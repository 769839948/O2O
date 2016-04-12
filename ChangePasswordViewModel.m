//
//  ChangePasswordViewModel.m
//  O2OProject
//
//  Created by Zhang on 1/30/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "ChangePasswordViewModel.h"
#import "User.h"

@implementation ChangePasswordViewModel

-(RACSignal *)changePasswordUpActiveSignal:(RACSignal *)oldPassword password:(RACSignal *)newpassword validPassword:(RACSignal *)validPassword
{
    return [RACSignal combineLatest:@[oldPassword,newpassword,validPassword] reduce:^(NSString *oldpassword, NSString *newpassword, NSString *validpassword){
        return @(oldpassword.length == 11 && [newpassword isEqualToString:validpassword]);
    }];
}

-(RACSignal *)requestChangePassword:(NSString *)mobile password:(NSString *)pwd
{
    NSString *url = [BaseUrl stringByAppendingString:RequestChangePasswordnUrl];
    @weakify(self)
    RACSignal *requestSignal = [RACSignal  createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        NSDictionary *parameters = @{@"uid":[User sharedInstance].uid,@"phone":mobile,@"pwd":pwd};
        [self.sessionManager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            NSLog(@"uploadProgress");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSError *err;
            //            NSString *json = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:    NSJSONReadingMutableContainers error:&err];
            
            if(err) {
                NSLog(@"json解析失败：%@",err);
                TTAlertNoTitle(dic[@"msg"]);
                [subscriber sendCompleted];
                
            }else{
                TTAlertNoTitle(@"发生错误");
                [subscriber sendError:err];
                [subscriber sendCompleted];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
            TTAlertNoTitle(@"发生错误");
            [subscriber sendError:error];
            [subscriber sendCompleted];
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    
    return requestSignal;
}

@end
