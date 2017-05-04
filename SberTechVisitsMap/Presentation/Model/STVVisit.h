//
//  STVVisit.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STVStorageOrganization.h"

@interface STVVisit : NSObject


@property (nonatomic, strong, readonly) NSString *identifier;

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, strong, readonly) STVStorageOrganization *organization;

- (instancetype)initWithTitle:(NSString *)title organization:(STVStorageOrganization *)organization;

@end
