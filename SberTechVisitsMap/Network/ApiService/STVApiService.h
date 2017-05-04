//
//  STVApiService.h
//  SberTechVisitsMap
//
//  Created by Aleksei Kolchanov on 04/05/2017.
//  Copyright © 2017 AlKol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STVApiServiceError.h"

@interface STVApiService : NSObject

@property (nonatomic, strong) NSURLSession *urlSession;
@property (nonatomic, copy) NSString *apiUrl;

@end
