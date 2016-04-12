//
//  CollectTableViewCell.h
//  O2OProject
//
//  Created by Zhang on 1/31/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectModle.h"

@interface CollectTableViewCell : UITableViewCell

// cell的VM

@property (nonatomic, strong) UIButton *addButton;

-(void)cofigCell:(CollectModle *)model withIndexPath:(NSIndexPath *)indexPath;


@end
