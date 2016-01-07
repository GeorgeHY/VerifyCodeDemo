//
//  HYTimerButton.h
//  VerifyCodeDemo
//
//  Created by GE on 16/1/7.
//  Copyright © 2016年 hy. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol HYTimerButtonDelegate <NSObject>

- (void)buttonClicked;

@end


@interface HYTimerButton : UIButton



//@property (nonatomic, strong) NSString * buttonTitle;//按钮title
//
//@property (nonatomic, assign) NSInteger borderWidth ;//边框宽度
//
//@property (nonatomic, strong) UIColor * borderColor ;//边框颜色

@property (nonatomic, assign) id<HYTimerButtonDelegate> delegate;







- (instancetype)initWithFrame:(CGRect)frame
              andDurationTime:(NSInteger)duration;


@end
