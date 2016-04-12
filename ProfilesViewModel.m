//
//  ProfilesViewModel.m
//  O2OProject
//
//  Created by Zhang on 1/28/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "ProfilesViewModel.h"
#import "UserProfile.h"

@implementation ProfilesViewModel

-(instancetype)init
{
    self = [super init];
    if (self) {
        _tableArray = [[NSMutableArray alloc] initWithObjects:@[@"积分",@"优惠券"],@[@"收货地址",@"我的收藏"],@[@"历史消息"],@[@"分享给朋友"],@[@"帮助中心"], nil];
        _imageArray = [[NSMutableArray alloc] initWithObjects:@[@"mine_address",@"mine_collect"],@[@"mine_history"],@[@"mine_share"],@[@"mine_help"], nil];
    
        
    }
    return self;
}

-(RACSignal *)requestModel
{
    NSString *url = [BaseUrl stringByAppendingString:RequestProfileUrl];
    @weakify(self)
    RACSignal *requestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
//        NSDictionary *parameters = @{nil};
        [self.sessionManager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@",responseObject);
//            NSNumber *status = responseObject[@"status"];
////            NSString *json = [self DataTOjsonString:responseObject];
//            if ([status intValue] == 1) {
//                UserProfile *user = [UserProfile sharedInstanceUser];
////                user.user_name = responseObject[@"user_name"];
//////                user.status = responseObject[@"status"];
////                user.page_title = responseObject[@"page_title"];
//////                user.user_score = responseObject[@"user_score"];
////                user.user_score_format = responseObject[@"user_score_format"];
////                user.user_avatar = responseObject[@"user_avatar"];
////                user.not_pay_order_count = responseObject[@"not_pay_order_count"];
////                user.sess_id = responseObject[@"sess_id"];
////                user.city_name = responseObject[@"city_name"];
////                user.coupon_count = responseObject[@"coupon_count"];
////                user.user_name = responseObject[@"user_name"];
////                user.sess_id = responseObject[@"sess_id"];
////                user.act = responseObject[@"act"];
////                user.info = responseObject[@"info"];
////                user.uid = responseObject[@"uid"];
////                user.youhui_count = responseObject[@"youhui_count"];
////                user.user_money_format = responseObject[@"user_money_format"];
////                user.ctl = responseObject[@"ctl"];
////                user.ref_uid = responseObject[@"ref_uid"];
////                user.wait_dp_count = responseObject[@"wait_dp_count"];
//                user = [UserProfile mj_objectWithKeyValues:responseObject];
//                user.status = [responseObject[@"status"] integerValue];
//                user.user_score = [responseObject[@"user_score"] integerValue];
//                user.user_login_status = [responseObject[@"user_login_status"] integerValue];
//                [UserProfile synchronize];
//                [subscriber sendNext:user];
//                [subscriber sendCompleted];
//            }else{
//                TTAlertNoTitle(responseObject[@"info"]);
//            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
            [subscriber sendNext:error];
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return requestSignal;
}

-(UserProfile *)userProfile
{
    return [UserProfile sharedInstanceUser];
}



@end
