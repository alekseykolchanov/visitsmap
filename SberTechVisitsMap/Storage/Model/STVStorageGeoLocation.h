//
//  STVStorageGeoLocation.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STVStorageGeoLocation : NSObject

@property (nonatomic, readonly) float latitude;
@property (nonatomic, readonly) float longitude;

- (instancetype)initWithLatitude:(float)latitude longitude:(float)longitude;

@end
