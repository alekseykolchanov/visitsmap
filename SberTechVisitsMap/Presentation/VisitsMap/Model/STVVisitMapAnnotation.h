//
//  STVVisitMapAnnotation.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 05/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface STVVisitMapAnnotation : NSObject<MKAnnotation>

@property (nonatomic, readonly, copy) NSString *visitIdentifier;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;

- (id)initWithVisitId:(NSString *)visitId coordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title subtitle:(NSString *)subtitle;
@end
