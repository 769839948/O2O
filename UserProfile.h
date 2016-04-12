//
//  UserProfile.h
//  O2OProject
//
//  Created by Zhang on 2/27/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserProfile : NSObject

@property (nonatomic, copy) NSString *user_name;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *page_title;

@property (nonatomic, assign) NSInteger user_score;

@property (nonatomic, assign) NSInteger user_login_status;

@property (nonatomic, copy) NSString *user_score_format;

@property (nonatomic, copy) NSString *user_avatar;

@property (nonatomic, copy) NSString *not_pay_order_count;

@property (nonatomic, copy) NSString *sess_id;

@property (nonatomic, copy) NSString *city_name;

@property (nonatomic, copy) NSString *coupon_count;

@property (nonatomic, copy) NSString *act;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *youhui_count;

@property (nonatomic, copy) NSString *user_money_format;

@property (nonatomic, copy) NSString *ctl;

@property (nonatomic, copy) NSString *ref_uid;

@property (nonatomic, copy) NSString *wait_dp_count;


+ (instancetype)sharedInstanceUser;

+ (BOOL)isLoggedIn;

+ (BOOL)saveBaseData:(id)data WithName:(NSString *)name;

+ (id)getBaseDataWithName:(NSString *)name;

+ (BOOL)synchronize;

@end
