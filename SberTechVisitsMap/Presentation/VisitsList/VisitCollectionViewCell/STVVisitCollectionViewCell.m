//
//  STVVisitCollectionViewCell.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVVisitCollectionViewCell.h"

@implementation STVVisitCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [[self contentView] setBackgroundColor:[UIColor whiteColor]];
    [[[self contentView] layer] setBorderColor:[UIColor colorWithWhite:0.7 alpha:0.5].CGColor];
    [[[self contentView] layer] setBorderWidth:1.0f];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    UIColor *backgroundColor = selected ? [UIColor greenColor] : [UIColor whiteColor];
    [[self contentView] setBackgroundColor:backgroundColor];
}

@end
