//
//  UserModel.h
//  YZGL
//
//  Created by Admin on 17/3/2.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#define USER_NAME                           @"ud_user_name"
#define USER_ID                             @"ud_user_id"
#define USER_PHONE                          @"phoneNumber"

@interface UserModel : NSObject

+(instancetype)shareManager;

+(BOOL)setUsername:(NSString*)userName;
+ (NSString *)username;

+(BOOL)setPhoneNumber:(NSString*)phoneNumber;
+ (NSString *)phoneNumber;

+(BOOL)setUserId:(NSString*)userId;
+ (NSString *)userId;

+ (BOOL)didLogin;
+ (void)logOut;

@end
