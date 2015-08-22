//
//  MBProgressHUD+Ext.h
//  JQDemoProgram
//
//  Created by 宋佳强 on 15/8/22.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Ext)

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;


+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
