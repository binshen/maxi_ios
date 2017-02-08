//
// Created by Bin Shen on 2017/2/8.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "HomePage.h"

@interface HomePage() {


}
@end

@implementation HomePage

- (void)viewDidLoad {
    [super viewDidLoad];

//    UINavigationBar *navBar = self.navigationController.navigationBar;
//    #define kSCNavBarImageTag 10
//    if ([navBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
//        //if iOS 5.0 and later
//        [navBar setBackgroundImage:[UIImage imageNamed:@"navbar1.png"] forBarMetrics:UIBarMetricsDefault];
//    } else {
//        UIImageView *imageView = (UIImageView *)[navBar viewWithTag:kSCNavBarImageTag];
//        if (imageView == nil) {
//            imageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"navbar1.png"]];
//            [imageView setTag:kSCNavBarImageTag];
//            [navBar insertSubview:imageView atIndex:0];
//        }
//    }

    self.navigationController.navigationBar.backgroundColor = kUIColorFromRGB(0x2698f9);
    self.navigationController.navigationItem.hidesBackButton = true;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_logo.png"] forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end