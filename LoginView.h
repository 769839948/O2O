//
//  LoginView.h
//  O2OProject
//
//  Created by Zhang on 1/29/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface LoginView : UIView

@property (nonatomic, strong) UITextField *userName;
@property (nonatomic, strong) UITextField *password;
@property (nonatomic, strong) UIButton    *loginBt;
@property (nonatomic, strong) UIButton    *registerBt;
@property (nonatomic, strong) UIButton    *forgetPasswordBt;

@property (nonatomic, strong) UserModel *userModel;

@end
