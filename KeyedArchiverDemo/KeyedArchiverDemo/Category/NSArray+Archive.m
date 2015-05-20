//
//  NSArray+Archive.m
//  YunXiao
//
//  Created by MacPro on 5/15/15.
//  Copyright (c) 2015 YunXiao. All rights reserved.
//

#import "NSArray+Archive.h"

#define kGroupIdentifier @"group.com.yunxiao.app.YunXiao"

@implementation NSArray (Archive)

- (BOOL)writeToPlistFile:(NSString *)filename{
    // /Users/tan/Library/Developer/CoreSimulator/Devices/E40664EA-491E-446D-87BA-EF3AE66E4B2B/data/Containers/Data/PluginKitPlugin/E47CA663-C6C2-4B6F-A99E-0D1CEF130A4C/Documents/ShareExtensionNewTopicArray
//    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString * documentsDirectory = [paths objectAtIndex:0];
//    NSString * path = [documentsDirectory stringByAppendingPathComponent:filename];
    
    //FIXME: 需要传递对象指针
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:self];
    
    NSURL *containerURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:kGroupIdentifier];
    // file:///Users/tan/Library/Developer/CoreSimulator/Devices/E40664EA-491E-446D-87BA-EF3AE66E4B2B/data/Containers/Shared/AppGroup/DBB9932A-1E25-41BA-B2D0-9E601AC31B1D/
    NSString *path = containerURL.path;
    // /Users/tan/Library/Developer/CoreSimulator/Devices/E40664EA-491E-446D-87BA-EF3AE66E4B2B/data/Containers/Shared/AppGroup/DBB9932A-1E25-41BA-B2D0-9E601AC31B1D
    
    path = [path stringByAppendingString:[NSString stringWithFormat:@"/%@",filename]];
    // /private/var/mobile/Containers/Shared/AppGroup/6213ADAE-2CF6-4D2F-B646-DC57A4F9A3E4/ShareExtensionNewTopicArray
    
    // 写入前先删除file
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSError *error = nil;
        [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
    }
    BOOL didWriteSuccessfull = [data writeToFile:path atomically:YES];
    
    return didWriteSuccessfull;
}

+ (NSArray *)readFromPlistFile:(NSString *)filename{
//    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString * documentsDirectory = [paths objectAtIndex:0];
//    NSString * path = [documentsDirectory stringByAppendingPathComponent:filename];

    NSURL *containerURL = [[NSFileManager defaultManager]
                           containerURLForSecurityApplicationGroupIdentifier:kGroupIdentifier];
    NSString *path = containerURL.path;
    path = [path stringByAppendingString:[NSString stringWithFormat:@"/%@",filename]];
    NSData * data = [[NSData alloc] init];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        data = [NSData dataWithContentsOfFile:path];
    }
    
    id temp = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSLog(@"%@", ([temp isKindOfClass:[NSArray class]] ?@"YES":@"NO"));//sub is instance of its super class
    
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

@end
