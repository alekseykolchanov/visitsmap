//
//  STVVisitsListViewController.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVVisitsListViewController.h"
#import "STVVisitsListViewModel.h"

NSString * const kVisitCollectionViewCellIdentifier = @"STVVisitCollectionViewCell";

@interface STVVisitsListViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation STVVisitsListViewController

- (void)buildModule {
    STVVisitsListViewModel *viewModel = [STVVisitsListViewModel new];
    [self setViewModel:viewModel];
    [viewModel setViewController:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self viewModel] viewDidLoad];
}



@end
