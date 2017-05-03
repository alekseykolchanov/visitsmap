//
//  STVApiOrganization.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 03/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVApiOrganization.h"

@interface STVApiOrganization()

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSNumber *latitude;
@property (nonatomic, copy) NSNumber *longitude;

@end

@implementation STVApiOrganization

- (instancetype)initWithID:(NSString *)ID title:(NSString *)title latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude {
    if (self = [super init]) {
        _ID = [ID copy];
        _title = [title copy];
        _latitude = [latitude copy];
        _longitude = [longitude copy];
    }
    return self;
}

@end
