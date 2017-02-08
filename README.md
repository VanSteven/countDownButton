# countDownButton
countDownButton,子类化UIButton实现iOS倒计时按钮,常常用于注册等发送验证码的时候进行倒计时操作

countDownButton, subclassing UIButton implementation iOS countdown button, register with sending the verification code and countdown
## Demo
![Demo](LFCountDownButton.gif)

## Installation

### Installation with CocoaPods

    platform:ios,'7.0'
    target 'YourProjectName' do
    pod 'countDownButton'
    end

 	
### Manually

Copy countDownButton.h countDownButton.m in LFCountDownButton/ to your project.

## Usage
### Code
    
    @property(nonatomic,strong) LFCountDownButton *countDownButton;
    
    
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

    
###xib
    @property (weak, nonatomic) IBOutlet LFCountDownButton *countDownButtonXib;
    
    - (IBAction)countDownButtonClickForXib:(id)sender {
   
     //要么拖拽方法的时候改变type(id改为LFCountDownButton类型)，要么自己转下
     self.countDownButtonXib = (LFCountDownButton*)sender;
     self.countDownButtonXib.enabled = NO;
    
    //1.1开始倒计时
    [ self.countDownButtonXib startCountDownWithSecond:15];
    
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
}
## License

This code is distributed under the terms and conditions of the MIT license.






