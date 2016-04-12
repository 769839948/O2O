//
//  ButtonTableViewCell.m
//  O2OProject
//
//  Created by Zhang on 1/31/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "ButtonTableViewCell.h"
#import "CustomButton.h"
#import "UIImage+UIColor.h"

@implementation ButtonTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *buttonTitle = @[@"超市",@"外卖",@"早餐",@"团购"];
        NSArray *buttonImage = @[[UIImage imageNamed:@"home_store"],[UIImage imageNamed:@"home_ take_out"],[UIImage imageNamed:@"home_breakfast"],[UIImage imageNamed:@"home_groupby"]];
        for (int i = 0; i < 4; i ++) {
            CustomButton *button = [[CustomButton alloc] initWithFrame:CGRectMake(i * (AppScreenSize.width/4), 0, AppScreenSize.width/4, AppScreenSize.width/4)];
            
            [button setTitle:buttonTitle[i] forState:UIControlStateNormal];
            
            [button setImage:buttonImage[i] forState:UIControlStateNormal];
            
            [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = i;
            [self.contentView addSubview:button];
        }
    }
    return self;
}

-(void)buttonPress:(UIButton *)sender
{
    [_delegate buttonPress:sender];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
