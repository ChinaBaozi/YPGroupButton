//
//  ViewController.m
//  YPGroupButton
//
//  Created by roadPro on 16/7/13.
//  Copyright © 2016年 YPGroupButton. All rights reserved.
//

/**
 *  屏幕高度，宽度
 */
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define BLUE_COLOR   [UIColor colorWithRed:82/255.0 green:146/255.0 blue:174/255.0 alpha:1]

#import "ViewController.h"
#import "YPGroupBtnView.h"

@interface ViewController ()<GroupButtonViewDelegate,UIScrollViewDelegate>{

    UIScrollView *_mainScroll;

}

@property(nonatomic,strong) YPGroupBtnView *buttonView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    YPGroupBtnView *buttonView = [[YPGroupBtnView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 40) andDataArray:@[@"个人资料",@"个人简介",@"工作经历"]];
    buttonView.delegate = self;
    buttonView.showAnimation = YES;
    buttonView.clickShowAnimation = NO;
    buttonView.tintColor = BLUE_COLOR;
    buttonView.lineColor = BLUE_COLOR;
    [buttonView setButtonTitleFont:[UIFont boldSystemFontOfSize:14]];
    self.buttonView = buttonView;
    [self.view addSubview:buttonView];
    
    
    UIScrollView *mainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, buttonView.frame.size.height+64+5, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - buttonView.frame.size.height- 5)];
    mainScroll.contentSize = CGSizeMake(SCREEN_WIDTH * 4, mainScroll.frame.size.height);
    mainScroll.bounces = NO;
    mainScroll.delegate = self;
    mainScroll.pagingEnabled = YES;
    mainScroll.showsHorizontalScrollIndicator=NO;
    mainScroll.backgroundColor = [UIColor whiteColor];
    _mainScroll = mainScroll;
    [self.view addSubview:mainScroll];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    
    UILabel *label=[[UILabel alloc]initWithFrame:mainScroll.bounds];
    label.font=[UIFont boldSystemFontOfSize:18];
    label.textAlignment=NSTextAlignmentCenter;
    label.text=@"个人资料";
    label.textColor=BLUE_COLOR;
    [mainScroll addSubview:label];
    
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(mainScroll.frame.size.width, 0, mainScroll.frame.size.width, mainScroll.frame.size.height)];
    label2.font=[UIFont boldSystemFontOfSize:18];
    label2.textAlignment=NSTextAlignmentCenter;
    label2.text=@"个人简介";
    label2.textColor=BLUE_COLOR;
    [mainScroll addSubview:label2];
    
    
    UILabel *label3=[[UILabel alloc]initWithFrame:CGRectMake(mainScroll.frame.size.width*2, 0, mainScroll.frame.size.width, mainScroll.frame.size.height)];
    label3.font=[UIFont boldSystemFontOfSize:18];
    label3.textAlignment=NSTextAlignmentCenter;
    label3.text=@"工作经历";
    label3.textColor=BLUE_COLOR;
    [mainScroll addSubview:label3];

    
    
    
}
#pragma mark --GroupButtonViewDelegate
- (void)GroupButtonView:(YPGroupBtnView *)view ClickButton:(UIButton *)button{
    
    NSInteger page=self.buttonView.selectIndex;
    CGFloat offsetX = page * SCREEN_WIDTH;
    CGPoint offset = CGPointMake(offsetX, 0);
    
    [_mainScroll setContentOffset:offset animated:YES];
    
    
}
#pragma mark - UIScrollViewDelegate
/**
 *  当scrollView正在滚动就会调用
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if (scrollView==_mainScroll) {
        // 根据scrollView的滚动位置决定pageControl显示第几页
        CGFloat scrollW = scrollView.frame.size.width;
        int page = (scrollView.contentOffset.x+0.5*scrollW)/ scrollW;
        self.buttonView.selectIndex=page;
    }
    
}

@end
