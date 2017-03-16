//
//  ConstantColors.h
//  JQDemoProgram
//
//  Created by Whisper-JQ on 15/11/9.
//  Copyright © 2015年 JQTech. All rights reserved.
//

#ifndef ConstantColors_h
#define ConstantColors_h

#define UIColorWithRGBA(r, g, b, a) [UIColor colorWithRed:(r / 255.0f) green:(g / 255.0f) blue:(b / 255.0f) alpha:a]
#define UIColorWithRGB(r, g, b) UIColorWithRGBA(r, g, b, 1)
#define UIColorWithHex(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0xFF00) >> 8))/255.0 \
blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]


// simple color
#define kWhiteColor [UIColor whiteColor]
#define kClearColor [UIColor clearColor]
#define kBlackColor [UIColor BlackColor]

#define kRedColor [UIColor redColor]

#define ColorWhisperPurple UIColorWithRGB(119,47,255)
#define ColorWhisperGray UIColorWithRGB(235,235,235)







#endif /* ConstantColors_h */
