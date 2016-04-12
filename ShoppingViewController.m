//
//  ShoppingViewController.m
//  O2OProject
//
//  Created by Zhang on 1/28/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "ShoppingViewController.h"
#import "SAddressTableViewCell.h"
#import "CommoditysTableViewCell.h"

@interface ShoppingViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购物车";
    [self setUpTableView];
    // Do any additional setup after loading the view.
}

-(void)setUpTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma make - UITableViewDelegate&DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            static NSString *cellIdentifier = @"AddressCell";
            SAddressTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (!cell) {
                cell = [[SAddressTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            
            
            return cell;
        }
            break;
        case 1:
        {
            static NSString *cellIdentifier = @"LocationCell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            
            cell.textLabel.text = @"【当前】果粒多北京店";
            return cell;
        }
            break;
        case 2:
        {
            static NSString *cellIdentifier = @"StoreCell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            
            cell.textLabel.text = @"快果超市";
            return cell;
        }
            break;
        default:
        {
            static NSString *cellIdentifier = @"StoreCell";
            CommoditysTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (!cell) {
                cell = [[CommoditysTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            }
            
//            cell.textLabel.text = @"快果超市";
            return cell;
        }
            break;
    }
}

@end
