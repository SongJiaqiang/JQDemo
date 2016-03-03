//
//  GradientTriangleController.m
//  JQDemoProgram
//
//  Created by Whisper-JQ on 15/11/18.
//  Copyright © 2015年 JQTech. All rights reserved.
//

#import "GradientTriangleController.h"

#import "GradientTriangleView.h"

@interface GradientTriangleController ()

@end

@implementation GradientTriangleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"渐变色三角形";

    GradientTriangleView *triangleView = [[GradientTriangleView alloc] init];
    [self.view addSubview:triangleView];
    triangleView.frame = CGRectMake(0, 70, 100, 100);
    
    
//    UIImageView *imageView = [UIImageView new];
//    [self.view addSubview:imageView];
//    imageView.backgroundColor = [UIColor grayColor];
//    
//    CGFloat width = 35;
//    CGFloat height = 320;
//    imageView.frame = CGRectMake(ScreenWidth-width, 70, width, height);
//    
//    imageView.image = [self triangleImageWithSize:CGSizeMake(width, height)];
}


- (UIImage *)triangleImageWithSize:(CGSize)size{
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIGraphicsBeginImageContext(CGSizeMake(size.width, size.height));
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(size.width, 0)];
    [path addLineToPoint:CGPointMake(size.width, size.height)];
    [path addLineToPoint:CGPointMake(0, size.height)];
    [path addLineToPoint:CGPointMake(size.width, 0)];
    
    
    [[UIColor redColor] set];
    [path fill];
    
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
