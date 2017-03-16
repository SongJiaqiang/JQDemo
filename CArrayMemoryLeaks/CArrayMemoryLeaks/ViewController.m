//
//  ViewController.m
//  CArrayMemoryLeaks
//
//  Created by Jarvis on 3/16/17.
//  Copyright © 2017 Jarvis. All rights reserved.
//

#import "ViewController.h"

#define kArraySize (12)

@implementation ViewController {
    int *_arrayPointer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupArray];
 
    // 稍后调用
    [self printArray];
}

/**
 配置数组
 */
- (void)setupArray {
    
    int array[kArraySize] = {
        11, 12, 13,
        21, 22, 23,
        31, 32, 33,
        41, 42, 43,
    };
    
//    // 直接给指针赋值
//    _arrayPointer = array;
    
    // 使用malloc和memcpy复制内存
    size_t memory_size = kArraySize * sizeof(int);
    _arrayPointer = malloc(memory_size);
    memcpy(_arrayPointer, array, memory_size);
    
    // 立即调用
    [self printArray];
}

/**
 打印数组
 */
- (void)printArray {
    for (int i=0; i<kArraySize; i++) {
        printf("index-%d: %d \n", i, _arrayPointer[i]);
    }
}

@end
