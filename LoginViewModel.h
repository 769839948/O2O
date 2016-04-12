//
//  LoginViewModel.h
//  O2OProject
//
//  Created by Zhang on 1/29/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
#import "RequestViewModel.h"

@interface LoginViewModel : RequestViewModel

@property (nonatomic, strong) RACSignal *signUpActiveSignal;
//@property (nonatomic, strong) RACSignal *requestSignal;

-(RACSignal *)signUpActiveSignal:(RACSignal *)userName password:(RACSignal *)password;

-(RACSignal *)loginRequest:(UserModel *)model;

@end
