//
//  EMTimeProgressView.m
//  EMPomodoro
//
//  Created by Ericmao on 16/3/19.
//  Copyright © 2016年 zhengya. All rights reserved.
//

#import "EMTimeProgressView.h"

#define EMTimerLableFontSize    55.0

@interface EMTimeProgressView()

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) NSInteger minutesLeft;
@property (nonatomic, assign) NSInteger secondsLeft;
@end

@implementation EMTimeProgressView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        self.alpha = 0.4;
        
        self.minutesLeft = 0;
        self.secondsLeft = 10;
        
        [self setUpSubViews];
    }
    return self;
}

- (void)setUpSubViews
{
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, EMTimerLableFontSize)];
    timeLabel.center = self.center;
    [timeLabel setFont:[UIFont fontWithName:@"STHeitiSC-Light" size:EMTimerLableFontSize]];
    [timeLabel setTextAlignment:NSTextAlignmentCenter];
    [timeLabel setTextColor:[UIColor whiteColor]];
    [self addSubview:timeLabel];
    self.timeLabel = timeLabel;
    [self updateTimeLable];
}

- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}
- (void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeChanged:) userInfo:nil repeats:YES];
    [self.timer fire];
}

- (void)resetTimer
{
    self.minutesLeft = 25;
    self.secondsLeft = 0;
    
    [self updateTimeLable];
}

- (void)timeChanged:(id)sender
{
    NSLog(@"timeChanged");
    if (self.minutesLeft == 0 && self.secondsLeft == 0) {
        return;
    }
    
    if (self.secondsLeft == 0) {
        self.secondsLeft = 59;
        self.minutesLeft--;
    } else {
        self.secondsLeft--;
    }
    
    if (self.minutesLeft == 0 && self.secondsLeft == 0) {
        [self.timer invalidate];
        self.timer = nil;
        if (self.delegate && [self.delegate respondsToSelector:@selector(progressViewTimeComplete:)]) {
            [self.delegate progressViewTimeComplete:self];
        }
    }
    
    [self updateTimeLable];
}

- (void)updateTimeLable
{
    NSString *secondStr = self.secondsLeft>9?[NSString stringWithFormat:@"%ld", self.secondsLeft]:[NSString stringWithFormat:@"0%ld", self.secondsLeft];
    NSString *minusStr = self.minutesLeft>9?[NSString stringWithFormat:@"%ld", self.minutesLeft]:[NSString stringWithFormat:@"0%ld", self.minutesLeft];
    self.timeLabel.text = [NSString stringWithFormat:@"%@:%@", minusStr, secondStr];
}

- (void)dealloc
{
    [self.timer invalidate];
    self.timer = nil;
}
@end
