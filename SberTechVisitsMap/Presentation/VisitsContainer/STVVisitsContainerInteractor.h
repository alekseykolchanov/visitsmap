//
//  STVVisitsContainerInteractor.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STVStorage.h"

@protocol STVVisitsContainerViewModelProtocol

@end

@interface STVVisitsContainerInteractor : NSObject

@property (nonatomic, weak) id<STVVisitsContainerViewModelProtocol> viewModel;

@property (nonatomic, strong) STVStorage *storage;

- (void)reloadVisitsWithCompletion:(void (^)(NSArray *visits, NSError *error))completion;
- (NSArray *)getAllVisits;

@end
