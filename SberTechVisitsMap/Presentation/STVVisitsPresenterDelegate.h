//
//  STVVisitsPresenterDelegate.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

@protocol STVVisitsPresenter;

@protocol STVVisitsPresenterDelegate <NSObject>

- (void)visitsPresenter:(id<STVVisitsPresenter>)presenter didSelectVisitWithId:(NSString *)visitId;

@end
