//
//  CustomTabBarController.m
//  O2OProject
//
//  Created by Zhang on 1/28/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "CustomTabBarController.h"
#import "HomeViewController.h"
#import "ShoppingViewController.h"
#import "OrderViewController.h"
#import "ProfilesViewController.h"
#import "BaseNavigationController.h"

@interface CustomTabBarController ()

@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BaseNavigationController *home = [self viewController:[[HomeViewController alloc] init] withTitle:@"首页"];
    home.tabBarItem.image = [UIImage imageNamed:@"home_normal"];
    
    BaseNavigationController *shop = [self viewController:[[ShoppingViewController alloc] init] withTitle:@"购物车"];
    shop.tabBarItem.image = [UIImage imageNamed:@"cart_nomal"];
    
    BaseNavigationController *order = [self viewController:[[OrderViewController alloc] init] withTitle:@"订单"];
    order.tabBarItem.image = [UIImage imageNamed:@"order_normal"];
    
    BaseNavigationController *profiles = [self viewController:[[ProfilesViewController alloc] init] withTitle:@"个人"];
    profiles.tabBarItem.image = [UIImage imageNamed:@"ming_nomal"];
//    ProfilesViewController *profiles = [[ProfilesViewController alloc] init];
    self.selectedIndex = 0;
    self.viewControllers = @[home,shop,order,profiles];
    
    // Do any additional setup after loading the view.
}


-(BaseNavigationController *)viewController:(UIViewController *)controller withTitle:(NSString *)title
{
    BaseNavigationController *baseView = [[BaseNavigationController alloc] initWithRootViewController:controller];
    controller.title = title;
    baseView.tabBarItem.title = title;
    return baseView;
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
