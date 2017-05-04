//
//  STVVisitsContainerViewController.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVVisitsContainerViewController.h"
#import "STVVisitsMapViewController.h"
#import "STVVisitsListViewController.h"

NSString * const kEmbedVisitsListSegueName = @"EmbedVisitsListSegue";
NSString * const kEmbedVisitsMapSegueName = @"EmbedVisitsMapSegue";

@interface STVVisitsContainerViewController ()

@property (nonatomic, strong) STVVisitsMapViewController *mapViewController;
@property (nonatomic, strong) STVVisitsListViewController *listViewController;

@end

@implementation STVVisitsContainerViewController

- (void)buildModule {
    STVVisitsContainerViewModel *viewModel = [STVVisitsContainerViewModel new];
    [self setViewModel:viewModel];
    [viewModel setViewController:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self viewModel] viewDidLoad];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:kEmbedVisitsMapSegueName]) {
        [self setMapViewController:[segue destinationViewController]];
    }else if ([[segue identifier] isEqualToString:kEmbedVisitsListSegueName]) {
        [self setListViewController:[segue destinationViewController]];
    }
}


@end
