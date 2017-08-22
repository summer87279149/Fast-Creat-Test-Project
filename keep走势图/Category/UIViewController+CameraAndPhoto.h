//
//  UIViewController+CameraAndPhoto.h
//  YZGL
//
//  Created by Admin on 17/2/28.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TOCropViewController.h"
typedef void(^getImageBlock)(NSData*data);

@interface UIViewController (CameraAndPhoto)<UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextFieldDelegate,UIScrollViewDelegate,UIActionSheetDelegate,TOCropViewControllerDelegate>

@property (nonatomic, copy) getImageBlock xt_block;

/**
弹出actionsheet，选择拍照和照片库，一次选择最多9张图片
 */
-(void)openImagePickerWithType:(XTCameraType)type;
@end
