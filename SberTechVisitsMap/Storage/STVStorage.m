//
//  STVStorage.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVStorage.h"
#import "STVApiOrganization.h"
#import "STVApiVisit.h"

@implementation STVStorage

+ (STVStorage *)sharedInstance {
    static STVStorage *sharedStorage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStorage = [[STVStorage alloc] init];
    });
    return sharedStorage;
}

- (id)init {
    if (self = [super init]) {
        _apiClient = [[STVVisitsApiClient alloc] init];
        _database = [[STVDatabase alloc] init];
        _entitisFabric = [[STVStorageEntitiesFabric alloc] init];
    }
    return self;
}

- (void)syncVisitsWithCompletion:(void (^)(NSError *error))completion {
    
    dispatch_group_t group = dispatch_group_create();
    
    __block NSError *apiError;
    __block NSArray *apiOrganizations;
    __block NSArray *apiVisits;
    
    dispatch_group_enter(group);
    [[self apiClient] getOrganizationsWithCompletion:^(NSArray *organizations, NSError *error) {
        if (error) {
            apiError = error;
        }
        
        apiOrganizations = organizations;
        dispatch_group_leave(group);
    }];
    
    dispatch_group_enter(group);
    [[self apiClient] getVisitsWithCompletion:^(NSArray *visits, NSError *error) {
        if (error) {
            apiError = error;
        }
        
        apiVisits = visits;
        dispatch_group_leave(group);
    }];
    
    __weak STVStorage *weakSelf = self;
    dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        if (apiError) {
            if (completion) {
                completion(apiError);
            }
            return;
        }
        
        [weakSelf cleanVisits];
        [weakSelf cleanOrganizations];
        [weakSelf saveApiVisits:apiVisits];
        [weakSelf saveApiOrganizations:apiOrganizations];
        [[weakSelf database] save];
        completion(nil);
    });
}

- (NSArray *)getAllVisits {
    NSMutableArray *storageVisits = [NSMutableArray new];
    NSArray *cdVisits = [[self database] getAllVisits];
    for (id cdVisit in cdVisits) {
        STVStorageVisit *storageVisit = [[self entitisFabric] visitFromCDVisit:cdVisit];
        if (storageVisit) {
            [storageVisits addObject:storageVisit];
        }
    }
    return storageVisits;
}

- (NSArray *)getAllOrganizations {
    NSMutableArray *storageOrganizations = [NSMutableArray new];
    NSArray *cdOrganizations = [[self database] getAllOrganizations];
    for (id cdOrganization in cdOrganizations) {
        STVStorageOrganization *storageOrganization = [[self entitisFabric] organizationFromCDOrganization:cdOrganization];
        if (storageOrganization) {
            [storageOrganizations addObject:storageOrganization];
        }
    }
    return storageOrganizations;
}


#pragma mark - Private
- (void)cleanVisits {
    [[self database] deleteAllVisits];
}

- (void)cleanOrganizations {
    [[self database] deleteAllOrganizations];
}

- (void)saveApiOrganizations:(NSArray *)apiOrganizations {
    for (STVApiOrganization *apiOrganization in apiOrganizations) {
        [[self database] createOrganizationWithTitle:[apiOrganization title]
                                      organizationId:[apiOrganization ID]
                                            latitude:[apiOrganization latitude]
                                           longitude:[apiOrganization longitude]];
    }
}

- (void)saveApiVisits:(NSArray *)apiVisits {
    for (STVApiVisit *apiVisit in apiVisits) {
        [[self database] createVisitWithTitle:[apiVisit title]
                               organizationId:[apiVisit organizationId]];
    }
}

@end
