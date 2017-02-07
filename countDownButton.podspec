Pod::Spec.new do |s|
    s.name         = 'countDownButton'
    s.version      = '1.0.0'
    s.summary      = 'An easy way to use countDown button,solving problem for into the background of the countdown'
    s.homepage     = 'https://github.com/iOS-lancelot/countDownButton'
    s.license      = 'MIT'
    s.authors      = {'lanliufeng' => '445816317@qq.com'}
    s.platform     = :ios, '7.0'
    s.source       = {:git => 'https://github.com/iOS-lancelot/countDownButton.git', :tag => s.version}
    s.source_files = 'LFCountDownButtonDemo/LFCountDownButtonDemo/LFCountDownButton/**/*.{h,m}'
    s.requires_arc = true
end
