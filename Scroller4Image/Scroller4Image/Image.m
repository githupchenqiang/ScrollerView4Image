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






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
