//
//  HYTimerButton.m
//  VerifyCodeDemo
//
//  Created by GE on 16/1/7.
//  Copyright © 2016年 hy. All rights reserved.
//

#import "HYTimerButton.h"

@interface HYTimerButton()

@property (nonatomic, assign) NSInteger tempDuration;

@property (nonatomic, assign) NSInteger durationTime;//倒计时时间

@property (nonatomic, assign) BOOL isClicked;

@end

@implementation HYTimerButton


- (void)initializeHYTimerButton
{
    [self addTarget:self action:@selector(sendCode:) forControlEvents:UIControlEventTouchUpInside];
}

//默认60秒
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _durationTime = 60;
        _tempDuration = 60;
        [self initializeHYTimerButton];
       
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
              andDurationTime:(NSInteger)duration{
    self = [super initWithFrame:frame];
    if (self) {
        _tempDuration = duration;
        _durationTime = duration;
        [self initializeHYTimerButton];
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _durationTime = 60;
        _tempDuration = 60;
        [self initializeHYTimerButton];
    }
    return self;
}


- (void)sendCode:(id)sender
{
    if (self.isClicked == YES) {
        return;
    }

    if ([self.delegate respondsToSelector:@selector(buttonClicked)]) {
        self.isClicked = YES;
        [self.delegate buttonClicked];
        
    }
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange:) userInfo:nil repeats:YES];
    [timer fire];
    
}

- (void)timeChange:(NSTimer *)timer
{

    self.durationTime --;
    [self setTitle:[NSString stringWithFormat:@"%d秒",self.durationTime] forState:UIControlStateNormal];
    if (self.durationTime == 0) {
        [timer invalidate];
        [self setTitle:@"重新发送" forState:UIControlStateNormal];
        self.durationTime = self.tempDuration;
        self.isClicked = NO;
        
    }
}

@end
