//
//  ViewController.m
//  Scroller4Image
//
//  Created by chenq@kensence.com on 16/3/2.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "ViewController.h"
#import "Image.h"
#import "CQShufflingFigure.h"
#define With4ViewFrame self.view.frame.size.width
#define Height4ViewFrame self.view.frame.size.height

@interface ViewController ()<ScrollerImageDelegate,UIScrollViewDelegate>
@property (nonatomic ,strong) UIScrollView * Scroller;
@property (nonatomic ,assign)NSInteger integer;
@property (nonatomic ,strong)NSTimer  *timer;
//时间间隔
@property (nonatomic ,assign)NSTimeInterval duration;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *imageArray = [[NSMutableArray alloc]initWithCapacity:10];
    for (int i = 6; i < 9; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
        [imageArray addObject:image];
        
    }
    
    
    CQShufflingFigure *CQview = [[CQShufflingFigure alloc]initWithFrame:CGRectMake(0, 0, With4ViewFrame, 200)];
    CQview.ImageCountArray = imageArray;
    CQview.backgroundColor = [UIColor cyanColor];
    
    [self.view addSubview:CQview];
  
    }

////
////    NSMutableArray *mutArray = [NSMutableArray arrayWithObjects:@[@"6.png",@"7.png",@"8.png"], nil];
////    Image *imageview = [[Image alloc]initWithFrame:CGRectMake(0, 0, With4ViewFrame, 200)];
////    imageview.imageArray = mutArray;
////    imageview.delegate = self;
////    
////    
////    [self.view addSubview:imageview];
////// 
//////   
//    [self DrawScrollerView];
//    
////
//}
//
//- (void)DrawScrollerView
//{
////    
//    _Scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, With4ViewFrame, 300)];
//    _Scroller.contentSize = CGSizeMake(With4ViewFrame*3, 300);
//    _Scroller.pagingEnabled = YES;
//    _Scroller.backgroundColor = [UIColor greenColor];
//
//    _Scroller.delegate = self;
//    _Scroller.pagingEnabled = YES;
//    
//    
//    
//    for (int i = 0; i <3; i ++) {
//        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake( With4ViewFrame*i,0, With4ViewFrame, 300)];
//        
//        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i+6]];
//        img = [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        image.image = img;
//        [_Scroller addSubview:image];
//     
//    }
//    [self.view addSubview:_Scroller];
//    
//   _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(ChangePage:) userInfo:self repeats:YES];
//    [_Scroller reloadInputViews];
//    
//
////    
////    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
////    UIImage *img = [UIImage imageNamed:@"img7.png"];
////    
////    image.backgroundColor = [UIColor cyanColor];
////    
////    
////    image.image = img;
////    
////    [self.view addSubview:image];
////
// 
//}
//
//- (void)ChangePage:(id)sender
//
//
//{
//    
//    self.integer++;
//    
//  
//    if (self.integer == 3) {
//        self.integer = 0;
//    }
//    
//    
//    
//    [_Scroller setContentOffset:CGPointMake(With4ViewFrame * self.integer, 0)];
//    
//    
//    
//    
//    
//}
//
//
//
//- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
//{
//    [_timer invalidate];
//    
//    if (_Scroller.contentOffset.x == With4ViewFrame*3) {
//        
//        [_Scroller setContentOffset:CGPointMake(0, 0) animated:YES];
//    
//    }
//    
//    
//    
//
//}
//
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{   [_timer invalidate];
//
//    
//    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(ChangePage:) userInfo:self repeats:YES];
// 
//}
//
////- (void)setDuration:(NSTimeInterval)duration
////{
////    [_timer invalidate];
////    self.timer = nil;
////    
////    self.duration = duration;
////    
////  _timer = [NSTimer scheduledTimerWithTimeInterval:_duration target:self selector:@selector(ChangePage:) userInfo:self repeats:YES];
////    
////}
//
- (void)ImageScrollerSelect:(Image *)Image atIndex:(NSUInteger)index;
{
    NSLog(@"%lu",(unsigned long)index);
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
