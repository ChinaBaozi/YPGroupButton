//
//  YPGroupBtnView.m
//  Inroad
//
//  Created by cyp on 16/1/22.
//  Copyright © 2016年 cyp. All rights reserved.
//

#import "YPGroupBtnView.h"

#define YPDuration 0.2

@interface YPGroupBtnView ()
{
    UIButton *_btn;
    
    UIView *lineView;
    
}

@end

@implementation YPGroupBtnView

- (instancetype)initWithFrame:(CGRect)frame andDataArray:(NSArray*) dataArray{
    
    if(self=[super initWithFrame:frame]){
        
        for (int i=0; i<dataArray.count; i++) {
            
            self.userInteractionEnabled=YES;
            
            CGFloat btnWeight=frame.size.width/dataArray.count;
            
            UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
            [button setFrame:CGRectMake(i*btnWeight, 0, btnWeight, frame.size.height)];
            [button setBackgroundColor:[UIColor clearColor]];
            button.titleLabel.font = [UIFont systemFontOfSize:11];
            button.titleLabel.textAlignment=NSTextAlignmentCenter;
            button.titleLabel.numberOfLines=2;
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            button.tag=i+555;
            [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchDown];
            [self addSubview:button];
            
            [button setTitle:[dataArray objectAtIndex:i] forState:UIControlStateNormal];
            
            [self.btnArray addObject:button];
            if (i==0) {
                [button setSelected:YES];
                _btn=button;
            }
        }
        lineView=[[UIImageView alloc]initWithFrame:CGRectMake(15,frame.size.height-2, frame.size.width/dataArray.count-30, 2)];
        [lineView setBackgroundColor:[UIColor whiteColor]];
        lineView.userInteractionEnabled=NO;
        lineView.hidden=YES;
        [self addSubview:lineView];
        
    }
    
    return  self;
    
}





- (instancetype)initWithFrame:(CGRect)frame andDataArray:(NSArray*) dataArray andGapWith:(CGFloat)gap{
    
    if(self=[super initWithFrame:frame])
        
        for (int i=0; i<dataArray.count; i++) {
            
            self.userInteractionEnabled=YES;
            
            CGFloat btnWeight=frame.size.width/dataArray.count-gap;
            
            
            UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
            [button setFrame:CGRectMake(i*(btnWeight+gap), 0, btnWeight, frame.size.height)];
            [button setBackgroundColor:[UIColor clearColor]];
            button.titleLabel.font = [UIFont systemFontOfSize:11];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            //            [button setBackgroundImage:[UIImage imageNamed:@"whiltColor"] forState:UIControlStateNormal];
            //            [button setBackgroundImage:[UIImage ImageWithColor:[UIColor redColor]] forState:UIControlStateSelected];
            button.tag=i+555;
            [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchDown];
            [self addSubview:button];
            
            [button setTitle:[dataArray objectAtIndex:i] forState:UIControlStateNormal];
            
            [self.btnArray addObject:button];
            if (i==0) {
                [button setSelected:YES];
                _btn=button;
            }
        }
    
    return  self;
}

- (void)setShowAnimation:(BOOL)showAnimation{
    
    _showAnimation=showAnimation;
    _clickShowAnimation=showAnimation;

    lineView.hidden=!showAnimation;
    
}

- (void)clickButton:(UIButton *)button {
    if (self.iscanRepeCLick) {
        if (![_btn isEqual:button])
        {
            _selectIndex=button.tag-555;
            _btn.selected=NO;
            button.selected=YES;
            _btn=button;
            
            if (self.showAnimation&&self.clickShowAnimation) {
                [UIView animateWithDuration:YPDuration animations:^{
                    
                    CGRect lineFrame=lineView.frame;
                    lineFrame.origin.x=button.frame.origin.x+15;
                    lineView.frame=lineFrame;
                }];
            }
            
        }
        if ([self.delegate respondsToSelector:@selector(GroupButtonView:ClickButton:)] ){
            
            [self.delegate GroupButtonView:self ClickButton:button];
        }
        
    }else{
        
        if (![_btn isEqual:button])
        {
            _selectIndex=button.tag-555;
            _btn.selected=NO;
            button.selected=YES;
            _btn=button;
            if (self.showAnimation&&self.clickShowAnimation) {
                [UIView animateWithDuration:YPDuration animations:^{
                    
                    CGRect lineFrame=lineView.frame;
                    lineFrame.origin.x=button.frame.origin.x+15;
                    lineView.frame=lineFrame;
                }];
            }
            
            if ([self.delegate respondsToSelector:@selector(GroupButtonView:ClickButton:)] ){
                
                [self.delegate GroupButtonView:self ClickButton:button];
            }
        }
        
    }
    
}


- (NSMutableArray *)btnArray{
    
    if (_btnArray==nil) {
        _btnArray=[NSMutableArray array];
    }
    return _btnArray;
    
}


- (void)setButtonBackgroundImage:(UIImage *)image forState:(UIControlState)state{
    
    for (UIButton *button in self.btnArray) {
        [button setBackgroundImage:image forState:state];
    }
}
-(void)setButtonImage:(UIImage *)image forState:(UIControlState)state{
    
    for (UIButton *button in self.btnArray) {
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        [button setImage:image forState:state];
    }
    
}

-(void)setButtonTitleClor:(UIColor *)color forState:(UIControlState)state{
    
    for (UIButton *button in self.btnArray) {
        [button setTitleColor:color forState:state];
    }
}

-(void)setButtonTitleFont:(UIFont *)font{
    for (UIButton *button in self.btnArray) {
        [button.titleLabel setFont:font];
    }
    
}

-(void)setButtonImage:(UIImage *)image forBtnIndex:(NSUInteger)index andStat:(UIControlState)state{
    
    UIButton *button=[self.btnArray objectAtIndex:index];
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
    [button setImage:image forState:state];
    
}


- (void)setSelectIndex:(NSInteger)selectIndex{
    
    if(selectIndex>self.btnArray.count-1)
        return;
    
    _selectIndex=selectIndex;
    _btn.selected=NO;
    UIButton *button=[self.btnArray objectAtIndex:selectIndex];
    button.selected=YES;
    
    
    if (self.showAnimation) {
        [UIView animateWithDuration:YPDuration animations:^{
            
            CGRect lineFrame=lineView.frame;
            lineFrame.origin.x=button.frame.origin.x+15;
            lineView.frame=lineFrame;
        }];
    }
    _btn=button;
    
}
- (void)setButtonTitle:(NSArray *)dataArray{
    
    for (int i=0; i<dataArray.count; i++) {
        
        [[self.btnArray objectAtIndex:i] setTitle:[dataArray objectAtIndex:i] forState:UIControlStateNormal];
    }
}

- (void)setLineColor:(UIColor *)lineColor{

    _lineColor=lineColor;
    lineView.backgroundColor=lineColor;

}

- (void)setTintColor:(UIColor *)tintColor{
    
    [super setTintColor:tintColor];
    lineView.backgroundColor=tintColor;
    [self setButtonTitleClor:tintColor forState:UIControlStateNormal];

}
@end
