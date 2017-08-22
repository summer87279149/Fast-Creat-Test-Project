//
//  BaseWebViewController.m
//  JuJingTianXiaGHD
//
//  Created by Admin on 2017/6/21.
//  Copyright © 2017年 Summer. All rights reserved.
//
#import "BaseWebViewController.h"

@interface BaseWebViewController ()@end

@implementation BaseWebViewController

#pragma mark - setting
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}




- (NSString*)getJsonWith:(NSDictionary*)dic {
    NSString *json = nil;
    
    if ([NSJSONSerialization isValidJSONObject:dic]) {
        
        NSError *error;
        
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        
        if(!error) {
            
            json =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
        else {
            NSLog(@"JSON parse error: %@", error);
        }
    }
    else {
        NSLog(@"Not a valid JSON object: %@", dic);
    }
        return json;
    
}

















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
