//
//  ViewController.m
//  VerifyCodeDemo
//
//  Created by 韩扬 on 15/10/7.
//  Copyright © 2015年 hy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UIButton * btn;

@end

static NSInteger timeOut = 10;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 100, 200, 50)];
    self.btn.backgroundColor = [UIColor redColor];
    [self.btn setTitle:@"发送验证码" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(sendCode:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    
}

- (void)sendCode:(UIButton *)btn
{
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange:) userInfo:nil repeats:YES];
    [timer fire];
    
}

- (void)timeChange:(NSTimer *)timer
{
    timeOut --;
    [self.btn setTitle:[NSString stringWithFormat:@"%d秒",timeOut] forState:UIControlStateNormal];
    if (timeOut == 0) {
        [timer invalidate];
        [self.btn setTitle:@"重新发送" forState:UIControlStateNormal];
        timeOut = 10;
        
    }
}

@end
