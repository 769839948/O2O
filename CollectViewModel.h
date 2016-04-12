//
//  CollectViewModel.h
//  O2OProject
//
//  Created by Zhang on 1/31/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "RequestViewModel.h"

@interface CollectViewModel : RequestViewModel

-(RACSignal *)collectRequest:(NSString *)string;

@end
