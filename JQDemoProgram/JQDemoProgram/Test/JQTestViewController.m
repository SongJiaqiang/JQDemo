//
//  JQTestViewController.m
//  JQDemoProgram
//
//  Created by 宋佳强 on 15/5/14.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import "JQTestViewController.h"

#import "AFNetworking.h"

@interface JQTestViewController ()

@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITextField *urlField;
@property (weak, nonatomic) IBOutlet UITextView *resultField;

- (IBAction)requestButtonClick;

@end

@implementation JQTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // nav
    self.navigationItem.title = @"TestController";
    
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

- (IBAction)requestButtonClick {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *url = self.urlField.text;
    if (url == nil || url.length == 0) {
        NSLog(@"url empty");
        return;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"responseObject:%@", responseObject);
        
        NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        self.resultField.text = [NSString stringWithFormat:@"%@", responseData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error");
    }];
    
}
@end
