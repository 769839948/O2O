//
//  StoreView.m
//  O2OProject
//
//  Created by Zhang on 2/3/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "StoreView.h"
#import "StoreCategoryCollectionViewCell.h"
#import "FoodCollectionViewCell.h"

@implementation StoreView

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpCollectView];
    }
    return self;
}


-(void)setUpCollectView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    _collectView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, AppScreenSize.width, AppScreenSize.height-50) collectionViewLayout:layout];
    _collectView.backgroundColor = [UIColor whiteColor];
    _collectView.delegate = self;
    _collectView.dataSource = self;
    [_collectView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    [_collectView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionView"];
    [_collectView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"StoreCollectionViewCell"];
    [_collectView registerClass:[FoodCollectionViewCell class] forCellWithReuseIdentifier:@"FoodCollectionViewCell"];
    [self addSubview:_collectView];
}

-(void)setHederView:(UICollectionReusableView *)headerView
{
    UIView *header = [[UIView alloc] init];
    header.frame = CGRectMake(0, 0, AppScreenSize.width, 100);
    header.backgroundColor = UINavigationBarColor;
    
    [headerView addSubview:header];
    
    UITapGestureRecognizer *oneTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneTapGesture:)];
    oneTapGesture.numberOfTapsRequired = 1;
    [header addGestureRecognizer:oneTapGesture];
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(20, 20, 60, 60);
    [imageView sd_setImageWithURL:[NSURL URLWithString:_model.preview] placeholderImage:nil];
    imageView.layer.cornerRadius = 30;
    imageView.layer.masksToBounds = YES;
    imageView.layer.borderColor = [[UIColor whiteColor] CGColor];
    imageView.layer.borderWidth = 1.0f;
    [headerView addSubview:imageView];
    
    UILabel *startSender = [[UILabel alloc] initWithFrame:CGRectMake(imageView.frame.size.width + 30, 25, 90, 15)];
    startSender.text = [NSString stringWithFormat:@"起送价 ￥%@",@"100"];
    startSender.font = [UIFont systemFontOfSize:15.0];
    startSender.textColor = [UIColor whiteColor];
    [headerView addSubview:startSender];
    
    UILabel *sender = [[UILabel alloc] initWithFrame:CGRectMake(startSender.frame.size.width + startSender.frame.origin.x +20, 25, 90, 15)];
    sender.text = [NSString stringWithFormat:@"配送价 ￥%@",@"200"];
    sender.font = [UIFont systemFontOfSize:15.0];
    sender.textColor = [UIColor whiteColor];
    [headerView addSubview:sender];
    
    UILabel *buyingInfo = [[UILabel alloc] initWithFrame:CGRectMake(startSender.frame.origin.x, sender.frame.size.height + sender.frame.origin.y + 5, AppScreenSize.width - startSender.frame.origin.x, 40)];
    buyingInfo.text = [NSString stringWithFormat:@"下单必读:友情提示:%@",@"ee"];
    buyingInfo.numberOfLines = 2;
    buyingInfo.lineBreakMode = NSLineBreakByWordWrapping;
    buyingInfo.font = [UIFont systemFontOfSize:15.0];
    buyingInfo.textColor = [UIColor whiteColor];
    [headerView addSubview:buyingInfo];
    
    UILabel *commityName = [[UILabel alloc] initWithFrame:CGRectMake(20, header.frame.size.height + 10, AppScreenSize.width, 20)];
    commityName.text = @"商品分类";
    [headerView addSubview:commityName];
    
    
}

#pragma mark- 手势点击

-(void)oneTapGesture:(UITapGestureRecognizer *)gusture
{
    
}

#pragma mark UICollectViewDelegate&DataSource


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader && indexPath.section == 0) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
        [self setHederView:headerView];
        return headerView;
    }else{
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionView" forIndexPath:indexPath];
        UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, AppScreenSize.width, 20)];
        
        header.backgroundColor = [UIColor grayColor];
        [headerView addSubview:header];
        
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(20, header.frame.size.height + 10, AppScreenSize.width, 20)];
        lable.text = @"精选商品";
        [headerView addSubview:lable];
        return headerView;
    }}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return _categeryArray.count;
    }else{
        return _commodityArray.count;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        static NSString * CellIdentifier = @"StoreCollectionViewCell";
        UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        UILabel *lable = [[UILabel alloc] init];
        lable.frame = CGRectMake(0, 0, cell.frame.size.width, 25);
        lable.text = _categeryArray[indexPath.row];
        lable.textAlignment = NSTextAlignmentCenter;
        lable.textColor = [UIColor grayColor];
        [cell.contentView addSubview:lable];
        return cell;

    }else{
        static NSString * CellIdentifier = @"FoodCollectionViewCell";
        FoodCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        [cell setData:_commodityArray[indexPath.row] withIndexPath:indexPath];
        [[cell.addBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            
        }];
        return cell;
    }
  
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake((AppScreenSize.width-40)/3, 25);
    }else{
        return CGSizeMake((AppScreenSize.width-40)/3, 180);
    }
    
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }else{
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }
    
}



//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

//header的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return CGSizeMake(AppScreenSize.width, 130);
    }else{
        return CGSizeMake(AppScreenSize.width, 50);
    }
    
}

@end
