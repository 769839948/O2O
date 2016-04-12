//
//  ProfilesTable.m
//  O2OProject
//
//  Created by Zhang on 1/28/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "ProfilesTable.h"
#import "IntegralCell.h"

static NSString *tableVIewCell = @"ProfilesCell";

@implementation ProfilesTable

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
        self.tableHeaderView = [self headerView];
    }
    return self;
}


-(UIView *)headerView
{
    UIView *tableHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, AppScreenSize.width, 155)];
    _profilePhoto = [[UIImageView alloc] initWithFrame:CGRectMake(AppScreenSize.width/2-40, 155/2-40, 80, 80)];
    
    // 单击的 Recognizer
    UITapGestureRecognizer* singleRecognizer;
    singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapFrom)];
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    [_profilePhoto addGestureRecognizer:singleRecognizer];
    _profilePhoto.userInteractionEnabled = YES;
    _profilePhoto.layer.cornerRadius = 40;
    [_profilePhoto sd_setImageWithURL:[NSURL URLWithString:_userProfile.user_avatar] placeholderImage:[UIImage imageNamed:@""]];
    [tableHeader addSubview:_profilePhoto];
    
    UILabel *userName = [[UILabel alloc] initWithFrame:CGRectMake(0, 155 - 30, AppScreenSize.width, 20)];
    userName.textAlignment = NSTextAlignmentCenter;
    userName.textColor = [UIColor whiteColor];
    userName.text = _userProfile.user_name;
    [tableHeader addSubview:userName];
    
    tableHeader.backgroundColor = UINavigationBarColor;
    
    
    
    return tableHeader;
}

-(void)handleSingleTapFrom
{
    
}

#pragma mark - uitableViewDelegateDataSource

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 2;
    }else if (section == 2){
        return 1;
    }else if (section == 3){
        return 1;
    }else{
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        static NSString *cellIdentifier = @"Intergral";
        IntegralCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[IntegralCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            
        }
        [cell setData:_userProfile];
        [[cell.integralBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            NSLog(@"integralBt press");
        }];
        [[cell.favorableBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            NSLog(@"favorableBt press");
        }];
        return cell;
        
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableVIewCell];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableVIewCell];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.imageView.image = [UIImage imageNamed:self.imageArray[indexPath.section - 1][indexPath.row]];
        cell.textLabel.text = self.tableArray[indexPath.section][indexPath.row];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
