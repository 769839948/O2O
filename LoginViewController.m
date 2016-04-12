//
//  LoginViewController.m
//  O2OProject
//
//  Created by Zhang on 1/28/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "LoginViewModel.h"
#import "ForgetPassWordViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong) LoginView *loginView;
@property (nonatomic, strong) LoginViewModel *viewModel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self setUpNavigationItem];
    [self setUpLoginView];
    // Do any additional setup after loading the view.
}

-(void)setUpNavigationItem
{
    UIBarButtonItem *leftBt = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(leftItemPress:)];
    self.navigationItem.leftBarButtonItem = leftBt;
}

-(void)leftItemPress:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)setUpLoginView
{
    _loginView = [[LoginView alloc] init];
    int padding = 0;
    [self.view addSubview:_loginView];
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(padding);
        make.left.equalTo(self.view.left).offset(padding);
        make.bottom.equalTo(self.view.bottom).offset(-padding);
        make.right.equalTo(self.view.right).offset(-padding);

    }];
    
    [self bindViewModel];
    
    
    
}

-(void)bindViewModel
{
    _viewModel = [[LoginViewModel alloc] init];

//    RAC(_loginView.loginBt,enabled) = [_viewModel signUpActiveSignal:[_loginView.userName rac_textSignal] password:[_loginView.password rac_textSignal]];
    [[_loginView.password rac_textSignal] subscribeNext:^(NSString *x) {
        if (x.length != 0 && _loginView.userName.text.length != 11) {
            _loginView.loginBt.backgroundColor = UINavigationBarColor;
        }else{
            _loginView.loginBt.backgroundColor = [UIColor grayColor];
        }
    }];
    
    [[[[_loginView.loginBt
       rac_signalForControlEvents:UIControlEventTouchUpInside] flattenMap:^id(id x){
//        [self showHudInView:self.view hint:@"登录中"];
        return [_viewModel loginRequest:_loginView.userModel];
    }] doError:^(NSError *error) {
        [self hideHud];
        NSLog(@"error");
    }] subscribeNext:^(NSString *rex) {
         [self hideHud];
        NSLog(@"%@",rex);
        if ([rex isEqualToString:@"success"]) {
            [self dismissViewControllerAnimated:YES completion:^{
                if (self.loginSuccess)
                {
                    self.loginSuccess();
                }
            }];
            
        }
    }];
    
    [[_loginView.registerBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self.navigationController pushViewController:[[RegisterViewController alloc] init] animated:YES];
    }];
    
    [[_loginView.forgetPasswordBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self.navigationController pushViewController:[[ForgetPassWordViewController alloc] init] animated:YES];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
