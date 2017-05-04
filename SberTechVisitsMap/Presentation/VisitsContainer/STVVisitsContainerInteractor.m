//
//  STVVisitsContainerInteractor.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVVisitsContainerInteractor.h"
#import "STVStorageVisit.h"
#import "STVStorageOrganization.h"
#import "STVVisit.h"

@implementation STVVisitsContainerInteractor

- (STVStorage *)storage {
    if (!_storage) {
        _storage = [STVStorage sharedInstance];
    }
    return _storage;
}

- (void)reloadVisitsWithCompletion:(void (^)(NSArray *visits, NSError *error))completion {
    [[self storage] syncVisitsWithCompletion:^(NSError *error) {
        
        if (!completion) {
            return;
        }
        if (error) {
            completion(nil, error);
            return;
        }
        
        NSArray *visits = [self getAllVisits];
        completion(visits, nil);
    }];
}

- (NSArray *)getAllVisits {
    NSArray *storageVisits = [[self storage] getAllVisits];
    NSArray *storageOrganizations = [[self storage] getAllOrganizations];
    
    NSDictionary *storageOrganizationsDictionary = [NSDictionary dictionaryWithObjects:storageOrganizations forKeys:[storageOrganizations valueForKey:@"ID"]];
    
    NSMutableArray *resultVisits = [NSMutableArray new];
    for (STVStorageVisit *storageVisit in storageVisits) {
        NSString *organizationId = [storageVisit organizationId];
        STVStorageOrganization *storageOrganization;
        if (organizationId &&
            (storageOrganization = storageOrganizationsDictionary[organizationId])) {
            STVVisit *visit = [[STVVisit alloc] initWithTitle:[storageVisit title] organization:storageOrganization];
            if (visit) {
                [resultVisits addObject:visit];
            }
        }
    }
    
    return resultVisits;
}



@end
