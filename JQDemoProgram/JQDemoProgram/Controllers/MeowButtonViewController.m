//
//  MeowButtonViewController.m
//  JQDemoProgram
//
//  Created by Whisper-JQ on 15/11/8.
//  Copyright © 2015年 JQTech. All rights reserved.
//

#import "MeowButtonViewController.h"

#import "MeowButton.h"


@interface MeowButtonViewController ()

@end

@implementation MeowButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"MeowButton";
    self.view.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    [attr setObject:[UIFont systemFontOfSize:12] forKey:NSFontAttributeName];
    [attr setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    UIImage *icon = [self whisper_replyTagIconWithSize:CGSizeMake(100, 40) text:@"热门" textAttr:attr bgColor:[UIColor redColor] offset:10 radius:10 mode:kCGPathFill];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.contentMode = UIViewContentModeCenter;
    imageView.image = icon;
    imageView.frame = CGRectMake(20, 240, 270, 150);
    [self.view addSubview:imageView];
    
    
    UIImageView *envolopeImageView = [UIImageView new];
    envolopeImageView.contentMode = UIViewContentModeRedraw;
    UIImage *bgImage = [self envolopeImage];
//    envolopeImageView.image = [self envolopeImage];
    envolopeImageView.backgroundColor = [UIColor colorWithPatternImage:bgImage];
    envolopeImageView.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 5);
    [self.view addSubview:envolopeImageView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


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

- (UIImage *)envolopeImage{
    CGFloat width = 15;
    CGFloat height = 5;
    CGFloat offset = 5;
    NSArray *colors = @[[UIColor redColor], [UIColor blueColor]];
    
    // 设置画布尺寸
    CGSize imageSize = CGSizeMake(colors.count * 2 * width, height);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    
    // 获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 生成贝塞尔路径
//    CGPoint topPoint0 = CGPointMake(0, 0);
//    CGPoint topPoint1 = CGPointMake(0, 0);
//    CGPoint topPoint2 = CGPointMake(0, 0);
//    CGPoint topPoint3 = CGPointMake(0, 0);
//    CGPoint topPoint4 = CGPointMake(0, 0);
//    
//    CGPoint bottomPoint0 = CGPointMake(0, 0);
//    CGPoint bottomPoint1 = CGPointMake(0, 0);
//    CGPoint bottomPoint2 = CGPointMake(0, 0);
//    CGPoint bottomPoint3 = CGPointMake(0, 0);
//    CGPoint bottomPoint4 = CGPointMake(0, 0);
    
    for (int i=0; i<colors.count+1; i++){
        UIBezierPath *path = [UIBezierPath bezierPath];
        
        switch (i) {
            case 0:
            {
                // 设置起点
                CGPoint startPoint = CGPointMake(0, 0);
                [path moveToPoint:startPoint];
                
                // 绘制直线
                [path addLineToPoint:CGPointMake(offset, 0)];
                [path addLineToPoint:CGPointMake(0, height)];
                [path addLineToPoint:startPoint];
                
                UIColor *color = colors[0];
                [color set];
                [path fill];
                break;
            }
            case 1:
            {
                // 设置起点
                CGPoint startPoint = CGPointMake(width+offset, 0);
                [path moveToPoint:startPoint];
                
                // 绘制直线
                [path addLineToPoint:CGPointMake(width+offset+width, 0)];
                [path addLineToPoint:CGPointMake(width+width, height)];
                [path addLineToPoint:CGPointMake(width, height)];
                [path addLineToPoint:startPoint];
                
                UIColor *color = colors[1];
                [color set];
                [path fill];
                break;
            }
            case 2:
            {
                // 设置起点
                CGPoint startPoint = CGPointMake(width+offset+width+width, 0);
                [path moveToPoint:startPoint];
                
                // 绘制直线
                [path addLineToPoint:CGPointMake(width+offset+width+width+width-offset, 0)];
                [path addLineToPoint:CGPointMake(width+offset+width+width+width-offset, height)];
                [path addLineToPoint:CGPointMake(width+width+width, height)];
                [path addLineToPoint:startPoint];
                
                UIColor *color = colors[0];
                [color set];
                [path fill];
                break;
            }
            default:
                break;
        }
        
        
        
        
    }
    
    CGContextStrokePath(context);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
}


@end
