//
//  STVVisitsContainerViewController.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVModuleViewController.h"
#import "STVVisitsContainerViewModel.h"

@interface STVVisitsContainerViewController : STVModuleViewController <STVVisitsContainerViewControllerProtocol>

@property (nonatomic, strong) STVVisitsContainerViewModel *viewModel;

@end
