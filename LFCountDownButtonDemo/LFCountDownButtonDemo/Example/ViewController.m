//
//  ViewController.m
//  LFCountDownButton
//
//  Created by 兰柳锋 on 2017/2/7.
//  Copyright © 2017年 柳锋兰. All rights reserved.
//

#import "ViewController.h"
#import "LFCountDownButton.h"

@interface ViewController ()

/**倒计时按钮*/
@property(nonatomic,strong) LFCountDownButton *countDownButton;
@property (weak, nonatomic) IBOutlet LFCountDownButton *countDownButtonXib;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
     self.title = @"LFCountDownButtonDemo";
    
    [self setupCountDownButtonPure];
    
}
#pragma mark - 纯代码

- (void)setupCountDownButtonPure{
   
    //标题
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 70, 150, 40)];
    titleLabel.text = @"Pure Code";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:14.0f];
    titleLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:titleLabel];
    
    //创建倒计时按钮
     self.countDownButton = [[LFCountDownButton alloc]init];
     self.countDownButton.frame = CGRectMake(10, 130, 150, 40);
    [self.countDownButton.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [self.countDownButton setTitle:@"Start CountDown" forState:UIControlStateNormal];
    [self.countDownButton setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.countDownButton];
    
    // 1. 倒计时按钮点击
    [self.countDownButton touchCountDownButtonHandler:^(LFCountDownButton *countDownButton, NSInteger tag) {
        
        countDownButton.enabled = NO;
        
        //1.1开始倒计时
        [countDownButton startCountDownWithSecond:10];
        
        //do something...
        
        //1.2 倒计时进行中
        [countDownButton countDownButtonChanging:^NSString *(LFCountDownButton *countDownButton, NSUInteger second) {
         
            NSString *title = [NSString stringWithFormat:@"%zd left",second];
            return title;
            
        }];
        
        //1.3 倒计时结束
        [countDownButton countDownButtonFinished:^NSString *(LFCountDownButton *countDownButton, NSUInteger second) {
         
            countDownButton.enabled = YES;
            return @"Obtain again";
            
        }];

    }];
 
}

#pragma mark - Xib

/** 
    1.拖拽button控件到xib
    2.修改button控件的的类，button type要设置成custom 否则会闪动
    3.设置IBAction方法
 
 */
- (IBAction)countDownButtonClickForXib:(id)sender {
   
     //要么拖拽方法的时候改变type(id改为LFCountDownButton类型)，要么自己转下
     self.countDownButtonXib = (LFCountDownButton*)sender;
     self.countDownButtonXib.enabled = NO;
    
    //1.1开始倒计时
    [ self.countDownButtonXib startCountDownWithSecond:10];
    
    //do something...
    
    //1.2 倒计时进行中
    [ self.countDownButtonXib countDownButtonChanging:^NSString *(LFCountDownButton *countDownButton, NSUInteger second) {
        
        NSString *title = [NSString stringWithFormat:@"%zd left",second];
        return title;
        
    }];
    
    //1.3 倒计时结束
    [ self.countDownButtonXib countDownButtonFinished:^NSString *(LFCountDownButton *countDownButton, NSUInteger second) {
        
        countDownButton.enabled = YES;
        return @"Obtain again";
    }];
  
}

#pragma mark - 停止倒计时

- (IBAction)stopCountDown:(id)sender {
    
    [self.countDownButton stopCountDown];
    [self.countDownButtonXib stopCountDown];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
