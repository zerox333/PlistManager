//
//  main.m
//  PlistManager
//
//  Created by ding_yuanyi on 12-12-11.
//  Copyright (c) 2012年 zerox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlistManager.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        if (argc <= 1)
        {
            printf(" ------------------------------------------");
            printf("\n| How To Use:                              |\n");                         
            printf("| plistmanager [pathOfDictionaryPlistFile] |\n");
            printf(" ------------------------------------------\n");
        }
        else
        {
            NSFileManager *fm = [NSFileManager defaultManager];
            
            NSString *path = [NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding];
            BOOL isDirectory = NO;
            BOOL isExists = [fm fileExistsAtPath:path isDirectory:&isDirectory];
            
            if (isExists)
            {
                if (isDirectory)
                {
                    NSArray *subpathArray = [fm subpathsAtPath:path];
                    for (NSString *subpath in subpathArray)
                    {
                        @autoreleasepool
                        {
                            if ([[[subpath pathExtension] lowercaseString] isEqualToString:@"plist"])
                            {
                                [PlistManager keysArrayFromDictionaryPath:subpath writeToFile:YES writePath:nil];
                            }
                        }
                    }
                }
                else
                {
                    if ([[[path pathExtension] lowercaseString] isEqualToString:@"plist"])
                    {
                        [PlistManager keysArrayFromDictionaryPath:path writeToFile:YES writePath:nil];
                    }
                }
            }
        }
        
    }
    return 0;
}

