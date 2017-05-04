//
//  STVVisitsPresenter.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

@protocol STVVisitsPresenter <NSObject>

- (void)setVisits:(NSArray *)visits;
- (void)selectVisitWithId:(NSString *)visitId;

@end
