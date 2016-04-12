//
//  CollectTableViewCell.m
//  O2OProject
//
//  Created by Zhang on 1/31/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "CollectTableViewCell.h"

@interface CollectTableViewCell();

@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UILabel *nameLable;
@property (nonatomic, strong) UILabel *muchLable;


@end

@implementation CollectTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _image = [[UIImageView alloc] init];
        [self.contentView addSubview:_image];
        _nameLable = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLable];
        
        _muchLable = [[UILabel alloc] init];
        [self.contentView addSubview:_muchLable];
        
        
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_addButton];
        [self setConstraints];
    }
    return self;
}

-(void)setConstraints
{
    [_image makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top).offset(10);
        make.left.equalTo(self.contentView.left).offset(20);
        make.size.equalTo(CGSizeMake(80, 80));
        make.bottom.equalTo(self.contentView.bottom).offset(-10);
    }];
    [_nameLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top).offset(10);
        make.left.equalTo(_image.left).offset(20);
        make.right.equalTo(_image.right).offset(-20);
        make.bottom.equalTo(_muchLable.bottom).offset(-20);
    }];
    [_muchLable makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameLable.top).offset(20);
        make.left.equalTo(self.contentView.left).offset(20);
        make.right.equalTo(_image.right).offset(-20);
        make.bottom.equalTo(self.contentView.bottom).offset(-20);
    }];
    [_addButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.top).offset(10);
        make.right.equalTo(self.contentView.right).offset(-10);
        make.size.equalTo(CGSizeMake(80, 80));
        make.bottom.equalTo(self.contentView.bottom).offset(-10);
    }];
    
}

-(void)cofigCell:(CollectModle *)model withIndexPath:(NSIndexPath *)indexPath
{
    [_image sd_setImageWithURL:[NSURL URLWithString:model.imageName]  placeholderImage:[UIImage imageNamed:@""]];
    _nameLable.text = model.collectName;
    _muchLable.text = model.collectMuch;
    _addButton.tag = indexPath.row;
//    [_image sd_setImageWithURL:[NSURL URLWithString:model.imageName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        
//    }];
}
//- (void)setupSignal {
//    
//    @weakify(self);
//    [RACObserve(self, viewModel) subscribeNext:^(CollectViewModel *viewModel) {
//        
//        // 使用strong修饰self，防止在self在使用中被释放
//        @strongify(self);
//        
//        // vm已经将要显示的文本处理好了，在cell中直接赋值就行
//        self.textLabel.text = viewModel.titleText;
//        self.detailTextLabel.text = viewModel.authorText;
//    }];
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
