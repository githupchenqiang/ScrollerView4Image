//
//  ViewController.m
//  Scroller4Image
//
//  Created by chenq@kensence.com on 16/3/2.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "ViewController.h"
#import "Image.h"
#define With4ViewFrame self.view.frame.size.width
#define Height4ViewFrame self.view.frame.size.height
@interface ViewController ()<ScrollerImageDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSMutableArray *imageArray = [NSMutableArray array];
    for (int i = 1; i <= 4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
        [imageArray addObject:image];
      
    }
    
    Image *imageview = [[Image alloc]initWithFrame:CGRectMake(0, 0, With4ViewFrame, 200)];
    imageview.imageArray = imageArray;
    imageview.delegate = self;
    
    
    [self.view addSubview:imageview];
 
    
}

- (void)ImageScrollerSelect:(Image *)Image atIndex:(NSUInteger)index;
{
    NSLog(@"%lu",(unsigned long)index);
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
