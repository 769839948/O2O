//
//  CommodityInfoViewController.h
//  O2OProject
//
//  Created by Zhang on 2/4/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "BaseViewController.h"
#import "Commodity.h"
#import "StoreModel.h"

@interface CommodityInfoViewController : BaseViewController

@property (nonatomic, strong) StoreModel *storeModel;
@property (nonatomic, strong) Commodity *model;

@end
