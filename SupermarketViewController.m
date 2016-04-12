//
//  SupermarketViewController.m
//  O2OProject
//
//  Created by Zhang on 2/2/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "SupermarketViewController.h"
#import "StoreTableViewCell.h"
#import "HomeViewModel.h"
#import "StoreViewController.h"

@interface SupermarketViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HomeViewModel *viewModel;

@end

@implementation SupermarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"超市频道";
    self.storyArray = [[NSMutableArray alloc] init];
    [self setNavigationItem];
    [self setUpTableView];
    // Do any additional setup after loading the view.
}

-(void)setNavigationItem
{
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(rightPress:)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
}

-(void)rightPress:(UIBarButtonItem *)sender
{
    
}

-(void)setUpTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = [self setUpHeaderView];
    [self.view addSubview:_tableView];
    
    [self bindViewModel];
}

-(UIView *)setUpHeaderView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, AppScreenSize.width, 20)];
    UIButton *sortBt = [UIButton buttonWithType:UIButtonTypeCustom];
    sortBt.frame = headerView.frame;
    [sortBt setTitle:@"智能排序" forState:UIControlStateNormal];
    [[sortBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"智能排序点击");
    }];
    [headerView addSubview:sortBt];
    return headerView;
}

-(void)bindViewModel
{
    _viewModel = [[HomeViewModel alloc] init];
    [[_viewModel requestSuperMarkView:@"15"] subscribeNext:^(NSMutableArray *storeModelArray) {
        self.storyArray = storeModelArray;
        [self.tableView reloadData];
    }];
}

#pragma mark- UITableViewDelegate&DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _storyArray.count;
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
    
    return 140;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIdentifier = @"storeTableViewCell";
    StoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[StoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [cell setData:_storyArray[indexPath.row]];
    return cell;
   
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    StoreViewController *storeView = [[StoreViewController alloc] init];
    storeView.hidesBottomBarWhenPushed = YES;
    storeView.model = _storyArray[indexPath.row];
    [self.navigationController pushViewController:storeView animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
