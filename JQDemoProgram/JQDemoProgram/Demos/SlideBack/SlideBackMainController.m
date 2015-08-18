//
//  SlideBackMainController.m
//  JQDemoProgram
//
//  Created by 宋佳强 on 15/8/15.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import "SlideBackMainController.h"

#import "AViewController.h"
#import "BViewController.h"
#import "SlideBackNavigationController.h"

@interface SlideBackMainController ()
<
UITableViewDelegate, UITableViewDataSource
>

@property (nonatomic, strong) NSMutableArray *controllers;



@end

@implementation SlideBackMainController

#pragma mark - lazy

-(NSMutableArray *)controllers{
    if (!_controllers) {
        _controllers = [NSMutableArray array];
        
        NSMutableDictionary *item1 = [NSMutableDictionary dictionary];
        item1[@"title"] = @"AViewController";
        item1[@"desc"] = @"adsfasdfasdfaf";
        item1[@"name"] = @"AViewController";
        
        
        NSMutableDictionary *item2 = [NSMutableDictionary dictionary];
        item2[@"title"] = @"BViewController";
        item2[@"desc"] = @"adsfasdfasdfaf";
        item2[@"name"] = @"BViewController";
        
        [_controllers addObject:item1];
        [_controllers addObject:item2];
    }
    return _controllers;
}


#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // nav
    self.navigationItem.title = @"滑动返回";
    
    
}


#pragma mark - delegate
#pragma mark tableview
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.controllers.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc ]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    NSDictionary *item = self.controllers[indexPath.row];
    cell.textLabel.text = item[@"title"];
    cell.detailTextLabel.text = item[@"desc"];
    
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *item = self.controllers[indexPath.row];
    
    //    AViewController *controller = (AViewController *)NSClassFromString(item[@"name"]);
    switch (indexPath.row) {
        case 0:{
            
            SlideBackNavigationController *navC = [[SlideBackNavigationController alloc] initWithRootViewController:[AViewController new]];
            [self presentViewController:navC animated:YES completion:nil];
            
            break;}
        case 1:{
            
            BViewController *controller = [[BViewController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
            
            break;}
        default:
            break;
    }
    
}



#pragma mark - listener



#pragma mark - ui create



#pragma mark - other




@end
