//
//  STVVisitsMapViewModel.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVVisitsMapViewModel.h"
#import "STVVisit.h"
#import "STVStorageGeoLocation.h"
#import "STVVisitsPresenterDelegate.h"

@implementation STVVisitsMapViewModel

#pragma mark - Public 
- (void)viewDidLoad {
    
}

- (void)didSelectVisitAnnotation:(STVVisitMapAnnotation *)visitAnnotation {
    [[self visitsPresenterDelegate] visitsPresenter:self didSelectVisitWithId:[visitAnnotation visitIdentifier]];
}

#pragma mark - STVVisitsPresenter
- (void)setVisits:(NSArray *)visits {
    NSArray *mapAnnotations = [self mapAnnotaionsFromVisits:visits];
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self viewController] setVisitAnnotations:mapAnnotations];
    });
}

- (void)selectVisitWithId:(NSString *)visitId {
    [[self viewController] selectVisitAnnotationWithId:visitId makeVisible:YES animated:YES];
}

#pragma mark - Private
- (STVVisitMapAnnotation *)mapAnnotationFromVisit:(STVVisit *)visit {
    STVStorageGeoLocation *geoLocation = [[visit organization] geoLocation];
    if (!geoLocation) {
        return nil;
    }
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake([geoLocation latitude], [geoLocation longitude]);
    STVVisitMapAnnotation *annotation = [[STVVisitMapAnnotation alloc]
                                         initWithVisitId:[visit identifier]
                                         coordinate:coordinate
                                         title:[visit title]
                                         subtitle:[[visit organization] title]];
    
    return annotation;
}

- (NSArray *)mapAnnotaionsFromVisits:(NSArray *)visits {
    NSMutableArray *resultAnnotations = [NSMutableArray new];
    for (STVVisit *visit in visits) {
        STVVisitMapAnnotation *annotation = [self mapAnnotationFromVisit:visit];
        if (annotation) {
            [resultAnnotations addObject:annotation];
        }
    }
    return resultAnnotations;
}

@end
