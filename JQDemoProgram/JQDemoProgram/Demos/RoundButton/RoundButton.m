
//
//  RoundButton.m
//  JQDemoProgram
//
//  Created by 宋佳强 on 15/8/26.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import "RoundButton.h"

@implementation RoundButton

-(void)drawRect:(CGRect)rect{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGFloat radius1 = 10;
    CGFloat radius2 = 20;
    CGFloat minWidth = 40;
    CGFloat minHeight = 40;
    CGFloat width = self.frame.size.width>minWidth?self.frame.size.width:minWidth;
    CGFloat height = self.frame.size.height>minHeight?self.frame.size.height:minHeight;
    
//    CGPoint center1 = CGPointMake(radius1, radius1);
//    CGPoint center2 = CGPointMake(radius1, radius1);
//    CGPoint center3 = CGPointMake(radius1, radius1);
//    CGPoint center4 = CGPointMake(radius1, radius1);
    
    // 起点
    switch (_type) {
        case RoundButtonTypeDefault:{
            
            CGPoint center1 = CGPointMake(width-radius1, radius1);
            CGPoint center2 = CGPointMake(width-radius1, height-radius1);
            CGPoint center3 = CGPointMake(radius1, height-radius1);
            CGPoint center4 = CGPointMake(radius1, radius1);
            
            [path moveToPoint:CGPointMake(radius1, 0)];
            [path addLineToPoint:CGPointMake(width-radius1, 0)];
            [path addArcWithCenter:center1 radius:radius1 startAngle:-M_PI_2 endAngle:0 clockwise:YES];
            [path addLineToPoint:CGPointMake(width, height-radius1)];
            [path addArcWithCenter:center2 radius:radius1 startAngle:0 endAngle:M_PI_2 clockwise:YES];
            [path addLineToPoint:CGPointMake(radius1, height)];
            [path addArcWithCenter:center3 radius:radius1 startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
            [path addLineToPoint:CGPointMake(0, radius1)];
            [path addArcWithCenter:center4 radius:radius1 startAngle:M_PI_2 endAngle:-M_PI_2 clockwise:YES];
            
            [ColorWhisperGray set];
            
            break;
        }
        case RoundButtonTypeLeftTop:
        {
            
            CGPoint center1 = CGPointMake(width-radius2, radius2);
            CGPoint center2 = CGPointMake(width-radius2, height-radius2);
            CGPoint center3 = CGPointMake(radius1, height-radius1);
            CGPoint center4 = CGPointMake(radius2, radius2);
            
            [path moveToPoint:CGPointMake(radius2, 0)];
            [path addLineToPoint:CGPointMake(width-radius2, 0)];
            [path addArcWithCenter:center1 radius:radius2 startAngle:-M_PI_2 endAngle:0 clockwise:YES];
            [path addLineToPoint:CGPointMake(width, height-radius2)];
            [path addArcWithCenter:center2 radius:radius2 startAngle:0 endAngle:M_PI_2 clockwise:YES];
            [path addLineToPoint:CGPointMake(radius1, height)];
            [path addArcWithCenter:center3 radius:radius1 startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
            [path addLineToPoint:CGPointMake(0, radius2)];
            [path addArcWithCenter:center4 radius:radius2 startAngle:M_PI_2 endAngle:-M_PI_2 clockwise:YES];
            
            [ColorWhisperGray set];
            
            break;
        }
        case RoundButtonTypeLeftMiddle:
        {
            
            CGPoint center1 = CGPointMake(width-radius2, radius2);
            CGPoint center2 = CGPointMake(width-radius2, height-radius2);
            CGPoint center3 = CGPointMake(radius1, height-radius1);
            CGPoint center4 = CGPointMake(radius1, radius1);
            
            [path moveToPoint:CGPointMake(radius1, 0)];
            [path addLineToPoint:CGPointMake(width-radius2, 0)];
            [path addArcWithCenter:center1 radius:radius2 startAngle:-M_PI_2 endAngle:0 clockwise:YES];
            [path addLineToPoint:CGPointMake(width, height-radius2)];
            [path addArcWithCenter:center2 radius:radius2 startAngle:0 endAngle:M_PI_2 clockwise:YES];
            [path addLineToPoint:CGPointMake(radius1, height)];
            [path addArcWithCenter:center3 radius:radius1 startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
            [path addLineToPoint:CGPointMake(0, radius1)];
            [path addArcWithCenter:center4 radius:radius1 startAngle:M_PI_2 endAngle:-M_PI_2 clockwise:YES];
            
            [ColorWhisperGray set];
            
            break;
        }
        case RoundButtonTypeLeftBottom:
        {
            
            CGPoint center1 = CGPointMake(width-radius2, radius2);
            CGPoint center2 = CGPointMake(width-radius2, height-radius2);
            CGPoint center3 = CGPointMake(radius2, height-radius2);
            CGPoint center4 = CGPointMake(radius1, radius1);
            
            [path moveToPoint:CGPointMake(radius1, 0)];
            [path addLineToPoint:CGPointMake(width-radius2, 0)];
            [path addArcWithCenter:center1 radius:radius2 startAngle:-M_PI_2 endAngle:0 clockwise:YES];
            [path addLineToPoint:CGPointMake(width, height-radius2)];
            [path addArcWithCenter:center2 radius:radius2 startAngle:0 endAngle:M_PI_2 clockwise:YES];
            [path addLineToPoint:CGPointMake(radius2, height)];
            [path addArcWithCenter:center3 radius:radius2 startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
            [path addLineToPoint:CGPointMake(0, radius1)];
            [path addArcWithCenter:center4 radius:radius1 startAngle:M_PI_2 endAngle:-M_PI_2 clockwise:YES];
            
            [ColorWhisperGray set];
            
            break;
        }
        case RoundButtonTypeRightTop:
        {
            
            CGPoint center1 = CGPointMake(width-radius2, radius2);
            CGPoint center2 = CGPointMake(width-radius1, height-radius1);
            CGPoint center3 = CGPointMake(radius2, height-radius2);
            CGPoint center4 = CGPointMake(radius2, radius2);
            
            [path moveToPoint:CGPointMake(radius2, 0)];
            [path addLineToPoint:CGPointMake(width-radius2, 0)];
            [path addArcWithCenter:center1 radius:radius2 startAngle:-M_PI_2 endAngle:0 clockwise:YES];
            [path addLineToPoint:CGPointMake(width, height-radius1)];
            [path addArcWithCenter:center2 radius:radius1 startAngle:0 endAngle:M_PI_2 clockwise:YES];
            [path addLineToPoint:CGPointMake(radius2, height)];
            [path addArcWithCenter:center3 radius:radius2 startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
            [path addLineToPoint:CGPointMake(0, radius2)];
            [path addArcWithCenter:center4 radius:radius2 startAngle:M_PI_2 endAngle:-M_PI_2 clockwise:YES];
            
            [ColorWhisperPurple set];
            
            break;
        }
        case RoundButtonTypeRightMiddle:
        {
            
            CGPoint center1 = CGPointMake(width-radius1, radius1);
            CGPoint center2 = CGPointMake(width-radius1, height-radius1);
            CGPoint center3 = CGPointMake(radius2, height-radius2);
            CGPoint center4 = CGPointMake(radius2, radius2);
            
            [path moveToPoint:CGPointMake(radius1, 0)];
            [path addLineToPoint:CGPointMake(width-radius1, 0)];
            [path addArcWithCenter:center1 radius:radius1 startAngle:-M_PI_2 endAngle:0 clockwise:YES];
            [path addLineToPoint:CGPointMake(width, height-radius1)];
            [path addArcWithCenter:center2 radius:radius1 startAngle:0 endAngle:M_PI_2 clockwise:YES];
            [path addLineToPoint:CGPointMake(radius2, height)];
            [path addArcWithCenter:center3 radius:radius2 startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
            [path addLineToPoint:CGPointMake(0, radius2)];
            [path addArcWithCenter:center4 radius:radius2 startAngle:M_PI_2 endAngle:-M_PI_2 clockwise:YES];
            
            [ColorWhisperPurple set];
            
            break;
        }
        case RoundButtonTypeRightBottom:
        {
            
            CGPoint center1 = CGPointMake(width-radius1, radius1);
            CGPoint center2 = CGPointMake(width-radius2, height-radius2);
            CGPoint center3 = CGPointMake(radius2, height-radius2);
            CGPoint center4 = CGPointMake(radius2, radius2);
            
            [path moveToPoint:CGPointMake(radius2, 0)];
            [path addLineToPoint:CGPointMake(width-radius1, 0)];
            [path addArcWithCenter:center1 radius:radius1 startAngle:-M_PI_2 endAngle:0 clockwise:YES];
            [path addLineToPoint:CGPointMake(width, height-radius2)];
            [path addArcWithCenter:center2 radius:radius2 startAngle:0 endAngle:M_PI_2 clockwise:YES];
            [path addLineToPoint:CGPointMake(radius2, height)];
            [path addArcWithCenter:center3 radius:radius2 startAngle:M_PI_2 endAngle:M_PI clockwise:YES];
            [path addLineToPoint:CGPointMake(0, radius2)];
            [path addArcWithCenter:center4 radius:radius2 startAngle:M_PI_2 endAngle:-M_PI_2 clockwise:YES];
            
            [ColorWhisperPurple set];
            
            break;
        }
        default:
            break;
    }
    
    
    
    
    
    
    
    path.lineWidth = 1;
//    [path stroke];
    [path fill];
    
}
@end
