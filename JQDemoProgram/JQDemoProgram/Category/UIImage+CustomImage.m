//
//  UIImage+CustomImage.m
//  JQDemoProgram
//
//  Created by Whisper-JQ on 15/11/8.
//  Copyright © 2015年 JQTech. All rights reserved.
//

#import "UIImage+CustomImage.h"

@implementation UIImage (CustomImage)


// 倾斜圆角矩形
- (UIImage *)meowImageWithSize:(CGSize)size text:(NSString *)text textAttr:(NSDictionary *)textAttr bgColor:(UIColor *)bgColor offset:(CGFloat)offset radius:(CGFloat)radius mode:(CGPathDrawingMode)mode{
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
    
    /*
     
     kCGPathFill,
     kCGPathEOFill,
     kCGPathStroke,
     kCGPathFillStroke,
     kCGPathEOFillStroke
     */
    
    [bgColor set];
    switch (mode) {
        case kCGPathFill:
            [path fill];
            break;
            
        case kCGPathStroke:
            [path addClip];
            [path stroke];
            break;
            
        default:
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
