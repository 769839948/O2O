//
//  Commodity.h
//  O2OProject
//
//  Created by Zhang on 2/3/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Commodity : NSObject

@property (nonatomic, copy, readwrite) NSString *commodityImage;
@property (nonatomic, copy, readwrite) NSString *commodityName;
@property (nonatomic, copy, readwrite) NSString *commodityMuch;
@property (nonatomic, copy, readwrite) NSString *commodityNomalMuch;
@property (nonatomic, copy, readwrite) NSString *commodityNumber;

@property (nonatomic, copy, readwrite) NSString *commodityIntegrate;

@end
