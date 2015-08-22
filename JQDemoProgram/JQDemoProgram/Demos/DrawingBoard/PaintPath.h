//
//  PaintPath.h
//  JQDemoProgram
//
//  Created by 宋佳强 on 15/8/22.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaintPath : UIBezierPath

// 笔触颜色
@property (nonatomic, strong) UIColor *color;
// 笔触宽度
@property (nonatomic, assign) CGFloat width;


/**
 *  实例化方法
 *
 *  @param startPoint 开始坐标
 *  @param width      笔触宽度
 *  @param color      笔触颜色
 *
 *  @return PaintPath实例
 */
+ (instancetype) paintPathWitStartPoint:(CGPoint)startPoint andhWidth:(CGFloat)width andColor:(UIColor *)color;

@end
