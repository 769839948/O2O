//
//  FoodCollectionViewCell.h
//  O2OProject
//
//  Created by Zhang on 2/3/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Commodity.h"

@interface FoodCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIButton *addBt;

-(void)setData:(Commodity *)model withIndexPath:(NSIndexPath *)indexPath;

@end
