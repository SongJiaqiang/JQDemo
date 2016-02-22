//
//  ContactViewController.m
//  JQDemoProgram
//
//  Created by Whisper-JQ on 15/11/9.
//  Copyright © 2015年 JQTech. All rights reserved.
//

#import "ContactViewController.h"

#import <AddressBookUI/ABPeoplePickerNavigationController.h>
#import <AddressBook/ABPerson.h>
#import <AddressBookUI/ABPersonViewController.h>

#import "MBProgressHUD+Ext.h"

#define kKeyWindow [UIApplication sharedApplication].keyWindow

@interface ContactViewController ()
<
    UITableViewDataSource,
    UITableViewDelegate,
    ABPeoplePickerNavigationControllerDelegate,
    UIAlertViewDelegate
>

@property (nonatomic, weak) UIButton *avatorButton;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *phoneLabel;

@property (nonatomic, weak) UIView *emptyView;

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation ContactViewController{
    UIImage *_originalImage;
    UIImage *_thumbnailImage;
    CGRect _imageFrame;
    
    BOOL _editMode;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = @"通讯录";
    [self setupRightItems];
    
    
    [self setupTableView];
    [self setupTopView];

    [self setupEmptyView];
}

- (void)setupRightItems{
    if (_editMode) {
        UIBarButtonItem *deleteItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteItemClick:)];
        
        UIBarButtonItem *finishItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(finishItemClick:)];
        
        self.navigationItem.rightBarButtonItems = @[finishItem, deleteItem];
    }else{
        UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editItemClick:)];
        
        self.navigationItem.rightBarButtonItems = @[editItem];
    }

}

- (void)setupTableView{
    
    if (!_tableView) {
        UITableView *tableView = [UITableView newAutoLayoutView];
        [self.view addSubview:tableView];
        _tableView = tableView;
        tableView.delegate = self;
        tableView.dataSource = self;
        
     
        [tableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(80, 0, 0, 0)];
    }
}

- (void)setupTopView{
    
    UIView *headerView = [UIView new];
    [self.view addSubview:headerView];
    headerView.backgroundColor = UIColorWithHex(0x282B35);
    
    UIButton *avatorButton = [UIButton newAutoLayoutView];
    [headerView addSubview:avatorButton];
    _avatorButton = avatorButton;
    avatorButton.clipsToBounds = YES;
    avatorButton.layer.masksToBounds = YES;
    avatorButton.layer.cornerRadius = 30;
    avatorButton.backgroundColor = kWhiteColor;
    [avatorButton addTarget:self action:@selector(avatorButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *nameLabel = [UILabel newAutoLayoutView];
    [headerView addSubview:nameLabel];
    _nameLabel = nameLabel;
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.textColor = kWhiteColor;
    nameLabel.text = @"user name";
    
    UILabel *phoneLabel = [UILabel newAutoLayoutView];
    [headerView addSubview:phoneLabel];
    _phoneLabel = phoneLabel;
    phoneLabel.font = [UIFont systemFontOfSize:12];
    phoneLabel.textColor = kWhiteColor;
    phoneLabel.text = @"134 1234 1234";
    
    UIButton *editButton = [UIButton newAutoLayoutView];
    [headerView addSubview:editButton];
    [editButton addTarget:self action:@selector(editButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [editButton setTitle:@"编辑" forState:UIControlStateNormal];
    [editButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
    editButton.titleLabel.font = kSystemFontOfSize(13);
    
    
    // autolayout
    [headerView autoSetDimension:ALDimensionHeight toSize:80];
    [headerView autoPinEdgesToSuperviewEdgesOnAxis:ALAxisHorizontal];
    [headerView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:64];
    
    [avatorButton autoSetDimension:ALDimensionHeight toSize:60];
    [avatorButton autoSetDimension:ALDimensionWidth toSize:60];
    [avatorButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 10, 0) excludingEdge:ALEdgeRight];
    
    [nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:avatorButton withOffset:10];
    [nameLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [nameLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    
    [phoneLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:avatorButton withOffset:10];
    [phoneLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [phoneLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:20];
    
    [editButton autoSetDimension:ALDimensionWidth toSize:20];
    [editButton autoSetDimension:ALDimensionHeight toSize:20];
    [editButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:5];
    [editButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:5];
    
}

- (void)setupEmptyView{
    
    if (!_emptyView) {
        UIView *emptyView = [UIView newAutoLayoutView];
        [self.view addSubview:emptyView];
        _emptyView = emptyView;
        emptyView.backgroundColor = kWhiteColor;
        
        UILabel *titleLabel = [UILabel newAutoLayoutView];
        [emptyView addSubview:titleLabel];
        titleLabel.font = kSystemBoldFontOfSize(16);
        titleLabel.textColor = UIColorWithHex(0x999999);
        titleLabel.text = @"没有数据";
        
        UILabel *messageLabel = [UILabel newAutoLayoutView];
        [emptyView addSubview:messageLabel];
        messageLabel.numberOfLines = 2;
        messageLabel.font = kSystemFontOfSize(12);
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.textColor = UIColorWithHex(0xcccccc);
        messageLabel.text = @"点击屏幕重新加载";
        
        UIButton *coverButton = [UIButton newAutoLayoutView];
        [emptyView addSubview:coverButton];
        coverButton.backgroundColor = kClearColor;
        [coverButton addTarget:self action:@selector(coverButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        // autolayout
//        [emptyView autoPinEdgesToSuperviewEdges];
        [emptyView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(80+64, 0, 0, 0)];

        [titleLabel autoCenterInSuperview];
        
        [messageLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:titleLabel withOffset:5];
        [messageLabel autoPinEdgesToSuperviewEdgesOnAxis:ALAxisHorizontal withInset:30];
        
        [coverButton autoPinEdgesToSuperviewEdges];
        
    }
    
    
}


#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"cell - %ld", indexPath.row];
    
    return cell;
}


#pragma mark - peoplePickerNavigationController delegate
-(void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];

    NSString *phone;
    if (property == kABPersonPhoneProperty) {
        // phonenumber
        ABMultiValueRef phoneRef = ABRecordCopyValue(person, property);
        if (phoneRef) {
            CFStringRef selectLabel = ABMultiValueCopyValueAtIndex(phoneRef, identifier);
            phone = (__bridge NSString *)selectLabel;
        }
        _phoneLabel.text = phone;
        
        // name
        NSString *firstname = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
        NSString *lastname = (__bridge NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
        NSString *fullname = @"";
        if (firstname != nil) {
            fullname = [fullname stringByAppendingString:firstname];
        }
        if (lastname != nil) {
            fullname = [fullname stringByAppendingString:@" "];
            fullname = [fullname stringByAppendingString:lastname];
        }
        _nameLabel.text = fullname;
        
        if (ABPersonHasImageData(person)) {
            
            UIImage *originalImage = [UIImage imageWithData:(__bridge NSData *)ABPersonCopyImageDataWithFormat(person, kABPersonImageFormatOriginalSize)];
            UIImage *thumbnailImage = [UIImage imageWithData:(__bridge NSData *)ABPersonCopyImageDataWithFormat(person, kABPersonImageFormatThumbnail)];
            
            [_avatorButton setImage:thumbnailImage forState:UIControlStateNormal];
            
            _originalImage = originalImage;
            _thumbnailImage = thumbnailImage;
        }
    }
    
}

-(void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark alertView delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            
            break;
        case 1:
            
            _editMode = NO;
            [self setupRightItems];
            
            break;
            
        default:
            break;
    }
}

#pragma mark - event 
- (void)editButtonClick:(UIButton *)button{
    
    NSLog(@"edit user info");
    
    ABPeoplePickerNavigationController *pickerController = [[ABPeoplePickerNavigationController alloc] init];
    pickerController.peoplePickerDelegate = self;
    [self presentViewController:pickerController animated:YES completion:nil];
    
}

- (void)coverButtonClick:(UIButton *)button{
    
    NSLog(@"load contacts");
    
    [MBProgressHUD showMessage:@"loading" toView:_emptyView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:_emptyView];
        _emptyView.hidden = YES;
        _emptyView = nil;
    });
    
}

- (void)avatorButtonClick:(UIButton *)button{
    
    if (button.imageView.image == nil) return;
    
    if (!_imageView) {
        UIImageView *imageView = [UIImageView new];
        [kKeyWindow addSubview:imageView];
        imageView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
        imageView.image = button.imageView.image;
        CGRect imageFrame = [button convertRect:button.frame toView:kKeyWindow];
        imageView.frame = imageFrame;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTap:)];
        [imageView addGestureRecognizer:tap];
        imageView.userInteractionEnabled = YES;
        
        _imageView = imageView;
        _imageFrame = imageFrame;
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        _imageView.frame = kKeyWindow.frame;
    } completion:^(BOOL finished) {
        if (_originalImage) {
            _imageView.image = _originalImage;
        }
    }];
}

- (void)editItemClick:(UIBarButtonItem *)item{
    _editMode = YES;
    [self setupRightItems];
}

- (void)finishItemClick:(UIBarButtonItem *)item{
    _editMode = NO;
    [self setupRightItems];
}

- (void)deleteItemClick:(UIBarButtonItem *)item{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"重要提示" message:@"数据删除后无法回复，请谨慎选择。" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];
}

#pragma mark - gesture
- (void)imageViewTap:(UITapGestureRecognizer *)gesture{
    [UIView animateWithDuration:0.25 animations:^{
        _imageView.frame = _imageFrame;
    } completion:^(BOOL finished) {
        [_imageView removeFromSuperview];
        _imageView = nil;
    }];
}

@end
