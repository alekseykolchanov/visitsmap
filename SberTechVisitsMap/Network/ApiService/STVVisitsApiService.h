//
//  STVVisitsApiService.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVApiService.h"
@class STVApiVisitMapper;
@class STVApiVisitValidator;

typedef void (^GetVisitsApiServiceCompletionBlock)(NSArray *visits, NSError *error);

@interface STVVisitsApiService : STVApiService

@property (nonatomic, strong) STVApiVisitMapper *getMapper;
@property (nonatomic, strong) STVApiVisitValidator *getValidator;

- (NSURL *)getVisitsUrl;
- (void)getVisitsWithCompletion:(GetVisitsApiServiceCompletionBlock)completion;

@end
