//
//  ChangePasswordViewModel.h
//  O2OProject
//
//  Created by Zhang on 1/30/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "RequestViewModel.h"

@interface ChangePasswordViewModel : RequestViewModel


-(RACSignal *)changePasswordUpActiveSignal:(RACSignal *)oldPassword password:(RACSignal *)newpassword validPassword:(RACSignal *)validPassword;

-(RACSignal *)requestChangePassword:(NSString *)oldpassword password:(NSString *)password;

@end
