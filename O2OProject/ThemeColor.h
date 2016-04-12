//
//  ThemeColor.h
//  O2OProject
//
//  Created by Zhang on 1/28/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#ifndef ThemeColor_h
#define ThemeColor_h


//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS


#define AppScreenSize           [[UIScreen mainScreen] bounds].size

#if __IPHONE_7_0 && __IPHONE_OS_VERSION_MAX_ALLOWED >=  __IPHONE_7_0
#define IS_RUNNING_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#else
#define IS_RUNNING_IOS7 NO
#endif


#define UMengKey                @"56ace3c0e0f55a86b7003cb5"
#define WXAPPID                 @"wx90ab084664d4bd5a"
#define WXAPPsecret             @"5ae73c1360f720416d8aa767e840c17b"
#define WXUrl                   @"www.weixin.com"

#define MapKey                  @"143567c4beba2717d44c160a08b5ed87"

#define UINavigationBarColor    [UIColor colorWithRed:0/255.0 green:194/255.0 blue:41/255.0 alpha:1.0]


#endif /* ThemeColor_h */
