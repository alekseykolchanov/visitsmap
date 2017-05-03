//
//  STVApiOrganization.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 03/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STVApiOrganization : NSObject

@property (nonatomic, copy, readonly) NSString *ID;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSNumber *latitude;
@property (nonatomic, copy, readonly) NSNumber *longitude;

- (instancetype)initWithID:(NSString *)ID title:(NSString *)title latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude;

@end
