//
//  PlistManager.h
//  PlistManager
//
//  Created by ding_yuanyi on 12-12-11.
//  Copyright (c) 2012年 zerox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlistManager : NSObject

/** 由字典获取键数组
 @param dictionaryPath 字典plist路径
 @param isWrite 是否将数组写入文件
 @param writePath 数组写入路径（*预留，后续扩展）
 @return 键数组
 */
+ (NSArray *)keysArrayFromDictionaryPath:(NSString *)dictionaryPath
                             writeToFile:(BOOL)isWrite
                               writePath:(NSString *)writePath;

@end
