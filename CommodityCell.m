//
//  CommodityCell.m
//  O2OProject
//
//  Created by Zhang on 2/4/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "CommodityCell.h"

@interface CommodityCell()

@property (nonatomic, strong) UIImageView *commodityImage;
@property (nonatomic, strong) UILabel *commodityName;
@property (nonatomic, strong) UILabel *commodityMuch;
@property (nonatomic, strong) UILabel *commodityNumber;
@property (nonatomic, strong) UILabel *commodityNomalMuch;
@property (nonatomic, strong) UILabel *commodityIntegrate;


@property (nonatomic, strong) UILabel *nomalMuch;
@property (nonatomic, strong) UILabel *much;
@property (nonatomic, strong) UILabel *sender;

@end

@implementation CommodityCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _commodityImage = [[UIImageView alloc] init];
        [self.contentView addSubview:_commodityImage];
        
        _commodityName = [[UILabel alloc] init];
        _commodityName.textColor = [UIColor blackColor];
        _commodityName.font = [UIFont systemFontOfSize:20.0f];
        [self.contentView addSubview:_commodityName];
        
        _commodityNumber = [[UILabel alloc] init];
        _commodityNumber.textColor = [UIColor grayColor];
        _commodityNumber.font = [UIFont systemFontOfSize:10.0f];
        [self.contentView addSubview:_commodityNumber];
        
        _much = [[UILabel alloc] init];
        _much.textColor = [UIColor grayColor];
        _much.text = @"商场价：";
        _much.font = [UIFont systemFontOfSize:14.0f];
        [self.contentView addSubview:_much];
        
        _nomalMuch = [[UILabel alloc] init];
        _nomalMuch.textColor = [UIColor grayColor];
        _nomalMuch.text = @"市场价：";
        _nomalMuch.font = [UIFont systemFontOfSize:14.0f];
        [self.contentView addSubview:_nomalMuch];
        
        _commodityMuch = [[UILabel alloc] init];
        _commodityMuch.textColor = [UIColor greenColor];
        _commodityMuch.font = [UIFont systemFontOfSize:14.0f];
        [self.contentView addSubview:_commodityMuch];
        
        _commodityNomalMuch = [[UILabel alloc] init];
        _commodityNomalMuch.textColor = [UIColor grayColor];
        _commodityNomalMuch.font = [UIFont systemFontOfSize:14.0f];
        [self.contentView addSubview:_commodityNomalMuch];
        
        _commodityIntegrate = [[UILabel alloc] init];
        _commodityIntegrate.textColor = [UIColor grayColor];
        _commodityIntegrate.font = [UIFont systemFontOfSize:14.0f];
        _commodityIntegrate.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_commodityIntegrate];
        
        _sender = [[UILabel alloc] init];
        _sender.textColor = [UIColor greenColor];
        _sender.font = [UIFont systemFontOfSize:20.0f];
        _sender.text = @"公配";
        _sender.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_sender];
        
        
        [self makeConstraints];
    }
    return self;
}

-(void)makeConstraints
{
     [_commodityImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(0);
        make.centerX.equalTo(self.centerX).offset(0);
        make.size.equalTo(CGSizeMake(110, 110));
    }];
    
    [_commodityName makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commodityImage.bottom).offset(10);
        make.left.equalTo(self.left).offset(20);
        make.right.equalTo(_commodityIntegrate.left).offset(-10);
        make.right.equalTo(self.centerX).offset(30);
        make.height.equalTo(20);
    }];
    
    [_commodityIntegrate makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commodityImage.bottom).offset(20);
        make.left.equalTo(_commodityName.right).offset(10);
        make.right.equalTo(self.right).offset(-20);
        make.height.equalTo(14);

    }];
    
    [_commodityNumber makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commodityName.bottom).offset(5);
        make.left.equalTo(self.left).offset(20);
        make.right.equalTo(self.centerX).offset(-20);
        make.height.equalTo(10);
    }];
    
    [_commodityNomalMuch makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commodityNumber.bottom).offset(0);
        make.left.equalTo(_nomalMuch.right).offset(10);
        make.right.equalTo(self.centerX).offset(-20);
        make.height.equalTo(14);
    }];
    [_commodityMuch makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commodityNomalMuch.bottom).offset(0);
        make.left.equalTo(_much.right).offset(10);
        make.right.equalTo(self.centerX).offset(-20);
        make.height.equalTo(14);
    }];
    
    [_nomalMuch makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commodityNumber.bottom).offset(10);
        make.left.equalTo(self.left).offset(20);
        make.size.equalTo(CGSizeMake(60, 14));
    }];
    
    [_much makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nomalMuch.bottom).offset(5);
        make.left.equalTo(self.left).offset(20);
        make.size.equalTo(CGSizeMake(60, 14));
    }];
    
    [_sender makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commodityIntegrate.bottom).offset(5);
        make.right.equalTo(self.right).offset(-20);
        make.left.equalTo(self.centerX).offset(10);
        make.height.equalTo(20);
    }];
}

-(void)setData:(Commodity *)model
{
    _commodityImage.image = [UIImage imageNamed:model.commodityImage];
    _commodityName.text = model.commodityName;
    _commodityIntegrate.text = [NSString stringWithFormat:@"累计%@分",model.commodityIntegrate];
    _commodityNumber.text = [NSString stringWithFormat:@"月售%@笔",model.commodityNumber];
    _commodityNomalMuch.text = [NSString stringWithFormat:@"￥%@",model.commodityNomalMuch];
    _commodityMuch.text = [NSString stringWithFormat:@"￥%@",model.commodityMuch];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
