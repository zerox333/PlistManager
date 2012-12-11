//
//  PlistManager.m
//  PlistManager
//
//  Created by ding_yuanyi on 12-12-11.
//  Copyright (c) 2012年 zerox. All rights reserved.
//

#import "PlistManager.h"

@interface PlistManager ()

+ (NSArray *)sortArrary:(NSArray *)arrayUnsorted;

@end


@implementation PlistManager

+ (NSArray *)keysArrayFromDictionaryPath:(NSString *)dictionaryPath
                             writeToFile:(BOOL)isWrite
                               writePath:(NSString *)writePath
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:dictionaryPath];
    NSArray *keysArray = [PlistManager sortArrary:[dictionary allKeys]];
    if (isWrite)
    {
        NSString *pathToWrite = [writePath length] ? writePath : [[dictionaryPath stringByDeletingPathExtension] stringByAppendingString:@"_keys.plist"];
        
        [keysArray writeToFile:pathToWrite atomically:YES];
    }
    return keysArray;
}

+ (NSArray *)sortArrary:(NSArray *)arrayUnsorted
{
    NSArray *sorter = [arrayUnsorted sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    return sorter;
}

@end
