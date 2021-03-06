//
//  PageInfo.m
//  airtree
//
//  Created by WindShan on 2016/11/14.
//  Copyright © 2016年 Gloria. All rights reserved.
//

#import "PageInfo.h"

@implementation PageInfo

+ (PageInfo *)infoFromDict:(NSDictionary *)dict
{
    PageInfo *info = [[PageInfo alloc] init];
    
    info.ID = [dict objectForKey:@"ClassName"];
    info.name = [dict objectForKey:@"Title"];
    info.image = [dict objectForKey:@"Image"];
    info.selectImage = [dict objectForKey:@"SelectImage"];
    info.unLoad = [[dict objectForKey:@"UnLoad"] boolValue];
    
    return info;
}


+ (NSArray *)pages
{
    NSString *configFile = [[NSBundle mainBundle] pathForResource:@"TabBarPages" ofType:@"plist"];
    NSArray *pageConfigs = [NSArray arrayWithContentsOfFile:configFile];
    NSMutableArray *pages = [[NSMutableArray alloc] init];
    
    if (pageConfigs.count <= 0) {
        BASE_ERROR_FUN(@"没有配置TabBarPages.plist");
    }
    
    for (NSDictionary *dict in pageConfigs) {
        [pages addObject:[PageInfo infoFromDict:dict]];
    }
    
    return pages;
}

+ (NSArray *)pageControllers
{
    NSMutableArray *controllers = [NSMutableArray array];
    NSArray *pages = [PageInfo pages];
    UIViewController *pageController = nil;
    UINavigationController *navPage = nil;
    
    for (PageInfo *pageInfo in pages) {
        if (pageInfo.unLoad) {
            continue;
        }
        
        pageController = [[NSClassFromString(pageInfo.ID) alloc] init];
        navPage = [[UINavigationController alloc] initWithRootViewController:pageController];
        
        pageController.title = pageInfo.name;
        pageController.tabBarItem.image = [[UIImage imageNamed:pageInfo.image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        pageController.tabBarItem.selectedImage = [[UIImage imageNamed:pageInfo.selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        //[[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"Helvetica" size:12.0f],NSFontAttributeName,nil] forState:UIControlStateNormal];
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:MAIN_TAB_ACTIVE_COLOR, NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];

        [controllers addObject:navPage];
    }
    
    return controllers;
}


@end
