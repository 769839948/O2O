//
//  LoginViewModel.m
//  O2OProject
//
//  Created by Zhang on 1/29/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "LoginViewModel.h"
#import "AFNetworking.h"
#import "UserModel.h"
#import "User.h"
#import "MJExtension.h"

@implementation LoginViewModel

-(RACSignal *)signUpActiveSignal:(RACSignal *)userName password:(RACSignal *)password
{
    RACSignal *signUpActiveSignal =
    [RACSignal combineLatest:@[userName, password]
                      reduce:^id(NSString *usernameValid, NSString *passwordValid){
                          return @(usernameValid.length == 11 &&passwordValid > 0);
                      }];
    return signUpActiveSignal;
}


#pragma mark - Getter / Setter
// 采用懒加载的方式来配置网络请求
- (RACSignal *)loginRequest:(UserModel *)model {
//    NSString *url = [BaseUrl stringByAppendingString:RequestLoginUrl];
    NSString *url = @"http://127.0.0.1:8080/Contact/userLogin";
    @weakify(self)
    RACSignal *requestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        NSDictionary *parameters = @{@"username":model.userName,@"password":model.password};
        [self.sessionManager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            NSLog(@"formData");
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            NSLog(@"uplodaProgress");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSError *err;
//            NSString *json = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSDictionary *nsdic = [NSJSONSerialization JSONObjectWithData:responseObject options:    NSJSONReadingMutableContainers error:&err];
            
            if(err) {
                NSLog(@"json解析失败：%@",err);
                TTAlertNoTitle(@"注册错误");
            }else{
                NSString *state = nsdic[@"msg"];
                if ([state isEqualToString:@"OK"]) {
                    [[NSUserDefaults standardUserDefaults] setObject:model.password forKey:@"pwd"];
                    NSDictionary *dic = nsdic[@"user"];
                    User *user = [User sharedInstance];
                    user.score_count = dic[@"score_count"];
                    user.province = dic[@"province"];
                    user.status = dic[@"status"];
                    user.web_openid = dic[@"web_openid"];
                    user.openid = dic[@"openid"];
                    user.birthday = dic[@"birthday"];
                    user.nickname = dic[@"nickname"];
                    user.sex = dic[@"sex"];
                    user.last_weixin_time = dic[@"last_weixin_time"];
                    user.last_ip = dic[@"last_ip"];
                    user.is_check_phone = dic[@"is_check_phone"];
                    user.city = dic[@"city"];
                    user.is_follow = dic[@"is_follow"];
                    user.truename = dic[@"truename"];
                    user.union_id = dic[@"union_id"];
                    user.now_money = dic[@"now_money"];
                    user.last_time = dic[@"last_time"];
                    user.occupation = dic[@"occupation"];
                    user.uid = dic[@"uid"];
                    user.pwd = dic[@"pwd"];
                    user.phone = dic[@"phone"];
                    user.add_time = dic[@"add_time"];
                    user.message = dic[@"message"];
                    user.email = dic[@"email"];
                    user.avatar = dic[@"avatar"];
                    user.importid = dic[@"importid"];
                    user.level = dic[@"level"];
                    user.qq = dic[@"qq"];
                    user.weidian_sessid = dic[@"weidian_sessid"] ;
                    user.add_ip = dic[@"add_ip"];
                    
                    [User synchronize];
                    [subscriber sendNext:@"success"];
                    [subscriber sendCompleted];
                }else{
                    [subscriber sendNext:@"faile"];
                    [subscriber sendCompleted];
                }
            }
//            if ([state intValue] == 1) {
//                User *user = [User sharedInstance];
//                user.uid = responseObject[@"uid"];
//                user.status = [responseObject[@"status"] intValue];
//                user.u_return = [responseObject[@"return"] intValue];
//                user.city_name = responseObject[@"city_name"];
//                user.user_name = responseObject[@"user_name"];
//                user.user_pwd = responseObject[@"user_pwd"];
//                user.mobile = responseObject[@"mobile"];
//                user.sess_id = responseObject[@"sess_id"];
//                user.ref_uid = responseObject[@"ref_uid"];
//                user.is_tmp = responseObject[@"is_tmp"];
//                user.ctl = responseObject[@"ctl"];
//                user.act = responseObject[@"act"];
//                user.email = responseObject[@"email"];
//                user.info = responseObject[@"info"];
//                [User synchronize];
//                [subscriber sendNext:@"success"];
//                [subscriber sendCompleted];
//                
//                [self autoLoginInfo:model.userName pwd:model.password];
//                
//            }else{
//                TTAlertNoTitle(info);
//            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
            [subscriber sendError:error];
            
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return requestSignal;
}

-(void)autoLoginInfo:(NSString *)userMobile pwd:(NSString *)pwd
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:userMobile forKey:@"userMobile"];
    [userDefaults setObject:pwd forKey:@"userPwd"];
    [userDefaults synchronize];
}

@end
