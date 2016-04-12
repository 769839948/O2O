//
//  AddressViewController.m
//  O2OProject
//
//  Created by Zhang on 1/31/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "AddressViewController.h"
#import "AddressTableViewCell.h"
#import "AddAddressViewController.h"
#import "UIViewController+LeftItem.h"
#import "AddressViewModel.h"
#import "User.h"

@interface AddressViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) NSMutableArray *addressArray;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) AddressViewModel *viewModel;

@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"地址管理";
    self.navigationItem.leftBarButtonItem = [self setLeftItem];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"新建地址" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarPress:)];
    [self setUpTableView];
    // Do any additional setup after loading the view.
}

-(void)rightBarPress:(UIBarButtonItem *)sender
{
    AddAddressViewController *addressView = [[AddAddressViewController alloc] init];
    addressView.model = [[AddressModel alloc] init];
    [self.navigationController pushViewController:addressView animated:YES];
}

-(void)setUpTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [self bindViewModel];
}

-(void)bindViewModel
{
    _viewModel = [[AddressViewModel alloc] init];
    if ([User isLoggedIn]) {
        [self requestAddress];
    }
}

-(void)requestAddress
{
    @weakify(self)
    [[_viewModel requestModel] subscribeNext:^(NSMutableArray *addressArray) {
        @strongify(self);
        self.addressArray = [addressArray mutableCopy];
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma make - UITableViewDelegate&DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _addressArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndefier = @"HelpCell";
    AddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndefier];
    if (cell == nil) {
        cell = [[AddressTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndefier];
    }
    [cell configCell:_addressArray[indexPath.row] withIndex:indexPath];
   
   
    @weakify(self);
    [[cell.editBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        AddAddressViewController *addressView = [[AddAddressViewController alloc] init];
        addressView.model = _addressArray[indexPath.row];
        [self.navigationController pushViewController:addressView animated:YES];
    }];
    
    [[cell.deleteBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//        [[_viewModel requestDelModel:[_addressArray[indexPath.row] ID]] subscribeNext:^(NSString *info) {
//            
//            TTAlertNoTitle(info);
//            [self requestAddress];
//        }];
        
    }];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_viewModel requestNomalModel:_addressArray[indexPath.row]];
}

@end
