//
//  STVOrganizationsApiService.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVOrganizationsApiService.h"
#import "STVApiOrganizatonMapper.h"
#import "STVApiOrganizationValidator.h"

NSString * const kGetOrganizationsPathUrl = @"getOrganizationListTest";

@implementation STVOrganizationsApiService

- (id)init {
    if (self = [super init]) {
        _getMapper = [STVApiOrganizatonMapper new];
        _getValidator = [STVApiOrganizationValidator new];
    }
    return self;
}

#pragma mark - Public
#pragma mark GET Visits
- (NSURL *)getOrganizationsUrl {
    NSString *apiUrl = [self apiUrl];
    NSAssert([apiUrl length], @"apiUrl is not set up");
    
    NSString *absolutePath = [NSString stringWithFormat:@"%@/%@", apiUrl, kGetOrganizationsPathUrl];
    return [[NSURL alloc] initWithString:absolutePath];
}

- (void)getOrganizationsWithCompletion:(GetOrganizationsApiServiceCompletionBlock)completion {
    NSURLSession *urlSession = [self urlSession];
    NSAssert(urlSession != nil, @"urlSession is not set up");
    
    NSURL *url = [self getOrganizationsUrl];
    NSAssert(url != nil, @"get visits url is nil");
    
    __weak STVOrganizationsApiService *weakSelf = self;
    [urlSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        [weakSelf manageGetOrganizationsData:data response:response error:error completion:completion];
    }];
}

#pragma mark - Private
#pragma mark GET visits
- (void)manageGetOrganizationsData:(NSData *)data response:(NSURLResponse *)response error:(NSError *)error completion:(GetOrganizationsApiServiceCompletionBlock)completion {
    //Manage error
    if (error) {
        if (completion) {
            completion(nil, error);
        }
        return;
    }
    
    //Get json
    NSError *jsonError;
    NSArray *jsonOrganizations = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
    
    if (jsonError) {
        if (completion) {
            completion(nil, error);
        }
        return;
    }
    
    if (![jsonOrganizations isKindOfClass:[NSArray class]]) {
        if (completion) {
            STVApiServiceError *jsonParseError = [STVApiServiceError jsonParseErrorWithResponse:response];
            completion(nil, jsonParseError);
        }
        return;
    }
    
    //Get visits
    NSArray *mappedOrganizations = [self mappedOrganizationsFromJsonVisits:jsonOrganizations];
    NSArray *validatedOrganizations = [self validatedOrganizationsInArray:mappedOrganizations];
    if (completion) {
        completion(validatedOrganizations, nil);
    }
}

- (NSArray *)mappedOrganizationsFromJsonVisits:(NSArray *)jsonOrganizations {
    NSMutableArray *mappedVisits = [NSMutableArray new];
    for (NSDictionary *jsonOrganization in jsonOrganizations) {
        id apiOrganization = [[self getMapper] apiOrganizationFromJson:jsonOrganization];
        if (apiOrganization) {
            [mappedVisits addObject:apiOrganization];
        }else{
            NSAssert(NO, @"Unable to map organization %@", jsonOrganization);
        }
    }
    return mappedVisits;
}

- (NSArray *)validatedOrganizationsInArray:(NSArray *)organizations {
    NSMutableArray *validatedOrganizations = [NSMutableArray new];
    for (id organization in organizations) {
        if ([[self getValidator] isValidApiEntity:organization]) {
            [validatedOrganizations addObject:organization];
        }else{
            NSAssert(NO, @"Organization is invalid");
        }
    }
    return validatedOrganizations;
}

@end
