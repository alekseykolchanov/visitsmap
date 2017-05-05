//
//  STVVisitsMapViewModel.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STVVisitMapAnnotation.h"
#import "STVVisitsPresenter.h"


@protocol STVVisitsMapViewControllerProtocol <NSObject>

- (void)setVisitAnnotations:(NSArray *)visitAnnotations;
- (void)selectVisitAnnotationWithId:(NSString *)visitId makeVisible:(BOOL)makeVisible animated:(BOOL)animated;

@end



@interface STVVisitsMapViewModel : NSObject<STVVisitsPresenter>

@property (nonatomic, weak) id<STVVisitsMapViewControllerProtocol> viewController;
@property (nonatomic, weak) id<STVVisitsPresenterDelegate> visitsPresenterDelegate;

- (void)viewDidLoad;
- (void)didSelectVisitAnnotation:(STVVisitMapAnnotation *)visitAnnotation;

@end
