//
//  HomeView.m
//  O2OProject
//
//  Created by Zhang on 1/31/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "HomeView.h"
#import "AddressModel.h"
#import "StoreTableViewCell.h"


@implementation HomeView

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


-(void)reloadData
{
    [_tableView reloadData];
}

#pragma mark - ButtonViewDelegate
-(void)buttonPress:(UIButton *)button
{
    [_delegate buttonCellPress:button];
}

#pragma mark- UITableViewDelegate&DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }else{
//        return 1;
        return _model.supplier_list.count + 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 122;
        }else{
            return 80;
        }
        
    }else{
        if (indexPath.row == 0) {
            return 150;
        }else{
            return 140;
        }
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            static NSString *cellIdentifier = @"AdTableViewCell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, AppScreenSize.width, 120) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
            cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
            cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSMutableArray *urlString = [[NSMutableArray alloc] init];
                for (int i = 0; i < _model.advs.count; i++) {
                    [urlString addObject:[_model.advs[i] img]];
                }
                cycleScrollView.imageURLStringsGroup = urlString;
            });
            [cell.contentView addSubview:cycleScrollView];
            return cell;
        }else{
            static NSString *cellIdentifier = @"ButtonTableViewCell";
            ButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (!cell) {
                cell = [[ButtonTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            cell.delegate = self;
            return cell;
        }
    }else{
        if (indexPath.row == 0) {
            static NSString *cellIdentifier = @"RefinanceCell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, AppScreenSize.width/2-70, 1)];
            line.backgroundColor = [UIColor lightGrayColor];
            [cell addSubview:line];
            UILabel *line1 = [[UILabel alloc] initWithFrame:CGRectMake(AppScreenSize.width/2 + 50, 30, AppScreenSize.width/2-80, 1)];
            line1.backgroundColor = [UIColor lightGrayColor];
            [cell addSubview:line1];
            
            UILabel *textLable = [[UILabel alloc] initWithFrame:CGRectMake(AppScreenSize.width/2-40, 20, 80, 20)];
            textLable.text = @"众筹专区";
            [cell addSubview:textLable];
            
            UILabel *line3 = [[UILabel alloc] initWithFrame:CGRectMake(20, 140, AppScreenSize.width/2-70, 1)];
            line3.backgroundColor = [UIColor lightGrayColor];
            [cell addSubview:line3];
            UILabel *line4 = [[UILabel alloc] initWithFrame:CGRectMake(AppScreenSize.width/2 + 50, 140, AppScreenSize.width/2-80, 1)];
            line4.backgroundColor = [UIColor lightGrayColor];
            [cell addSubview:line4];
            
            UILabel *textLable1 = [[UILabel alloc] initWithFrame:CGRectMake(AppScreenSize.width/2-50, 130, 120, 20)];
            textLable1.text = @"实时为你推荐";
            [cell addSubview:textLable1];
            
            UIButton *refinanceBt = [UIButton buttonWithType:UIButtonTypeCustom];
            refinanceBt.backgroundColor = [UIColor grayColor];
            [[refinanceBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
                NSLog(@"refinaceBt Press");
            }];
            [cell addSubview:refinanceBt];
            
            return cell;
        }else{
            static NSString *cellIdentifier = @"StoreTableViewCell";
            StoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (!cell) {
                cell = [[StoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            [cell setData:_storeArray[indexPath.row - 1]];
            return cell;
        }
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    
//    [self.navigationController pushViewController:[NSClassFromString(@"DemoVCWithXib") new] animated:YES];
}

@end
