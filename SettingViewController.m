//
//  SettingViewController.m
//  O2OProject
//
//  Created by Zhang on 1/30/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "SettingViewController.h"
#import "UserInfoViewController.h"
#import "AccountViewController.h"
#import "FeedbackViewController.h"
#import "AboutViewController.h"
#import "UIImage+UIColor.h"
#import "UIViewController+LeftItem.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) NSArray *tableArray;
@property (nonatomic, strong) UITableView *tableView;


@property (nonatomic, strong) UILabel  *userLable;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    self.navigationItem.leftBarButtonItem = [self setLeftItem];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithRed:0.0/255.0 green:194.0/255.0 blue:41.0/255.0 alpha:1]] forBarMetrics:UIBarMetricsDefault];
    _tableArray = @[@[@"个人信息"],@[@"账户安全"],@[@"意见反馈",@"关于我们"],@[@"退出登录"]];
    [self setUpTableView];
    
    // Do any additional setup after loading the view.
}

-(void)setUpTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate&DataSource

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _tableArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableArray[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"SettingCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if (indexPath.section == _tableArray.count) {
        _userLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, AppScreenSize.width, 44)];
        _userLable.text = @"退出登录";
        _userLable.textAlignment = NSTextAlignmentCenter;
        _userLable.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:_userLable];
    }else {
        cell.textLabel.text = _tableArray[indexPath.section][indexPath.row];
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            [self.navigationController pushViewController:[[UserInfoViewController alloc] init] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[[AccountViewController alloc] init] animated:YES];
            break;
        case 2:
            if (indexPath.row == 0) {
                [self.navigationController pushViewController:[[FeedbackViewController alloc] init]animated:YES];
            }else{
               [self.navigationController pushViewController:[[AboutViewController alloc] init]animated:YES];
            }
            break;
        default:
            [self loginOut];
            break;
    }
}

-(void)loginOut
{
    
}

@end
