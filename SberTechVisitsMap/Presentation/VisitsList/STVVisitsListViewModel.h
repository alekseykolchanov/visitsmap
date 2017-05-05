//
//  STVVisitsListViewModel.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STVVisit.h"
#import "STVVisitsPresenter.h"
#import "STVVisitsPresenterDelegate.h"

@protocol STVVisitsListViewControllerProtocol

- (void)setVisits:(NSArray *)visits;
- (void)selectVisitWithId:(NSString *)visitId makeVisible:(BOOL)makeVisible animated:(BOOL)animated;

@end



@interface STVVisitsListViewModel : NSObject<STVVisitsPresenter>

@property (nonatomic, weak) id<STVVisitsListViewControllerProtocol> viewController;
@property (nonatomic, weak) id<STVVisitsPresenterDelegate> visitsPresenterDelegate;

- (void)viewDidLoad;
- (void)didSelectVisit:(STVVisit *)visit;

@end
