//
//  EMPomodoroConfigManager.m
//  EMPomodoro
//
//  Created by Ericmao on 16/7/18.
//  Copyright © 2016年 zhengya. All rights reserved.
//

#import "EMPomodoroConfigManager.h"

@implementation EMPomodoroConfigManager

+ (id)shareInstance
{
    static EMPomodoroConfigManager *instance = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        instance = [[EMPomodoroConfigManager alloc] init];
    });
    
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self loadLocalConfig];
    }
    
    return self;
}

- (void)loadLocalConfig
{
    
}
@end
