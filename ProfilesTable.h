//
//  ProfilesTable.h
//  O2OProject
//
//  Created by Zhang on 1/28/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserProfile.h"

@interface ProfilesTable : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, copy) NSMutableArray *tableArray;
@property (nonatomic, copy) NSMutableArray *imageArray;

@property (nonatomic, strong) UIImageView *profilePhoto;

@property (nonatomic, strong) UserProfile *userProfile;

@property (nonatomic, strong) UILabel *userName;

-(UIView *)headerView;

-(void)handleSingleTapFrom;

@end
