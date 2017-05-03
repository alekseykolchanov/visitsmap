//
//  STVJsonMapper.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 03/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVJsonMapper.h"

@implementation STVJsonMapper

#pragma mark - Public
- (NSNumberFormatter *)numberFormatter {
    if (!_numberFormatter) {
        _numberFormatter = [NSNumberFormatter new];
        _numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        _numberFormatter.decimalSeparator = @".";
    }
    return _numberFormatter;
}

- (NSString *)stringForKey:(NSString *)key inJson:(NSDictionary *)jsonDict {
    id value = [self jsonValueForKey:key inJson:jsonDict];
    if (!value) {
        return nil;
    }
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)value stringValue];
    }

    return nil;
}

- (NSNumber *)numberForKey:(NSString *)key inJson:(NSDictionary *)jsonDict {
    id value = [self jsonValueForKey:key inJson:jsonDict];
    if (!value) {
        return nil;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return value;
    }
    if ([value isKindOfClass:[NSString class]]) {
        return [[self numberFormatter] numberFromString:value];
    }
    
    return nil;
}

#pragma mark - Private
- (id)jsonValueForKey:(NSString *)key inJson:(NSDictionary *)jsonDict {
    if (!key || !jsonDict) {
        return nil;
    }
    
    id value = jsonDict[key];
    if (!value) {
        return nil;
    }
    if ([value isKindOfClass:[NSNull class]]) {
        return nil;
    }
    
    return value;
}

@end
