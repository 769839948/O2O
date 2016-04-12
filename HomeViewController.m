//
//  HomeViewController.m
//  O2OProject
//
//  Created by Zhang on 1/28/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"
#import "SupermarketViewController.h"
#import "OutsideViewController.h"
#import "BreakfastViewController.h"
#import "GroupBuyingViewController.h"
#import "HomeViewModel.h"
#import "HomeModel.h"
#import "StoreViewController.h"
#import "CityModel.h"
#import <AMapLocationKit/AMapLocationManager.h>

@interface HomeViewController ()<UISearchBarDelegate,HomeViewDelegate>

@property (nonatomic, strong) AMapLocationManager *locationManager;
@property (nonatomic, strong) HomeView *homeView;

@property (nonatomic, strong) HomeViewModel *viewModel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _locationManager = [[AMapLocationManager alloc] init];
    [self titleView];
    [self setLocation];
    [self setUpHomeView];
    // Do any additional setup after loading the view.
}

-(void)titleView
{
    UIView *titleView = [[UIView alloc] initWithFrame:self.navigationController.navigationBar.frame];
//    [titleView setBackgroundColor:[UIColor redColor]];
    self.navigationItem.titleView  = titleView;
    
    UILabel *lableView = [[UILabel alloc] init];
    lableView.text = @"送至:";
    lableView.textAlignment = NSTextAlignmentCenter;
    lableView.font = [UIFont systemFontOfSize:15.0];
    lableView.textColor = [UIColor whiteColor];
    
    [[self setLocation] subscribeNext:^(id x) {
        lableView.text = [NSString stringWithFormat:@"送至:%@",x];
    }];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 5, AppScreenSize.width-20, 20)];
    searchBar.backgroundColor = [UIColor redColor];
    searchBar.placeholder = @"搜索附近商店和门店";
    [titleView addSubview:searchBar];
    [titleView addSubview:lableView];
    
    [lableView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleView).offset(2);
        make.left.equalTo(titleView).offset(10);
        make.right.equalTo(titleView).offset(-10);
        make.bottom.equalTo(titleView).offset(-20);
    }];
    [searchBar makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleView).offset(20);
        make.left.equalTo(titleView).offset(10);
        make.right.equalTo(titleView).offset(-10);
        make.bottom.equalTo(titleView).offset(-2);
        
    }];
}

-(RACSignal *)setLocation
{
    RACSignal *location = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
            
            if (error)
            {
                NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
                
                if (error.code == AMapLocationErrorLocateFailed)
                {
                    [subscriber sendNext:@"定位错误"];
                    return;
                }
            }
            
            NSLog(@"location:%@", location);
            
            if (regeocode)
            {
                [subscriber sendNext:regeocode];
                NSLog(@"reGeocode:%@", regeocode);
            }
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return location;
    
}

-(void)setUpHomeView
{
    _homeView = [[HomeView alloc] init];
    _homeView.backgroundColor = [UIColor redColor];
    _homeView.delegate = self;
    [self.view addSubview:_homeView];
    [_homeView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(0);
        make.left.equalTo(self.view.left).offset(0);
        make.right.equalTo(self.view.right).offset(-0);
        make.bottom.equalTo(self.view.bottom).offset(-0);
    }];
    
    [self bindViewModel];
}

-(void)bindViewModel
{
    _viewModel = [[HomeViewModel alloc] init];
    [[_viewModel requestHomeView:@"all"] subscribeNext:^(HomeModel *model) {
        _homeView.model = model;
        [_homeView.tableView reloadData];
    }];
    [[_viewModel requestCityView] subscribeNext:^(CityModel *model) {
//        _homeView.model = model;
//        [_homeView.tableView reloadData];
        
    }];
    
    __weak typeof(self) WeakSelf = self;
   [[_homeView rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:) fromProtocol:@protocol(UITableViewDelegate)] subscribeNext:^(RACTuple *second) {
      
        NSIndexPath *indexPath = (NSIndexPath *)[second second];
        if (indexPath.section ==1 && indexPath.row >=1) {
            StoreViewController *storeView = [[StoreViewController alloc] init];
            storeView.model = [_homeView.storeArray objectAtIndex:indexPath.row - 1];
            [WeakSelf.navigationController pushViewController:storeView animated:YES];
        }
    }];
    
}

#pragma mark HomeViewDelegate
-(void)buttonCellPress:(UIButton *)button
{
    NSLog(@"%ld",(long)button.tag);
    HomeIndexModle *index = _homeView.model.indexs[button.tag];
    switch (button.tag) {
        case 0:
        {
            SupermarketViewController *superMark = [[SupermarketViewController alloc] init];
            superMark.model = index;
            superMark.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:superMark animated:YES];
        }
            break;
        case 1:
        {
            OutsideViewController *outside = [[OutsideViewController alloc] init];
            outside.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:outside animated:YES];
        }
            break;
        case 2:
        {
            BreakfastViewController *breakfast = [[BreakfastViewController alloc] init];
            breakfast.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:breakfast animated:YES];
        }
            break;
            
        default:
        {
            GroupBuyingViewController *groupBuying = [[GroupBuyingViewController alloc] init];
            groupBuying.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:groupBuying animated:YES];
        }
            break;
    }

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
