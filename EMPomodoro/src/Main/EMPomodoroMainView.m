//
//  EMPomodoroMainView.m
//  EMPomodoro
//
//  Created by Ericmao on 16/3/19.
//  Copyright © 2016年 zhengya. All rights reserved.
//

#import "EMPomodoroMainView.h"
#import "EMTimeProgressView.h"
#import "EMTypeDefine.h"
#import "EMSoundPlayer.h"

#define ButtonToBottomMargin    100.0
#define ButtonHeight            45.0

@interface EMPomodoroMainView () <EMTimeProgressViewDelegate>

@property (nonatomic, strong) EMTimeProgressView *timeProgressView;
@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UIButton *stopButton;
@property (nonatomic, strong) UIButton *continueButton;
@property (nonatomic, strong) UIButton *giveUpButton;
@end

@implementation EMPomodoroMainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setPomodoroState:PomodoroState_init];
    }
    
    return self;
}

- (void)initSubviews
{
    self.backgroundColor = [UIColor blueColor];
    self.alpha = .4f;
    
    UIButton *menuButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, 80, 40)];
    [menuButton setTitle:@"Menu" forState:UIControlStateNormal];
    [menuButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(onMenuButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:menuButton];
    
    
    [self showTimeProgressView];
    [self showStartButton];
}

- (void)showTimeProgressView
{
    if (self.timeProgressView == nil) {
        CGFloat circleWidth = 250.0;
        CGFloat topMargin   = 100.0;
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        
        EMTimeProgressView *timeProgewssView = [[EMTimeProgressView alloc] initWithFrame:CGRectMake(0, 0, circleWidth, circleWidth)];
        CGPoint center = CGPointMake(screenWidth/2, topMargin + circleWidth/2);
        timeProgewssView.center = center;
        timeProgewssView.layer.cornerRadius = circleWidth/2;
        timeProgewssView.layer.masksToBounds = YES;
        self.timeProgressView = timeProgewssView;
        timeProgewssView.delegate = self;
        [self addSubview:timeProgewssView];
    }
}

- (void)showStartButton
{
    if (self.startButton == nil) {
        CGFloat screenWidth     = [UIScreen mainScreen].bounds.size.width;
        CGFloat screenHeight    = [UIScreen mainScreen].bounds.size.height;
        CGFloat buttonWidth     = 140;
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, buttonWidth, ButtonHeight)];
        CGPoint center = CGPointMake(screenWidth/2, screenHeight - ButtonToBottomMargin - ButtonHeight/2);
        button.center = center;
        button.tag = EMViewTag_Main_Start_Button;
        
        [button setTitle:@"开始关注" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(onButtonCliced:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:[UIColor redColor]];
        [button.layer setCornerRadius:ButtonHeight/2];
        button.alpha = 0.9f;
        
        self.startButton = button;
        [self addSubview:button];
    }
}

- (void)showStopButton
{
    if (self.stopButton == nil) {
        CGFloat screenWidth     = [UIScreen mainScreen].bounds.size.width;
        CGFloat screenHeight    = [UIScreen mainScreen].bounds.size.height;
        CGFloat buttonWidth     = 100;
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, buttonWidth, ButtonHeight)];
        CGPoint center = CGPointMake(screenWidth/2, screenHeight - ButtonToBottomMargin - ButtonHeight/2);
        button.center = center;
        button.tag = EMViewTag_Main_Stop_Button;
        
        [button setTitle:@"暂停" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(onButtonCliced:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:[UIColor clearColor]];
        [button.layer setBorderColor:[UIColor whiteColor].CGColor];
        [button.layer setBorderWidth:ButtonBorderLineWidth];
        [button.layer setCornerRadius:ButtonHeight/2];
        button.alpha = 0.9f;
        
        self.stopButton = button;
        [self addSubview:button];
    }
}

- (void)showContinueButton
{
    if (self.continueButton == nil) {
        CGFloat screenWidth     = [UIScreen mainScreen].bounds.size.width;
        CGFloat screenHeight    = [UIScreen mainScreen].bounds.size.height;
        CGFloat buttonWidth     = 140;
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, buttonWidth, ButtonHeight)];
        CGPoint center = CGPointMake(screenWidth/2, screenHeight - ButtonToBottomMargin - ButtonHeight/2);
        button.center = center;
        button.tag = EMViewTag_Main_Continue_Button;
        
        [button setTitle:@"继续" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(onButtonCliced:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:[UIColor greenColor]];
        [button.layer setCornerRadius:ButtonHeight/2];
        
        self.continueButton = button;
        [self addSubview:button];
    }
    
    if (self.giveUpButton == nil) {
        CGFloat screenWidth     = [UIScreen mainScreen].bounds.size.width;
        CGFloat screenHeight    = [UIScreen mainScreen].bounds.size.height;
        CGFloat buttonWidth     = 100;
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, buttonWidth, ButtonHeight)];
        CGPoint center = CGPointMake(screenWidth/2, screenHeight - ButtonToBottomMargin - ButtonHeight/2);
        button.center = center;
        button.tag = EMViewTag_Main_GiveUp_Button;
        
        [button setTitle:@"放弃" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(onButtonCliced:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:[UIColor clearColor]];
        [button.layer setBorderColor:[UIColor whiteColor].CGColor];
        [button.layer setBorderWidth:ButtonBorderLineWidth];
        [button.layer setCornerRadius:ButtonHeight/2];
        
        self.giveUpButton = button;
        [self addSubview:button];
    }
    
    
}

- (void)onButtonCliced:(UIButton *)button
{
    if (button.tag == EMViewTag_Main_Start_Button) {
        [self.timeProgressView startTimer];
        [self setPomodoroState:PomodoroState_Started];
    } if (button.tag == EMViewTag_Main_Stop_Button) {
        [self.timeProgressView stopTimer];
        [self setPomodoroState:PomodoroState_Stoped];
    } else if (button.tag == EMViewTag_Main_Continue_Button) {
        [self.timeProgressView startTimer];
        [self setPomodoroState:PomodoroState_Started];
    } else if (button.tag == EMViewTag_Main_GiveUp_Button) {
        [self setPomodoroState:PomodoroState_init];
        [self.timeProgressView resetTimer];
    }
}


- (void)onMenuButton:(id)button
{
    NSLog(@"onMenuButton");
}

- (void)setPomodoroState:(PomodoroState)state
{
   if (self.currentState == PomodoroState_init) {
        if (PomodoroState_Started == state) {
            self.currentState = PomodoroState_Started;
            [self showStopButton];
            self.stopButton.alpha = 0.0;
            
            [UIView animateWithDuration:.7 animations:^{
                self.startButton.frame = self.stopButton.frame;
                self.startButton.alpha = 0.2;
                
                self.stopButton.alpha = 1.0;
            } completion:^(BOOL finish){
                self.startButton.hidden = YES;
                self.stopButton.hidden = NO;
                
            }];
        }
    } else if (self.currentState == PomodoroState_Started) {
        if (PomodoroState_Stoped == state) {
            [self showContinueButton];
            self.currentState = PomodoroState_Stoped;
            
            self.continueButton.frame = self.stopButton.frame;
            self.giveUpButton.frame = self.stopButton.frame;
            
            CGRect continueButtonFrame = self.stopButton.frame;
            CGRect giveUpButtonFrame = self.stopButton.frame;
            continueButtonFrame.origin.x -= 60;
            giveUpButtonFrame.origin.x += 60;
            
            [UIView animateWithDuration:0.75 animations:^{
                self.stopButton.alpha = 0.2;
                self.continueButton.frame = continueButtonFrame;
                self.giveUpButton.frame = giveUpButtonFrame;
                self.continueButton.hidden = NO;
                self.giveUpButton.hidden = NO;
                
            } completion:^(BOOL finished){
                self.stopButton.hidden = YES;
            }];
        } else if (PomodoroState_init == state) {
            self.currentState = PomodoroState_init;
            
            CGFloat screenWidth     = [UIScreen mainScreen].bounds.size.width;
            CGFloat buttonWidth     = 140;
            
            self.startButton.frame = CGRectMake((screenWidth - buttonWidth)/2, self.startButton.frame.origin.y, buttonWidth, ButtonHeight);
            self.stopButton.hidden = YES;
            
            [UIView animateWithDuration:0.75 animations:^{
                self.startButton.alpha = 1;
                self.startButton.hidden = NO;
                self.continueButton.frame = self.stopButton.frame;
                self.giveUpButton.frame = self.stopButton.frame;
                
            } completion:^(BOOL finished){
                self.continueButton.hidden = YES;
                self.giveUpButton.hidden = YES;
            }];
        }
    } else if(self.currentState ==PomodoroState_Stoped) {
        if (PomodoroState_Started == state) {
            self.currentState = PomodoroState_Started;
            
            [UIView animateWithDuration:0.75 animations:^{
                self.stopButton.alpha = 1;
                self.stopButton.hidden = NO;
                self.continueButton.frame = self.stopButton.frame;
                self.giveUpButton.frame = self.stopButton.frame;
                
            } completion:^(BOOL finished){
                self.continueButton.hidden = YES;
                self.giveUpButton.hidden = YES;
            }];
            
        } else if (PomodoroState_init == state) {
            self.currentState = PomodoroState_init;
            
            CGFloat screenWidth     = [UIScreen mainScreen].bounds.size.width;
            CGFloat buttonWidth     = 140;
            
            self.startButton.frame = CGRectMake((screenWidth - buttonWidth)/2, self.startButton.frame.origin.y, buttonWidth, ButtonHeight);
            
            [UIView animateWithDuration:0.75 animations:^{
                self.startButton.alpha = 1;
                self.startButton.hidden = NO;
                self.continueButton.frame = self.stopButton.frame;
                self.giveUpButton.frame = self.stopButton.frame;
                
            } completion:^(BOOL finished){
                self.continueButton.hidden = YES;
                self.giveUpButton.hidden = YES;
            }];
        }
    } else if (PomodoroState_init == state) {
        self.currentState = PomodoroState_init;
        [self initSubviews];
    }
}

#pragma mark - EMTimeProgressViewDelegate
- (void)progressViewTimeComplete:(EMTimeProgressView *)progressView
{
    [self setPomodoroState:PomodoroState_init];
    [self.timeProgressView resetTimer];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"恭喜你又完成一个番茄钟"
                                                        message:@"休息一下吧"
                                                       delegate:self
                                              cancelButtonTitle:@"好的"
                                              otherButtonTitles:nil];
    [alertView show];
    [[EMSoundPlayer shareInstance] playSound];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [[EMSoundPlayer shareInstance] stopPlay];
}

@end
