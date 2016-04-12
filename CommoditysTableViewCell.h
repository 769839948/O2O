//
//  CommoditysTableViewCell.h
//  O2OProject
//
//  Created by Zhang on 2/6/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Commodity.h"

@interface CommoditysTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *commodityImage;
@property (nonatomic, strong) UILabel *commodityName;
@property (nonatomic, strong) UILabel *commodityMuch;

-(void)setData:(Commodity *)model;

@end
