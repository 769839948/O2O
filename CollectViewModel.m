//
//  CollectViewModel.m
//  O2OProject
//
//  Created by Zhang on 1/31/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "CollectViewModel.h"

@implementation CollectViewModel



-(RACSignal *)collectRequest:(NSString *)string
{
    NSString *url = [BaseUrl stringByAppendingString:RequestCollectUrl];
    @weakify(self)
    RACSignal *requestSignal = [RACSignal  createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        NSDictionary *parameters = @{@"page":string};
        [self.sessionManager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            NSLog(@"uploadProgress");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //这里需要一些itemArray;
            NSLog(@"%@",responseObject);
            
            NSString *string = [self DataTOjsonString:responseObject];
            NSLog(@"");
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
            TTAlertNoTitle(@"登录错误");
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
