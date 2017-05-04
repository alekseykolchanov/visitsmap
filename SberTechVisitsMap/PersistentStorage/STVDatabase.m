//
//  STVDatabase.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVDatabase.h"

NSString * const kDataModelFileName = @"visits";

@implementation STVDatabase

- (STVCoreDataController *)coreDataController {
    if (!_coreDataController) {
        _coreDataController = [[STVCoreDataController alloc] initWithDataModelFileName:kDataModelFileName];
    }
    
    return _coreDataController;
}


#pragma mark - Public
- (NSArray *)getAllVisits {
    return [[self workerContext] executeFetchRequest:[CDVisit fetchRequest] error:nil];
}

- (NSArray *)getAllOrganizations {
    return [[self workerContext] executeFetchRequest:[CDOrganization fetchRequest] error:nil];
}

- (void)deleteAllVisits {
    [self deleteObjectsWithRequest:[CDVisit fetchRequest]];
}

- (void)deleteAllOrganizations {
    [self deleteObjectsWithRequest:[CDOrganization fetchRequest]];
}

- (void)createVisitWithTitle:(NSString *)title organizationId:(NSString *)organizationId {
    CDVisit *visit = [NSEntityDescription insertNewObjectForEntityForName:@"CDVisit" inManagedObjectContext:[self workerContext]];
    [[self workerContext] performBlockAndWait:^{
        [visit setTitle:title];
        [visit setOrganizationId:organizationId];
    }];
}

- (void)createOrganizationWithTitle:(NSString *)title organizationId:(NSString *)ID latitude:(NSNumber *)latitide longitude:(NSNumber *)longitude {
    CDGeoLocation *geoLocation = [NSEntityDescription insertNewObjectForEntityForName:@"CDGeoLocation" inManagedObjectContext:[self workerContext]];
    CDOrganization *organization = [NSEntityDescription insertNewObjectForEntityForName:@"CDOrganization" inManagedObjectContext:[self workerContext]];
    
    [[self workerContext] performBlockAndWait:^{
        [geoLocation setLatitude:[latitide floatValue]];
        [geoLocation setLongitude:[longitude floatValue]];
        
        [organization setTitle:title];
        [organization setIdentifier:ID];
        [organization setGeoLocation:geoLocation];
    }];
}

- (void)save {
    [[self workerContext] performBlockAndWait:^{
        [[self workerContext] save:nil];
    }];
}

#pragma mark - Private
- (NSManagedObjectContext *)workerContext {
    return [[self coreDataController] backgroundManagedObjectContext];
}

- (void)deleteObjectsWithRequest:(NSFetchRequest *)fetchRequest {
    [[self workerContext] performBlockAndWait:^{
        NSArray *objects = [[self workerContext] executeFetchRequest:fetchRequest error:nil];
        for (NSManagedObject *obj in objects) {
            [[self workerContext] deleteObject:obj];
        }
    }];
}

@end
