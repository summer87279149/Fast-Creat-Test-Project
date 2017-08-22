//
//  UserModel.m
//  YZGL
//
//  Created by Admin on 17/3/2.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+(instancetype)shareManager
{
    static UserModel *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       manager = [[UserModel alloc]init];
    });
    return manager;
}

//MARK: - username
+(BOOL)setUsername:(NSString*)userName{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:userName forKey:USER_NAME];
   return [ud synchronize];
}
+ (NSString *)username{
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:USER_NAME];
    return username;
}

//MARK: - phoneNumber
+(BOOL)setPhoneNumber:(NSString*)phoneNumber{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:phoneNumber forKey:USER_PHONE];
   return [ud synchronize];
}
+ (NSString *)phoneNumber{
    NSString *phoneNumber = [[NSUserDefaults standardUserDefaults] objectForKey:USER_PHONE];
    return  phoneNumber;
}

//MARK: - userId
+(BOOL)setUserId:(NSString*)userId{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:userId forKey:USER_ID];
    return [ud synchronize];
}
+ (NSString *)userId{
    NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:USER_ID];
    return userId;
}

+ (BOOL)didLogin{
    BOOL login = NO;
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if ([ud objectForKey:USER_ID]) {
        login = YES;
    }
    return login;
}
+ (void)logOut{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:nil forKey:USER_NAME];
    [ud setObject:nil forKey:USER_ID];
    [ud setObject:nil forKey:USER_PHONE];
    [ud synchronize];
}



@end
