//
//  BaseViewController.m
//  JQDemoProgram
//
//  Created by 宋佳强 on 15/8/25.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark - lazy
-(UIView *)contentView{
    if (!_contentView) {
        UIView *contentView = [[UIView alloc] init];
        contentView.backgroundColor = [UIColor whiteColor];
        contentView.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height);
        
        [self.view addSubview:contentView];
        _contentView = contentView;
    }
    return _contentView;
}


#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // backgroundcolor
    self.view.backgroundColor = [UIColor whiteColor];
    
    // nav
    
    
    // 添加点击手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureHandler:)];
    [self.view addGestureRecognizer:tapGesture];
    
}


#pragma mark - delegate




#pragma mark - listener
- (void)tapGestureHandler:(UITapGestureRecognizer *)gesture{
    [self.view endEditing:YES];
}


#pragma mark - ui create



#pragma mark - other



@end
