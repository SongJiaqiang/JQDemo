//
//  Demo.h
//  JQDemoProgram
//
//  Created by Whisper-JQ on 15/11/8.
//  Copyright © 2015年 JQTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Demo : NSObject

@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *controller;

- (id) initWithDictionary:(NSDictionary *)dict;
+ (instancetype)demoWithDictionary:(NSDictionary *)dict;

+(NSArray *)demoList;

@end
