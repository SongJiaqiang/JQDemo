//
//  RoundButton.h
//  JQDemoProgram
//
//  Created by 宋佳强 on 15/8/26.
//  Copyright (c) 2015年 JQTech. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 按钮类型 */
typedef enum {
    RoundButtonTypeDefault = 0,
    RoundButtonTypeLeftMiddle,
    RoundButtonTypeLeftTop,
    RoundButtonTypeLeftBottom,
    RoundButtonTypeRightMiddle,
    RoundButtonTypeRightTop,
    RoundButtonTypeRightBottom
} RoundButtonType;

struct CornerRadiusRect {
    CGFloat topLeft;
    CGFloat topRight;
    CGFloat bottomLeft;
    CGFloat bottomRight;
};
typedef struct CornerRadiusRect CornerRadiusRect;


@interface RoundButton : UIButton

@property (nonatomic, assign) RoundButtonType type;

@property (nonatomic, assign) CornerRadiusRect radiusRect;


@end
