//
//  STVApiVisit.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 03/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STVApiVisit : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *organizationId;

- (instancetype)initWithTitle:(NSString *)title organizationId:(NSString *)organizationId;

@end
