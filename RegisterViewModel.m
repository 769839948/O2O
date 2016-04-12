//
//  RegisterViewModel.m
//  O2OProject
//
//  Created by Zhang on 1/29/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "RegisterViewModel.h"
#import "NSString+JSON.h"

@implementation RegisterViewModel

-(RACSignal *)registerUpActiveSignal:(RACSignal *)userName password:(RACSignal *)password validPassword:(RACSignal *)validPassword
{
     return [RACSignal combineLatest:@[userName,password,validPassword ] reduce:^(NSString *username,NSString *password, NSString *validpassword){
        return @(username.length == 11 && [password isEqualToString:validpassword]);
    }];
}


-(RACSignal *)requestRegister:(UserModel *)model
{
    NSString *url = [BaseUrl stringByAppendingString:RequestRegisterUrl];
    @weakify(self)
    RACSignal *requestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        NSDictionary *parameters = @{@"phone":model.userName,@"pwd":model.password};
        [self.sessionManager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            NSLog(@"forData");
        } progress: ^(NSProgress * _Nonnull uploadProgress) {
            NSLog(@"uploadProgress");
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSLog(@"%@",responseObject);
//             NSString *jsonString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
             NSError *err;
             NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:    NSJSONReadingMutableContainers error:&err];
             
             if(err) {
                 NSLog(@"json解析失败：%@",err);
                 TTAlertNoTitle(@"注册错误");
             }else{
                 NSString *state = dic[@"error_code"];
                 if ([state isEqualToString:@"1"]) {
                     [subscriber sendNext:responseObject[@"msg"]];
                     [subscriber sendCompleted];
                 }
             }
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"%@",error);
             TTAlertNoTitle(@"注册错误");
             [subscriber sendError:error];
         }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return requestSignal;
}

-(NSString*)DataTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

@end
