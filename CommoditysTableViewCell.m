//
//  CommoditysTableViewCell.m
//  O2OProject
//
//  Created by Zhang on 2/6/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "CommoditysTableViewCell.h"

//@interface CommoditysTableViewCell()
//
//
//
//@end

@implementation CommoditysTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _commodityImage = [[UIImageView alloc] init];
        [self.contentView addSubview:_commodityImage];
        
        _commodityName = [[UILabel alloc] init];
        [self.contentView addSubview:_commodityName];
        
        _commodityMuch = [[UILabel alloc] init];
        [self.contentView addSubview:_commodityMuch];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
