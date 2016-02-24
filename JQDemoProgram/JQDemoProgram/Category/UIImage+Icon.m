//
//  UIImage+Icon.m
//  JQDemoProgram
//
//  Created by 宋佳强 on 15/9/16.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import "UIImage+Icon.h"

#define ICON_SIZE_12 CGSizeMake(12,12)

@implementation UIImage (Icon)

+(UIImage *)icon_plus{
    // 开启图片上下文 ➕🔘⚫
    UIGraphicsBeginImageContextWithOptions(ICON_SIZE_12, NO, 0);
    // 创建贝塞尔对象
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 绘制路径
    [path moveToPoint:CGPointMake(0, 6)];
    [path addLineToPoint:CGPointMake(12, 6)];
    [path moveToPoint:CGPointMake(6, 0)];
    [path addLineToPoint:CGPointMake(6, 12)];
    
    [[UIColor lightGrayColor] set]; // 颜色
    path.lineWidth = 2; // 笔触宽度
    [path stroke];  // 描边
//    [path fill];  // 填充
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
+(UIImage *)icon_ring{
    
    UIGraphicsBeginImageContextWithOptions(ICON_SIZE_12, NO, 0);
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(6, 12)];
    [path addArcWithCenter:CGPointMake(6, 6)
                    radius:6
                startAngle:M_PI_2
                  endAngle:M_PI_2*5
                 clockwise:YES];
    
    [[UIColor lightGrayColor] set]; // 颜色
    path.lineWidth = 4; // 笔触宽度
    [path addClip]; // 抗锯齿
    [path stroke];  // 描边
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
+(UIImage *)icon_dot{
    
    UIGraphicsBeginImageContextWithOptions(ICON_SIZE_12, NO, 0);
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(6, 8)];
    [path addArcWithCenter:CGPointMake(6, 6)
                    radius:2
                startAngle:M_PI_2
                  endAngle:M_PI_2*5
                 clockwise:YES];
    
    [[UIColor lightGrayColor] set]; // 颜色
//    path.lineWidth = 4; // 笔触宽度
//    [path addClip]; // 抗锯齿
    [path fill];  // 填充
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
