//
//  RoundButtonMainController.m
//  JQDemoProgram
//
//  Created by 宋佳强 on 15/8/26.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import "RoundButtonMainController.h"

#import "RoundButton.h"


@interface RoundButtonMainController ()

@end

@implementation RoundButtonMainController
#pragma mark - lazy



#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // nav
    self.navigationItem.title = @"圆角按钮";
    
    
    [self setupButton];
}


#pragma mark - delegate




#pragma mark - listener



#pragma mark - ui create
- (void) setupButton{
    
    
    UIButton *btn1 = [[UIButton alloc] init];
    btn1.frame = CGRectMake(20, 84, 100, 40);
    btn1.backgroundColor = [UIColor magentaColor];
    
    btn1.layer.cornerRadius = 10;
    [self.view addSubview:btn1];
    
    
    UIButton *btn2 = [[UIButton alloc] init];
    btn2.frame = CGRectMake(20, 140, 100, 40);
    btn2.backgroundColor = [UIColor purpleColor];
    btn2.layer.cornerRadius = 20;
    [self.view addSubview:btn2];

//    UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:btn2.bounds byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(10, 20)];
//    UIBezierPath *path3=  [UIBezierPath bezierPathWithArcCenter:CGPointMake(20, 140) radius:20 startAngle:M_PI_4 endAngle:M_PI_2 clockwise:YES];
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(0, 0)];
//    [path addLineToPoint:CGPointMake(CGRectGetMaxX(btn2.frame), btn2.frame.origin.y)];
//    
//    
//    path.lineWidth = 2;
//    [[UIColor purpleColor] set];
//    [path stroke];
//    
//    CAShapeLayer *mask2 = [[CAShapeLayer alloc] init];
//    mask2.frame = btn2.bounds;
//    mask2.path = path.CGPath;
//    
//    btn2.layer.mask = mask2;
    
    CGFloat minWidth = 100;
    CGFloat minHeight = 40;
    CGFloat leftX = 10;
    CGFloat rightX = DefaultWindowWidth - 10 - minWidth;
    
    RoundButton *btn3 = [[RoundButton alloc] init];
    btn3.frame = CGRectMake(leftX, 220, minWidth, minHeight);
    btn3.type = RoundButtonTypeLeftTop;
    [self.view addSubview:btn3];
    
    RoundButton *btn4 = [[RoundButton alloc] init];
    btn4.frame = CGRectMake(leftX, 270, minWidth, minHeight);
    btn4.type = RoundButtonTypeLeftMiddle;
    [self.view addSubview:btn4];
    
    RoundButton *btn5 = [[RoundButton alloc] init];
    btn5.frame = CGRectMake(leftX, 320, minWidth, minHeight);
    btn5.type = RoundButtonTypeLeftBottom;
    [self.view addSubview:btn5];
    
    
    
    RoundButton *btn6 = [[RoundButton alloc] init];
    btn6.frame = CGRectMake(rightX, 380, minWidth, minHeight);
    btn6.type = RoundButtonTypeRightTop;
    [self.view addSubview:btn6];
    
    RoundButton *btn7 = [[RoundButton alloc] init];
    btn7.frame = CGRectMake(rightX, 430, minWidth, minHeight);
    btn7.type = RoundButtonTypeRightMiddle;
    [self.view addSubview:btn7];
    
    RoundButton *btn8 = [[RoundButton alloc] init];
    btn8.frame = CGRectMake(rightX-50, 480, minWidth+50, minHeight+30);
    btn8.type = RoundButtonTypeRightBottom;
    [self.view addSubview:btn8];
    
    
    
    
    
}




#pragma mark - other



@end
