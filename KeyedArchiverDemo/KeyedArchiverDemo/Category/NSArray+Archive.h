//
//  NSArray+Archive.h
//  YunXiao
//
//  Created by MacPro on 5/15/15.
//  Copyright (c) 2015 YunXiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Archive)

+ (NSArray *)readFromPlistFile:(NSString *)filename;

- (BOOL)writeToPlistFile:(NSString *)filename;

@end
