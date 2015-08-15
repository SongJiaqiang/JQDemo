//
//  AViewController.m
//  JQLeftBack
//
//  Created by 宋佳强 on 15/8/14.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import "AViewController.h"

#import "A2ViewController.h"
#import "A3ViewController.h"

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.navigationItem.title = NSStringFromClass(self.class);
    self.view.backgroundColor = [UIColor grayColor];
 
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(20, 84, 100, 40)];
    [btn1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTitle:@"btn1" forState:UIControlStateNormal];
    btn1.tag = 1;
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(20, 184, 100, 40)];
    [btn2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setTitle:@"btn2" forState:UIControlStateNormal];
    btn2.tag = 2;
    
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    
    
}


- (void) buttonClick:(UIButton *)button{
    switch (button.tag){
        case 1:
            [self.navigationController pushViewController:[A2ViewController new] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[A3ViewController new] animated:YES];
            break;
        default:
            break;
    }
    
}

@end
