//
//  CommodityView.m
//  O2OProject
//
//  Created by Zhang on 2/4/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "CommodityView.h"
#import "CommodityCell.h"
#import "CommodityCommentCell.h"

@implementation CommodityView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpTableView];
    }
    return self;
}

-(void)setUpTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, AppScreenSize.width, AppScreenSize.height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self addSubview:_tableView];
}

-(NSMutableArray *)cellTableArray
{
    NSMutableArray *cellArray = [[NSMutableArray alloc] init];
//    [cellArray addObject:_storeModel.shop];
//    [cellArray addObject:_storeModel.address];
//    [cellArray addObject:@"商品详情"];
    return cellArray;
}

#pragma mark - UITableViewDelegate&DateSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            return 1;
        }
            break;
        case 1:
        {
            return 3;
        }
            break;
        default:
        {
            return 2;
        }
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            return 210;
        }
            break;
        case 1:
        {
            return 40;
        }
            break;
        default:
        {
            return 60;
        }
            break;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            static NSString *cellIdentifier = @"CommodityCell";
            CommodityCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil) {
                cell = [[CommodityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            [cell setData:_model];
            return cell;
        }
            break;
        case 1:
        {
            static NSString *cellIdentifier = @"StoreInfoCell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = self.cellTableArray[indexPath.row];
            return cell;
        }
            break;
        default:
        {
            if (indexPath.row == 0)
            {
                static NSString *cellIdentifier = @"CommodityCommentCell";
                CommodityCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
                if (cell == nil) {
                    cell = [[CommodityCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
                }
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.numberComment.text = @"4人评价";
                cell.commentScore.text = @"100%";
//                [NSString stringWithFormat:@"4人评价"];
                return cell;
            }else{
                static NSString *cellIdentifier = @"cellIdentifier";
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
                if (cell == nil) {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
                }
                
                UILabel *cellLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, AppScreenSize.width, 40)];
                cellLable.text = @"举报商家";
                cellLable.textAlignment = NSTextAlignmentCenter;
                cellLable.textColor = [UIColor greenColor];
                [cell.contentView addSubview:cellLable];
                return cell;
            }
        }
            break;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
