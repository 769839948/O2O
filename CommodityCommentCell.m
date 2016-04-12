//
//  CommodityCommentCell.m
//  O2OProject
//
//  Created by Zhang on 2/4/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "CommodityCommentCell.h"

@interface CommodityCommentCell()

@property (nonatomic, strong) UILabel *commenLable;
@property (nonatomic, strong) UILabel *score;


@end

@implementation CommodityCommentCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _commenLable = [[UILabel alloc] init];
        _commenLable.text = @"商品评价";
        _commenLable.font = [UIFont systemFontOfSize:20.0f];
        _commenLable.textColor = [UIColor blackColor];
        [self.contentView addSubview:_commenLable];
        
        _commentScore = [[UILabel alloc] init];
        _commentScore.font = [UIFont systemFontOfSize:15.0f];
        _commentScore.textColor = [UIColor greenColor];
        [self.contentView addSubview:_commentScore];
        
        _score = [[UILabel alloc] init];
        _score.font = [UIFont systemFontOfSize:15.0f];
        _score.textColor = [UIColor grayColor];
        _score.text = @"好评率";
        [self.contentView addSubview:_score];
        
        _numberComment = [[UILabel alloc] init];
        _numberComment.textColor = [UIColor grayColor];
        _numberComment.font = [UIFont systemFontOfSize:15.0f];
        [self.contentView addSubview:_numberComment];
        [self makeConstraints];
    }
    return self;
}

-(void)makeConstraints
{
    [_commenLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(10);
        make.left.equalTo(self.left).offset(20);
        make.right.equalTo(self.right).offset(-20);
        make.height.equalTo(20);
    }];
    
    [_score makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commenLable.bottom).offset(5);
        make.left.equalTo(self.left).offset(20);
        make.width.equalTo(50);
        make.height.equalTo(15);
    }];
    
    [_commentScore makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commenLable.bottom).offset(5);
        make.left.equalTo(_score.right).offset(10);
        make.width.equalTo(50);
        make.height.equalTo(15);
        
    }];
    
    [_numberComment makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_commenLable.bottom).offset(5);
        make.left.equalTo(_commentScore.right).offset(10);
        make.right.equalTo(self.right).offset(-20);
        make.height.equalTo(15);
        
    }];
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
