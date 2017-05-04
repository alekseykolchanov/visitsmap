//
//  STVVisit.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVVisit.h"

@implementation STVVisit

- (instancetype)initWithTitle:(NSString *)title organization:(STVStorageOrganization *)organization {
    if (self = [super init]) {
        _title = [title copy];
        _organization = organization;
        _identifier = [self generateIdentifier];
    }
    return self;
}

- (NSString *)generateIdentifier {
    NSMutableArray *identifierParts = [NSMutableArray new];
    
    if ([self title]) {
        [identifierParts addObject:[self title]];
    }
    
    if ([self organization] && [[self organization] ID]) {
        [identifierParts addObject:[[self organization] ID]];
    }
    
    return [identifierParts componentsJoinedByString:@"_"];
}

@end
