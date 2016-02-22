//
//  GalleryImagePickerController.m
//  JQDemoProgram
//
//  Created by Whisper-JQ on 16/2/15.
//  Copyright © 2016年 JQTech. All rights reserved.
//

#import "GalleryImagePickerController.h"

@implementation GalleryImagePickerController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    // nav
    self.navigationItem.title = @"画廊图片选择器";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"image" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemPress)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
}


-(void)rightItemPress {
    
}

@end
