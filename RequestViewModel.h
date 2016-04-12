//
//  RequestViewModel.h
//  O2OProject
//
//  Created by Zhang on 1/29/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "BaseViewModel.h"
#import "MJExtension.h"
// 继承自BaseViewModel
// 需要网络请求的VM继承该类
// 该类有一个公共属性sessionManager，一个该属性的懒加载方法和一个dealloc中取消网络请求的方法

@interface RequestViewModel : BaseViewModel

@property (nonatomic, strong) AFHTTPSessionManager * sessionManager;

@end
