//
//  NSMutableArray+KeyedArchive.h
//  YunXiao
//
//  Created by MacPro on 5/20/15.
//  Copyright (c) 2015 YunXiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (KeyedArchive)

+ (BOOL)removePlistFile:(NSString *)filename;
+ (NSArray *)readFromPlistFile:(NSString *)filename;

- (BOOL)writeToPlistFile:(NSString *)filename;

@end
