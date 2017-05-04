//
//  STVStorageVisit.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVStorageVisit.h"

@interface STVStorageVisit ()
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *organizationId;
@end

@implementation STVStorageVisit

- (instancetype)initWithTitle:(NSString *)title organizationId:(NSString *)organizationId {
    if (self = [super init]) {
        _title = [title copy];
        _organizationId = [organizationId copy];
    }
    
    return self;
}

@end
