//
//  STVApiOrganizationValidator.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 03/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVApiOrganizationValidator.h"
#import "STVApiOrganization.h"

const float kMinCoordinate = -180;
const float kMaxCoordinate = 180;

@implementation STVApiOrganizationValidator

#pragma mark - STVApiValidator
- (BOOL)isValidApiEntity:(id)entity {
    if (![entity isKindOfClass:[STVApiOrganization class]]) {
        return NO;
    }
    
    STVApiOrganization *apiOrganization = (STVApiOrganization *)entity;
    if (![[apiOrganization title] length]) {
        return NO;
    }
    if (![[apiOrganization ID] length]) {
        return NO;
    }
    
    //Latitude & Longitude
    if (![apiOrganization longitude] || ![apiOrganization latitude]) {
        return NO;
    }
    float latitude = [[apiOrganization latitude] floatValue];
    float longitude = [[apiOrganization longitude] floatValue];
    
    if (latitude > kMaxCoordinate ||
        latitude < kMinCoordinate ||
        longitude > kMaxCoordinate ||
        longitude < kMinCoordinate) {
        return NO;
    }
    
    return YES;
}

@end
