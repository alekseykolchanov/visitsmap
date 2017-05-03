//
//  STVApiOrganizatonMapper.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 03/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVApiOrganizatonMapper.h"
#import "STVApiOrganization.h"

NSString * const kTitleApiOrganizationJsonKey = @"title";
NSString * const kOrganizationIdApiOrganizationJsonKey = @"organizationId";
NSString * const kLatitudeApiOrganizationJsonKey = @"latitude";
NSString * const kLongitudeApiOrganizationJsonKey = @"longitude";

@implementation STVApiOrganizatonMapper

#pragma mark - Public
- (STVApiOrganization *)apiOrganizationFromJson:(NSDictionary *)jsonDict {
    if (!jsonDict) {
        return nil;
    }
    
    NSString *title = [self stringForKey:kTitleApiOrganizationJsonKey inJson:jsonDict];
    NSString *organizationId = [self stringForKey:kOrganizationIdApiOrganizationJsonKey inJson:jsonDict];
    NSNumber *latitude = [self numberForKey:kLatitudeApiOrganizationJsonKey inJson:jsonDict];
    NSNumber *longitude = [self numberForKey:kLongitudeApiOrganizationJsonKey inJson:jsonDict];
    
    STVApiOrganization *apiOrganization = [[STVApiOrganization alloc] initWithID:organizationId title:title latitude:latitude longitude:longitude];
    
    return apiOrganization;
}

@end
