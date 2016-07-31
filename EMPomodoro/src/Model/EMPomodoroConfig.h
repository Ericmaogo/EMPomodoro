//
//  EMPomodoroConfig.h
//  EMPomodoro
//
//  Created by Ericmao on 16/7/18.
//  Copyright © 2016年 zhengya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMPomodoroConfig : NSObject <NSCoding>

@property (nonatomic, strong) NSNumber *potatoTime;
@property (nonatomic, strong) NSNumber *restTime;

@end
