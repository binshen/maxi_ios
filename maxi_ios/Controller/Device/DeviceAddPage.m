//
// Created by Bin Shen on 2017/2/12.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "DeviceAddPage.h"
#import "DeviceMainPage.h"

@interface DeviceAddPage() {

}
@end

@implementation DeviceAddPage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"设备配对";
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor whiteColor], [UIFont systemFontOfSize:20 weight:20], nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil]];
    self.navigationController.navigationBar.titleTextAttributes = dic;

    UIImage *backImage = [UIImage imageNamed:@"btn_back2"];
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 16, 20)];
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;

    UIImage *bg_image = [UIImage imageNamed:@"icon_wifi"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:bg_image];
    imageView.center = CGPointMake(SCREEN_WIDTH/2, bg_image.size.height/2+30);
    [self.view addSubview:imageView];

    CGFloat _height = bg_image.size.height+30;
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, _height+30, SCREEN_WIDTH, 30)];
    label1.text = @"连接WIFI";
    label1.textColor = [UIColor grayColor];
    label1.font = FONT18;
    label1.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label1];

    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, _height+60, SCREEN_WIDTH, 30)];
    label2.text = @"连接一个可用的WIFI，让设备接入网络";
    label2.textColor = [UIColor grayColor];
    label2.font = FONT12;
    label2.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label2];

    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(20, _height+90, SCREEN_WIDTH-40, 100)];
    imageView2.image = [UIImage imageNamed:@"bg_wifi"];
    [self.view addSubview:imageView2];

    UITextField *wifiNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(25, _height+90, SCREEN_WIDTH-50, 50)];
    wifiNameTextField.placeholder = @"WIFI名称";
    [self.view addSubview:wifiNameTextField];

    UITextField *wifiPswTextField = [[UITextField alloc] initWithFrame:CGRectMake(25, _height+140, SCREEN_WIDTH-50, 50)];
    wifiPswTextField.placeholder = @"请输入密码";
    [self.view addSubview:wifiPswTextField];

    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT-130, SCREEN_WIDTH-40, 40)];
    imageView3.image = [UIImage imageNamed:@"btn_next"];
    imageView3.userInteractionEnabled = YES;
    [imageView3 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doAddDevice:)]];
    [self.view addSubview:imageView3];
}

-(void)doAddDevice:(UIGestureRecognizer *)gestureRecognizer {
    DeviceMainPage * page = [[DeviceMainPage alloc] initIsFirstPage:NO];
    [self.navigationController pushViewController:page animated:YES];
}

@end