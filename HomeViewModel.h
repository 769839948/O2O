//
//  HomeViewModel.h
//  O2OProject
//
//  Created by Zhang on 2/2/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "RequestViewModel.h"
#import "StoreModel.h"
#import "HomeModel.h"

@interface HomeViewModel : RequestViewModel

-(RACSignal *)requestHomeView:(NSString *)shopType;
-(RACSignal *)requestCityView;
//-(RACSignal *)requestSuperMarkView:(HomeIndexModle *)model;

-(RACSignal *)requestSuperMarkView:(NSString *)city_id;

@end
