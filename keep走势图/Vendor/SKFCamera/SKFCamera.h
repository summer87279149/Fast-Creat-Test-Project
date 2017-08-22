
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,XTCameraType){
    XTCameraTypeA4Paper,
    XTCameraTypeSeal,//1:1
    XTCameraTypeCircleSeal,
    XTCameraTypeIdCard,
    XTCameraTypeHuKou,
};
typedef void (^fininshcapture)(UIImage *image);
@interface SKFCamera : UIViewController
@property (nonatomic,copy) fininshcapture fininshcapture;
@property (nonatomic, assign) XTCameraType cameraType;
@end
