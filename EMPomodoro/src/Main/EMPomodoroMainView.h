//
//  EMPomodoroMainView.h
//  EMPomodoro
//
//  Created by Ericmao on 16/3/19.
//  Copyright © 2016年 zhengya. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PomodoroState) {
    PomodoroState_Undefine,
    PomodoroState_init,
    PomodoroState_Started,
    PomodoroState_Stoped,
    PomodoroState_GiveUped
};

@class EMPomodoroMainView;

@protocol EMPomodoroMainViewDelegate <NSObject>

- (void)onPomodoroStart:(EMPomodoroMainView *)pomodoroMainView;
- (void)onPomodoroStop:(EMPomodoroMainView *)pomodoroMainView;
- (void)onPomodoroContinue:(EMPomodoroMainView *)pomodoroMainView;
- (void)onPomodoroGiveUp:(EMPomodoroMainView *)pomodoroMainView;

@end

@interface EMPomodoroMainView : UIView
@property (nonatomic, assign) PomodoroState currentState;

- (void)setPomodoroState:(PomodoroState)state;
@end
