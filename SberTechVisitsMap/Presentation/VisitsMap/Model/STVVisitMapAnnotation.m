//
//  STVVisitMapAnnotation.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 05/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVVisitMapAnnotation.h"

@interface STVVisitMapAnnotation ()

@property (nonatomic, copy) NSString *visitIdentifier;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end

@implementation STVVisitMapAnnotation

- (id)initWithVisitId:(NSString *)visitId coordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title subtitle:(NSString *)subtitle {
    if (self = [super init]) {
        _visitIdentifier = [visitId copy];
        _coordinate = coordinate;
        _title = [title copy];
        _subtitle = [subtitle copy];
    }
    return self;
}

@end
