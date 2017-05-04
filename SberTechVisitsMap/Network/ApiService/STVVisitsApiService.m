//
//  STVVisitsApiService.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVVisitsApiService.h"
#import "STVApiVisitMapper.h"
#import "STVApiVisitValidator.h"

NSString * const kGetVisitsPathUrl = @"getVisitsListTest";

@implementation STVVisitsApiService

- (id)init {
    if (self = [super init]) {
        _getMapper = [STVApiVisitMapper new];
        _getValidator = [STVApiVisitValidator new];
    }
    return self;
}

#pragma mark - Public
#pragma mark GET Visits
- (NSURL *)getVisitsUrl {
    NSString *apiUrl = [self apiUrl];
    NSAssert([apiUrl length], @"apiUrl is not set up");
    
    NSString *absolutePath = [NSString stringWithFormat:@"%@/%@", apiUrl, kGetVisitsPathUrl];
    return [[NSURL alloc] initWithString:absolutePath];
}

- (void)getVisitsWithCompletion:(GetVisitsApiServiceCompletionBlock)completion {
    NSURLSession *urlSession = [self urlSession];
    NSAssert(urlSession != nil, @"urlSession is not set up");
    
    NSURL *url = [self getVisitsUrl];
    NSAssert(url != nil, @"get visits url is nil");
    
    __weak STVVisitsApiService *weakSelf = self;
    [[urlSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        [weakSelf manageGetVisitsData:data response:response error:error completion:completion];
    }] resume];
}

#pragma mark - Private
#pragma mark GET visits
- (void)manageGetVisitsData:(NSData *)data response:(NSURLResponse *)response error:(NSError *)error completion:(GetVisitsApiServiceCompletionBlock)completion {
    //Manage error
    if (error) {
        if (completion) {
            completion(nil, error);
        }
        return;
    }
    
    //Get json
    NSError *jsonError;
    NSArray *jsonVisits = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
    
    if (jsonError) {
        if (completion) {
            completion(nil, error);
        }
        return;
    }
    
    if (![jsonVisits isKindOfClass:[NSArray class]]) {
        if (completion) {
            STVApiServiceError *jsonParseError = [STVApiServiceError jsonParseErrorWithResponse:response];
            completion(nil, jsonParseError);
        }
        return;
    }
    
    //Get visits
    NSArray *mappedVisits = [self mappedVisitsFromJsonVisits:jsonVisits];
    NSArray *validatedVisits = [self validatedVisitsInArray:mappedVisits];
    if (completion) {
        completion(validatedVisits, nil);
    }
}

- (NSArray *)mappedVisitsFromJsonVisits:(NSArray *)jsonVisits {
    NSMutableArray *mappedVisits = [NSMutableArray new];
    for (NSDictionary *jsonVisit in jsonVisits) {
        id apiVisit = [[self getMapper] apiVisitFromJson:jsonVisit];
        if (apiVisit) {
            [mappedVisits addObject:apiVisit];
        }else{
            NSAssert(NO, @"Unable to map visit %@", jsonVisit);
        }
    }
    return mappedVisits;
}

- (NSArray *)validatedVisitsInArray:(NSArray *)visits {
    NSMutableArray *validatedVisits = [NSMutableArray new];
    for (id visit in visits) {
        if ([[self getValidator] isValidApiEntity:visit]) {
            [validatedVisits addObject:visit];
        }else{
            NSAssert(NO, @"Visit is invalid");
        }
    }
    return validatedVisits;
}

@end
