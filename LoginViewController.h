//
//  LoginViewController.h
//  O2OProject
//
//  Created by Zhang on 1/28/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "BaseViewController.h"


typedef void (^LoginSuccess)();

@interface LoginViewController : BaseViewController

@property (nonatomic, copy) LoginSuccess loginSuccess;

@end
