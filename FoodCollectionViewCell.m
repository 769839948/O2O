//
//  FoodCollectionViewCell.m
//  O2OProject
//
//  Created by Zhang on 2/3/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "FoodCollectionViewCell.h"

@interface FoodCollectionViewCell()

@property (nonatomic, strong) UIImageView *commityImage;
@property (nonatomic, strong) UILabel *commityName;
@property (nonatomic, strong) UILabel *commityNumber;
@property (nonatomic, strong) UILabel *commityMuch;




@end

@implementation FoodCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _commityImage = [[UIImageView alloc] init];
        [self.contentView addSubview:_commityImage];
        
        _commityName = [[UILabel alloc] init];
        _commityName.textColor = [UIColor blackColor];
        _commityName.lineBreakMode = NSLineBreakByWordWrapping;
        _commityName.font = [UIFont systemFontOfSize:15.0];
        _commityName.numberOfLines = 2;
        [self.contentView addSubview:_commityName];
        
        _commityNumber = [[UILabel alloc] init];
        _commityNumber.textColor = [UIColor grayColor];
        _commityNumber.font = [UIFont systemFontOfSize:12.0];
        [self.contentView addSubview:_commityNumber];
        
        _commityMuch = [[UILabel alloc] init];
        _commityMuch.textColor = [UIColor greenColor];
        _commityMuch.font = [UIFont systemFontOfSize:15.0];
        [self.contentView addSubview:_commityMuch];
        
        _addBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addBt setBackgroundImage:[UIImage imageNamed:@"add.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:_addBt];
        
        [self makeConstraints];
    }
    return self;
}

-(void)makeConstraints
{
    [_commityImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(0);
        make.left.equalTo(self.left).offset(0);
        make.right.equalTo(self.right).offset(-0);
        make.bottom.equalTo(_commityName.top).offset(-10);
        make.height.equalTo(80);
    }];
    
    [_commityName makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commityImage.bottom).offset(10);
        make.left.equalTo(self.left).offset(0);
        make.right.equalTo(self.right).offset(-0);
        make.height.equalTo(38);
    }];
    
    [_commityNumber makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commityName.bottom).offset(0);
        make.left.equalTo(self.left).offset(0);
        make.right.equalTo(self.right).offset(-0);
        make.height.equalTo(13);
    }];
    
    [_commityMuch makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom).offset(-10);
        make.left.equalTo(self.left).offset(0);
        make.right.equalTo(self.right).offset(-50);
        make.height.equalTo(15);
    }];
    
    [_addBt makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottom).offset(-7.5);
//        make.left.equalTo(self.left).offset(0);
        make.right.equalTo(self.right).offset(-5);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
}

-(void)setData:(Commodity *)model withIndexPath:(NSIndexPath *)indexPath
{
    _commityImage.image = [UIImage imageNamed:model.commodityImage];
    _commityName.text = model.commodityName;
    _commityNumber.text = [NSString stringWithFormat:@"月售%@份",model.commodityNumber];
    _commityMuch.text = [NSString stringWithFormat:@"￥ %@",model.commodityMuch];
    _addBt.tag = indexPath.row;
}

@end
