//
//  StoreInfoModel.h
//  O2OProject
//
//  Created by Zhang on 3/2/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store_Images : NSObject

@property (nonatomic, copy) NSString *brief;

@property (nonatomic, copy) NSString *image;

@end

@interface Store_Info : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, assign) CGFloat xpoint;

@property (nonatomic, copy) NSString *preview;

@property (nonatomic, copy) NSString *supplier_id;

@property (nonatomic, copy) NSString *brief;

@property (nonatomic, assign) CGFloat ypoint;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, copy) NSString *tel;

@property (nonatomic, copy) NSString *is_verify;

@property (nonatomic, assign) NSInteger avg_point;

@property (nonatomic, strong) NSArray<Store_Images *> *store_images;

@property (nonatomic, copy) NSString *name;

@end



@interface Dp_List : NSObject

@property (nonatomic, strong) NSArray<NSString *> *images;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *point;

@property (nonatomic, strong) NSArray<NSString *> *oimages;

@property (nonatomic, copy) NSString *reply_content;

@property (nonatomic, copy) NSString *create_time;

@property (nonatomic, copy) NSString *user_name;

@end

@interface Other_Supplier_Location : NSObject

@property (nonatomic, copy) NSString *address;

@property (nonatomic, assign) CGFloat xpoint;

@property (nonatomic, assign) NSInteger distance;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *preview;

@property (nonatomic, copy) NSString *is_verify;

@property (nonatomic, assign) CGFloat ypoint;

@property (nonatomic, copy) NSString *tel;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *avg_point;

@end

@interface Tuan_List : NSObject

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

@interface Event_List : NSObject

@property (nonatomic, assign) CGFloat xpoint;

@property (nonatomic, copy) NSString *submit_begin_time_format;

@property (nonatomic, assign) NSInteger distance;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *submit_end_time_format;

@property (nonatomic, copy) NSString *submit_count;

@property (nonatomic, assign) CGFloat ypoint;

@property (nonatomic, copy) NSString *sheng_time_format;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *icon;

@end
@interface StoreInfoModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, strong) NSArray *youhui_list;

@property (nonatomic, copy) NSString *sess_id;

@property (nonatomic, strong) NSArray<Tuan_List *> *tuan_list;

@property (nonatomic, strong) NSArray<Event_List *> *event_list;

@property (nonatomic, copy) NSString *ref_uid;

@property (nonatomic, assign) NSInteger u_return;

@property (nonatomic, strong) NSArray<Other_Supplier_Location *> *other_supplier_location;

@property (nonatomic, strong) Store_Info *store_info;

@property (nonatomic, strong) NSArray<Dp_List *> *dp_list;

@property (nonatomic, strong) NSArray *deal_list;

@property (nonatomic, copy) NSString *page_title;

@property (nonatomic, copy) NSString *ctl;

@property (nonatomic, copy) NSString *info;

@property (nonatomic, copy) NSString *act;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *city_name;

@end
