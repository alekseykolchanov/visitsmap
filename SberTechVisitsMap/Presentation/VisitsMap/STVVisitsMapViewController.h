//
//  STVVisitsMapViewController.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVModuleViewController.h"
#import "STVVisitsMapViewModel.h"

@interface STVVisitsMapViewController : STVModuleViewController<STVVisitsMapViewControllerProtocol>

@property (nonatomic, strong) STVVisitsMapViewModel *viewModel;

@end

