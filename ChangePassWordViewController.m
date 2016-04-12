//
//  ChangePassWordViewController.m
//  O2OProject
//
//  Created by Zhang on 1/30/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "ChangePassWordViewController.h"
#import "ChangePassword.h"
#import "ChangePasswordViewModel.h"

@interface ChangePassWordViewController ()

@property (nonatomic, strong) ChangePassword *changePasswordView;
@property (nonatomic, strong) ChangePasswordViewModel *viewModel;

@end

@implementation ChangePassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改登录密码";
    [self setUpView];
    // Do any additional setup after loading the view.
}

-(void)setUpView
{
    _changePasswordView = [[ChangePassword alloc] init];
    [self.view addSubview:_changePasswordView];
    int padding = 0;
    [_changePasswordView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(padding);
        make.left.equalTo(self.view.left).offset(padding);
        make.bottom.equalTo(self.view.bottom).offset(-padding);
        make.right.equalTo(self.view.right).offset(-padding);
    }];
    
    [self bindViewModel];
}

-(void)bindViewModel
{
    _viewModel = [[ChangePasswordViewModel alloc] init];
    
    RAC(_changePasswordView.changeBt,enabled) = [_viewModel changePasswordUpActiveSignal:[_changePasswordView.phone rac_textSignal] password:[_changePasswordView.password rac_textSignal] validPassword:[_changePasswordView.validPassword rac_textSignal]];
    
    [[[_changePasswordView.changeBt rac_signalForControlEvents:UIControlEventTouchUpInside] flattenMap:^id(id value) {
        [self showHudInView:self.view hint:@"修改中"];
        return [_viewModel requestChangePassword:_changePasswordView.phone.text password:_changePasswordView.password.text];
    }] subscribeNext:^(id x) {
        [self hideHud];
        NSLog(@"x");
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
