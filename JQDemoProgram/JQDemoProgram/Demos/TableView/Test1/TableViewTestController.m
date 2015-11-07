//
//  TableViewTestController.m
//  JQDemoProgram
//
//  Created by Whisper-JQ on 15/11/4.
//  Copyright © 2015年 JQTech. All rights reserved.
//

#import "TableViewTestController.h"

#import "TableViewTest1Cell.h"

@interface TableViewTestController ()

@end

@implementation TableViewTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"TableView";
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardChanged:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat containerWidth = [UIScreen mainScreen].bounds.size.width - 15*2;
    CGFloat photoHeight = containerWidth * (2.0/5.0);
    CGFloat buttonHeight = 30;
    CGFloat fieldHeight = 30;
    
    return photoHeight+15+buttonHeight+fieldHeight+5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewTest1Cell *cell = [TableViewTest1Cell cellWithTableView:tableView];
    
    return cell;
}


- (void)keyboardChanged:(NSNotification *)notification{
    NSDictionary *userInfo = notification.userInfo;
    
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGFloat keyboardY = value.CGRectValue.origin.y;
    CGFloat keyboardH = value.CGRectValue.size.height;
    NSLog(@"keyboardY:%f", keyboardY);
    NSLog(@"keyboardH:%f", keyboardH);
    
    NSLog(@"findFirstResponder: %@", [self findFirstResponder]);
    
    
}

- (UIView *)findFirstResponder{
    if (self.view.isFirstResponder) {
        return self.view;
    }
    
    for (UIView *subView in self.view.subviews) {
        if (subView.isFirstResponder) {
            return subView;
        }
    }
    
    return nil;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
