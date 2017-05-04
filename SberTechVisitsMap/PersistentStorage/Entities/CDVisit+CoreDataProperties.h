//
//  CDVisit+CoreDataProperties.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "CDVisit+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CDVisit (CoreDataProperties)

+ (NSFetchRequest<CDVisit *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *organizationId;
@property (nullable, nonatomic, copy) NSString *title;

@end

NS_ASSUME_NONNULL_END
