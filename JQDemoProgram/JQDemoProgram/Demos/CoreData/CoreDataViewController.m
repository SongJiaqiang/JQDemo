//
//  CoreDataViewController.m
//  JQDemoProgram
//
//  Created by Whisper-JQ on 16/3/3.
//  Copyright © 2016年 JQTech. All rights reserved.
//

#import "CoreDataViewController.h"

@interface CoreDataViewController ()

@property (nonatomic, strong) NSMutableArray *contacts;

@end

@implementation CoreDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"CoreData";
    
    UIBarButtonItem *refreshItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)];
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(search)];
    self.navigationItem.rightBarButtonItems = @[addItem, refreshItem, searchItem];
}

- (void)add {
    NSLog(@"Add an item");
    
//    [[self.navigationController presentViewController:[[UINavigationController alloc] initWithRootViewController:Newitem]] animated:YES completion:nil];
//    
}

- (void)refresh {
    NSLog(@"Refresh tableView");
}

- (void)search {
    NSLog(@"Searching with keyword");
}


#pragma mark - delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.contacts.count;
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld-%ld", indexPath.section, indexPath.row];
    cell.detailTextLabel.text = @"detailTextLabel";
    cell.imageView.image = [UIImage imageNamed:@"cat_pumpkin"];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}


#pragma mark - lazy loading
-(NSMutableArray *)contacts {
    if (_contacts == nil) {
        _contacts = [NSMutableArray array];
        
    }
    return _contacts;
}



@end
