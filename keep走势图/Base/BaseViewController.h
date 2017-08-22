//
//  BaseViewController.h
//  Driver
//
//  Created by Admin on 17/2/13.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, RequestType) {
    RequestTypeHeader,
    RequestTypeFooter
};
@interface BaseViewController : UIViewController


-(void)startLoadingAnimation;
-(void)stopLoadingAnimation;
@end
