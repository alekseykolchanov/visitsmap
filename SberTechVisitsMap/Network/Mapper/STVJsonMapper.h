//
//  STVJsonMapper.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 03/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STVJsonMapper : NSObject

@property (nonatomic, strong) NSNumberFormatter *numberFormatter;

- (NSString *)stringForKey:(NSString *)key inJson:(NSDictionary *)jsonDict;
- (NSNumber *)numberForKey:(NSString *)key inJson:(NSDictionary *)jsonDict;

@end
