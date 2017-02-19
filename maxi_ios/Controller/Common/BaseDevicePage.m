//
// Created by Bin Shen on 19/02/2017.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "BaseDevicePage.h"


@implementation BaseDevicePage

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *backImage = [UIImage imageNamed:@"btn_back2"];
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 16, 20)];
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

@end