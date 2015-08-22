//
//  MainViewController.m
//  JQDemoProgram
//
//  Created by 宋佳强 on 15/4/30.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import "MainViewController.h"

#import "JQTestViewController.h"
#import "SlideBackMainController.h"
#import "OpenAppURLMainController.h"
#import "DrawingBoardMainController.h"


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
        CGFloat y = self.view.bounds.size.height - h - 30.0;
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
    
    // tableview

    
    // feedback
    [self.feedbackButton addTarget:self action:@selector(feedbackButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // 旋转button
    self.feedbackButton.hidden = NO;
    [self rotate:self.feedbackButton];

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.feedbackButton.hidden = YES;
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

    NSDictionary *demoInfo = self.demoList[indexPath.row];
    

    NSString *code = demoInfo[@"code"];
    if (code == nil) {
        NSLog(@"code错误，请检查demo列表中的code格式是否正确。");
        return;
    }
    
    
    if ([@"001" isEqualToString:code]) {
        [self.navigationController pushViewController:[JQTestViewController new] animated:YES];
        
    } else if ([@"002" isEqualToString:code]) {
        
        
        
    } else if ([@"006" isEqualToString:code]) {
        
        [self.navigationController pushViewController:[SlideBackMainController new] animated:YES];
        
    } else if ([@"007" isEqualToString:code]) {
        
        [self.navigationController pushViewController:[OpenAppURLMainController new] animated:YES];
        
    } else if ([@"008" isEqualToString:code]) {
        
        [self.navigationController pushViewController:[DrawingBoardMainController new] animated:YES];
        
    }
    
}


#pragma mark - 监听方法
/**
 *  点击反馈按钮
 */
-(void) feedbackButtonClick:(UIButton *)button{
    NSLog(@"进入用户反馈界面");
    
    
}


#pragma mark - 其他方法

/**
 *  转圈圈
 *
 *  @param view 旋转的视图
 */
-(void) rotate:(UIView *)view{
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: -M_PI * 2.0 ];
    rotationAnimation.duration = JQMainButtonRotateDuration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = CGFLOAT_MAX;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    
}

@end
