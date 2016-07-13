//
//  YPGroupBtnView.h
//  YPGroupButton
//
//  Created by cyp on 16/1/22.
//  Copyright © 2016年 cyp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YPGroupBtnView;

@protocol GroupButtonViewDelegate <NSObject>

- (void)GroupButtonView:(YPGroupBtnView*) view ClickButton:(UIButton*) button;

@end

@interface YPGroupBtnView : UIImageView

@property (nonatomic, assign) id <GroupButtonViewDelegate> delegate;

@property (nonatomic) BOOL iscanRepeCLick;

@property (nonatomic) BOOL showAnimation;

@property (nonatomic) BOOL clickShowAnimation;

@property (nonatomic,strong) UIColor *lineColor;

@property (nonatomic,strong)NSArray *dataArray;

@property (nonatomic,strong)NSMutableArray *btnArray;

@property (nonatomic)NSInteger selectIndex;


- (instancetype)initWithFrame:(CGRect)frame andDataArray:(NSArray*) dataArray;

- (instancetype)initWithFrame:(CGRect)frame andDataArray:(NSArray*) dataArray andGapWith:(CGFloat)gap;

- (void)setButtonBackgroundImage:(UIImage *)image forState:(UIControlState)state UI_APPEARANCE_SELECTOR;

- (void)setButtonTitle:(NSArray*) dataArray;

- (void)setButtonImage:(UIImage *)image forState:(UIControlState)state;


-(void)setButtonImage:(UIImage *)image forBtnIndex:(NSUInteger)index andStat:(UIControlState)state;

- (void)setButtonTitleClor:(UIColor *)color forState:(UIControlState)state;

- (void)setButtonTitleFont:(UIFont *)font;



@end
