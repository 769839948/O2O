//
//  SupermarketViewController.h
//  O2OProject
//
//  Created by Zhang on 2/2/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "BaseViewController.h"
#import "HomeModel.h"

@interface SupermarketViewController : BaseViewController


@property (nonatomic, strong) HomeIndexModle *model;
@property (nonatomic, copy, readwrite) NSMutableArray *storyArray;

@end
