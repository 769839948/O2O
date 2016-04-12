//
//  RegisterView.h
//  O2OProject
//
//  Created by Zhang on 1/29/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface RegisterView : UIView

@property (nonatomic, strong) UITextField *userName;

@property (nonatomic, strong) UITextField *email;

@property (nonatomic, strong) UITextField *password;
@property (nonatomic, strong) UITextField *validPassword;

@property (nonatomic, strong) UITextField *refName;
@property (nonatomic, strong) UITextField *refUName;

@property (nonatomic, strong) UIButton    *registerBt;

@property (nonatomic, strong) UserModel *userModel;

@end
