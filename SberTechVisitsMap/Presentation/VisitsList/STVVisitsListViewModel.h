//
//  STVVisitsListViewModel.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol STVVisitsListViewControllerProtocol


@end



@interface STVVisitsListViewModel : NSObject

@property (nonatomic, weak) id<STVVisitsListViewControllerProtocol> viewController;

- (void)viewDidLoad;

@end
