//
//  STVVisitsListViewModel.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVVisitsListViewModel.h"

@implementation STVVisitsListViewModel

- (void)viewDidLoad {
    
}

- (void)didSelectVisit:(STVVisit *)visit {
    
}

#pragma mark - STVVisitsPresenter
- (void)setVisits:(NSArray *)visits {
    NSArray *sortedVisits = [visits sortedArrayUsingComparator:^NSComparisonResult(STVVisit *obj1, STVVisit *obj2) {
        return [[obj1 identifier] compare:[obj2 identifier]];
    }];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self viewController] setVisits:sortedVisits];
    });
}

- (void)selectVisitWithId:(NSString *)visitId {
    
}

@end
