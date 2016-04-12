//
//  NSString+JSON.h
//  O2OProject
//
//  Created by Zhang on 4/10/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSON)


+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary;
+(NSString *) jsonStringWithArray:(NSArray *)array;
+(NSString *) jsonStringWithString:(NSString *) strings;
+(NSString *) jsonStringWithObject:(id) object;

@end
