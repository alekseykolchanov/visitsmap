//
//  STVVisitsContainerViewModel.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol STVVisitsContainerViewControllerProtocol <NSObject>



@end

@interface STVVisitsContainerViewModel : NSObject

@property (nonatomic, weak) id<STVVisitsContainerViewControllerProtocol> viewController;

- (void)viewDidLoad;

@end
