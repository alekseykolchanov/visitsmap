//
//  CDGeoLocation+CoreDataProperties.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "CDGeoLocation+CoreDataProperties.h"

@implementation CDGeoLocation (CoreDataProperties)

+ (NSFetchRequest<CDGeoLocation *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CDGeoLocation"];
}

@dynamic latitude;
@dynamic longitude;
@dynamic organization;

@end
