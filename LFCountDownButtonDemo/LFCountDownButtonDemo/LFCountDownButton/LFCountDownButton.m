//
//  LFCountDownButton.m
//  LFCountDownButton version 1.0.0
//
//  Created by 兰柳锋 on 2017/2/7.
//  Copyright © 2017年 柳锋兰. All rights reserved.
//

#import "LFCountDownButton.h"

@interface LFCountDownButton ()

/** 倒计时秒数   Countdown seconds */
@property(nonatomic,assign) NSInteger second;
/** 倒计时总时间 Total countdown time */
@property(nonatomic,assign) NSUInteger totalSecond;
/** 定时器 timer */
@property(nonatomic,strong) NSTimer *timer;
/** 时间 timer*/
@property(nonatomic,strong) NSDate *startDate;

//Block

@property(nonatomic,copy) countDownButtonChanging countDownButtonChanging;

@property(nonatomic,copy) countDownButtonFinished countDownButtonFinished;

@property(nonatomic,copy) touchedCountDownButtonHandler touchedCountDownButtonHandler;


@end


@implementation LFCountDownButton

#pragma mark - Class方法

/** 倒计时点击回调 Countdown click callback */
- (void)touchCountDownButtonHandler:(touchedCountDownButtonHandler)touchedCountDownButtonHandler{

    _touchedCountDownButtonHandler = [touchedCountDownButtonHandler copy];
    
    [self addTarget:self action:@selector(touchedBegin:) forControlEvents:UIControlEventTouchUpInside];
}
/** 倒计时进行中 Countdown running in progress callback */
- (void)countDownButtonChanging:(countDownButtonChanging)countDownButtonChanging{
    
    _countDownButtonChanging = [countDownButtonChanging copy];
    
}
/** 倒计时结束 Countdown end callback */
- (void)countDownButtonFinished:(countDownButtonFinished)countDownButtonFinished{

    _countDownButtonFinished = [countDownButtonFinished copy];
    
}

/** 开始倒计时 Start countdown */
- (void)startCountDownWithSecond:(NSUInteger)second{
   
    _second      = second;
    _totalSecond = second;
    _timer       = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStart:) userInfo:nil repeats:YES];
    _startDate = [NSDate date];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
    
}
/** 停止倒计时 Stop countdown */
- (void)stopCountDown{
    
    if (_timer) {
        
        if ([_timer respondsToSelector:@selector(isValid)])
        {
            if ([_timer isValid])
            {
                [_timer invalidate];
                _second = _totalSecond;
                
                if (_countDownButtonFinished)
                {
                    [self setTitle:_countDownButtonFinished(self,_totalSecond)forState:UIControlStateNormal];
                    [self setTitle:_countDownButtonFinished(self,_totalSecond)forState:UIControlStateDisabled];
                    
                }
                else
                {
                    [self setTitle:@"Obtain Again" forState:UIControlStateNormal];
                    [self setTitle:@"Obtain Again" forState:UIControlStateDisabled];
                    
                }
            }
        }
    }

}

#pragma mark - Selector方法
/** 点击倒计时按钮 Click the countdown button */
- (void)touchedBegin:(LFCountDownButton*)sender{
    
    if (_touchedCountDownButtonHandler) {
        
        _touchedCountDownButtonHandler(sender,sender.tag);
    }
}
/** 定时器 timer*/
- (void)timerStart:(NSTimer *)theTimer {
    
    double deltaTime = [[NSDate date] timeIntervalSinceDate:_startDate];
    
    _second = _totalSecond - (NSInteger)(deltaTime+0.5) ;
    
    if (_second <= 0.0)
    {
        [self stopCountDown];
    }
    else
    {
        if (_countDownButtonChanging)
        {
            [self setTitle:_countDownButtonChanging(self,_second) forState:UIControlStateNormal];
            [self setTitle:_countDownButtonChanging(self,_second) forState:UIControlStateDisabled];
            
        }
        else
        {
             NSString *title = [NSString stringWithFormat:@"%zd left",_second];
            [self setTitle:title forState:UIControlStateNormal];
            [self setTitle:title forState:UIControlStateDisabled];
            
        }
    }

}

@end
