//
//  RegisterView.m
//  O2OProject
//
//  Created by Zhang on 1/29/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "RegisterView.h"

@implementation RegisterView

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
    _userName.placeholder = @"请输入用户名";
    _userName.layer.cornerRadius = 5;
    _userName.layer.borderColor = [[UIColor grayColor] CGColor];
    _userName.layer.borderWidth = 1.0;
    [self addSubview:_userName];
    
    
    _email = [[UITextField alloc] init];
    _email.placeholder = @"请输入邮箱";
    _email.layer.cornerRadius = 5;
    _email.layer.borderColor = [[UIColor grayColor] CGColor];
    _email.layer.borderWidth = 1.0;
    [self addSubview:_email];
    
    _password = [[UITextField alloc] init];
    _password.placeholder = @"请输入密码";
    _password.layer.cornerRadius = 5;
    _password.layer.borderColor = [[UIColor grayColor] CGColor];
    _password.layer.borderWidth = 1.0;
    [self addSubview:_password];
    
    _password = [[UITextField alloc] init];
    _password.placeholder = @"请输入密码";
    _password.layer.cornerRadius = 5;
    _password.layer.borderColor = [[UIColor grayColor] CGColor];
    _password.layer.borderWidth = 1.0;
    [self addSubview:_password];
    
    _refName = [[UITextField alloc] init];
    _refName.placeholder = @"请输入推荐人";
    _refName.layer.cornerRadius = 5;
    _refName.layer.borderColor = [[UIColor grayColor] CGColor];
    _refName.layer.borderWidth = 1.0;
    [self addSubview:_refName];
    
    _refUName = [[UITextField alloc] init];
    _refUName.placeholder = @"请输入推荐人用户名";
    _refUName.layer.cornerRadius = 5;
    _refUName.layer.borderColor = [[UIColor grayColor] CGColor];
    _refUName.layer.borderWidth = 1.0;
    [self addSubview:_refUName];
    
    _validPassword = [[UITextField alloc] init];
    _validPassword.placeholder = @"确认密码";
    _validPassword.layer.cornerRadius = 5;
    _validPassword.layer.borderColor = [[UIColor grayColor] CGColor];
    _validPassword.layer.borderWidth = 1.0;
    [self addSubview:_validPassword];
    
    _registerBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [_registerBt setBackgroundColor:UINavigationBarColor];
    [_registerBt setTitle:@"注册" forState:UIControlStateNormal];
    [self addSubview:_registerBt];
    
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
    
//    [_email mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_userName.bottom).offset(20);
//        make.left.equalTo(self.left).offset(20);
//        make.right.equalTo(self.right).offset(-20);
//        make.size.height.equalTo(40);
//    }];
    
    [_password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userName.bottom).offset(20);
        make.left.equalTo(self.left).offset(20);
        make.right.equalTo(self.right).offset(-20);
        make.size.height.equalTo(40);
    }];
    
    [_validPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_password.bottom).offset(20);
        make.left.equalTo(self.left).offset(20);
        make.right.equalTo(self.right).offset(-20);
        make.size.height.equalTo(40);
    }];
    
//    [_refName mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_validPassword.bottom).offset(20);
//        make.left.equalTo(self.left).offset(20);
//        make.right.equalTo(self.right).offset(-20);
//        make.size.height.equalTo(40);
//    }];
//    
//    [_refUName mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_refName.bottom).offset(20);
//        make.left.equalTo(self.left).offset(20);
//        make.right.equalTo(self.right).offset(-20);
//        make.size.height.equalTo(40);
//    }];
    
    [_registerBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_validPassword.bottom).offset(20);
        make.left.equalTo(self.left).offset(20);
        make.right.equalTo(self.right).offset(-20);
        make.size.height.equalTo(40);
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
    
    [[_email rac_textSignal] subscribeNext:^(id x) {
        _userModel.email = x;
    }];
    
    [[_refName rac_textSignal] subscribeNext:^(id x) {
        _userModel.refName = x;
    }];
    
    [[_refUName rac_textSignal] subscribeNext:^(id x) {
        _userModel.refUName = x;
    }];

}


@end
