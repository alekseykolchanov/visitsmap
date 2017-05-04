//
//  STVVisitsApiClient.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 03/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>
@class STVVisitsApiService;
@class STVOrganizationsApiService;

@interface STVVisitsApiClient : NSObject

@property (nonatomic, strong) NSString *apiUrl;

/**
 Makes a request and returns visits list in completion block
 **/
- (void)getVisitsWithCompletion:(void (^)(NSArray *visits, NSError *error))completion;

/**
 Makes a request and returns organizations list in completion block
 **/
- (void)getOrganizationsWithCompletion:(void (^)(NSArray *organizations, NSError *error))completion;

@end
