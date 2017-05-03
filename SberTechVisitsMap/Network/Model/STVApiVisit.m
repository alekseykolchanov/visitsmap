//
//  STVApiVisit.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 03/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVApiVisit.h"

@interface STVApiVisit ()

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *organizationId;

@end

@implementation STVApiVisit

- (instancetype)initWithTitle:(NSString *)title organizationId:(NSString *)organizationId {
    if (self = [super init]) {
        _title = [title copy];
        _organizationId = [organizationId copy];
    }
    
    return self;
}

@end
