//
//  CDOrganization+CoreDataProperties.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "CDOrganization+CoreDataProperties.h"

@implementation CDOrganization (CoreDataProperties)

+ (NSFetchRequest<CDOrganization *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CDOrganization"];
}

@dynamic identifier;
@dynamic title;
@dynamic geoLocation;

@end
