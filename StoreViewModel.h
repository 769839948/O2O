//
//  StoreViewModel.h
//  O2OProject
//
//  Created by Zhang on 2/3/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "RequestViewModel.h"
#import "Commodity.h"
#import "StoreInfoModel.h"

@interface StoreViewModel : RequestViewModel

-(NSArray *)tableArray;

-(RACSignal *)requestSignal:(NSString *)data_id;

@end
