//
//  AppDelegate.h
//  maxi_ios
//
//  Created by Bin Shen on 2017/2/2.
//  Copyright © 2017年 Bin Shen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


+ (AppDelegate *)AppInstance;

- (void)showMainPage;
@end

