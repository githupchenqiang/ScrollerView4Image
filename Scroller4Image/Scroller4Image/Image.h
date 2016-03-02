//
//  Image.h
//  Scroller4Image
//
//  Created by chenq@kensence.com on 16/3/2.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Image;

@protocol ScrollerImageDelegate<NSObject>

@required

//代理方法
- (void)ImageScrollerSelect:(Image *)Image atIndex:(NSUInteger)index;

@end



@interface Image : UIView
//图片数组
@property (nonatomic ,strong)NSArray *imageArray;

//时间间隔
@property (nonatomic ,assign)NSTimeInterval duration;

//当前下标
@property (nonatomic ,assign)NSInteger currentIndex;

@property (nonatomic ,assign)id<ScrollerImageDelegate>delegate;









@end
