//
//  IntegralCell.m
//  O2OProject
//
//  Created by Zhang on 2/27/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "IntegralCell.h"

@interface IntegralCell()
{
    UILabel *numberScore;
    UILabel *scoreLable;
    UILabel *numberCar;
    UILabel *carLable;
    
    UILabel *centerLable;
}

@end

@implementation IntegralCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        numberScore = [[UILabel alloc] init];
        numberScore.font = [UIFont systemFontOfSize:10.0];
        numberScore.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:numberScore];
        scoreLable = [[UILabel alloc] init];
        scoreLable.textAlignment = NSTextAlignmentCenter;
        scoreLable.font = [UIFont systemFontOfSize:15.0];
        scoreLable.text = @"积分";
        [self.contentView addSubview:scoreLable];
        
        _integralBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_integralBt];
        
        
        
        centerLable = [[UILabel alloc] init];
        centerLable.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:centerLable];
        
        numberCar = [[UILabel alloc] init];
        numberCar.textAlignment = NSTextAlignmentCenter;
        numberCar.font = [UIFont systemFontOfSize:10.0];
        [self.contentView addSubview:numberCar];
        carLable = [[UILabel alloc] init];
        carLable.font = [UIFont systemFontOfSize:15.0];
        carLable.textAlignment = NSTextAlignmentCenter;
        carLable.text = @"优惠劵";
        [self.contentView addSubview:carLable];
        
        _favorableBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_favorableBt];
        
        [self makeConstraints];
    }
    return self;
}


-(void)makeConstraints
{
    [numberScore makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(5);
        make.left.equalTo(self.left).offset(0);
        make.right.equalTo(self.centerX).offset(-0);
        make.bottom.equalTo(scoreLable.top).offset(2);
        make.height.equalTo(10);
    }];
    
    [scoreLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(numberScore.bottom).offset(2);
        make.left.equalTo(self.left).offset(0);
        make.right.equalTo(self.centerX).offset(-0);
        make.bottom.equalTo(self.bottom).offset(2);
    }];
    
    [numberCar makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(5);
        make.left.equalTo(self.centerX).offset(0);
        make.right.equalTo(self.right).offset(-0);
        make.bottom.equalTo(scoreLable.top).offset(2);
        make.height.equalTo(10);
    }];
    
    [carLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(numberScore.bottom).offset(2);
        make.left.equalTo(self.centerX).offset(0);
        make.right.equalTo(self.right).offset(-0);
        make.bottom.equalTo(self.bottom).offset(2);
    }];
    
    [_integralBt makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(0);
        make.left.equalTo(self.left).offset(0);
        make.right.equalTo(self.centerX).offset(-0);
        make.bottom.equalTo(self.bottom).offset(0);
    }];
    
    [_favorableBt makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(0);
        make.left.equalTo(self.centerX).offset(0);
        make.right.equalTo(self.right).offset(-0);
        make.bottom.equalTo(self.bottom).offset(0);
    }];
    
    [centerLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(10);
        make.left.equalTo(self.centerX).offset(-1);
        make.right.equalTo(self.centerX).offset(1);
        make.bottom.equalTo(self.bottom).offset(-10);
    }];
}

-(void)setData:(UserProfile *)profile
{
    numberScore.text = profile.user_score_format;
    numberCar.text = [NSString stringWithFormat:@"%@ 张",profile.youhui_count];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
