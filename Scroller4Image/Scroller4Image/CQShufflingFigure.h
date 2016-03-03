//
//  CQShufflingFigure.h
//  Scroller4Image
//
//  Created by chenq@kensence.com on 16/3/2.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//


#import <UIKit/UIKit.h>

@class CQShufflingFigure;

@protocol CQShufflingFigureDelegate<NSObject>

@optional

- (void)SelectedViewOfshufflingFigure:(CQShufflingFigure *)Image atIndex:(NSInteger)index;


@end

@interface CQShufflingFigure : UIView

//图片的个数
@property(nonatomic,strong)NSArray *ImageCountArray;


 //定义定时器的全局变量
@property(nonatomic,strong)NSTimer *Timer;



//当前的下标
@property(nonatomic,assign)NSUInteger CurrentIndex;

//时间间隔
@property(nonatomic,assign)NSTimeInterval Duration;


//代理方法
@property(nonatomic,assign)id<CQShufflingFigureDelegate>delegate;




@end
