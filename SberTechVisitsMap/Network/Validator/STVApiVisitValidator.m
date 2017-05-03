//
//  STVApiVisitValidator.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 03/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVApiVisitValidator.h"
#import "STVApiVisit.h"

@implementation STVApiVisitValidator

#pragma mark - STVApiValidator
- (BOOL)isValidApiEntity:(id)entity {
    if (![entity isKindOfClass:[STVApiVisit class]]) {
        return NO;
    }
    
    STVApiVisit *apiVisit = (STVApiVisit *)entity;
    if (![[apiVisit title] length]) {
        return NO;
    }
    if (![[apiVisit organizationId] length]) {
        return NO;
    }
    
    return YES;
}

@end
