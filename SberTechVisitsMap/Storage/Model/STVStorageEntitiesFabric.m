//
//  STVStorageEntitiesFabric.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVStorageEntitiesFabric.h"

@implementation STVStorageEntitiesFabric

#pragma mark - Public
- (STVStorageVisit *)visitFromCDVisit:(CDVisit *)cdVisit {
    __block STVStorageVisit *visit = nil;
    [[cdVisit managedObjectContext] performBlockAndWait:^{
        visit = [[STVStorageVisit alloc] initWithTitle:[cdVisit title]
                                        organizationId:[cdVisit organizationId]];
    }];
    return visit;
}

- (STVStorageOrganization *)organizationFromCDOrganization:(CDOrganization *)cdOrganization {
    __block STVStorageOrganization *organization = nil;
    [[cdOrganization managedObjectContext] performBlockAndWait:^{
        STVStorageGeoLocation *geoLocation = [[STVStorageGeoLocation alloc]
                                              initWithLatitude:[[cdOrganization geoLocation] latitude]
                                              longitude:[[cdOrganization geoLocation] longitude]];
        organization = [[STVStorageOrganization alloc]
                        initWithID:[cdOrganization identifier]
                        title:[cdOrganization title]
                        geoLocation:geoLocation];
    }];
    return organization;
}

@end
