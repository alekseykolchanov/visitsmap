//
//  STVApiServiceError.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, STVApiServiceErrorCode) {
    STVApiServiceErrorCodeUnknown = 0,
    STVApiServiceErrorCodeJsonParse = -1,
};

@interface STVApiServiceError : NSError

+ (NSErrorDomain)errorDomain;

+ (STVApiServiceError *)jsonParseErrorWithResponse:(NSURLResponse *)response;

@end
