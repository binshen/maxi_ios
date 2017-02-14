//
// Created by Bin Shen on 2017/2/12.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "DeviceRechargePage.h"
#import "DeviceConfigPage.h"

@interface DeviceRechargePage() {

}
@end

@implementation DeviceRechargePage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"充值";
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor blackColor], [UIFont systemFontOfSize:20 weight:20], nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil]];
    self.navigationController.navigationBar.titleTextAttributes = dic;

    UIImage* backImage = [UIImage imageNamed:@"btn_back"];
    UIButton* backButton= [[UIButton alloc] initWithFrame:CGRectMake(0,0,16,20)];
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;



    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT-130, SCREEN_WIDTH-40, 40)];
    imageView.image = [UIImage imageNamed:@"btn_confirm_recharge"];
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doRechargeDevice:)]];
    [self.view addSubview:imageView];
}

-(void)doRechargeDevice:(UIGestureRecognizer *)gestureRecognizer {
    DeviceConfigPage * page = [[DeviceConfigPage alloc] initIsFirstPage:NO];
    [self.navigationController pushViewController:page animated:YES];
}

@end