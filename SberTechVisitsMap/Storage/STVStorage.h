//
//  STVStorage.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STVStorageModels.h"

@interface STVStorage : NSObject

- (void)syncVisitsWithCompletion:(void (^)(NSError *error))completion;
- (NSArray *)getAllVisits;
- (STVStorageOrganization *)organizationWithId:(NSString *)organizationId;

@end
