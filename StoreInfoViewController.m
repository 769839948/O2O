//
//  StoreInfoViewController.m
//  O2OProject
//
//  Created by Zhang on 2/3/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "StoreInfoViewController.h"
#import "StoreViewModel.h"

@interface StoreInfoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) StoreViewModel *viewModel;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *tableArray;

@end

@implementation StoreInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商户详情";
    [self setUpTableView];
}

-(void)setUpTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource =self;
    [_tableView setTableHeaderView:[self headerView]];
    [self.view addSubview:_tableView];
    [self bindeView];
}

-(void)bindeView
{
    _viewModel = [[StoreViewModel alloc] init];
    _tableArray = [_viewModel tableArray];
    [_tableView reloadData];
}

-(UIView *)headerView
{
    UIView *headerView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, AppScreenSize.width, 100)];
    headerView.backgroundColor = [UIColor colorWithRed:124.0/255 green:127/255.0 blue:98/255.0 alpha:1.0];
    
    
    UIImageView *storeImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 90, 60)];
    [storeImage sd_setImageWithURL:[NSURL URLWithString:_model.preview] placeholderImage:[UIImage imageNamed:@""]];
    [headerView addSubview:storeImage];
    
    UILabel *storeName = [[UILabel alloc] initWithFrame:CGRectMake(storeImage.frame.size.width + storeImage.frame.origin.x +10, 10, 190, 20)];
    storeName.font = [UIFont systemFontOfSize:13.0];
    storeName.textColor = [UIColor whiteColor];
    storeName.text = _model.name;
    [headerView addSubview:storeName];
    
    UILabel *score = [[UILabel alloc] initWithFrame:CGRectMake(storeImage.frame.size.width + storeImage.frame.origin.x +30, 45, 90, 20)];
    score.font = [UIFont systemFontOfSize:13.0];
    score.textColor = [UIColor whiteColor];
    score.text = [NSString stringWithFormat:@"%ld",(long)_model.avg_point];
    [headerView addSubview:score];
    
    UILabel *numberSale = [[UILabel alloc] initWithFrame:CGRectMake(storeImage.frame.size.width + storeImage.frame.origin.x +30, 65, 90, 20)];
    numberSale.font = [UIFont systemFontOfSize:13.0];
    numberSale.textColor = [UIColor whiteColor];
//    numberSale.text = [NSString stringWithFormat:@"月售%@笔",10];
    [headerView addSubview:numberSale];
    
    return headerView;
}
-(NSMutableArray *)cellArray
{
    NSMutableArray *tableArray = [[NSMutableArray alloc] init];
    [tableArray addObject:@"9:00-14:00"];
    [tableArray addObject:_model.address];
    [tableArray addObject:_model.tel];
    [tableArray addObject:_model.is_verify];
    [tableArray addObject:@"ddd"];
    return tableArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate&DateSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 6;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 1;
        default:
            return 1;
            break;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            if (indexPath.row == 0) {
                static NSString *cellIdentifier = @"InfoCellIdentifier";
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
                if (cell == nil) {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
                }
                UILabel *startLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 90, 40)];
                startLable.textColor = [UIColor greenColor];
                startLable.textAlignment = NSTextAlignmentCenter;
                startLable.text = [NSString stringWithFormat:@"起送 ￥%@",@""];
                [cell.contentView addSubview:startLable];
                UILabel *senderLable = [[UILabel alloc] initWithFrame:CGRectMake(startLable.frame.size.width + startLable.frame.origin.x, 0, 90, 40)];
                senderLable.text = [NSString stringWithFormat:@"配送 ￥%@",@""];
                senderLable.textColor = [UIColor greenColor];
                senderLable.textAlignment = NSTextAlignmentCenter;
                [cell.contentView addSubview:senderLable];
                return cell;
            }else{
                static NSString *cellIdentifier = @"InfoCellIdentifier";
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
                if (cell == nil) {
                    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
                }
                cell.accessoryType = UITableViewRowActionStyleDestructive;
                cell.textLabel.text = _tableArray[indexPath.row - 1];
                cell.detailTextLabel.text = self.cellArray[indexPath.row - 1];
                return cell;
            }
        }
            break;
        case 1:
        {
            static NSString *cellIdentifier = @"PromptCellIdentifier";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            cell.imageView.image = [UIImage imageNamed:@"oldUser.png"];
            cell.textLabel.text = @"新用户减100元";
//            cell.textLabel.text = _model.oldUserLable;
            return cell;
        }
            break;
        case 2:
        {
            static NSString *cellIdentifier = @"OnlineCellIdentifier";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            
            cell.imageView.image = [UIImage imageNamed:@"pay.png"];
            cell.textLabel.text = @"支持在线支付";
//            if (_model.onlinePay) {
//                cell.textLabel.text = @"支持在线支付";
//            }else{
//                cell.textLabel.text = @"不支持在线支付";
//            }
            return cell;
        }
            break;
        default:
        {
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
             break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
