//
//  Demo.m
//  JQDemoProgram
//
//  Created by Whisper-JQ on 15/11/8.
//  Copyright © 2015年 JQTech. All rights reserved.
//

#import "Demo.h"

@implementation Demo


- (id) initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        
        if (dict[@"code"]) {
            _code = dict[@"code"];
        }
        if (dict[@"name"]) {
            _name = dict[@"name"];
        }
        
        if (dict[@"desc"]) {
            _desc = dict[@"desc"];
        }
        
        if (dict[@"controller"]) {
            _controller = dict[@"controller"];
        }
        
        
        
        
        
    }
    return self;
}

+ (instancetype)demoWithDictionary:(NSDictionary *)dict{
    Demo *demo = [[Demo alloc] initWithDictionary:dict];
    return demo;
}

+(NSArray *)demoList{
    
    NSMutableArray *demos = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"demoList" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    for (NSDictionary *dict in array) {
        Demo *demo = [Demo demoWithDictionary:dict];
        if (demo) {
            [demos addObject:demo];
        }
    }
    
    return demos;
}
@end
