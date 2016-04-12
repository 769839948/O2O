//
//  CommodityView.h
//  O2OProject
//
//  Created by Zhang on 2/4/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Commodity.h"
#import "StoreModel.h"

@interface CommodityView : UIView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) Commodity *model;
@property (nonatomic, strong) StoreModel *storeModel;

@property (nonatomic, strong) UITableView *tableView;

@end
