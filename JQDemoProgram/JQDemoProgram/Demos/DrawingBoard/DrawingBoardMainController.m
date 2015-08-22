//
//  DrawingBoardMainController.m
//  JQDemoProgram
//
//  Created by 宋佳强 on 15/8/22.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import "DrawingBoardMainController.h"

#import "MBProgressHUD+Ext.h"


@interface DrawingBoardMainController ()



@property (weak, nonatomic) IBOutlet UIButton *undoButton;
@property (weak, nonatomic) IBOutlet UIButton *redoButton;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;
@property (weak, nonatomic) IBOutlet UIButton *eraseButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *openButton;

@property (weak, nonatomic) IBOutlet UIView *colorsView;
@property (weak, nonatomic) IBOutlet UIView *paintView;



- (IBAction)undoButtonClick;
- (IBAction)redoButtonClick;
- (IBAction)clearButtonClick;
- (IBAction)eraseButtonClick;
- (IBAction)saveButtonClick;
- (IBAction)openButtonClick;


@property (nonatomic, strong) NSMutableArray *colorList;
@property (nonatomic, strong) NSMutableArray *colorButtonList;


@end

@implementation DrawingBoardMainController
#pragma mark - lazy
-(NSMutableArray *)colorList{
    if (!_colorList) {
        
        _colorList = [NSMutableArray array];
        [_colorList addObject:[UIColor blackColor]];
        [_colorList addObject:[UIColor magentaColor]];
        [_colorList addObject:[UIColor grayColor]];
        [_colorList addObject:[UIColor redColor]];
        [_colorList addObject:[UIColor greenColor]];
        [_colorList addObject:[UIColor blueColor]];
        [_colorList addObject:[UIColor yellowColor]];
        [_colorList addObject:[UIColor orangeColor]];
        
    }
    return _colorList;
}

-(NSMutableArray *)colorButtonList{
    if (!_colorButtonList) {
        _colorButtonList = [NSMutableArray array];

    }
    return _colorButtonList;
}


#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // nav
    self.navigationItem.title = @"涂鸦板";
    
    [self setupColorsView];
    
}









#pragma mark - listener

- (IBAction)undoButtonClick{
    
}
- (IBAction)redoButtonClick{
    
}
- (IBAction)clearButtonClick{
    
}
- (IBAction)eraseButtonClick{
    
}
- (IBAction)saveButtonClick{
    
    // 获取图片
    UIImage *paintImage = [self getPaintViewImage];
    
    // 保存到相册
    UIImageWriteToSavedPhotosAlbum(paintImage, self, @selector(image:didFinishedSavingWithError:contextRef:), nil);
    
    
}
- (IBAction)openButtonClick{
    
}

/** 保存图片到相册的监听方法    */
- (void)image:(UIImage *)image didFinishedSavingWithError:(NSError *)error contextRef:(CGContextRef)contextRef{
    
    if (error) {
        [MBProgressHUD showError:@"保存失败"];
    }else {
        [MBProgressHUD showSuccess:@"保存成功"];
    }
}


#pragma mark - ui
- (void) setupColorsView{
    

    CGFloat btnWidth = 30;
    CGFloat margin = 5;
    
    for (int i=0 ; i<self.colorList.count; i++) {
        UIColor *color = self.colorList[i];
        
        if (![color isKindOfClass:[UIColor class]]) {
            continue;
        }
        
        UIButton *button = [[UIButton alloc] init];
        button.backgroundColor = color;
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        button.tag = i;
        
        // round
        button.layer.cornerRadius = btnWidth*0.5;
        
        // target
        [button addTarget:self action:@selector(colorButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        CGFloat x = margin + (margin + btnWidth)*i;
        button.frame = CGRectMake(x, 0, btnWidth, btnWidth);
        
        [self.colorsView addSubview:button];
        
        [self.colorButtonList addObject:button];
    
        // select first button
        if (i==0) {
            [self colorButtonClick:button];
        }
        
    }
    
    
}


#pragma mark - other
- (void)useRoundBorder {
    
    for (UIButton *button in self.colorButtonList) {
        button.layer.cornerRadius = button.frame.size.height * 0.5;
    }
    

}

- (void)useColor {
    
    for (int i=0; i<self.colorButtonList.count; i++) {
        UIButton *button = self.colorButtonList[i];
        button.backgroundColor = self.colorList[i];
    }
    
    
}



- (void)colorButtonClick:(UIButton *)button {
    
    for (UIButton *btn in self.colorButtonList) {
        btn.layer.borderWidth = 0;
    }
    
    button.layer.borderWidth = 4;
    
}

- (UIImage *)getPaintViewImage{
    // 开启上下文操作
    UIGraphicsBeginImageContextWithOptions(self.paintView.frame.size, NO, 0);
    
    // 获取当前上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    // 把画板内容渲染到上下文
    [self.paintView.layer renderInContext:contextRef];
    
    // 从上下文获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}


@end
