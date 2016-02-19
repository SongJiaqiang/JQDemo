//
//  GalleryImagePickerView.h
//  JQDemoProgram
//
//  Created by Whisper-JQ on 16/2/18.
//  Copyright © 2016年 JQTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GalleryImagePickerViewDelegate <NSObject>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@interface GalleryImagePickerView : UIView

@property (nonatomic, assign) id<GalleryImagePickerViewDelegate> delegate;
@property (nonatomic, strong) UIColor *mainColor;


- (void)show;
- (void)hide;

@end
