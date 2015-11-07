//
//  TableViewTest1Cell.m
//  JQDemoProgram
//
//  Created by Whisper-JQ on 15/11/4.
//  Copyright © 2015年 JQTech. All rights reserved.
//

#import "TableViewTest1Cell.h"

@interface TableViewTest1Cell ()

@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation TableViewTest1Cell

-(instancetype)init{
    if (self = [super init]) {
        
        self = [[NSBundle mainBundle] loadNibNamed:@"TableViewTest1Cell" owner:nil options:nil].lastObject;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.photoView.backgroundColor = [UIColor colorWithRed:(arc4random_uniform(256)/255.0) green:(arc4random_uniform(256)/255.0) blue:(arc4random_uniform(256)/255.0) alpha:1];
        
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"test1Cell";
    TableViewTest1Cell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[TableViewTest1Cell alloc] init];
    }
    
    return cell;
}

@end
