# YPGroupButton
选项卡式的按钮组，带横线动画效果

#使用方式简单
    YPGroupBtnView *buttonView = [[YPGroupBtnView alloc]initWithFrame:CGRectMake(0, 64, [[UIScreen mainScreen] bounds].size.width, 40) andDataArray:@[@"个人资料",@"个人简介",@"工作经历"]];
    buttonView.delegate = self;
    buttonView.showAnimation = YES;
    buttonView.clickShowAnimation = NO;
    buttonView.tintColor = [UIColor blueColor];
    buttonView.lineColor = [UIColor blueColor];
    [buttonView setButtonTitleFont:[UIFont boldSystemFontOfSize:14]];
    self.buttonView = buttonView;
    [self.view addSubview:buttonView];

##效果图如下：
![](http://upload-images.jianshu.io/upload_images/1617728-8747cd3ccdc26c61.gif?imageMogr2/auto-orient/strip)  
