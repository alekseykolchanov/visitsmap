//
//  STVStorageGeoLocation.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVStorageGeoLocation.h"

@interface STVStorageGeoLocation ()

@property (nonatomic) float latitude;
@property (nonatomic) float longitude;

@end

@implementation STVStorageGeoLocation

- (instancetype)initWithLatitude:(float)latitude longitude:(float)longitude {
    if (self = [super init]) {
        _latitude = latitude;
        _longitude = longitude;
    }
    return self;
}

@end
