//
//  AddressTableViewCell.h
//  O2OProject
//
//  Created by Zhang on 1/31/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressModel.h"

@interface AddressTableViewCell : UITableViewCell

@property (nonatomic, strong) UIButton *deleteBt;
@property (nonatomic, strong) UIButton *editBt;

-(void)configCell:(AddressModel *)model withIndex:(NSIndexPath *)indexPath;

@end
