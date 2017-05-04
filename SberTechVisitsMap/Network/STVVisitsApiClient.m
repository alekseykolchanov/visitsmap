//
//  STVVisitsApiClient.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 03/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVVisitsApiClient.h"
#import "STVVisitsApiService.h"
#import "STVOrganizationsApiService.h"

NSString * const kApiUrl = @"http://demo3526062.mockable.io";

@interface STVVisitsApiClient()<NSURLSessionDelegate>

@property (nonatomic, strong) NSURLSession *apiUrlSession;
@property (nonatomic, strong) STVVisitsApiService *visitsApiService;
@property (nonatomic, strong) STVOrganizationsApiService *organizationsApiService;

@end

@implementation STVVisitsApiClient

- (NSString *)apiUrl {
    if (!_apiUrl) {
        _apiUrl = kApiUrl;
    }
    return _apiUrl;
}

- (NSURLSession *)apiUrlSession {
    if (!_apiUrlSession) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _apiUrlSession = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    }
    return _apiUrlSession;
}

- (STVVisitsApiService *)visitsApiService {
    if (!_visitsApiService) {
        _visitsApiService = [[STVVisitsApiService alloc] init];
        [_visitsApiService setUrlSession:[self apiUrlSession]];
        [_visitsApiService setApiUrl:[self apiUrl]];
    }
    return _visitsApiService;
}

- (STVOrganizationsApiService *)organizationsApiService {
    if (!_organizationsApiService) {
        _organizationsApiService = [[STVOrganizationsApiService alloc] init];
        [_organizationsApiService setUrlSession:[self apiUrlSession]];
        [_organizationsApiService setApiUrl:[self apiUrl]];
    }
    return _organizationsApiService;
}

#pragma mark - Public
- (void)getVisitsWithCompletion:(void (^)(NSArray *visits, NSError *error))completion {
    [[self visitsApiService] getVisitsWithCompletion:^(NSArray *visits, NSError *error) {
        if (completion) {
            completion(visits, error);
        }
    }];
}

- (void)getOrganizationsWithCompletion:(void (^)(NSArray *organizations, NSError *error))completion {
    [[self organizationsApiService] getOrganizationsWithCompletion:^(NSArray *organizations, NSError *error) {
        if (completion) {
            completion(organizations, error);
        }
    }];
}

@end
