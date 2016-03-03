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
#import "SaveToAlbumMainController.h"
#import "RoundButtonMainController.h"
#import "JQBezierIconController.h"
#import "TableViewTestController.h"

#import "UMFeedback.h"
#import "Demo.h"

@interface MainViewController ()

/**
 *  demo信息数组（从plist文件中获取）
 */
@property (nonatomic, strong) NSArray *demoList;

/**
 *  反馈按钮
 */
@property (nonatomic, weak) UIButton *feedbackButton;

@property (nonatomic, weak) UITextField *controllerNameField;


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
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self setupSearchBar];
    
    // feedback
//    [self.feedbackButton addTarget:self action:@selector(feedbackButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 启用侧滑返回
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    // 旋转button
//    self.feedbackButton.hidden = NO;
//    [self rotate:self.feedbackButton];

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    self.feedbackButton.hidden = YES;
}

#pragma mark setup
- (void)setupSearchBar{
    
    UIColor *textColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1];
    
    UIView *view = [UIView new];
    view.frame = CGRectMake(0, 0, ScreenWidth, 40);
    view.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:button];
    button.frame = CGRectMake(ScreenWidth-10-60, 5, 60, 30);
    button.backgroundColor= [UIColor clearColor];
    [self roundCornerView:button];
    [button setTitle:@"GO" forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UITextField *field = [UITextField new];
    [view addSubview:field];
    _controllerNameField = field;
    field.frame = CGRectMake(10, 5, ScreenWidth-10-10-button.frame.size.width-10, 30);
    [self roundCornerView:field];
    field.font = [UIFont systemFontOfSize:14];
    field.textColor = textColor;
    field.placeholder = @"Controller class name";
    field.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 30)];
    field.leftViewMode = UITextFieldViewModeAlways;
    
    
    self.tableView.tableHeaderView = view;
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

    
    Demo *demo = self.demoList[indexPath.row];
    
    if (demo.controller) {
        Class className = NSClassFromString(demo.controller);
        UIViewController *controller = [className new];
        [self.navigationController pushViewController:controller animated:YES];
    }else {
        [MBProgressHUD showError:@"this controller do not found"];
    }
}


#pragma mark - 监听方法
/**
 *  点击反馈按钮
 */
-(void) feedbackButtonClick:(UIButton *)button{
    NSLog(@"进入用户反馈界面");
    
    [self presentViewController:[UMFeedback feedbackModalViewController] animated:YES completion:nil];
    
}

- (void)buttonClick:(UIButton*)button{
    
    NSString *controllerName = self.controllerNameField.text;
    if (controllerName == nil || controllerName.length == 0) {
        return;
    }
    
    Class controller = NSClassFromString(controllerName);
    [self.navigationController pushViewController:[controller new] animated:YES];
    
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

- (void)roundCornerView:(UIView *)view{
    view.clipsToBounds = YES;
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 5;
    view.layer.borderWidth = 1;
    view.layer.borderColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1].CGColor;
}


@end
