//
//  EMPomodoroConfig.m
//  EMPomodoro
//
//  Created by Ericmao on 16/7/18.
//  Copyright © 2016年 zhengya. All rights reserved.
//

#import "EMPomodoroConfig.h"

@implementation EMPomodoroConfig

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self) {
        self.potatoTime     = [decoder decodeObjectForKey:@"potatoTime"];
        self.restTime       = [decoder decodeObjectForKey:@"restTime"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.potatoTime forKey:@"potatoTime"];
    [coder encodeObject:self.restTime forKey:@"restTime"];
}

@end
