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
    
    MeowButton *button = [[MeowButton alloc] init];
    [self.view addSubview:button];
    button.frame = CGRectMake(10, 100, 100, 30);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
