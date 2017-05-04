//
//  STVVisitsListViewController.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVModuleViewController.h"
#import "STVVisitsListViewModel.h"

@interface STVVisitsListViewController : STVModuleViewController <STVVisitsListViewControllerProtocol>

@property (nonatomic, strong) STVVisitsListViewModel *viewModel;
@property (nonatomic, strong) NSString *selectedVisit;


@end
