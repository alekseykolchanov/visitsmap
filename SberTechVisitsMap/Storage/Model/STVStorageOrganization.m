//
//  STVStorageOrganization.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVStorageOrganization.h"

@interface STVStorageOrganization ()

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) STVStorageGeoLocation *geoLocation;
@end

@implementation STVStorageOrganization

- (instancetype)initWithID:(NSString *)ID title:(NSString *)title geoLocation:(STVStorageGeoLocation *)geoLocation {
    if (self = [super init]) {
        _ID = [ID copy];
        _title = [title copy];
        _geoLocation = geoLocation;
    }
    return self;
}

@end
