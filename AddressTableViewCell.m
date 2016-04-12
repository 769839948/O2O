//
//  AddressTableViewCell.m
//  O2OProject
//
//  Created by Zhang on 1/31/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "AddressTableViewCell.h"

@interface AddressTableViewCell()

@property (nonatomic, strong) UIImageView *address_user;
@property (nonatomic, strong) UIImageView *address_mobile;


@property (nonatomic, strong) UILabel *address;
@property (nonatomic, strong) UILabel *phone;
@property (nonatomic, strong) UILabel *userName;


@end


@implementation AddressTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _address_user = [[UIImageView alloc] init];
        _address_user.image = [UIImage imageNamed:@"address_user"];
        [self.contentView addSubview:_address_user];
        
        _address_mobile = [[UIImageView alloc] init];
        _address_mobile.image = [UIImage imageNamed:@"address_mobile"];
        [self.contentView addSubview:_address_mobile];
        
        _address = [[UILabel alloc] init];
        _address.font = [UIFont systemFontOfSize:15.0];
        _address.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_address];
        
        
        _phone = [[UILabel alloc] init];
        _phone.font = [UIFont systemFontOfSize:15.0];
        _phone.textColor = [UIColor blackColor];
        [self.contentView addSubview:_phone];
        
        
        _userName = [[UILabel alloc] init];
        _userName.font = [UIFont systemFontOfSize:15.0];
        _userName.textColor = [UIColor blackColor];
        [self.contentView addSubview:_userName];
        
        _deleteBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteBt setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteBt setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_deleteBt setImage:[UIImage imageNamed:@"address_delete"] forState:UIControlStateNormal];
        _deleteBt.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [self.contentView addSubview:_deleteBt];
        
        _editBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [_editBt setTitle:@"编辑" forState:UIControlStateNormal];
        [_editBt setImage:[UIImage imageNamed:@"address_edit"] forState:UIControlStateNormal];
        [_editBt setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _editBt.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [self.contentView addSubview:_editBt];
        
        [self setUpConstraints];
    }
    return self;
}

-(void)setUpConstraints
{
    [_address_user makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top).offset(20);
        make.left.equalTo(self.contentView.left).offset(20);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    
    [_userName makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top).offset(20);
        make.left.equalTo(_address_user.right).offset(10);
        make.right.equalTo(self.contentView.centerX).offset(-10);
        make.height.equalTo(20);
    }];
    
    [_address_mobile makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top).offset(20);
        make.left.equalTo(self.contentView.centerX).offset(20);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    
    [_phone makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top).offset(20);
        make.left.equalTo(_address_mobile.right).offset(10);
        make.right.equalTo(self.contentView.right).offset(-10);
        make.height.equalTo(15);
    }];
    
    [_address makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userName.bottom).offset(10);
        make.left.equalTo(self.contentView.left).offset(20);
        make.right.equalTo(self.contentView.centerX).offset(-10);
        make.height.equalTo(20);
    }];
    
    [_deleteBt makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.bottom).offset(-10);
        make.right.equalTo(self.contentView.right).offset(-20);
        make.width.equalTo(50);
    }];
    
    [_editBt makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.bottom).offset(-10);
        make.right.equalTo(_deleteBt.left).offset(-10);
        make.width.equalTo(50);
    }];
}
-(void)configCell:(AddressModel *)model withIndex:(NSIndexPath *)indexPath
{
    _address.text = model.adress;
    _phone.text = model.phone;
    _userName.text = model.name;
    _deleteBt.tag = indexPath.row;
    _editBt.tag = indexPath.row;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
