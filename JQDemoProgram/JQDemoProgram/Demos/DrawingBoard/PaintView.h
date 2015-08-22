//
//  PaintView.h
//  JQDemoProgram
//
//  Created by 宋佳强 on 15/8/22.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaintView : UIView


// 笔触颜色
@property (nonatomic, strong) UIColor *color;
// 笔触宽度
@property (nonatomic, assign) CGFloat width;
// 附加图片
//@property (nonatomic, strong) UIImage *image;

/** 撤销 */
- (void)undo;
/** 重做 */
- (void)redo;
/** 清空 */
- (void)clearAll;




@end
