//
//  AddressViewModel.m
//  O2OProject
//
//  Created by Zhang on 2/27/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "AddressViewModel.h"
#import "User.h"

@implementation AddressViewModel

-(NSArray *)addAddressTableArray
{
    return @[@"收货人",@"手机号码",@"收货省份",@"收货城市",@"收货县区",@"详细地址",@"收货邮编",@"标签"];
}

-(NSArray *)addAddressField
{
    return @[@"填写收件人",@"填写手机号码",@"北京",@"北京",@"社区、街道、学校",@"填写详细地址",@"收货邮编",@"标签"];
}

-(RACSignal *)requestModel
{
    NSString *url = [BaseUrl stringByAppendingString:RequestAddressUrl];
    @weakify(self)
    RACSignal *requestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        NSDictionary *parameters = @{@"uid":[User sharedInstance].uid,@"pwd":[[NSUserDefaults standardUserDefaults] objectForKey:@"pwd"]};
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
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
            [subscriber sendError:error];
            
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return requestSignal;
}


-(RACSignal *)requestModel:(AddressModel *)model
{
    NSString *url = [BaseUrl stringByAppendingString:RequestSaveAddressUrl];
    @weakify(self)
    RACSignal *requestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        NSDictionary *parameters = @{@"uid":[User sharedInstance].uid,@"pwd":[User sharedInstance].pwd,@"name":model.name,@"phone":model.phone,@"province":model.province,@"city":model.city,@"area":model.area,@"adress":model.adress,@"zipcode":model.zipcode,@"default":@"0",@"method":@"add"};
        [self.sessionManager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            NSLog(@"forData");
        } progress: ^(NSProgress * _Nonnull uploadProgress) {
            NSLog(@"uploadProgress");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@",responseObject);
            NSNumber *status = responseObject[@"status"];
            TTAlertNoTitle(responseObject[@"infos"]);

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return requestSignal;
}

-(RACSignal *)requestDelModel:(NSString *)ID
{
    NSString *url = [BaseUrl stringByAppendingString:RequestSaveAddressUrl];
    @weakify(self)
    RACSignal *requestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        NSDictionary *parameters = @{@"id":ID};
        [self.sessionManager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            NSLog(@"forData");
        } progress: ^(NSProgress * _Nonnull uploadProgress) {
            NSLog(@"uploadProgress");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@",responseObject);
            NSNumber *status = responseObject[@"del_status"];
            if ([status intValue] == 1) {
                [subscriber sendNext:@"删除成功"];
                [subscriber sendCompleted];
            }else{
                [subscriber sendNext:@"删除失败"];
                [subscriber sendCompleted];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendNext:@"出现错误"];
            [subscriber sendCompleted];
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return requestSignal;
}

-(void)requestNomalModel:(NSString *)ID
{
    NSString *url = [BaseUrl stringByAppendingString:RequestNomalAddressUrl];
    NSDictionary *parameters = @{@"id":ID};
    [self.sessionManager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSLog(@"forData");
    } progress: ^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"uploadProgress");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        NSNumber *status = responseObject[@"set_status"];
        if ([status intValue] == 1) {
            TTAlertNoTitle(@"设置成功");
        }else{
            TTAlertNoTitle(@"设置失败");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

@end
