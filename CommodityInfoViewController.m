//
//  CommodityInfoViewController.m
//  O2OProject
//
//  Created by Zhang on 2/4/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "CommodityInfoViewController.h"
#import "CommodityView.h"
#import "StoreViewController.h"

@interface CommodityInfoViewController ()

@property (nonatomic, strong) CommodityView *commodityView;

@end

@implementation CommodityInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品详情";
    [self setUpCommodituView];
    // Do any additional setup after loading the view.
}


-(void)setUpCommodituView
{
    _commodityView = [[CommodityView alloc] init];
    _commodityView.model = _model;
    _commodityView.storeModel = _storeModel;
    [self.view addSubview:_commodityView];
    [_commodityView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(0);
        make.left.equalTo(self.view.left).offset(0);
        make.right.equalTo(self.view.right).offset(-0);
        make.bottom.equalTo(self.view.bottom).offset(-0);
    }];
    [self bindViewModel];
}

-(void)bindViewModel
{
    [[_commodityView rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:) fromProtocol:@protocol(UITableViewDelegate)] subscribeNext:^(RACTuple *seconde) {
        NSIndexPath *indexPath = (NSIndexPath *)[seconde second];
        if (indexPath.section == 1 && indexPath.row == 0) {
            StoreViewController *storeView = [[StoreViewController alloc] init];
            storeView.model = _storeModel;
            [self.navigationController pushViewController:storeView animated:YES];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
