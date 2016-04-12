//
//  StoreModel.h
//  O2OProject
//
//  Created by Zhang on 2/2/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoreModel : NSObject

@property (nonatomic, copy) NSString *address;

@property (nonatomic, assign) CGFloat xpoint;

@property (nonatomic, assign) NSInteger distance;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *preview;

@property (nonatomic, copy) NSString *is_verify;

@property (nonatomic, assign) CGFloat ypoint;

@property (nonatomic, copy) NSString *tel;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *avg_point;

@end
