//
//  BaseNavigationController.m
//  JQLeftBack
//
//  Created by 宋佳强 on 15/8/15.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import "SlideBackNavigationController.h"

@interface SlideBackNavigationController ()
<
UIGestureRecognizerDelegate
>

@end

@implementation SlideBackNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取系统自带滑动返回手势的代理delegate
    id target = self.interactivePopGestureRecognizer.delegate;
//    SEL action = self.interactivePopGestureRecognizer.action;
    // 新建一个滑动手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    // 设置代理
    panGesture.delegate = self;
    // 给导航控制器的view添加手势
    [self.view addGestureRecognizer:panGesture];
    
    // 禁用系统自带手势
    self.interactivePopGestureRecognizer.enabled = NO;
    
    
}


#pragma mark - 实现代理方法
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{

    // 根控制器只有一个子控制器
    if (self.childViewControllers.count == 1) {
        // 根控制器不触发返回手势
        return NO;
    }
    
    return YES;
}


@end
