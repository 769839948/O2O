//
//  ForgetViewModel.h
//  O2OProject
//
//  Created by Zhang on 2/25/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "RequestViewModel.h"

@interface ForgetViewModel : RequestViewModel

-(RACSignal *)nextSetBtActive:(RACSignal *)phoneSignal verificationCode:(RACSignal *)verification;

-(RACSignal *)requestMessageModel:(NSString *)mobile unique:(NSNumber *)unique;

-(RACSignal *)requestMessageModel:(NSString *)mobile verifyCode:(NSString *)verify newPwd:(NSString *)pwd;

@end
