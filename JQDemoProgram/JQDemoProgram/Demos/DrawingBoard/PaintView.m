//
//  PaintView.m
//  JQDemoProgram
//
//  Created by 宋佳强 on 15/8/22.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import "PaintView.h"

@interface PaintView ()

// 当前路径
@property (nonatomic, strong) UIBezierPath *path;
// 全部路径
@property (nonatomic, strong) NSMutableArray *paths;
// 已删除路径
@property (nonatomic, strong) NSMutableArray *deletedPaths;


@end


@implementation PaintView

#pragma mark - lazy
-(NSMutableArray *)paths{
    if (!_paths) {
        _paths = [NSMutableArray array];
        
        
    }
    return _paths;
}


#pragma mark - system
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

-(void)drawRect:(CGRect)rect{
    
    // 遍历所有路径并依次绘制出来
    for (UIBezierPath *path in self.paths) {
        [path stroke];
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    // 创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 添加到数组中
    _path = path;
    [self.paths addObject:path];
    
    // 获取触摸点
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    // 设置路径的起点
    [path moveToPoint:point];
    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    // 获取触摸点
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    // 绘制路径
    [_path addLineToPoint:point];
    
    // 重绘
    [self setNeedsDisplay];
    
}

#pragma mark - delegate




#pragma mark - listener



#pragma mark - ui create



#pragma mark - other



@end
