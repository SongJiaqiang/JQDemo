//
//  CoreDataViewController.h
//  JQDemoProgram
//
//  Created by Whisper-JQ on 16/3/3.
//  Copyright © 2016年 JQTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoreDataViewController : UITableViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end
