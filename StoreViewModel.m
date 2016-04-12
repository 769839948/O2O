//
//  StoreViewModel.m
//  O2OProject
//
//  Created by Zhang on 2/3/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "StoreViewModel.h"

@implementation StoreViewModel

-(NSArray *)tableArray
{
    return @[@"时间",@"地址",@"电话",@"价格",@"待定"];
}

-(RACSignal *)requestSignal:(NSString *)data_id
{
    NSString *url = [BaseUrl stringByAppendingString:RequestStoreInfoUrl];
    NSDictionary *parameters = @{@"data_id":data_id};
    RACSignal *requestSinal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self.sessionManager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            NSLog(@"");
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            NSLog(@"");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSString *jsongString = [self DataTOjsonString:responseObject];
            NSLog(@"%@",responseObject);
            NSNumber *status = responseObject[@"status"];
            if ([status intValue] == 1) {
                StoreInfoModel *model = [StoreInfoModel mj_objectWithKeyValues:responseObject];
                [subscriber sendNext:model];
                [subscriber sendCompleted];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendCompleted];
        }];
        
        return [RACDisposable disposableWithBlock:^{
            
            
        }];
    }];
    return requestSinal;
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
