//
//  CollectViewController.m
//  O2OProject
//
//  Created by Zhang on 1/31/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "CollectViewController.h"
#import "CollectTableViewCell.h"
#import "CollectViewModel.h"
#import "UIViewController+LeftItem.h"
#import "MJRefresh.h"

@interface CollectViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CollectViewModel *viewModel;
@property (nonatomic, copy) NSMutableArray *collectArray;

@property (nonatomic, strong) UIView *deleteView;

@end

@implementation CollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的收藏";
    [self setUpTableView];
    [self setUpNavigationItem];
    // Do any additional setup after loading the view.
}

-(void)setUpNavigationItem
{
    self.navigationItem.leftBarButtonItem = [self setLeftItem];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(rightBtPress:)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

-(void)rightBtPress:(UIBarButtonItem *)sender
{
    self.tableView.editing = YES;
    [self setUpDeletView];
}

-(void)setUpTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = [self headerView];
    [self.view addSubview:_tableView];
    [self bindViewModel];
}

-(UIView *)headerView
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, AppScreenSize.width, 44)];
    UILabel *textLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, AppScreenSize.width, 20)];
    textLable.text = @"全部分类";
    [headerView addSubview:textLable];
    UIButton *categoryBt = [UIButton buttonWithType:UIButtonTypeCustom];
    categoryBt.frame = CGRectMake(0, 0, AppScreenSize.width, headerView.frame.size.height);
    categoryBt.backgroundColor = [UIColor clearColor];
    [headerView addSubview:categoryBt];
    return headerView;
    
}

-(void)setUpDeletView
{
    if (!_deleteView) {
        _deleteView = [[UIView alloc] init];
        
        [self.view addSubview:_deleteView];
        [_deleteView makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.view.bottom).offset(-40);
            make.left.equalTo(self.view.left).offset(0);
            make.right.equalTo(self.view.right).offset(-0);
            make.size.height.equalTo(40);
        }];
        UIButton *deleteBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [deleteBt setTitle:@"删除" forState:UIControlStateNormal];
        deleteBt.frame = CGRectMake(0, 0, _deleteView.frame.size.width, 40);
        [_deleteView addSubview:deleteBt];
        [[deleteBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            NSLog(@"delete button Press");
        }];
    }
    _deleteView.hidden = NO;
}

-(void)bindViewModel
{
    _viewModel = [[CollectViewModel alloc] init];
    _collectArray = [[NSMutableArray alloc] init];
    @weakify(self);
    [[_viewModel collectRequest:@"0"] subscribeNext:^(NSArray *collectArray) {
        @strongify(self);
        [_collectArray removeAllObjects];
        _collectArray = [NSMutableArray arrayWithArray:collectArray];
        [self.tableView reloadData];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegateDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _collectArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 80;
    }else{
        return 44;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndefier = @"HelpCell";
    CollectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndefier];
    if (cell == nil) {
        cell = [[CollectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndefier];
    }
    [cell cofigCell:_collectArray[indexPath.row] withIndexPath:indexPath];
    [[cell.addButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"add BUtton is Press");
//        [self addCollerModel];
    }];
    return cell;
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
