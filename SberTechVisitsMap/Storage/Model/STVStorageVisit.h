//
//  STVStorageVisit.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STVStorageVisit : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *organizationId;

- (instancetype)initWithTitle:(NSString *)title organizationId:(NSString *)organizationId;

@end
