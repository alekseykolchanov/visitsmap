//
//  STVVisitsContainerViewModel.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STVVisitsContainerInteractor.h"
#import "STVVisitsPresenter.h"

@protocol STVVisitsContainerViewControllerProtocol <NSObject>

- (id<STVVisitsPresenter>)listVisitsPresenter;
- (id<STVVisitsPresenter>)mapVisitsPresenter;

- (void)showErrorWithText:(NSString *)errorText;

@end

@interface STVVisitsContainerViewModel : NSObject <STVVisitsContainerViewModelProtocol>

@property (nonatomic, weak) id<STVVisitsContainerViewControllerProtocol> viewController;
@property (nonatomic, strong) STVVisitsContainerInteractor *interactor;

- (void)viewDidLoad;

@end
