//
//  LFCountDownButton.h
//  LFCountDownButton
//
//  Created by 兰柳锋 on 2017/2/7.
//  Copyright © 2017年 柳锋兰. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LFCountDownButton;

#pragma mark - BlockMethod

/** 倒计时进行中  Countdown in progress */
typedef NSString* (^countDownButtonChanging)(LFCountDownButton *countDownButton,NSUInteger second);
/** 倒计时结束    Countdown end */
typedef NSString* (^countDownButtonFinished)(LFCountDownButton *countDownButton,NSUInteger second);
/** 点击倒计时按钮 Click the countdown button */
typedef void (^touchedCountDownButtonHandler)(LFCountDownButton *countDownButton,NSInteger tag);

@interface LFCountDownButton : UIButton

#pragma mark - ClassMethod

/** 倒计时点击回调   Countdown click callback */
- (void)touchCountDownButtonHandler:(touchedCountDownButtonHandler)touchedCountDownButtonHandler;

/** 倒计时进行中回调 Countdown running in progress callback */
- (void)countDownButtonChanging:(countDownButtonChanging)countDownButtonChanging;

/** 倒计时结束回调   Countdown end callback */
- (void)countDownButtonFinished:(countDownButtonFinished)countDownButtonFinished;

/** 开始倒计时 Start countdown */
- (void)startCountDownWithSecond:(NSUInteger)second;

/** 停止倒计时 Stop countdown */
- (void)stopCountDown;


@end
