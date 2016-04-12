//
//  RegisterViewModel.h
//  O2OProject
//
//  Created by Zhang on 1/29/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
#import "RequestViewModel.h"

@interface RegisterViewModel : RequestViewModel


-(RACSignal *)registerUpActiveSignal:(RACSignal *)userName password:(RACSignal *)password validPassword:(RACSignal *)validPassword;

-(RACSignal *)requestRegister:(UserModel *)model;

@end
