//
//  UIViewController+LeftItem.m
//  O2OProject
//
//  Created by Zhang on 1/31/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "UIViewController+LeftItem.h"

@implementation UIViewController (LeftItem)

-(UIBarButtonItem *)setLeftItem
{
    UIBarButtonItem *leftBt = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(leftBarPress:)];
    return leftBt;
}
-(void)leftBarPress:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
