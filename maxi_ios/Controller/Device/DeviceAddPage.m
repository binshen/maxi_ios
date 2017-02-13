//
// Created by Bin Shen on 2017/2/12.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "DeviceAddPage.h"


@interface DeviceAddPage() {

}
@end

@implementation DeviceAddPage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"设备配对";
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor blackColor], [UIFont systemFontOfSize:20 weight:20], nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil]];
    self.navigationController.navigationBar.titleTextAttributes = dic;

    UIImage *backImage = [UIImage imageNamed:@"btn_back"];
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 16, 20)];
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;

    UIImage *bg_image = [UIImage imageNamed:@"icon_wifi"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:bg_image];
    imageView.center = CGPointMake(SCREEN_WIDTH/2, bg_image.size.height+10);
    [self.view addSubview:imageView];
}


@end