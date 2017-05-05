//
//  STVVisitsListViewController.m
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import "STVVisitsListViewController.h"
#import "STVVisitsListViewModel.h"
#import "STVVisitCollectionViewCell.h"

NSString * const kVisitCollectionViewCellIdentifier = @"STVVisitCollectionViewCell";

@interface STVVisitsListViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *visits;

@end



@implementation STVVisitsListViewController

@synthesize visits = _visits;

- (void)buildModule {
    STVVisitsListViewModel *viewModel = [STVVisitsListViewModel new];
    [self setViewModel:viewModel];
    [viewModel setViewController:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAppearance];
    [[self viewModel] viewDidLoad];
}

- (void)setupAppearance {
    UIEdgeInsets insets = [[self collectionView] contentInset];
    insets.top = 28;
    [[self collectionView] setContentInset:insets];
    [[self collectionView] setScrollIndicatorInsets:insets];
}

- (NSArray *)visits {
    if (!_visits) {
        _visits = @[];
    }
    return _visits;
}

- (void)setVisits:(NSArray *)visits {
    _visits = visits;
    [[self collectionView] reloadData];
}

#pragma mark - STVVisitsListViewControllerProtocol
- (void)selectVisitWithId:(NSString *)visitId makeVisible:(BOOL)makeVisible animated:(BOOL)animated {
    NSInteger visitIndex = [self indexOfVisitWithId:visitId];
    
    if (visitIndex == NSNotFound) {
        return;
    }
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:visitIndex inSection:0];
    UICollectionViewScrollPosition scrollPosition = UICollectionViewScrollPositionNone;
    if (makeVisible) {
        scrollPosition = UICollectionViewScrollPositionTop;
    }
    
    [[self collectionView] selectItemAtIndexPath:indexPath animated:animated scrollPosition:scrollPosition];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self visits] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    STVVisitCollectionViewCell *cell = [[self collectionView] dequeueReusableCellWithReuseIdentifier:kVisitCollectionViewCellIdentifier forIndexPath:indexPath];
    
    STVVisit *visit = [self visits][[indexPath item]];
    
    [[cell titleLabel] setText:[visit title]];
    [[cell organizationLabel] setText:[[visit organization] title]];
    return cell;
}

#pragma mark - UICollectionViewDelegate 
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    STVVisit *visit = [self visits][[indexPath item]];
    [[self viewModel] didSelectVisit:visit];
}

#pragma mark - Private
- (NSInteger)indexOfVisitWithId:(NSString *)visitId {
    __block NSInteger index = NSNotFound;
    [[self visits] enumerateObjectsUsingBlock:^(STVVisit *visit, NSUInteger idx, BOOL *stop) {
        if ([[visit identifier] isEqualToString:visitId]) {
            index = idx;
            *stop = YES;
        }
    }];
    return index;
}


@end
