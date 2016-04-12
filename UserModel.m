//
//  UserModel.m
//  O2OProject
//
//  Created by Zhang on 1/29/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

// MJExtension中替换属性名称的方法
+ (NSDictionary *)replacedKeyFromPropertyName {
    
    return @{@"articleId" : @"id"};
}

@end
