//
//  STVApiVisitMapper.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 03/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVApiVisitMapper.h"
#import "STVApiVisit.h"

NSString * const kTitleApiVisitJsonKey = @"title";
NSString * const kOrganizationIdApiVisitJsonKey = @"organizationId";

@implementation STVApiVisitMapper

#pragma mark - Public
- (STVApiVisit *)apiVisitFromJson:(NSDictionary *)jsonDict {
    if (!jsonDict) {
        return nil;
    }
    
    NSString *title = [self stringForKey:kTitleApiVisitJsonKey inJson:jsonDict];
    NSString *organizationId = [self stringForKey:kOrganizationIdApiVisitJsonKey inJson:jsonDict];
    
    STVApiVisit *apiVisit = [[STVApiVisit alloc] initWithTitle:title organizationId:organizationId];
    
    return apiVisit;
}

@end
