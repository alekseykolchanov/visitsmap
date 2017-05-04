//
//  STVOrganizationsApiService.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVApiService.h"
@class STVApiOrganizatonMapper;
@class STVApiOrganizationValidator;

typedef void (^GetOrganizationsApiServiceCompletionBlock)(NSArray *organizations, NSError *error);

@interface STVOrganizationsApiService : STVApiService

@property (nonatomic, strong) STVApiOrganizatonMapper *getMapper;
@property (nonatomic, strong) STVApiOrganizationValidator *getValidator;

- (NSURL *)getOrganizationsUrl;
- (void)getOrganizationsWithCompletion:(GetOrganizationsApiServiceCompletionBlock)completion;

@end
