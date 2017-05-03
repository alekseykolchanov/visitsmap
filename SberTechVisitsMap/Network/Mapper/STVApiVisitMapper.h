//
//  STVApiVisitMapper.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 03/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVJsonMapper.h"
@class STVApiVisit;

@interface STVApiVisitMapper : STVJsonMapper

- (STVApiVisit *)apiVisitFromJson:(NSDictionary *)jsonDict;

@end
