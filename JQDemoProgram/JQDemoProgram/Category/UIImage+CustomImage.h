//
//  UIImage+CustomImage.h
//  JQDemoProgram
//
//  Created by Whisper-JQ on 15/11/8.
//  Copyright © 2015年 JQTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CustomImage)


/** 倾斜圆角矩形 */
- (UIImage *)meowImageWithSize:(CGSize)size text:(NSString *)text textAttr:(NSDictionary *)textAttr bgColor:(UIColor *)bgColor offset:(CGFloat)offset radius:(CGFloat)radius mode:(CGPathDrawingMode)mode;



@end
