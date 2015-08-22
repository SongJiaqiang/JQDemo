//
//  PaintPath.m
//  JQDemoProgram
//
//  Created by 宋佳强 on 15/8/22.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import "PaintPath.h"

@implementation PaintPath

+ (instancetype) paintPathWitStartPoint:(CGPoint)startPoint andhWidth:(CGFloat)width andColor:(UIColor *)color{
    
    PaintPath *path = [[PaintPath alloc] init];
    path.color = color;
    path.width = width;
    [path moveToPoint:startPoint];
    
    return path;
}


@end
