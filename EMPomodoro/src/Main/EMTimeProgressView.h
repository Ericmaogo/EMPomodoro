//
//  EMTimeProgressView.h
//  EMPomodoro
//
//  Created by Ericmao on 16/3/19.
//  Copyright © 2016年 zhengya. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EMTimeProgressView;

@protocol EMTimeProgressViewDelegate <NSObject>

- (void)progressViewTimeComplete:(EMTimeProgressView *)progressView;

@end

@interface EMTimeProgressView : UIView

@property (nonatomic, weak) id<EMTimeProgressViewDelegate> delegate;

- (void)stopTimer;
- (void)startTimer;
- (void)resetTimer;
@end
