//
//  IntegralCell.h
//  O2OProject
//
//  Created by Zhang on 2/27/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserProfile.h"

@interface IntegralCell : UITableViewCell


@property (nonatomic, strong) UIButton *integralBt;
@property (nonatomic, strong) UIButton *favorableBt;

-(void)setData:(UserProfile *)profile;

@end
