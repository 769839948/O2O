//
//  ForgetPassWordViewController.m
//  O2OProject
//
//  Created by Zhang on 1/29/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "ForgetPassWordViewController.h"
#import "UIButton+Time.h"
#import "ForgetViewModel.h"

@interface ForgetPassWordViewController ()

@property (nonatomic, strong) UITextField *phoneText;
@property (nonatomic, strong) UITextField *passWord;
@property (nonatomic, strong) UITextField *verificationCode;
@property (nonatomic, strong) UIButton    *verificationBt;
@property (nonatomic, strong) UIButton    *nextStep;

@property (nonatomic, strong) UILabel     *timeLable;

@property (nonatomic, strong) ForgetViewModel *viewModel;

@end

@implementation ForgetPassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"忘记密码";
    [self setupView];
    // Do any additional setup after loading the view.
}

-(void)setupView
{
    _phoneText = [[UITextField alloc] init];
    _phoneText.placeholder = @"请输入电话号码";
    _phoneText.layer.cornerRadius = 5;
    _phoneText.layer.borderColor = [[UIColor grayColor] CGColor];
    _phoneText.layer.borderWidth = 1.0;
    [self.view addSubview:_phoneText];
    
    _passWord = [[UITextField alloc] init];
    _passWord.placeholder = @"新密码";
    _passWord.layer.cornerRadius = 5;
    _passWord.layer.borderColor = [[UIColor grayColor] CGColor];
    _passWord.layer.borderWidth = 1.0;
    [self.view addSubview:_passWord];
    
    _verificationCode = [[UITextField alloc] init];
    _verificationCode.placeholder = @"请输入验证码";
    _verificationCode.layer.cornerRadius = 5;
    _verificationCode.layer.borderColor = [[UIColor grayColor] CGColor];
    _verificationCode.layer.borderWidth = 1.0;
    [self.view addSubview:_verificationCode];
    
    _verificationBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [_verificationBt setTitle:@"获取验证码" forState:UIControlStateNormal];
    _verificationBt.backgroundColor = UINavigationBarColor;
    [self.view addSubview:_verificationBt];
    
    _nextStep = [UIButton buttonWithType:UIButtonTypeCustom];
    _nextStep.backgroundColor = UINavigationBarColor;
    [_nextStep setTitle:@"下一步" forState:UIControlStateNormal];
    [self.view addSubview:_nextStep];
    
    [self makeConstraints];
    [self bindViewModel];
    
}

-(void)bindViewModel
{
    _viewModel = [[ForgetViewModel alloc] init];
    
    RAC(self.nextStep,enabled) = [_viewModel nextSetBtActive:[_phoneText rac_textSignal] verificationCode:[_verificationCode rac_textSignal]];
    
    RAC(self.verificationBt,enabled) = [RACSignal combineLatest:@[[_phoneText rac_textSignal]] reduce:^id(NSString *phone){
        return @(phone.length == 11);
    }];
    
    [RACSignal combineLatest:@[[_phoneText rac_textSignal],[_verificationCode rac_textSignal]] reduce:^id(NSString *phone, NSString *code){
        if (phone.length == 11 && code.length == 4) {
            _nextStep.backgroundColor = UINavigationBarColor;
            
        }else{
            
            _nextStep.backgroundColor = [UIColor grayColor];
        }
        return nil;

    }];
    
    [[_phoneText rac_textSignal] subscribeNext:^(NSString *x) {
        if (x.length == 11) {
            _verificationBt.backgroundColor = UINavigationBarColor;
            if (_verificationCode.text.length == 4) {
                _nextStep.backgroundColor = UINavigationBarColor;
            }
        }else{
            _nextStep.backgroundColor = [UIColor grayColor];
            _verificationBt.backgroundColor = [UIColor grayColor];
        }
    }];
    
    
    
    [[[_verificationBt rac_signalForControlEvents:UIControlEventTouchUpInside] flattenMap:^id(id x){
        return [_viewModel requestMessageModel:_phoneText.text unique:0];
    }]subscribeNext:^(NSString *x) {
        [_verificationBt startWithTime:60 title:@"获取验证码" countDownTitle:@"S" mainColor:UINavigationBarColor countColor:[UIColor lightGrayColor]];
        TTAlertNoTitle(x);
    }];
    
    [[[_nextStep rac_signalForControlEvents:UIControlEventTouchUpInside] flattenMap:^id(id x) {
        return [_viewModel requestMessageModel:_phoneText.text verifyCode:_verificationCode.text newPwd:_passWord.text];
    }] subscribeNext:^(NSString *info) {
        TTAlertNoTitle(info);
    }];
}

-(void)makeConstraints
{
    [_phoneText makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.top).offset(80);
        make.left.equalTo(self.view.left).offset(20);
        make.right.equalTo(self.view.right).offset(-20);
        make.height.equalTo(40);
    }];
    
    [_passWord makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneText.bottom).offset(20);
        make.left.equalTo(self.view.left).offset(20);
        make.right.equalTo(self.view.right).offset(-20);
        make.height.equalTo(40);
    }];
    
    [_verificationCode makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passWord.bottom).offset(20);
        make.left.equalTo(self.view.left).offset(20);
        make.right.equalTo(self.view.right).offset(-120);
        make.height.equalTo(_phoneText.mas_height);
    }];
    
    [_verificationBt makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneText.bottom).offset(20);
        make.left.equalTo(self.verificationCode.right).offset(0);
        make.right.equalTo(self.view.right).offset(-20);
        make.height.equalTo(_phoneText.mas_height);
    }];
    [_nextStep makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.verificationCode.bottom).offset(20);
        make.left.equalTo(self.view.left).offset(20);
        make.right.equalTo(self.view.right).offset(-20);
        make.height.equalTo(_phoneText.mas_height);
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
