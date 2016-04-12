//
//  ButtonTableViewCell.h
//  O2OProject
//
//  Created by Zhang on 1/31/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ButtonTableCellDelegate <NSObject>

-(void)buttonPress:(UIButton *)button;

@end

@interface ButtonTableViewCell : UITableViewCell


@property (nonatomic, strong) id<ButtonTableCellDelegate> delegate;

-(void)buttonPress:(UIButton *)sender;

@end
