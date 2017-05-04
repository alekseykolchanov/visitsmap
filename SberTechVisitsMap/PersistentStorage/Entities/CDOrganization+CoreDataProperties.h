//
//  CDOrganization+CoreDataProperties.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "CDOrganization+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CDOrganization (CoreDataProperties)

+ (NSFetchRequest<CDOrganization *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *identifier;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, retain) CDGeoLocation *geoLocation;

@end

NS_ASSUME_NONNULL_END
