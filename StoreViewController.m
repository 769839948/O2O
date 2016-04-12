//
//  StoreViewController.m
//  O2OProject
//
//  Created by Zhang on 2/3/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "StoreViewController.h"
#import "StoreView.h"
#import "StoreViewModel.h"
#import "StoreInfoViewController.h"
#import "CommodityInfoViewController.h"

@interface StoreViewController ()

@property (nonatomic, strong) StoreView *storeView;
@property (nonatomic, strong) StoreViewModel *viewModel;

@property (nonatomic, strong) StoreInfoModel *infoModel;

@end

@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = _model.shop;
    [self setUpstoreView];
    [self setUpBootView];
    // Do any additional setup after loading the view.
}

-(void)setUpstoreView
{
    _storeView = [[StoreView alloc] init];
    _storeView.model = self.model;
    [self.view addSubview:_storeView];
    [_storeView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(0);
        make.left.equalTo(self.view.left).offset(0);
        make.right.equalTo(self.view.right).offset(-0);
        make.bottom.equalTo(self.view.bottom).offset(-50);
    }];
    
    [self bindViewModel];
}

-(void)bindViewModel
{
    _viewModel = [[StoreViewModel alloc] init];
    [[_viewModel requestSignal:_model.id] subscribeNext:^(StoreInfoModel *model) {
        _infoModel = model;
        [_storeView.collectView reloadData];
    }];
    @weakify(self);
    [[_storeView rac_signalForSelector:@selector(oneTapGesture:)] subscribeNext:^(id x) {
        @strongify(self);
        StoreInfoViewController *infoView = [[StoreInfoViewController alloc] init];
        infoView.model = _infoModel.store_info;
        infoView.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:infoView animated:YES];
    }];
    
//    @weakify(self);
    [[_storeView rac_signalForSelector:@selector(collectionView:didSelectItemAtIndexPath:) fromProtocol:@protocol(UICollectionViewDelegate)] subscribeNext:^(RACTuple *second) {
//        @strongify(self);
        CommodityInfoViewController *infoView = [[CommodityInfoViewController alloc] init];
        NSIndexPath *indexPath = (NSIndexPath *)[second second];
        infoView.model = _storeView.commodityArray[indexPath.row];
        infoView.storeModel = _model;
        infoView.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:infoView animated:YES];
    }];
    
}

-(void)setUpBootView
{
    UIView *bootomView = [[UIView alloc] init];
    bootomView.backgroundColor = [UIColor colorWithRed:84/255.0 green:84.0/255.0 blue:84.0/255.0 alpha:0.5];
//    [bootomView setBackgroundColor:[UIColor clearColor]];

    [self.view addSubview:bootomView];
    [bootomView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.bottom).offset(-0);
        make.left.equalTo(self.view.left).offset(-0);
        make.right.equalTo (self.view.right).offset(-0);
        make.height.equalTo(50);
    }];
    
    UIImageView *buyingCar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"buyingCart.png"]];
    [bootomView addSubview:buyingCar];
    
    [buyingCar makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bootomView.top).offset(10);
        make.bottom.equalTo(bootomView.bottom).offset(-10);
        make.left.equalTo(bootomView.left).offset(10);
        make.size.equalTo(CGSizeMake(30, 30));
    }];
    
    UILabel *number = [[UILabel alloc] init];
    number.text = @"购物车是空的";
    number.textColor = [UIColor whiteColor];
    number.textAlignment = NSTextAlignmentLeft;
    number.backgroundColor = [UIColor clearColor];
    number.font = [UIFont systemFontOfSize:16.0];
    [bootomView addSubview:number];
    
    UILabel *senderMuch = [[UILabel alloc] init];
    senderMuch.text = @"50元起送";
    senderMuch.backgroundColor = [UIColor clearColor];
    senderMuch.textAlignment = NSTextAlignmentRight;
    senderMuch.textColor = [UIColor whiteColor];
    senderMuch.font = [UIFont systemFontOfSize:15.0];
    [bootomView addSubview:senderMuch];
    
    [number makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bootomView.top).offset(15);
        make.bottom.equalTo(bootomView.bottom).offset(-10);
        make.left.equalTo(buyingCar.right).offset(10);
        make.right.equalTo(self.view.right).offset(-50);
        make.height.equalTo(senderMuch.height);
//        make.size.equalTo(CGSizeMake(30, 20));
    }];
    
    [senderMuch makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bootomView.top).offset(20);
        make.bottom.equalTo(bootomView.bottom).offset(-10);
        make.left.equalTo(buyingCar.right).offset(10);
        make.right.equalTo(self.view.right).offset(-10);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UICollectViewDelegate&DataSource



@end
