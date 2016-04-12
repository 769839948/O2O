//
//  LoginView.m
//  O2OProject
//
//  Created by Zhang on 1/29/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "LoginView.h"
#import "NSString+StringSize.h"

@implementation LoginView

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self setUpTextField];
        _userModel = [[UserModel alloc] init];
    }
    return self;
}

-(void)setUpTextField
{
    _userName = [[UITextField alloc] init];
//    _userName.backgroundColor = [UIColor grayColor];
    _userName.placeholder = @"请输入用户名";
    _userName.layer.cornerRadius = 5;
    _userName.layer.borderColor = [[UIColor grayColor] CGColor];
    _userName.layer.borderWidth = 1.0;
    [self addSubview:_userName];
    
    _password = [[UITextField alloc] init];
    _password.placeholder = @"请输入密码";
    _password.layer.cornerRadius = 5;
    _password.layer.borderColor = [[UIColor grayColor] CGColor];
    _password.layer.borderWidth = 1.0;
    [self addSubview:_password];
    
    
    
    
    _loginBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginBt setBackgroundColor:UINavigationBarColor];
    [_loginBt setTitle:@"登录" forState:UIControlStateNormal];
    [self addSubview:_loginBt];
    
    
    _forgetPasswordBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_forgetPasswordBt];
    
    [_forgetPasswordBt setTitle:@"忘记密码" forState:UIControlStateNormal];
    _forgetPasswordBt.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [_forgetPasswordBt setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    _registerBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_registerBt];
    
    [_registerBt setTitle:@"注册账号" forState:UIControlStateNormal];
    _registerBt.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [_registerBt setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self setContents];
    [self setUserModel];
}


-(void)setContents
{
    [_userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(74);
        make.left.equalTo(self.left).offset(20);
        make.right.equalTo(self.right).offset(-20);
        make.size.height.equalTo(40);
    }];
    
    [_password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userName.bottom).offset(20);
        make.left.equalTo(self.left).offset(20);
        make.right.equalTo(self.right).offset(-20);
        make.size.height.equalTo(40);
    }];
    
    [_loginBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_password.bottom).offset(20);
        make.left.equalTo(self.left).offset(20);
        make.right.equalTo(self.right).offset(-20);
        make.size.height.equalTo(40);
    }];
    
    [_forgetPasswordBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_loginBt.bottom).offset(20);
        make.width.equalTo([NSString widthForString:_forgetPasswordBt.titleLabel.text fontSize:15]);
        make.right.equalTo(self.centerX).offset(-10);
        make.height.equalTo(11);
    }];
    [_registerBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_loginBt.bottom).offset(20);
        make.width.equalTo(_forgetPasswordBt.width);
        make.left.equalTo(self.centerX).offset(10);
        make.height.equalTo(11);
    }];
}

-(void)setUserModel
{
    [[_userName rac_textSignal] subscribeNext:^(id x) {
        _userModel.userName = x;
    }];
    
    [[_password rac_textSignal] subscribeNext:^(id x) {
        _userModel.password = x;
    }];
}


@end
