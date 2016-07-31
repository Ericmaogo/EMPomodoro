//
//  ViewController.m
//  EMPomodoro
//
//  Created by Ericmao on 16/3/19.
//  Copyright © 2016年 zhengya. All rights reserved.
//

#import "ViewController.h"
#import "EMPomodoroMainView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadMainView];
}

- (void)loadMainView
{
    EMPomodoroMainView *mainView = [[EMPomodoroMainView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:mainView];
}


//改回来

@end
