//
//  UserProfile.m
//  O2OProject
//
//  Created by Zhang on 2/27/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "UserProfile.h"

#define kEncodedObjectPath_UserProfile ([[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"Profile"])

@implementation UserProfile

+ (instancetype)sharedInstanceUser
{
    static dispatch_once_t onceToken;
    static UserProfile *single = nil;
    dispatch_once(&onceToken, ^{
        if([UserProfile isLoggedIn])
        {
            single = [NSKeyedUnarchiver unarchiveObjectWithFile:kEncodedObjectPath_UserProfile];
        }
        else
        {
            single = [[UserProfile alloc] init];
        }
    });
    return single;
}

+ (BOOL)synchronize
{
    return [NSKeyedArchiver archiveRootObject:[UserProfile sharedInstanceUser] toFile:kEncodedObjectPath_UserProfile];
}

+ (BOOL)isLoggedIn
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:kEncodedObjectPath_UserProfile];
}

+ (BOOL)logout
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    BOOL result = [fileManager removeItemAtPath:kEncodedObjectPath_UserProfile error:&error];
    if(!result)
    {
        NSLog(@"注销失败!\n%@", error);
    }
    
    [UserProfile sharedInstanceUser].user_name  = nil;
    [UserProfile sharedInstanceUser].status  = 0;
    [UserProfile sharedInstanceUser].page_title  = nil;
    [UserProfile sharedInstanceUser].user_score  = 0;
    [UserProfile sharedInstanceUser].user_login_status  = 0;
    [UserProfile sharedInstanceUser].user_score_format  = nil;
    [UserProfile sharedInstanceUser].user_avatar  = nil;
    [UserProfile sharedInstanceUser].not_pay_order_count  = nil;
    [UserProfile sharedInstanceUser].sess_id  = nil;
    [UserProfile sharedInstanceUser].city_name  = nil;
    [UserProfile sharedInstanceUser].coupon_count  = nil;
    [UserProfile sharedInstanceUser].act  = nil;
    [UserProfile sharedInstanceUser].info  = nil;
    [UserProfile sharedInstanceUser].uid  = nil;
    [UserProfile sharedInstanceUser].youhui_count  = nil;
    [UserProfile sharedInstanceUser].user_money_format  = nil;
    [UserProfile sharedInstanceUser].ctl  = nil;
    [UserProfile sharedInstanceUser].ref_uid  = nil;
    [UserProfile sharedInstanceUser].wait_dp_count  = nil;
    return result;
}

- (id)init
{
    if (self = [super init])
    {
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    if(self)
    {
        self.user_name = [aDecoder decodeObjectForKey:@"user_name"];
        self.status = [aDecoder decodeIntegerForKey:@"status"];
        self.page_title = [aDecoder decodeObjectForKey:@"page_title"];
        self.user_score = [aDecoder decodeIntegerForKey:@"user_score"];
        self.user_login_status = [aDecoder decodeIntegerForKey:@"user_login_status"];
        self.user_score_format = [aDecoder decodeObjectForKey:@"user_score_format"];
        self.user_avatar = [aDecoder decodeObjectForKey:@"user_avatar"];
        self.not_pay_order_count = [aDecoder decodeObjectForKey:@"not_pay_order_count"];
        self.sess_id = [aDecoder decodeObjectForKey:@"sess_id"];
        self.city_name = [aDecoder decodeObjectForKey:@"city_name"];
        self.coupon_count = [aDecoder decodeObjectForKey:@"coupon_count"];
        self.act = [aDecoder decodeObjectForKey:@"act"];
        self.info = [aDecoder decodeObjectForKey:@"info"];
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.youhui_count = [aDecoder decodeObjectForKey:@"youhui_count"];
        self.user_money_format = [aDecoder decodeObjectForKey:@"user_money_format"];
        self.ctl = [aDecoder decodeObjectForKey:@"ctl"];
        self.ref_uid = [aDecoder decodeObjectForKey:@"ref_uid"];
        self.wait_dp_count = [aDecoder decodeObjectForKey:@"wait_dp_count"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.user_name forKey:@"user_name"];
    [aCoder encodeInteger:self.status forKey:@"status"];
    [aCoder encodeObject:self.page_title forKey:@"page_title"];
    [aCoder encodeInteger:self.user_score forKey:@"user_score"];
    [aCoder encodeInteger:self.user_login_status forKey:@"user_login_status"];
    [aCoder encodeObject:self.user_score_format forKey:@"user_score_format"];
    [aCoder encodeObject:self.user_avatar forKey:@"user_avatar"];
    [aCoder encodeObject:self.not_pay_order_count forKey:@"not_pay_order_count"];
    [aCoder encodeObject:self.sess_id forKey:@"sess_id"];
    [aCoder encodeObject:self.city_name forKey:@"city_name"];
    [aCoder encodeObject:self.coupon_count forKey:@"coupon_count"];
    [aCoder encodeObject:self.act forKey:@"act"];
    [aCoder encodeObject:self.info forKey:@"info"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.youhui_count forKey:@"youhui_count"];
    [aCoder encodeObject:self.user_money_format forKey:@"user_money_format"];
    [aCoder encodeObject:self.ctl forKey:@"ctl"];
    [aCoder encodeObject:self.ref_uid forKey:@"ref_uid"];
    [aCoder encodeObject:self.wait_dp_count forKey:@"wait_dp_count"];
}

+ (BOOL)saveCacheImage:(UIImage *)image withName:(NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = paths[0];
    [path stringByAppendingPathComponent:@"/uploadImage"];
    NSFileManager *fm = [NSFileManager defaultManager];
    
    if (![fm fileExistsAtPath:path])
    {
        NSError *error = nil;
        [fm createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
    }
    [path stringByAppendingFormat:@"/%@",name];
    NSData *imageData = UIImagePNGRepresentation(image);
    return [imageData writeToFile:path atomically:YES];
}

+ (UIImage *)imageForName:(NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = paths[0];
    NSFileManager *fm = [NSFileManager defaultManager];
    [path stringByAppendingFormat:@"/uploadImage/%@",name];
    if (![fm isReadableFileAtPath:path])
    {
        return nil;
    }
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    return [[UIImage alloc] initWithData:data];
}

+ (BOOL)saveBaseData:(id)data WithName:(NSString *)name
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *paths    = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path    = paths.lastObject;
    NSString *temPath = [path stringByAppendingPathComponent:@"baseData"];
    
    if (![fm fileExistsAtPath:temPath])
    {
        NSError *error = nil;
        [fm createDirectoryAtPath:temPath withIntermediateDirectories:YES attributes:nil error:&error];
    }
    NSString *filePath = [temPath stringByAppendingFormat:@"/%@.plist",name];
    return [NSKeyedArchiver archiveRootObject:data toFile:filePath];
}

+ (id)getBaseDataWithName:(NSString *)name
{
    NSFileManager *fm  = [NSFileManager defaultManager];
    NSArray *paths     = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path     = paths[0];
    NSString *filePath = [path stringByAppendingFormat:@"/baseData/%@.plist",name];
    if (![fm isReadableFileAtPath:filePath])
    {
        return nil;
    }
    id dat = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return dat;
}

+ (void)saveChatWithMessageArray:(NSMutableArray *)message withKey:(NSString *)key
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *paths    = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path    = paths.lastObject;
    NSString *temPath = [path stringByAppendingPathComponent:@"ChatData"];
    
    if (![fm fileExistsAtPath:temPath])
    {
        NSError *error = nil;
        [fm createDirectoryAtPath:temPath withIntermediateDirectories:YES attributes:nil error:&error];
    }
    NSString *filePath = [temPath stringByAppendingFormat:@"/%@.plist",key];
    [NSKeyedArchiver archiveRootObject:message toFile:filePath];
}

+ (id)getChatMessageWithKey:(NSString *)key
{
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *paths    = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path    = paths.lastObject;
    NSString *temPath = [path stringByAppendingPathComponent:@"ChatData"];
    if (![fm fileExistsAtPath:temPath])
    {
        return nil;
    }
    NSString *filePath = [temPath stringByAppendingFormat:@"/%@.plist",key];
    NSData *dat        = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return dat;
}


@end
