//
//  STVDatabase.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STVCoreDataController.h"
#import "CDEntities.h"


@interface STVDatabase : NSObject

@property (nonatomic, strong) STVCoreDataController *coreDataController;

- (NSArray *)getAllVisits;
- (NSArray *)getAllOrganizations;

- (void)deleteAllVisits;
- (void)deleteAllOrganizations;

- (void)createVisitWithTitle:(NSString *)title organizationId:(NSString *)organizationId;
- (void)createOrganizationWithTitle:(NSString *)title organizationId:(NSString *)ID latitude:(NSNumber *)latitide longitude:(NSNumber *)longitude;

- (void)save;

@end
