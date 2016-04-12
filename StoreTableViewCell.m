//
//  StoreTableViewCell.m
//  O2OProject
//
//  Created by Zhang on 1/31/16.
//  Copyright © 2016 Zhang. All rights reserved.
//
////        StoreModel *model = [[StoreModel alloc] init];
////        model.storeImage = @"storeImage.png";
////        model.storeName = @"绿意商贸";
////        model.userImage = @"newUser.png";
////        model.oldUserImage = @"oldUser.png";
////        model.payImage = @"pay.png";
////        model.cartImage = @"cart.png";
////        model.keatyImage = @"keay.png";
////        model.startSender = @"50";
////        model.sender = @"0";
////        model.location = @"北京西单";
////        model.phone = @"020-742919";
////        model.time = @"09:00-22:00";
////        model.prompt = @"今日下的可选择即使支付";
////        model.onlinePay = YES;
////        model.userLable = @"新用户在线支付满15立减6元";
////        model.oldUserLable = @"在线支付满50减6元";
////        model.comment = @"";
////        model.numberOfSale = @"40";
////        model.sorce = @"30";
#import "StoreTableViewCell.h"

@interface StoreTableViewCell()

@property (nonatomic, strong) UIImageView *storeImage;
@property (nonatomic, strong) UILabel *storeName;
@property (nonatomic, strong) UILabel *sorce;
@property (nonatomic, strong) UILabel *numberOfSale;
@property (nonatomic, strong) UILabel *startSender;
@property (nonatomic, strong) UILabel *sender;
@property (nonatomic, strong) UILabel *location;
@property (nonatomic, strong) UIImageView *cartImage;
@property (nonatomic, strong) UIImageView *payImage;
@property (nonatomic, strong) UIImageView *keatyImage;

@property (nonatomic, strong) UIImageView *userImage;
@property (nonatomic, strong) UIImageView *oldUserImage;

@property (nonatomic, strong) UILabel *userLable;
@property (nonatomic, strong) UILabel *oldUserLable;


@property (nonatomic, strong) UILabel *centerLable;

@end

@implementation StoreTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _storeImage = [[UIImageView alloc] init];
        [self.contentView addSubview:_storeImage];
        
        _storeName = [[UILabel alloc] init];
        _storeName.font = [UIFont systemFontOfSize:12.0];
//        _storeName.backgroundColor = [UIColor redColor];
        _storeName.numberOfLines = 0;
        [self.contentView addSubview:_storeName];
        
        _sorce = [[UILabel alloc] init];
        [self.contentView addSubview:_sorce];
        
        _numberOfSale = [[UILabel alloc] init];
        _numberOfSale.textColor = [UIColor grayColor];
        _numberOfSale.font = [UIFont systemFontOfSize:10.0];
        [self.contentView addSubview:_numberOfSale];
        
        _startSender = [[UILabel alloc] init];
        _startSender.textColor = [UIColor grayColor];
        _startSender.font = [UIFont systemFontOfSize:10.0];
        [self.contentView addSubview:_startSender];
        
        _sender = [[UILabel alloc] init];
        _sender.textColor = [UIColor grayColor];
        _sender.font = [UIFont systemFontOfSize:10.0];
        
        [self.contentView addSubview:_sender];
        
        _location = [[UILabel alloc] init];
        _location.textColor = [UIColor grayColor];
        _location.font = [UIFont systemFontOfSize:10.0];
        [self.contentView addSubview:_location];
        
        _cartImage = [[UIImageView alloc] init];
        [self.contentView addSubview:_cartImage];
        
        _keatyImage = [[UIImageView alloc] init];
        [self.contentView addSubview:_keatyImage];
       
        _payImage = [[UIImageView alloc] init];
        [self.contentView addSubview:_payImage];
        
        _userImage = [[UIImageView alloc] init];
        [self.contentView addSubview:_userImage];
        
        _oldUserImage = [[UIImageView alloc] init];
        [self.contentView addSubview:_oldUserImage];
        
        _userLable = [[UILabel alloc] init];
        _userLable.textColor = [UIColor grayColor];
        _userLable.font = [UIFont systemFontOfSize:12.0];
        [self.contentView addSubview:_userLable];
        
        _oldUserLable = [[UILabel alloc] init];
        _oldUserLable.textColor = [UIColor grayColor];
        _oldUserLable.font = [UIFont systemFontOfSize:12.0];
        [self.contentView addSubview:_oldUserLable];
        
        
        _centerLable = [[UILabel alloc] init];
        _centerLable.textColor = [UIColor grayColor];
        _centerLable.text = @"---------------------------------------------";
        [self.contentView addSubview:_centerLable];
        [self setConstraints];
//        [self testModel];
    }
    return self;
}


-(void)setConstraints
{
    [_storeImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top).offset(10);
        make.left.equalTo(self.contentView.left).offset(5);
        make.right.equalTo(_storeName.left).offset(-5);
        make.size.equalTo(CGSizeMake(80, 40));
        make.bottom.equalTo(self.contentView.centerY).offset(-0);
    }];
    
    [_storeName makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top).offset(10);
        make.left.equalTo(_storeImage.right).offset(5);
        make.right.equalTo(_cartImage.left).offset(-5);
        make.height.equalTo(30);
    }];
    
    [_sorce makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_storeName.bottom).offset(5);
        make.left.equalTo(_storeImage.right).offset(5);
        make.height.equalTo(10);
        make.right.equalTo(_numberOfSale.right).offset(-20);
    }];
    
    [_numberOfSale makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_storeName.bottom).offset(5);
        make.left.equalTo(_sorce.right).offset(5);
        make.height.equalTo(10);
        make.right.equalTo(self.contentView.right).offset(-50);
    }];
    
    [_startSender makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_sorce.bottom).offset(5);
        make.left.equalTo(_storeImage.right).offset(20);
        make.height.equalTo(10);
        make.right.equalTo(_sender.left).offset(-10);
    }];
    
    [_sender makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_sorce.bottom).offset(5);
        make.left.equalTo(_startSender.right).offset(10);
        make.height.equalTo(10);
        make.right.equalTo(_location.right).offset(-10);
    }];
    [_location makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_sorce.bottom).offset(5);
        make.left.equalTo(_sender.right).offset(10);
        make.height.equalTo(10);
        make.right.equalTo(self.contentView.right).offset(-50);
    }];
    
    [_userImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.centerY).offset(13);
        make.left.equalTo(self.contentView.left).offset(20);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    
    [_userLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.centerY).offset(16);
        make.left.equalTo(_userImage.right).offset(15);
        make.right.equalTo(self.contentView.right).offset(-20);
        make.height.equalTo(15);
    }];
    
    [_oldUserImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userImage.bottom).offset(7);
        make.left.equalTo(self.contentView.left).offset(20);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    
    [_oldUserLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_userLable.bottom).offset(12);
        make.left.equalTo(_oldUserImage.right).offset(15);
        make.right.equalTo(self.contentView.right).offset(-20);
        make.height.equalTo(15);
    }];
    
    [_cartImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top).offset(20);
        make.right.equalTo(_keatyImage.left).offset(-5);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    
    [_keatyImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top).offset(20);
        make.left.equalTo(_cartImage.right).offset(5);
        make.right.equalTo(_payImage.left).offset(-5);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    
    [_payImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top).offset(20);
        make.left.equalTo(_keatyImage.right).offset(5);
        make.right.equalTo(self.contentView.right).offset(-20);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
    
    [_centerLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.centerY).offset(6);
        make.left.equalTo(self.contentView.left).offset(20);
        make.right.equalTo(self.contentView.right).offset(-20);
        make.height.equalTo(2);
    }];
}

-(void)setData:(StoreModel *)model
{
    if (model.preview != nil && ![model.preview isEqualToString:@""]) {
        [_storeImage sd_setImageWithURL:[NSURL URLWithString:model.preview] placeholderImage:[UIImage imageNamed:@""]];
    }
    _storeName.text = model.name;
//    _sorce.text = model.sorce;
    _location.text = [NSString stringWithFormat:@"%@km",model.address];
    _startSender.text = [NSString stringWithFormat:@"起送 ￥%@",@""];
    _sender.text = _startSender.text = [NSString stringWithFormat:@"配送 ￥%@",@""];
    _userImage.image = [UIImage imageNamed:@"newUser.png"];
    _oldUserImage.image = [UIImage imageNamed:@"oldUser.png"];
    _payImage.image = [UIImage imageNamed:@"pay.png"];
    _cartImage.image = [UIImage imageNamed:@"cart.png"];
    _keatyImage.image = [UIImage imageNamed:@"keay.png"];
    _numberOfSale.text = [NSString stringWithFormat:@"月售%@笔",@"30"];
    _userLable.text = @"30";
    _oldUserLable.text = @"30";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
