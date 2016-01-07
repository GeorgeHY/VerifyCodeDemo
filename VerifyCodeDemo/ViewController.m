//
//  ViewController.m
//  VerifyCodeDemo
//
//  Created by 韩扬 on 15/10/7.
//  Copyright © 2015年 hy. All rights reserved.
//

#import "ViewController.h"
#import "HYTimerButton.h"

@interface ViewController ()<HYTimerButtonDelegate>

@property (nonatomic,strong) HYTimerButton * btn;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];

    
}

- (void)createUI
{

    
//    self.btn = [[HYTimerButton alloc]initWithFrame:CGRectMake(50, 100, 200, 50) andDurationTime:6];
    self.btn = [[HYTimerButton alloc]initWithFrame:CGRectMake(50, 100, 200, 50) ];
    self.btn.backgroundColor = [UIColor whiteColor];
    [self.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btn setTitle:@"发送验证码" forState:UIControlStateNormal];
    self.btn.layer.borderWidth = 1;
    self.btn.layer.borderColor = [[UIColor redColor]CGColor];
    self.btn.delegate = self;
    [self.view addSubview:self.btn];
}


#pragma mark - HYTimerButtonDelegate

- (void)buttonClicked
{
    NSLog(@"你好");
}

@end
