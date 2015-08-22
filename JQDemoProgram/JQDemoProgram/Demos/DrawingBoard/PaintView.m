//
//  PaintView.m
//  JQDemoProgram
//
//  Created by 宋佳强 on 15/8/22.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import "PaintView.h"

#import "PaintPath.h"

@interface PaintView ()

// 当前路径
@property (nonatomic, strong) PaintPath *path;
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
-(NSMutableArray *)deletedPaths{
    if (!_deletedPaths) {
        _deletedPaths = [NSMutableArray array];
        
    }
    return _deletedPaths;
}

#pragma mark - system

-(void)drawRect:(CGRect)rect{
    
    // 遍历所有路径并依次绘制出来
    for (PaintPath *path in self.paths) {
        
        [path.color set];
        [path stroke];
    }
    
}

-(void)awakeFromNib{
    // 笔触宽度默认设为2
    _width = 2;
    // 默认笔触颜色设为黑色
    _color = [UIColor blackColor];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    // 清空重做列表
    [self.deletedPaths removeAllObjects];
    
    // 获取触摸点
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    // 创建路径
    PaintPath *path = [PaintPath paintPathWithWidth:_width andColor:_color];
    // 设置路径的起点
    [path moveToPoint:point];
    
    
    // 添加到数组中
    [self.paths addObject:path];
    _path = path;

    
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



#pragma mark - interrface
-(void)undo{
    if (self.paths.count <= 0) return;
    
    // 记录即将删除的路径
    [self.deletedPaths addObject:self.paths.lastObject];
    
    // 移除最后一条路径
    [self.paths removeLastObject];
    
    // 重绘
    [self setNeedsDisplay];
}

-(void)redo{
    
    if (self.deletedPaths.count <= 0) return;
    
    
    // 重新记录上次删除的路径
    [self.paths addObject:self.deletedPaths.lastObject];
    
    
    // 移除最后一条路径
    [self.deletedPaths removeLastObject];
    
    // 重绘
    [self setNeedsDisplay];
    
}

-(void)clearAll{
    
    // 记录即将删除的路径
//    [self.deletedPaths addObjectsFromArray:self.paths];
    
    // 清空左右路径
    [self.paths removeAllObjects];
    
    // 重绘
    [self setNeedsDisplay];
}


#pragma mark - other



@end
