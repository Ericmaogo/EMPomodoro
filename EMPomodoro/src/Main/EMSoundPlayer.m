//
//  EMSoundPlayer.m
//  EMPomodoro
//
//  Created by Ericmao on 16/7/18.
//  Copyright © 2016年 zhengya. All rights reserved.
//

#import "EMSoundPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface EMSoundPlayer()

@property (nonatomic, strong) AVAudioPlayer *soundPlayer;

@end

@implementation EMSoundPlayer

+ (id)shareInstance
{
    static EMSoundPlayer *instance = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        instance = [[EMSoundPlayer alloc] init];
    });
    
    return instance;
}

- (void)playSound
{
    NSURL *soundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"yellow" ofType:@"mp3"]];
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
    player.numberOfLoops = 3;
    self.soundPlayer = player;
    
    [player play];
}

- (void)stopPlay
{
    [self.soundPlayer stop];
}

@end
