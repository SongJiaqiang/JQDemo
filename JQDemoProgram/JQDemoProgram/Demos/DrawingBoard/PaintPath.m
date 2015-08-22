//
//  PaintPath.m
//  JQDemoProgram
//
//  Created by 宋佳强 on 15/8/22.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import "PaintPath.h"

@implementation PaintPath

+ (instancetype) paintPathWithWidth:(CGFloat)width andColor:(UIColor *)color{
    
    PaintPath *path = [[self alloc] init];
    path.color = color;
    path.lineWidth = width;
//    [path moveToPoint:startPoint];
    
    return path;
}


@end
