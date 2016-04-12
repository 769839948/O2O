//
//  HomeModel.h
//  O2OProject
//
//  Created by Zhang on 3/1/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data1 : NSObject

@property (nonatomic, copy) NSString *url;

@end



@interface HomeAdvModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, strong) Data1 *data;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *ctl;

@end

@interface Data : NSObject

@property (nonatomic, copy) NSString *cate_id;

@end

@interface HomeIndexModle : NSObject

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *icon_name;

@property (nonatomic, strong) Data *data;

@property (nonatomic, copy) NSString *ctl;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *name;


@end


@interface SupplierDealModel : NSObject

@property (nonatomic, assign) NSInteger deal_score;

@property (nonatomic, assign) NSInteger origin_price;

@property (nonatomic, copy) NSString *sub_name;

@property (nonatomic, copy) NSString *buy_count;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *auto_order;

@property (nonatomic, copy) NSString *brief;

@property (nonatomic, assign) CGFloat ypoint;

@property (nonatomic, copy) NSString *end_time_format;

@property (nonatomic, copy) NSString *begin_time_format;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger buyin_app;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, assign) CGFloat xpoint;

@property (nonatomic, assign) NSInteger is_today;

@property (nonatomic, assign) NSInteger distance;

@property (nonatomic, copy) NSString *is_refund;

@property (nonatomic, assign) NSInteger current_price;

@property (nonatomic, copy) NSString *end_time;

@property (nonatomic, copy) NSString *begin_time;

@property (nonatomic, copy) NSString *is_lottery;

@end


@interface HomeModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSArray *youhui_list;

@property (nonatomic, strong) NSArray<HomeIndexModle *> *indexs;

@property (nonatomic, copy) NSString *sess_id;

@property (nonatomic, strong) NSArray *event_list;

@property (nonatomic, strong) NSArray<HomeAdvModel *> *advs;

@property (nonatomic, strong) NSArray<SupplierDealModel *> *supplier_deal_list;

@property (nonatomic, copy) NSString *ref_uid;

@property (nonatomic, assign) NSInteger u_return;

@property (nonatomic, copy) NSString *city_id;

@property (nonatomic, copy) NSString *page_title;

@property (nonatomic, strong) NSArray *deal_list;

@property (nonatomic, copy) NSString *city_name;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, copy) NSString *ctl;

@property (nonatomic, copy) NSString *act;

@property (nonatomic, strong) NSArray *supplier_list;

@end
