//
//  User.m
//  O2OProject
//
//  Created by Zhang on 1/30/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "User.h"

#define kEncodedObjectPath_User ([[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"user"])

@implementation User

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static User *single = nil;
    dispatch_once(&onceToken, ^{
        if([User isLoggedIn])
        {
            single = [NSKeyedUnarchiver unarchiveObjectWithFile:kEncodedObjectPath_User];
        }
        else
        {
            single = [[User alloc] init];
        }
    });
    
    
    return single;
}

+ (BOOL)synchronize
{
    return [NSKeyedArchiver archiveRootObject:[User sharedInstance] toFile:kEncodedObjectPath_User];
}

+ (BOOL)isLoggedIn
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:kEncodedObjectPath_User];
}

+ (BOOL)logout
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    BOOL result = [fileManager removeItemAtPath:kEncodedObjectPath_User error:&error];
    if(!result)
    {
        NSLog(@"注销失败!\n%@", error);
    }
    else
    {
        //        AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
        //        if (del.logoutCompleteBlock)
        //        {
        //            del.logoutCompleteBlock();
        //        }
    }
    
    [User sharedInstance].score_count  = nil;
    [User sharedInstance].province  = nil;
    [User sharedInstance].status  = nil;
    [User sharedInstance].web_openid  = nil;
    [User sharedInstance].openid  = nil;
    [User sharedInstance].birthday  = nil;
    [User sharedInstance].nickname  = nil;
    [User sharedInstance].sex  = nil;
    [User sharedInstance].last_weixin_time  = nil;
    [User sharedInstance].last_ip  = nil;
    [User sharedInstance].is_check_phone  = nil;
    [User sharedInstance].email  = nil;
    [User sharedInstance].status  = nil;
    [User sharedInstance].city  = nil;
    [User sharedInstance].truename  = nil;
    [User sharedInstance].union_id  = nil;
    [User sharedInstance].now_money  = nil;
    [User sharedInstance].last_time  = nil;
    [User sharedInstance].occupation  = nil;
    [User sharedInstance].uid  = nil;
    [User sharedInstance].pwd  = nil;
    [User sharedInstance].phone  = nil;
    [User sharedInstance].add_time  = nil;
    [User sharedInstance].message  = nil;
    [User sharedInstance].email  = nil;
    [User sharedInstance].avatar  = nil;
    [User sharedInstance].importid  = nil;
    [User sharedInstance].level  = nil;
    [User sharedInstance].qq  = nil;
    [User sharedInstance].weidian_sessid  = nil;
    [User sharedInstance].add_ip  = nil;
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
        self.score_count = [aDecoder decodeObjectForKey:@"score_count"];
        self.province = [aDecoder decodeObjectForKey:@"province"];
        self.status = [aDecoder decodeObjectForKey:@"status"];
        self.web_openid = [aDecoder decodeObjectForKey:@"web_openid"];
        self.openid = [aDecoder decodeObjectForKey:@"openid"];
        self.birthday = [aDecoder decodeObjectForKey:@"birthday"];
        self.nickname = [aDecoder decodeObjectForKey:@"nickname"];
        self.sex = [aDecoder decodeObjectForKey:@"sex"];
        self.last_weixin_time = [aDecoder decodeObjectForKey:@"last_weixin_time"];
        self.last_ip = [aDecoder decodeObjectForKey:@"last_ip"];
        self.is_check_phone = [aDecoder decodeObjectForKey:@"is_check_phone"];
        self.is_follow = [aDecoder decodeObjectForKey:@"is_follow"];
        self.truename = [aDecoder decodeObjectForKey:@"truename"];
        self.now_money = [aDecoder decodeObjectForKey:@"now_money"];
        self.last_time = [aDecoder decodeObjectForKey:@"last_time"];
        self.occupation = [aDecoder decodeObjectForKey:@"occupation"];
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.pwd = [aDecoder decodeObjectForKey:@"pwd"];
        self.phone = [aDecoder decodeObjectForKey:@"phone"];
        self.add_time = [aDecoder decodeObjectForKey:@"add_time"];
        self.message = [aDecoder decodeObjectForKey:@"message"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.avatar = [aDecoder decodeObjectForKey:@"avatar"];
        self.status = [aDecoder decodeObjectForKey:@"status"];
        self.importid = [aDecoder decodeObjectForKey:@"importid"];
        self.level = [aDecoder decodeObjectForKey:@"level"];
        self.qq = [aDecoder decodeObjectForKey:@"qq"];
        self.weidian_sessid = [aDecoder decodeObjectForKey:@"weidian_sessid"];
        self.add_ip = [aDecoder decodeObjectForKey:@"add_ip"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.score_count forKey:@"score_count"];
    [aCoder encodeObject:self.province forKey:@"province"];
    [aCoder encodeObject:self.status forKey:@"status"];
    [aCoder encodeObject:self.web_openid forKey:@"web_openid"];
    [aCoder encodeObject:self.openid forKey:@"openid"];
    [aCoder encodeObject:self.birthday forKey:@"birthday"];
    [aCoder encodeObject:self.nickname forKey:@"nickname"];
    [aCoder encodeObject:self.sex forKey:@"sex"];
    [aCoder encodeObject:self.last_weixin_time forKey:@"last_weixin_time"];
    [aCoder encodeObject:self.last_ip forKey:@"last_ip"];
    [aCoder encodeObject:self.is_check_phone forKey:@"is_check_phone"];
    [aCoder encodeObject:self.city forKey:@"city"];
    [aCoder encodeObject:self.is_follow forKey:@"is_follow"];
    [aCoder encodeObject:self.truename forKey:@"truename"];
    [aCoder encodeObject:self.union_id forKey:@"union_id"];
    [aCoder encodeObject:self.now_money forKey:@"now_money"];
    [aCoder encodeObject:self.last_time forKey:@"last_time"];
    [aCoder encodeObject:self.occupation forKey:@"occupation"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.pwd forKey:@"pwd"];
    [aCoder encodeObject:self.phone forKey:@"phone"];
    [aCoder encodeObject:self.add_time forKey:@"add_time"];
    [aCoder encodeObject:self.message forKey:@"message"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.avatar forKey:@"avatar"];
    [aCoder encodeObject:self.importid forKey:@"importid"];
    [aCoder encodeObject:self.level forKey:@"level"];
    [aCoder encodeObject:self.qq forKey:@"qq"];
    [aCoder encodeObject:self.weidian_sessid forKey:@"weidian_sessid"];
    [aCoder encodeObject:self.add_ip forKey:@"add_ip"];
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
    //    LSLog(@"save_path = %@",filePath);
    //    NSData *dat = [NSKeyedArchiver archivedDataWithRootObject:data];
    return [NSKeyedArchiver archiveRootObject:data toFile:filePath];
}

+ (id)getBaseDataWithName:(NSString *)name
{
    NSFileManager *fm  = [NSFileManager defaultManager];
    NSArray *paths     = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path     = paths[0];
    NSString *filePath = [path stringByAppendingFormat:@"/baseData/%@.plist",name];
    //    LSLog(@"read_path = %@",filePath);
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

+ (void)autoLogin
{
    NSString *url = [BaseUrl stringByAppendingString:RequestLoginUrl];
    AFHTTPSessionManager *_sessionManager = [AFHTTPSessionManager manager];
    //        [_sessionManager.securityPolicy setAllowInvalidCertificates:YES];
    _sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    _sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",nil];
    User *user = [User sharedInstance];
    NSDictionary *parameters = @{@"phone":@"18363899723",@"pwd":@"123"};
    [_sessionManager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"自动登录%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}

@end
