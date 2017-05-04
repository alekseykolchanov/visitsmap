//
//  STVStorageEntitiesFabric.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STVStorageModels.h"
#import "CDEntities.h"

@interface STVStorageEntitiesFabric : NSObject

- (STVStorageVisit *)visitFromCDVisit:(CDVisit *)cdVisit;
- (STVStorageOrganization *)organizationFromCDOrganization:(CDOrganization *)cdOrganization;

@end
