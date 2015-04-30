//
//  MainViewController.m
//  JQDemoProgram
//
//  Created by 宋佳强 on 15/4/30.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

/**
 *  demo信息数组（从plist文件中获取）
 */
@property (nonatomic, strong) NSArray *demoList;

/**
 *  反馈按钮
 */
@property (nonatomic, weak) UIButton *feedbackButton;



@end


@implementation MainViewController


#pragma mark - 懒加载
-(NSArray *)demoList{
    if (!_demoList) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"demoList" ofType:@"plist"];
        _demoList = [NSArray arrayWithContentsOfFile:path];
        
    }
    return _demoList;
}

-(UIButton *)feedbackButton{
    if (!_feedbackButton) {
        
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"icon_feedback"] forState:UIControlStateNormal];
        button.alpha = 0.8;
        
        CGFloat w = 50.0;
        CGFloat h = 50.0;
        CGFloat x = self.view.bounds.size.width - w - 20.0;
        CGFloat y = self.view.bounds.size.height - h - 60.0;
        button.frame = CGRectMake(x, y, w, h);
        
        [self.navigationController.view addSubview:button];
        _feedbackButton = button;
    }
    return _feedbackButton;
}

#pragma mark - 系统方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // nav
    self.navigationItem.title = @"JQDemo";
    
    // feedback
    [self.feedbackButton addTarget:self action:@selector(feedbackButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tableView delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.demoList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (! cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSDictionary *demoInfo = self.demoList[indexPath.row];
    cell.textLabel.text = demoInfo[@"name"];
    cell.detailTextLabel.text = demoInfo[@"desc"];
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
}


#pragma mark - 监听方法
/**
 *  点击反馈按钮
 */
-(void) feedbackButtonClick:(UIButton *)button{
    NSLog(@"进入用户反馈界面");
    
    [self circling:button];
    
}


#pragma mark - 其他方法

/**
 *  转圈圈
 *
 *  @param view 旋转的视图
 */
-(void) circling:(UIView *)view{
    
    [UIView animateWithDuration:1.0 animations:^{
        view.transform = CGAffineTransformRotate(view.transform, -M_PI);
    }];
    
}

@end
