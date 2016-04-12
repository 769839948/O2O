//
//  CustomButton.m
//  O2OProject
//
//  Created by Zhang on 1/31/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        CGSize size = frame.size;
        self.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 40, -10);
//        self.imageEdgeInsets = UIEdgeInsetsMake(size.width/4, size.height/6, -size.height/4, -size.width/4);
        self.titleEdgeInsets = UIEdgeInsetsMake(10, -5, -20, 30);
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:12.0];
    }
    return self;
}

@end
