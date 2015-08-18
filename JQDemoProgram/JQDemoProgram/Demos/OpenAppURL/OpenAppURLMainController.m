//
//  OpenAppURLMainController.m
//  JQDemoProgram
//
//  Created by 宋佳强 on 15/8/18.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import "OpenAppURLMainController.h"

@interface OpenAppURLMainController ()

@property (nonatomic, strong) NSMutableArray *cellInfos;

@end

@implementation OpenAppURLMainController

#pragma mark - lazy
-(NSMutableArray *)cellInfos{
    if (!_cellInfos) {
        _cellInfos = [NSMutableArray array];
        
        NSMutableDictionary *item1 = [NSMutableDictionary dictionary];
        item1[@"title"] = @"微信";
        item1[@"scheme"] = @"wechat";
        
        NSMutableDictionary *item2 = [NSMutableDictionary dictionary];
        item2[@"title"] = @"微博";
        item2[@"scheme"] = @"weibo";
        
        NSMutableDictionary *item3 = [NSMutableDictionary dictionary];
        item3[@"title"] = @"QQ";
        item3[@"scheme"] = @"qq";

        
        NSMutableDictionary *item4 = [NSMutableDictionary dictionary];
        item4[@"title"] = @"帮助宝";
        item4[@"scheme"] = @"bangzhubao";
        
        
        [_cellInfos addObject:item1];
        [_cellInfos addObject:item2];
        [_cellInfos addObject:item3];
        [_cellInfos addObject:item4];
        
    }
    return _cellInfos;
}

#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // nav
    self.navigationItem.title = @"app跳转";
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    return self.cellInfos.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"iCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    NSDictionary *item = self.cellInfos[indexPath.row];
    cell.textLabel.text = item[@"title"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"scheme:%@", item[@"scheme"]];
    

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    NSDictionary *item = self.cellInfos[indexPath.row];
    NSString *scheme = item[@"scheme"];
    [self openAppWithScheme:scheme params:nil];
    
}


- (void) openAppWithScheme:(NSString *)scheme params:(NSString *)params{
    
    NSString *url =[NSString stringWithFormat:@"%@://%@", scheme, params];
    NSURL *appURL = [NSURL URLWithString:url];
    
    UIApplication *app = [UIApplication sharedApplication];

    if ([app canOpenURL:appURL]) {
        // 安装了对应的app直接跳转
        [app openURL:appURL];
    }else {
        // 没有安装对应的app
        NSLog(@"当前设备没有安装该app或是scheme错误");
        
    }
    
}

@end
