//
//  HomeView.h
//  O2OProject
//
//  Created by Zhang on 1/31/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonTableViewCell.h"
#import "HomeModel.h"
#import "SDCycleScrollView.h"

@protocol HomeViewDelegate

-(void)adCellPress:(NSInteger)tag;
-(void)buttonCellPress:(UIButton *)tag;
-(void)affordableCellPress:(NSInteger)tag;
-(void)oddsCellPress:(NSInteger)tag;

@end

@interface HomeView : UIView<UITableViewDelegate,UITableViewDataSource,ButtonTableCellDelegate,SDCycleScrollViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy, readwrite) NSMutableArray *storeArray;

@property (nonatomic, strong) HomeModel *model;

@property (nonatomic, weak) id<HomeViewDelegate> delegate;


-(void)reloadData;

@end
