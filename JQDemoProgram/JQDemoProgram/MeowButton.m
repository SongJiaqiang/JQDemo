//
//  MeowButton.m
//  BezierTest
//
//  Created by Whisper-JQ on 15/9/17.
//  Copyright © 2015年 Whisper. All rights reserved.
//

#import "MeowButton.h"

@interface MeowButton ()

@property (nonatomic, strong) UIColor *bgColor;
@property (nonatomic, strong) NSDictionary *textAttr;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) CGFloat *offset;


@end

@implementation MeowButton

//- (void)drawRect:(CGRect)rect {
//    
//    
//    
//    
//}

- (UIImage *)whisper_replyTagIconWithSize:(CGSize)size text:(NSString *)text textAttr:(NSDictionary *)textAttr bgColor:(UIColor *)bgColor offset:(CGFloat)offset radius:(CGFloat)radius mode:(CGPathDrawingMode)mode{
    //    CGFloat offset = 10;
    //    CGFloat radius = 10;
    CGFloat scale = radius/sqrtf(offset*offset + size.height*size.height);
    
    // 设置画布尺寸
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    // 获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 设置背景绘图路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(offset, 0)];
    
    CGPoint controlPoint1 = CGPointMake(size.width, 0);
    CGPoint startPoint1 = CGPointMake(size.width-radius, 0);
    CGPoint endPoint1 = CGPointMake(size.width - scale * offset, scale * size.height);
    [path addLineToPoint:startPoint1];
    [path addQuadCurveToPoint:endPoint1 controlPoint:controlPoint1];
    
    CGPoint controlPoint2 = CGPointMake(size.width-offset, size.height);
    CGPoint startPoint2 = CGPointMake(size.width-((1-scale) * offset), size.height*(1-scale));
    CGPoint endPoint2 = CGPointMake(size.width-offset-radius, size.height);
    [path addLineToPoint:startPoint2];
    [path addQuadCurveToPoint:endPoint2 controlPoint:controlPoint2];
    
    CGPoint controlPoint3 = CGPointMake(0, size.height);
    CGPoint startPoint3 = CGPointMake(radius, size.height);
    CGPoint endPoint3 = CGPointMake(offset * scale, size.height*(1-scale));
    [path addLineToPoint:startPoint3];
    [path addQuadCurveToPoint:endPoint3 controlPoint:controlPoint3];
    
    CGPoint controlPoint4 = CGPointMake(offset, 0);
    CGPoint startPoint4 = CGPointMake((1-scale) * offset, size.height*scale);
    CGPoint endPoint4 = CGPointMake(offset+radius, 0);
    [path addLineToPoint:startPoint4];
    [path addQuadCurveToPoint:endPoint4 controlPoint:controlPoint4];
    
    
    switch (mode) {
        case kCGPathFill:
            [bgColor setFill];
            [path fill];
            break;
            
        case kCGPathStroke:
            [bgColor setStroke];
            [path addClip];
            [path stroke];
            break;
            
        default:
            [bgColor set];
            [path addClip];
            [path stroke];
            [path fill];
            break;
    }
    CGContextStrokePath(context);
    
    // 绘制文字
    CGSize textSize = [text sizeWithAttributes:textAttr];
    [text drawAtPoint:CGPointMake((size.width-textSize.width)*0.5, (size.height-textSize.height)*0.5) withAttributes:textAttr];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
}

@end
