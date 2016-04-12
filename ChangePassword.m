//
//  ChangePassword.m
//  O2OProject
//
//  Created by Zhang on 1/30/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "ChangePassword.h"

@implementation ChangePassword

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self setUpTextField];
    }
    return self;
}

-(void)setUpTextField
{
    _phone = [[UITextField alloc] init];
    _phone.placeholder = @"请输入电话号码";
    _phone.layer.cornerRadius = 5;
    _phone.layer.borderColor = [[UIColor grayColor] CGColor];
    _phone.layer.borderWidth = 1.0;
    [self addSubview:_phone];
    
    _password = [[UITextField alloc] init];
    _password.placeholder = @"请输入新密码";
    _password.layer.cornerRadius = 5;
    _password.layer.borderColor = [[UIColor grayColor] CGColor];
    _password.layer.borderWidth = 1.0;
    [self addSubview:_password];
    
    
    _validPassword = [[UITextField alloc] init];
    _validPassword.placeholder = @"确认密码";
    _validPassword.layer.cornerRadius = 5;
    _validPassword.layer.borderColor = [[UIColor grayColor] CGColor];
    _validPassword.layer.borderWidth = 1.0;
    [self addSubview:_validPassword];
    
    _changeBt = [UIButton buttonWithType:UIButtonTypeCustom];
    [_changeBt setBackgroundColor:UINavigationBarColor];
    [_changeBt setTitle:@"确认修改" forState:UIControlStateNormal];
    [self addSubview:_changeBt];
    
    [self setContents];
}


-(void)setContents
{
    [_phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(74);
        make.left.equalTo(self.left).offset(20);
        make.right.equalTo(self.right).offset(-20);
        make.size.height.equalTo(40);
    }];
    
    [_password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phone.bottom).offset(20);
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
    
    [_changeBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_validPassword.bottom).offset(20);
        make.left.equalTo(self.left).offset(20);
        make.right.equalTo(self.right).offset(-20);
        make.size.height.equalTo(40);
    }];
    
}


@end
