//
//  Image.m
//  Scroller4Image
//
//  Created by chenq@kensence.com on 16/3/2.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "Image.h"
#define ViewFrame4With self.frame.size.width
#define ViewFrame4Height self.frame.size.height


@interface Image()<UIScrollViewDelegate>
@property (nonatomic ,strong)UIScrollView *scrollerView;
@property (nonatomic ,strong)UIPageControl *pageControl;
@property (nonatomic ,strong)NSTimer  *timer;


@end


@implementation Image

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self ) {
        _timer = [[NSTimer alloc]init];
        
        _duration = 2;
        
        
    }
    return self;
   
}


- (UIScrollView *)scrollerView
{
    
    if (_scrollerView == nil) {
        _scrollerView = [[UIScrollView alloc]initWithFrame:self.frame];
        
    }
    
    _scrollerView.pagingEnabled = YES;
    _scrollerView.showsHorizontalScrollIndicator = NO;
    _scrollerView.showsVerticalScrollIndicator = NO;
    _scrollerView.delegate = self;
    _scrollerView.bounces = NO;
    _scrollerView.contentSize = CGSizeMake(ViewFrame4With*self.imageArray.count, ViewFrame4Height);
    
    for (int i = 0; i < self.imageArray.count - 1; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(ViewFrame4With*i, 0, ViewFrame4With, ViewFrame4Height)];
        imageView.userInteractionEnabled = YES;
        imageView.image = self.imageArray[i];
        
        //添加手势
        imageView.tag = 1000+i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [imageView addGestureRecognizer:tap];
        [_scrollerView addSubview:imageView];
     
    }
 
    return _scrollerView;
    
}

//手势事件
- (void)tapAction:(UITapGestureRecognizer *)tap
{
    NSUInteger index = tap.view.tag - 1000;
    if (_delegate != nil && [_delegate respondsToSelector:@selector(ImageScrollerSelect:atIndex:)] ) {
        [_delegate ImageScrollerSelect:self atIndex:index];
        
    }
    
}



//scroller的代理事件
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //开始拖动，timer暂停
    [_timer invalidate];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.timer = nil;
    
    _pageControl.currentPage = self.scrollerView.contentOffset.x/self.frame.size.width;
    _currentIndex = self.pageControl.currentPage;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:self.duration target:self selector:@selector(ImageScrollerTimer:) userInfo:self repeats:YES];
 
}


//定时器的事件
- (void)ImageScrollerTimer:(id)sender
{
    self.currentIndex ++;
    if (self.currentIndex == self.imageArray.count) {
        self.currentIndex = 0;
        
    }
    
    self.pageControl.currentPage = self.currentIndex;
    [self.scrollerView setContentOffset:CGPointMake(ViewFrame4With*self.currentIndex, 0)];

}


//赋值方法
- (void)setImageArray:(NSArray *)imageArray
{
    [self.timer invalidate];
    self.timer = nil;
    
    if ( _imageArray != imageArray) {
        _imageArray = imageArray;
        
    }
    
    [self drawView];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.duration target:self selector:@selector(ImageScrollerTimer:) userInfo:self repeats:YES];
 
}



-(void)setDuration:(NSTimeInterval)duration
{
    
    [self.timer invalidate];
    self.timer = nil;
    _duration = duration;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:_duration target:self selector:@selector(ImageScrollerTimer:) userInfo:self repeats:YES];
    
    
}





- (void)drawView
{
    //将绘制好的视图放在父视图上
    [self addSubview:_scrollerView];
    [self addSubview:_pageControl];
    
}









/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
