//
//  STVVisitsMapViewController.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVVisitsMapViewController.h"
#import <MapKit/MapKit.h>
#import "STVVisitsMapViewModel.h"

NSString * const kVisitAnnotationViewReuseIdentifier = @"VisitAnnotationViewIdentifier";

@interface STVVisitsMapViewController ()<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) NSArray *visitAnnotations;

@end

@implementation STVVisitsMapViewController

@synthesize visitAnnotations = _visitAnnotations;

- (void)buildModule {
    STVVisitsMapViewModel *viewModel = [STVVisitsMapViewModel new];
    [self setViewModel:viewModel];
    [viewModel setViewController:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (NSArray *)visitAnnotations {
    if (!_visitAnnotations) {
        _visitAnnotations = @[];
    }
    return _visitAnnotations;
}

- (void)setVisitAnnotations:(NSArray *)visits {
    _visitAnnotations = visits;
    
    [[self mapView] removeAnnotations:[[self mapView] annotations]];
    [[self mapView] addAnnotations:[self visitAnnotations]];
    [self zoomOnAnnotations:[self visitAnnotations] animated:YES];
}

#pragma mark - STVVisitsMapViewControllerProtocol
- (void)selectVisitAnnotationWithId:(NSString *)visitId makeVisible:(BOOL)makeVisible animated:(BOOL)animated {
    STVVisitMapAnnotation *annotation = [self mapAnnotationWithVisitId:visitId];
    if (!annotation) {
        return;
    }
    
    [[self mapView] selectAnnotation:annotation animated:animated];
}

#pragma mark - MKMapViewDelegate
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    MKPinAnnotationView *view;
    
    MKPinAnnotationView *dequeuedView = (MKPinAnnotationView *)[[self mapView] dequeueReusableAnnotationViewWithIdentifier:kVisitAnnotationViewReuseIdentifier];
    if (dequeuedView) {
        [dequeuedView setAnnotation:annotation];
        view = dequeuedView;
    }else{
        view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:kVisitAnnotationViewReuseIdentifier];
        [view setCanShowCallout:YES];
        [view setCalloutOffset:CGPointMake(-8, -3)];
    }
    
    return view;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    [[self viewModel] didSelectVisitAnnotation:(STVVisitMapAnnotation *)[view annotation]];
}

#pragma mark - Private
- (void)zoomOnAnnotations:(NSArray *)annotations animated:(BOOL)animated {
    MKMapRect annotationsRect = [self rectForAnnotations:annotations];
    if (![annotations count] || MKMapRectIsNull(annotationsRect)) {
        return;
    }
    
    UIEdgeInsets insets = UIEdgeInsetsMake(150, 420, 60, 80);

    [[self mapView] setVisibleMapRect:annotationsRect edgePadding:insets animated:animated];
}

- (MKMapRect)rectForAnnotations:(NSArray *)annotations {
    MKMapRect rect = MKMapRectNull;
    for (id<MKAnnotation> annotation in annotations) {
        MKMapPoint annotaionPoint = MKMapPointForCoordinate([annotation coordinate]);
        MKMapRect pointRect = MKMapRectMake(annotaionPoint.x, annotaionPoint.y, 0.1, 0.1);
        rect = MKMapRectUnion(rect, pointRect);
    }
    
    return rect;
}

- (STVVisitMapAnnotation *)mapAnnotationWithVisitId:(NSString *)visitId {
    for (STVVisitMapAnnotation *mapAnnotation in [self visitAnnotations]) {
        if ([[mapAnnotation visitIdentifier] isEqualToString:visitId]){
            return mapAnnotation;
        }
    }
    return nil;
}

@end
