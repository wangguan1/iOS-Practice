//
//  NSMutableArray+KeyedArchive.m
//  YunXiao
//
//  Created by MacPro on 5/20/15.
//  Copyright (c) 2015 YunXiao. All rights reserved.
//

#import "NSMutableArray+KeyedArchive.h"

#define kGroupIdentifier @"group.com.yunxiao.app.YunXiao" // group ID

@implementation NSMutableArray (KeyedArchive)

- (BOOL)writeToPlistFile:(NSString *)filename{
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:self];
    
    NSURL *containerURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:kGroupIdentifier];
    NSString *path = containerURL.path;
    
    path = [path stringByAppendingString:[NSString stringWithFormat:@"/%@",filename]];
    
    // 写入前先删除file
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSError *error = nil;
        [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
    }
    BOOL didWriteSuccessfull = [data writeToFile:path atomically:YES];
    
    return didWriteSuccessfull;
}

+ (NSArray *)readFromPlistFile:(NSString *)filename{
    NSURL *containerURL = [[NSFileManager defaultManager]
                           containerURLForSecurityApplicationGroupIdentifier:kGroupIdentifier];
    NSString *path = containerURL.path;
    path = [path stringByAppendingString:[NSString stringWithFormat:@"/%@",filename]];
    NSData * data = [[NSData alloc] init];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        data = [NSData dataWithContentsOfFile:path];
    }
    
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

+ (BOOL)removePlistFile:(NSString *)filename{
    NSURL *containerURL = [[NSFileManager defaultManager]
                           containerURLForSecurityApplicationGroupIdentifier:kGroupIdentifier];
    NSString *path = containerURL.path;
    path = [path stringByAppendingString:[NSString stringWithFormat:@"/%@",filename]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSError *error = nil;
        return [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
    }
    
    return NO;
}

@end
