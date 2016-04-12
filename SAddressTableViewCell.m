//
//  SAddressTableViewCell.m
//  O2OProject
//
//  Created by Zhang on 2/6/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "SAddressTableViewCell.h"

@interface SAddressTableViewCell()

@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *phone;
@property (nonatomic, strong) UILabel *houseNumber;

@end

@implementation SAddressTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _name = [[UILabel alloc] init];
        _name.font = [UIFont systemFontOfSize:15.0];
        _name.textColor = [UIColor blackColor];
        [self.contentView addSubview:_name];
        
        _phone = [[UILabel alloc] init];
        _phone.font = [UIFont systemFontOfSize:15.0];
        _phone.textColor = [UIColor blackColor];
        [self.contentView addSubview:_phone];
        
        _houseNumber = [[UILabel alloc] init];
        [self.contentView addSubview:_houseNumber];
        
        [self makeConstraints];
    }
    return self;
}

-(void)makeConstraints
{
    [_name makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(10);
        make.left.equalTo(self.left).offset(20);
        make.right.equalTo(_phone.left).offset(-0);
        make.bottom.equalTo(self.bottom).offset(-50);
        make.width.equalTo(_name.width);
    }];
    [_phone makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).offset(10);
        make.left.equalTo(_name.right).offset(0);
        make.right.equalTo(self.right).offset(-20);
        make.bottom.equalTo(self.bottom).offset(-50);
    }];
    [_houseNumber makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_name.bottom).offset(5);
        make.left.equalTo(self.left).offset(20);
        make.right.equalTo(self.right).offset(-20);
        make.bottom.equalTo(self.bottom).offset(-20);
    }];
}

-(void)setData:(AddressModel *)model
{
//    _name.text = model.address;
//    _phone.text = model.phone;
//    _houseNumber.text = model.houseNumber;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
