//
//  CQShufflingFigure.m
//  Scroller4Image
//
//  Created by chenq@kensence.com on 16/3/2.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "CQShufflingFigure.h"
#define WithFram4view self.frame.size.width
#define HeightFram4View self.frame.size.height

@interface CQShufflingFigure()<UIScrollViewDelegate>
@property (nonatomic ,strong)UIScrollView *Scroller;
@property (nonatomic ,strong)UIPageControl *PageControl;


@end



@implementation CQShufflingFigure


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _Timer = [[NSTimer alloc]init];
        _Duration = 2;
      
    }
    
    
    return self;
}

- (UIScrollView *)drawScroller
{
    
    if (_Scroller == nil) {
        
  
    
    _Scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,WithFram4view,HeightFram4View/4)];
    _Scroller.contentSize = CGSizeMake(WithFram4view *self.ImageCountArray.count, HeightFram4View/4);
    
    //是否整页滑动
    _Scroller.pagingEnabled = YES;
    
    //隐藏水平条
    _Scroller.showsHorizontalScrollIndicator = YES;
    _Scroller.showsVerticalScrollIndicator = YES;
    _Scroller.delegate = self;
    _Scroller.bounces = NO;
    
    //循环添加UIimageView
    for (int i = 0 ;i < self.ImageCountArray.count - 1; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(WithFram4view*i, 0, WithFram4view, HeightFram4View/4)];
        
        imageView.userInteractionEnabled = YES;
        imageView.image = self.ImageCountArray[i];
        
        imageView.tag = 1000+i;
        
        
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapAction:)];
        [imageView addGestureRecognizer:tap];
        [_Scroller addSubview:imageView];
        [self addSubview:self.Scroller];
    
    }
    }
    return _Scroller;
    

    
}
- (UIPageControl *)pageontrol
{
    if (_PageControl == nil) {
        _PageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(100, CGRectGetMaxY(_Scroller.frame) - 20, 50, 20)];
        _PageControl.numberOfPages = _ImageCountArray.count;
        
    }
    return _PageControl;
    
}

//手势事件
- (void)TapAction:(UITapGestureRecognizer *)tap
{
    NSUInteger integer = tap.view.tag - 1000;
    
    if (_delegate != nil &&[_delegate respondsToSelector:@selector(SelectedViewOfshufflingFigure:atIndex:)]) {
        [_delegate SelectedViewOfshufflingFigure:self atIndex:integer];
        
        
    }
}


- (void)DrawView
{
    [self addSubview:self.Scroller];
    [self addSubview:self.PageControl];
    
}


//赋值
- (void)setImageCountArray:(NSArray *)ImageCountArray
{
    [self.Timer invalidate];
    
    self.Timer = nil;
    
    if (_ImageCountArray != ImageCountArray) {
        _ImageCountArray = ImageCountArray;
        
    }
    [self DrawView];
    self.Timer = [NSTimer scheduledTimerWithTimeInterval:_Duration target:self selector:@selector(ImageScrollerAction:) userInfo:nil repeats:YES];
 
}

- (void)setDuration:(NSTimeInterval)Duration
{
    [self.Timer invalidate];
    self.Timer = nil;
    _Duration = Duration;
    self.Timer = [NSTimer scheduledTimerWithTimeInterval:_Duration target:self selector:@selector(ImageScrollerAction:) userInfo:nil repeats:YES];
    
}

//定时器事件
- (void)ImageScrollerAction:(id)sender
{
    self.CurrentIndex++;
    if (self.CurrentIndex == self.ImageCountArray.count) {
        self.CurrentIndex = 0;
        
    }
    
    self.PageControl.currentPage = self.CurrentIndex;
    [self.Scroller setContentOffset:CGPointMake(WithFram4view*self.CurrentIndex, 0) animated:YES];
    
    
    
}

//Scroller的代理事件
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    [self.Timer invalidate];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.Timer = nil;
    
    self.PageControl.currentPage = self.Scroller.contentOffset.x/WithFram4view;
    
    
    self.PageControl.currentPage = self.CurrentIndex;
    self.Timer = [NSTimer scheduledTimerWithTimeInterval:_Duration target:self selector:@selector(ImageScrollerAction:) userInfo:nil repeats:YES];
    
    
    
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
