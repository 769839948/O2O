//
//  HelpViewController.m
//  O2OProject
//
//  Created by Zhang on 1/31/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "HelpViewController.h"
#import "UIViewController+LeftItem.h"

@interface HelpViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) NSArray *tableArray;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"帮助中心";
    self.navigationItem.leftBarButtonItem = [self setLeftItem];
    _tableArray = @[@"客服电话",@"支付方式",@"配送方式",@"售后服务",@"常见问题",];
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _tableArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndefier = @"HelpCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndefier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndefier];
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = _tableArray[indexPath.section];
    return cell;
}

@end
