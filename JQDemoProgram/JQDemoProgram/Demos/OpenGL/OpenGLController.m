//
//  OpenGLController.m
//  JQDemoProgram
//
//  Created by Whisper-JQ on 16/2/29.
//  Copyright © 2016年 JQTech. All rights reserved.
//

#import "OpenGLController.h"
#import "OpenGLView.h"

@interface OpenGLController ()

@property (nonatomic, strong) OpenGLView *glView;


@end

@implementation OpenGLController



-(void)viewDidLoad {
    [super viewDidLoad];
 
    self.title = @"OpenGL";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.glView = [[OpenGLView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.glView];
}




@end
