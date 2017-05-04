//
//  STVApiServiceError.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVApiServiceError.h"
NSString * const kApiServiceErrorDomain = @"ApiErrorDomain";
@implementation STVApiServiceError

+ (NSErrorDomain)errorDomain {
    return kApiServiceErrorDomain;
}

+ (STVApiServiceError *)jsonParseErrorWithResponse:(NSURLResponse *)response {
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey: NSLocalizedString(@"Operation was unsuccessful.", nil),
                               NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"The operation timed out.", nil),
                               NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(@"Have you tried turning it off and on again?", nil)
                               
                               };
    return [STVApiServiceError errorWithDomain:[self errorDomain]
                                          code:STVApiServiceErrorCodeJsonParse
                                      userInfo:userInfo];
}

@end
