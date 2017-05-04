//
//  CDVisit+CoreDataProperties.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "CDVisit+CoreDataProperties.h"

@implementation CDVisit (CoreDataProperties)

+ (NSFetchRequest<CDVisit *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CDVisit"];
}

@dynamic organizationId;
@dynamic title;

@end
