//
//  ForgetViewModel.m
//  O2OProject
//
//  Created by Zhang on 2/25/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "ForgetViewModel.h"
#import "User.h"

@implementation ForgetViewModel

-(RACSignal *)nextSetBtActive:(RACSignal *)phoneSignal verificationCode:(RACSignal *)verification
{
    RACSignal *requestSignal = [RACSignal combineLatest:@[phoneSignal,verification] reduce:^id(NSString *phoneString, NSString *verificationString){
        return @(phoneString.length == 18 && verificationString.length == 4);
    }];
    return requestSignal;
}

-(RACSignal *)requestMessageModel:(NSString *)mobile unique:(NSNumber *)unique
{
    NSString *url = [BaseUrl stringByAppendingString:RequestMessageUrl];
    @weakify(self)
    RACSignal *requestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        NSDictionary *parameters = @{@"mobile":mobile,@"unique":unique};
        [self.sessionManager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            NSLog(@"forData");
        } progress: ^(NSProgress * _Nonnull uploadProgress) {
            NSLog(@"uploadProgress");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@",responseObject);
            NSNumber *status = responseObject[@"status"];
            if ([status intValue] == 1) {
                [subscriber sendNext:responseObject[@"info"]];
            }else{
                TTAlertNoTitle(responseObject[@"info"]);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
            [subscriber sendNext:error];
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return requestSignal;
}


-(RACSignal *)requestMessageModel:(NSString *)mobile verifyCode:(NSString *)verify newPwd:(NSString *)pwd
{
    NSString *url = [BaseUrl stringByAppendingString:RequestChangePasswordnUrl];
    @weakify(self)
    RACSignal *requestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        NSDictionary *parameters = @{@"uid":[User sharedInstance].uid,@"phone":mobile,@"pwd":pwd};
        [self.sessionManager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            NSLog(@"forData");
        } progress: ^(NSProgress * _Nonnull uploadProgress) {
            NSLog(@"uploadProgress");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@",responseObject);
            NSError *err;
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:    NSJSONReadingMutableContainers error:&err];
            
            if(err) {
                NSLog(@"json解析失败：%@",err);
                TTAlertNoTitle(@"注册错误");
            }else{
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
            [subscriber sendNext:error];
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return requestSignal;
}



@end
