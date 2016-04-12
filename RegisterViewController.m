//
//  RegisterViewController.m
//  O2OProject
//
//  Created by Zhang on 1/29/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import "RegisterViewModel.h"

@interface RegisterViewController ()

@property (nonatomic, strong) RegisterView *registerView;
@property (nonatomic, strong) RegisterViewModel *viewModel;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册账号";
    [self setUpRegisterView];
    // Do any additional setup after loading the view.
}

-(void)setUpRegisterView
{
    _registerView = [[RegisterView alloc] init];
    [self.view addSubview:_registerView];
    int padding = 0;
    [_registerView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(padding);
        make.left.equalTo(self.view.left).offset(padding);
        make.bottom.equalTo(self.view.bottom).offset(-padding);
        make.right.equalTo(self.view.right).offset(-padding);
    }];
    [self bindViewModel];
}

-(void)bindViewModel
{
    _viewModel = [[RegisterViewModel alloc] init];
//    RAC(_registerView.registerBt,enabled) = [_viewModel registerUpActiveSignal:_registerView.userName.rac_textSignal password:_registerView.password.rac_textSignal validPassword:_registerView.validPassword.rac_textSignal];
    @weakify(self);
    [[[_registerView.registerBt rac_signalForControlEvents:UIControlEventTouchUpInside] flattenMap:^id(id x) {
        return [_viewModel requestRegister:_registerView.userModel];
    }] subscribeNext:^(NSString *x) {
        @strongify(self);
        NSLog(@"%@",x);
    }];
}

#pragma mark - Lazy Load

- (RegisterViewModel *)viewModel {
    
    if (!_viewModel) {
        _viewModel = [RegisterViewModel new];
    }
    return _viewModel;
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
