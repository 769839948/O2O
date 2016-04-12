//
//  ProfilesViewController.m
//  O2OProject
//
//  Created by Zhang on 1/28/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "ProfilesViewController.h"
#import "ProfilesTable.h"
#import "ProfilesViewModel.h"
#import "UIImage+UIColor.h"
#import "BaseNavigationController.h"
#import "LoginViewController.h"
#import "SettingViewController.h"
#import "AddressViewController.h"
#import "CollectViewController.h"
#import "HelpViewController.h"
#import "HistoryViewController.h"

#import "UserProfile.h"
#import "User.h"


#import "CoreUmengShare.h"
#import "CoreUMeng.h"

@interface ProfilesViewController ()

@property (nonatomic, strong) ProfilesTable *tableView;
@property (nonatomic, strong) ProfilesViewModel *viewModel;

@property (nonatomic, strong) UserProfile *user;

@end

@implementation ProfilesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    [self setUpNavigationItem];
//    _user = [UserProfile sharedInstance];
//    NSLog(@"");
}

-(void)setUpNavigationItem
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"setting"] style:UIBarButtonItemStyleDone target:self action:@selector(rightPress:)];
}

-(void)rightPress:(UIBarButtonItem *)sender
{
    SettingViewController *settingView = [[SettingViewController alloc] init];
    BaseNavigationController *baseView = [[BaseNavigationController alloc] initWithRootViewController:settingView];
    [self presentViewController:baseView animated:YES completion:nil];
}

-(void)createView
{
    _tableView = [[ProfilesTable alloc] initWithFrame:CGRectMake(0, -64, AppScreenSize.width, AppScreenSize.height + 64) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    [self bindView];
}

-(void)bindView
{
    _viewModel = [[ProfilesViewModel alloc] init];
    
    if ([UserProfile isLoggedIn]) {
        _tableView.userProfile = [_viewModel userProfile];
        [_tableView reloadData];
        _tableView.tableHeaderView = [_tableView headerView];
    }else{
        _tableView.userProfile = [[UserProfile alloc] init];
    }
    _tableView.tableArray = _viewModel.tableArray;
    _tableView.imageArray = _viewModel.imageArray;
    
    
    [_tableView reloadData];
    [RACObserve(_tableView, contentOffset) subscribeNext:^(id x) {
        
        [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithRed:0.0/255.0 green:194.0/255.0 blue:41.0/255.0 alpha:_tableView.contentOffset.y / 90]] forBarMetrics:UIBarMetricsDefault];
        
        if (_tableView.contentOffset.y > 90){
            self.navigationItem.title = @"个人中心";

        }else {
            self.navigationItem.title = nil;
           
        }
    }];
    
    [[_tableView rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:) fromProtocol:@protocol(UITableViewDelegate)]
     subscribeNext:^(RACTuple *tuple) {
        NSLog(@"%@",tuple.second);
         [self navagationPushView:tuple.second];
    }];
    @weakify(self);
    [[_tableView rac_signalForSelector:@selector(handleSingleTapFrom)] subscribeNext:^(id x) {
        LoginViewController *loginView = [[LoginViewController alloc] init];
        @strongify(self);
        loginView.loginSuccess = ^(){
            [[_viewModel requestModel] subscribeNext:^(id x) {
                _tableView.userProfile = [_viewModel userProfile];
                [_tableView reloadData];
            }];
        };
        BaseNavigationController *baseView = [[BaseNavigationController alloc] initWithRootViewController:loginView];
        [self presentViewController:baseView animated:YES completion:nil];
    }];
}


-(void)navagationPushView:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            break;
        case 1:
            if (indexPath.row == 0) {
                AddressViewController *addressView = [[AddressViewController alloc] init];
                BaseNavigationController *baseView = [[BaseNavigationController alloc] initWithRootViewController:addressView];
                [self presentViewController:baseView animated:YES completion:nil];
            }else{
                CollectViewController *collectView = [[CollectViewController alloc] init];
                BaseNavigationController *baseView = [[BaseNavigationController alloc] initWithRootViewController:collectView];
                [self presentViewController:baseView animated:YES completion:nil];
            }
            break;
        case 2:
            {
                HistoryViewController *history = [[HistoryViewController alloc] init];
                BaseNavigationController *baseView = [[BaseNavigationController alloc] initWithRootViewController:history];
                [self presentViewController:baseView animated:YES completion:nil];
            }
            break;
        case 3:
            [CoreUmengShare show:self text:@"视频" image:[UIImage imageNamed:@"1448268756"]];
            break;
        default:
            {
                HelpViewController *helpView = [[HelpViewController alloc] init];
                BaseNavigationController *baseView = [[BaseNavigationController alloc] initWithRootViewController:helpView];
                [self presentViewController:baseView animated:YES completion:nil];
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
