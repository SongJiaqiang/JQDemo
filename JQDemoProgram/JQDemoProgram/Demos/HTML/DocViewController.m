//
//  DocViewController.m
//  JQDemoProgram
//
//  Created by Whisper-JQ on 16/3/3.
//  Copyright © 2016年 JQTech. All rights reserved.
//

#import "DocViewController.h"

@implementation DocViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Loading HTML";
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:webView];
    [self loadDocument:@"xxx.html" inView:webView];
    
}

-(void)loadDocument:(NSString*)documentName inView:(UIWebView*)webView
{
    NSString *path = [[NSBundle mainBundle] pathForResource:documentName ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

@end
