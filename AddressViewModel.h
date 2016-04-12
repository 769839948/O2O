//
//  AddressViewModel.h
//  O2OProject
//
//  Created by Zhang on 2/27/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "RequestViewModel.h"
#import "AddressModel.h"

@interface AddressViewModel : RequestViewModel

-(RACSignal *)requestModel;

-(RACSignal *)requestModel:(AddressModel *)model;

-(RACSignal *)requestDelModel:(NSString *)ID;

-(void)requestNomalModel:(NSString *)ID;

-(NSArray *)addAddressTableArray;

-(NSArray *)addAddressField;

@end
