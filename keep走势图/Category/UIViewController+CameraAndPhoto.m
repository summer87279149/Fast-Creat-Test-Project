//
//  UIViewController+CameraAndPhoto.m
//  YZGL
//
//  Created by Admin on 17/2/28.
//  Copyright © 2017年 Admin. All rights reserved.
//
#import "TOCropViewController.h"
#import "UIImage+Mo.h"
#import "UIViewController+CameraAndPhoto.h"
#import <objc/message.h>
@implementation UIViewController (CameraAndPhoto)

-(void)setXt_block:(getImageBlock)xt_block{
    objc_setAssociatedObject(self, @"xt_block", xt_block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(getImageBlock)xt_block{
   return  objc_getAssociatedObject(self, @"xt_block");
}

-(void)openImagePickerWithType:(XTCameraType)type
{
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"选择照片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"现在拍一张照片",@"从相册中选一张照片", nil];
    sheet.tag = 1000;
    NSNumber *typeNumber = [NSNumber numberWithInteger:type];
    objc_setAssociatedObject(sheet, @"cameratype", typeNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [sheet showInView:self.view];
}

#pragma mark - UIActionsheet Delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSNumber *typeNumber = objc_getAssociatedObject(actionSheet, @"cameratype");
    if (buttonIndex == 0&&actionSheet.tag == 1000) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            [self openCameraWithType:[typeNumber integerValue]];
        }
        
    } else if (buttonIndex == 1&&actionSheet.tag == 1000) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            [self openPhotoLibraryWithType:typeNumber];
        }
    }
}
/**
 *  打开相机
 */
- (void)openCameraWithType:(XTCameraType)type
{
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        SKFCamera *homec = [[SKFCamera alloc] init];
        homec.cameraType = type;
        __weak typeof(self) myself = self;
        homec.fininshcapture = ^(UIImage *ss) {
            if (ss) {
                NSLog(@"照片存在");
                // 1.取出选中的图片
                UIImage *originalImage = ss;
                NSData *mData = UIImageJPEGRepresentation(originalImage, 1);
                UIImage *needImage = nil;
                needImage = [UIImage imageWithData:mData];
                CGSize size = needImage.size;
                float height = 200.0f * size.height/size.width;
                needImage = [myself imageWithImageSimple:needImage scaledToSize:CGSizeMake(200.0f, height)];
                NSData *imageData = UIImageJPEGRepresentation(needImage, 1);
                if (myself.xt_block) {
                    myself.xt_block(imageData);
                }
            }
        };
        [myself presentViewController:homec
                             animated:NO
                           completion:^{
                           }];
    } else {
        NSLog(@"相机调用失败");
    }
    
    
    
//    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
//    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
//    ipc.cameraDevice = UIImagePickerControllerCameraDeviceRear;
//    ipc.delegate = self;
//    ipc.allowsEditing = YES;
//    ipc.allowsImageEditing = YES;
//    //    UIViewController *rootVC = [self fl_viewController];
//    [self presentViewController:ipc animated:YES completion:nil];
}

/**
 *  打开相册
 */
- (void)openPhotoLibraryWithType:(NSNumber *)typeNumber
{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    ipc.delegate = self;
//    ipc.allowsEditing = YES;
    objc_setAssociatedObject(ipc, @"cameraType", typeNumber, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    //    UIViewController *rootVC = [self fl_viewController];
    [self presentViewController:ipc animated:YES completion:nil];
}
//
- (UIImage *)createViewImage:(UIView *)shareView {
    UIGraphicsBeginImageContextWithOptions(shareView.bounds.size, NO, [UIScreen mainScreen].scale);
    [shareView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
/**
 *根据给定的size的宽高比自动缩放原图片、自动判断截取位置,进行图片截取
 * UIImage image 原始的图片
 * CGSize size 截取图片的size
 */
-(UIImage *)clipImage:(UIImage *)image toRect:(CGSize)size{
    
    //被切图片宽比例比高比例小 或者相等，以图片宽进行放大
    if (image.size.width*size.height <= image.size.height*size.width) {
        
        //以被剪裁图片的宽度为基准，得到剪切范围的大小
        CGFloat width  = image.size.width;
        CGFloat height = image.size.width * size.height / size.width;
        
        // 调用剪切方法
        // 这里是以中心位置剪切，也可以通过改变rect的x、y值调整剪切位置
        return [UIImage imageFromImage:image inRect:CGRectMake(0, (image.size.height -height)/2, width, height)];
        
    }else{ //被切图片宽比例比高比例大，以图片高进行剪裁
        
        // 以被剪切图片的高度为基准，得到剪切范围的大小
        CGFloat width  = image.size.height * size.width / size.height;
        CGFloat height = image.size.height;
        
        // 调用剪切方法
        // 这里是以中心位置剪切，也可以通过改变rect的x、y值调整剪切位置
        return [UIImage imageFromImage:image inRect:CGRectMake((image.size.width -width)/2, 0, width, height)];
    }
    return nil;
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //    NSValue *value = [info objectForKey:UIImagePickerControllerCropRect] ;
    //    CGRect  rect = value.CGRectValue;
    //    NSLog(@"选择完图片的info：%@,cgrect 是:%@",info,rect);
//    [picker dismissViewControllerAnimated:YES completion:nil];
    
//    // 1.取出选中的图片
//    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
//    //    UIImage * originalImage =  [UIImage imageFromImage:originalImageeee inRect:rect];
//    NSData *mData = UIImageJPEGRepresentation(originalImage, 1);
//    UIImage *needImage = nil;
//    
//    needImage = [UIImage imageWithData:mData];
//    
//    CGSize size = needImage.size;
//    float height = 200.0f * size.height/size.width;
//    needImage = [self imageWithImageSimple:needImage scaledToSize:CGSizeMake(200.0f, height)];
//    NSData *imageData = UIImageJPEGRepresentation(needImage, 1);
//    
   //周四在此修改
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    TOCropViewController *cropController = [[TOCropViewController alloc] initWithImage:originalImage];
    cropController.delegate = self;
    NSNumber*typeNum = objc_getAssociatedObject(picker, @"cameraType");
    cropController.cameraType = [typeNum integerValue];
    [picker presentViewController:cropController animated:YES completion:nil];
    
    
    
}

//按比例压缩
- (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
    
}

#pragma mark - TOCropViewController代理
- (void)cropViewController:(TOCropViewController *)cropViewController didCropToImage:(UIImage *)image withRect:(CGRect)cropRect angle:(NSInteger)angle{
    
    NSData *imageData = UIImageJPEGRepresentation(image, 1);
    if (self.xt_block) {
        self.xt_block(imageData);
    }
   
    
        [self dismissViewControllerAnimated:NO completion:^{
        }];
        [self dismissViewControllerAnimated:NO completion:^{
        }];
    
    


}
#pragma mark - 返回当前所在控制器
- (UIViewController *)imc_viewController:(UIViewController *)vc {
    UIResponder *responder = vc;
    while ([responder isKindOfClass:[UIView class]]) {
        responder = responder.nextResponder;
    }
    return (UIViewController *)responder;
}
- (UIViewController *)fl_viewController{
    
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    // modal
    if (vc.presentedViewController) {
        if ([vc.presentedViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *navVc = (UINavigationController *)vc.presentedViewController;
            vc = navVc.visibleViewController;
        }
        else if ([vc.presentedViewController isKindOfClass:[UITabBarController class]]){
            UITabBarController *tabVc = (UITabBarController *)vc.presentedViewController;
            if ([tabVc.selectedViewController isKindOfClass:[UINavigationController class]]) {
                UINavigationController *navVc = (UINavigationController *)tabVc.selectedViewController;
                return navVc.visibleViewController;
            }
            else{
                return tabVc.selectedViewController;
            }
        }
        else{
            vc = vc.presentedViewController;
            
        }
    }
    // push
    else{
        if ([vc isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tabVc = (UITabBarController *)vc;
            if ([tabVc.selectedViewController isKindOfClass:[UINavigationController class]]) {
                UINavigationController *navVc = (UINavigationController *)tabVc.selectedViewController;
                return navVc.visibleViewController;
            }
            else{
                return tabVc.selectedViewController;
            }
        }
        else if([vc isKindOfClass:[UINavigationController class]]){
            UINavigationController *navVc = (UINavigationController *)vc;
            vc = navVc.visibleViewController;
        }
    }
    return vc;
}


@end
