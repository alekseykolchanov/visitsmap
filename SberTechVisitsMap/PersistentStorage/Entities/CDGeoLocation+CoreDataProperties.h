//
//  CDGeoLocation+CoreDataProperties.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "CDGeoLocation+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CDGeoLocation (CoreDataProperties)

+ (NSFetchRequest<CDGeoLocation *> *)fetchRequest;

@property (nonatomic) float latitude;
@property (nonatomic) float longitude;
@property (nullable, nonatomic, retain) CDOrganization *organization;

@end

NS_ASSUME_NONNULL_END
