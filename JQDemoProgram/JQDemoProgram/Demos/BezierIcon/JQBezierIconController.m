//
//  JQBezierIconController.m
//  JQDemoProgram
//
//  Created by 宋佳强 on 15/9/16.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import "JQBezierIconController.h"
#import "UIImage+Icon.h"

@interface JQBezierIconController ()


@end

@implementation JQBezierIconController

#pragma mark - lazy



#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // nav
    self.navigationItem.title = @"贝塞尔图标";
    
    
    [self setupView];
    
    [self drawStarSpace];
    
}


#pragma mark - delegate




#pragma mark - listener



#pragma mark - ui create
- (void)setupView{

    NSArray *icons = @[[UIImage icon_plus], [UIImage icon_ring], [UIImage icon_dot]];
    
    CGFloat startX = 10;
    CGFloat startY = 10;
    CGSize iconSize = {12, 12};
    CGFloat margin = 20;
    
    for (int i=0; i<icons.count; i++) {
        UIImage *icon = icons[i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(startX, startY+(iconSize.height + margin)*i, iconSize.width, iconSize.height)];
        imageView.image = icon;
        
        [self.contentView addSubview:imageView];
        
    }
    
    
    
    
}

- (void)drawStarSpace{
    NSArray *icons = @[[UIImage icon_plus], [UIImage icon_ring], [UIImage icon_dot]];
    
    
    CGSize canvaSize = CGSizeMake(300, 300);
    
    UIGraphicsBeginImageContextWithOptions(canvaSize, NO, 0);

    int squareW = 40;
    CGFloat startX = -squareW;
    CGFloat startY = 0;
    
    while (startY < canvaSize.height) {
        while (startX < canvaSize.width) {
            
            CGFloat randomLength = arc4random_uniform(squareW+1);
            
            startX += (randomLength+squareW);
            CGFloat tempY = arc4random_uniform(squareW+1)+startY;

            UIImage *icon = icons[rand()%icons.count];
            [icon drawAtPoint:CGPointMake(startX, tempY)];
//            startX += margin;
            NSLog(@"%.2f - %.2f",startX, tempY);
        }
        CGFloat randomY = arc4random_uniform(squareW+1);
        startY += (randomY+squareW);
        startX = -squareW;
    }

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, canvaSize.width, canvaSize.height)];
    imageView.image = image;
    imageView.backgroundColor = [UIColor colorWithRed:0.36 green:0.43 blue:0.7 alpha:1];
    
    [self.contentView addSubview:imageView];
}


#pragma mark - other



@end
