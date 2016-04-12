//
//  HomeViewModel.m
//  O2OProject
//
//  Created by Zhang on 2/2/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "HomeViewModel.h"
#import "MJExtension.h"
#import "HomeModel.h"
#import "CityModel.h"


@implementation HomeViewModel

-(RACSignal *)requestHomeView:(NSString *)shopType
{
    NSString *url = [BaseUrl stringByAppendingString:RequestHomeUrl];
    RACSignal *requestSinal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [self.sessionManager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@",responseObject);
//            NSNumber *status = responseObject[@"status"];
////            NSString *json = [self DataTOjsonString:responseObject];
//            if ([status intValue] == 1) {
//                HomeModel *model = [[HomeModel alloc] init];
//                model = [HomeModel mj_objectWithKeyValues:responseObject];
//                model.indexs = [HomeIndexModle mj_objectArrayWithKeyValuesArray:responseObject[@"indexs"]];
//                model.advs = [HomeAdvModel mj_objectArrayWithKeyValuesArray:responseObject[@"advs"]];
//                model.supplier_deal_list = [SupplierDealModel mj_objectArrayWithKeyValuesArray:responseObject[@"supplier_deal_list"]];
//                model.deal_list = [NSObject mj_objectArrayWithKeyValuesArray:responseObject[@"deal_list"]];
//                model.supplier_list = [NSObject mj_objectArrayWithKeyValuesArray:responseObject[@"supplier_list"]];
//                [subscriber sendNext:model];
//                [subscriber sendCompleted];
//            }else{
//                HomeModel *model = [[HomeModel alloc] init];
//                [subscriber sendNext:model];
//                [subscriber sendCompleted];
//            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            HomeModel *model = [[HomeModel alloc] init];
            [subscriber sendNext:model];
            [subscriber sendCompleted];
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return requestSinal;
}

-(RACSignal *)requestCityView
{
    NSString *url = [BaseUrl stringByAppendingString:RequestCityUrl];
    RACSignal *requestSinal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [self.sessionManager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            NSLog(@"");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@",responseObject);
//            NSNumber *status = responseObject[@"status"];
//            NSString *json = [self DataTOjsonString:responseObject];
//            if ([status intValue] == 1) {
//                CityModel *model = [[CityModel alloc] init];
//                model = [CityModel mj_objectWithKeyValues:responseObject];
//                model.hot_city = [NSArray mj_objectArrayWithKeyValuesArray:responseObject[@"hot_city"]];
////                model.city_list = [City_List mj_objectWithKeyValues:responseObject[@"city_list"]];
////                NSDictionary *dic = responseObject[@"city_list"];
////                model.city_list.A = [A mj_objectArrayWithKeyValuesArray:dic[@"A"]];
////                model.city_list.B = [B mj_objectArrayWithKeyValuesArray:dic[@"B"]];
////                model.city_list.C = [C mj_objectArrayWithKeyValuesArray:dic[@"C"]];
////                model.city_list.D = [D mj_objectArrayWithKeyValuesArray:dic[@"D"]];
////                model.city_list.E = [E mj_objectArrayWithKeyValuesArray:dic[@"E"]];
////                model.city_list.F = [F mj_objectArrayWithKeyValuesArray:dic[@"F"]];
////                model.city_list.G = [G mj_objectArrayWithKeyValuesArray:dic[@"G"]];
////                model.city_list.H = [H mj_objectArrayWithKeyValuesArray:dic[@"H"]];
////                model.city_list.J = [J mj_objectArrayWithKeyValuesArray:dic[@"J"]];
////                model.city_list.K = [K mj_objectArrayWithKeyValuesArray:dic[@"K"]];
////                model.city_list.L = [L mj_objectArrayWithKeyValuesArray:dic[@"L"]];
////                model.city_list.M = [M mj_objectArrayWithKeyValuesArray:dic[@"M"]];
////                model.city_list.N = [N mj_objectArrayWithKeyValuesArray:dic[@"N"]];
////                model.city_list.O = [O mj_objectArrayWithKeyValuesArray:dic[@"O"]];
////                model.city_list.P = [P mj_objectArrayWithKeyValuesArray:dic[@"P"]];
////                model.city_list.Q = [Q mj_objectArrayWithKeyValuesArray:dic[@"Q"]];
////                model.city_list.R = [R mj_objectArrayWithKeyValuesArray:dic[@"R"]];
////                model.city_list.S = [S mj_objectArrayWithKeyValuesArray:dic[@"S"]];
////                model.city_list.T = [T mj_objectArrayWithKeyValuesArray:dic[@"T"]];
////                model.city_list.U = [U mj_objectArrayWithKeyValuesArray:dic[@"U"]];
////                model.city_list.V = [V mj_objectArrayWithKeyValuesArray:dic[@"V"]];
////                model.city_list.W = [W mj_objectArrayWithKeyValuesArray:dic[@"W"]];
////                model.city_list.X = [X mj_objectArrayWithKeyValuesArray:dic[@"X"]];
////                model.city_list.Y = [Y mj_objectArrayWithKeyValuesArray:dic[@"Y"]];
////                model.city_list.Z = [Z mj_objectArrayWithKeyValuesArray:dic[@"Z"]];
//                [subscriber sendNext:model];
//                [subscriber sendCompleted];
//            }else{
//                HomeModel *model = [[HomeModel alloc] init];
//                [subscriber sendNext:model];
//                [subscriber sendCompleted];
//            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            HomeModel *model = [[HomeModel alloc] init];
            [subscriber sendNext:model];
            [subscriber sendCompleted];
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return requestSinal;
}

-(RACSignal *)requestSuperMarkView:(NSString *)city_id
{
    NSString *url = [BaseUrl stringByAppendingString:RequestStoreUrl];
    RACSignal *requestSinal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSDictionary *parameters = @{@"city_id":@"15"};
        [self.sessionManager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            NSLog(@"%@",formData);
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            NSLog(@"%@",uploadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSString *json = [self DataTOjsonString:responseObject];
//            NSLog(@"%@",responseObject);
            NSNumber *status = responseObject[@"status"];
            if ([status intValue] == 1) {
                NSMutableArray *modelArray = [StoreModel mj_objectArrayWithKeyValuesArray:responseObject[@"item"]];
                [subscriber sendNext:modelArray];
                [subscriber sendCompleted];
            }else{
                [subscriber sendCompleted];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendCompleted];
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return requestSinal;
}

/*
-(RACSignal *)requestSuperMarkView:(HomeIndexModle *)model
{
    NSString *url = [BaseUrl stringByAppendingString:RequestStoreUrl];
    RACSignal *requestSinal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        Data *data = [[Data alloc] init];
        data = model.data;
        NSString *string = data.cate_id;
        NSDictionary *parameters = @{@"cate_id":@"8",@"qid":model.type,@"page":@"1",@"order_type":@"default"};
        [self.sessionManager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            NSLog(@"");
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            NSLog(@"");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSString *json = [self DataTOjsonString:responseObject];
            NSLog(@"%@",responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"");
        }];
        return [RACDisposable disposableWithBlock:^{
            
        }];
    }];
    return requestSinal;
}
*/
-(NSString*)DataTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}


@end
