//
//  STVVisitsContainerViewModel.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVVisitsContainerViewModel.h"


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

@end
