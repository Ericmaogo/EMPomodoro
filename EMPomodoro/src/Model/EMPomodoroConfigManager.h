//
//  EMPomodoroConfigManager.h
//  EMPomodoro
//
//  Created by Ericmao on 16/7/18.
//  Copyright © 2016年 zhengya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EMPomodoroConfig.h"

@interface EMPomodoroConfigManager : NSObject

@property (nonatomic, strong) EMPomodoroConfig *pomodoroConfig;

+ (id)shareInstance;

@end
