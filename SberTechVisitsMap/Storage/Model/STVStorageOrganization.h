//
//  STVStorageOrganization.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>
@class STVStorageGeoLocation;

@interface STVStorageOrganization : NSObject

@property (nonatomic, copy, readonly) NSString *ID;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, strong, readonly) STVStorageGeoLocation *geoLocation;

- (instancetype)initWithID:(NSString *)ID title:(NSString *)title getLocation:(STVStorageGeoLocation *)geoLocation;

@end
