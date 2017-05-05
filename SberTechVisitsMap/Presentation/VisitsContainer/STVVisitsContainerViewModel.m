//
//  STVVisitsContainerViewModel.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVVisitsContainerViewModel.h"
#import "STVVisitsPresenterDelegate.h"

@interface STVVisitsContainerViewModel ()<STVVisitsPresenterDelegate>

@end

@implementation STVVisitsContainerViewModel

- (instancetype)init {
    if (self = [super init]) {
        STVVisitsContainerInteractor *interactor = [STVVisitsContainerInteractor new];
        _interactor = interactor;
        [interactor setViewModel:self];
    }
    return self;
}

- (void)viewDidLoad {
    [self reloadWithCompletion:nil];
    [[[self viewController] listVisitsPresenter] setVisitsPresenterDelegate:self];
    [[[self viewController] mapVisitsPresenter] setVisitsPresenterDelegate:self];
}

- (void)reloadWithCompletion:(void (^)(BOOL success))completion {
    [[self interactor] reloadVisitsWithCompletion:^(NSArray *visits, NSError *error) {
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [[self viewController] showErrorWithText:[error localizedDescription]];
            });
            return;
        }
        
        [[[self viewController] listVisitsPresenter] setVisits:visits];
        [[[self viewController] mapVisitsPresenter] setVisits:visits];
    }];
}

#pragma mark - STVVisitsPresenterDelegate
- (void)visitsPresenter:(id<STVVisitsPresenter>)presenter didSelectVisitWithId:(NSString *)visitId {
    
    if (presenter == [[self viewController] listVisitsPresenter]) {
        [[[self viewController] mapVisitsPresenter] selectVisitWithId:visitId];
    }else if (presenter == [[self viewController] mapVisitsPresenter]) {
        [[[self viewController] listVisitsPresenter] selectVisitWithId:visitId];
    }
}

@end
