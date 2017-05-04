//
//  STVStorage.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STVStorageModels.h"
#import "STVVisitsApiClient.h"
#import "STVDatabase.h"
#import "STVStorageEntitiesFabric.h"

@interface STVStorage : NSObject

+ (STVStorage *)sharedInstance;

@property (nonatomic, strong) STVVisitsApiClient *apiClient;
@property (nonatomic, strong) STVDatabase *database;
@property (nonatomic, strong) STVStorageEntitiesFabric *entitisFabric;

- (void)syncVisitsWithCompletion:(void (^)(NSError *error))completion;
- (NSArray *)getAllVisits;
- (NSArray *)getAllOrganizations;

@end
