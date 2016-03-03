//
//  GradientTriangleView.m
//  JQDemoProgram
//
//  Created by Whisper-JQ on 15/11/18.
//  Copyright © 2015年 JQTech. All rights reserved.
//

#import "GradientTriangleView.h"

#import "GradientLayer.h"

@implementation GradientTriangleView

- (instancetype)init{
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        
        
        CGFloat width = ScreenWidth;
//        CGFloat angle = atan(1.0/10);
//        CGFloat tanA = tan((angle/180)*M_PI);
        CGFloat tanA = tan(atan(1.0/10));
        CGFloat height = width / tanA;
        
        NSLog(@"width:height = %.2f:%.2f", width, height);
        
        CGRect frame = CGRectMake(0, 0, width, height);
        CAGradientLayer *gradientLayer = [GradientLayer greyGradientLayerWithFrame:frame];
        CALayer *coverLayer = [[CALayer alloc] init];
        coverLayer.frame = frame;
        coverLayer.backgroundColor = [UIColor colorWithPatternImage:[self gradientImageWithSize:frame.size]].CGColor;
        
        [self.layer addSublayer:gradientLayer];
        [self.layer addSublayer:coverLayer];
        
    }
    return self;
}

- (UIImage *)gradientImageWithSize:(CGSize)size{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);

    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(size.width, 0)];
    [path addLineToPoint:CGPointMake(0, size.height)];
    [path addLineToPoint:CGPointMake(0, 0)];
    
    [[UIColor magentaColor] set];
    [path fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



@end
