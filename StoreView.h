//
//  StoreView.h
//  O2OProject
//
//  Created by Zhang on 2/3/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoreModel.h"

@interface StoreView : UIView<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) StoreModel *model;

@property (nonatomic, copy, readwrite) NSMutableArray *categeryArray;
@property (nonatomic, copy, readwrite) NSMutableArray *commodityArray;

@property (nonatomic, strong) UICollectionView *collectView;

-(void)oneTapGesture:(UITapGestureRecognizer *)gusture;

@end
