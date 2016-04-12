//
//  ProfilesViewModel.h
//  O2OProject
//
//  Created by Zhang on 1/28/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "RequestViewModel.h"
#import "UserProfile.h"


@interface ProfilesViewModel :RequestViewModel

@property (nonatomic, copy) NSMutableArray *tableArray;

@property (nonatomic, copy) NSMutableArray *imageArray;

-(UserProfile *)userProfile;

-(RACSignal *)requestModel;

@end
