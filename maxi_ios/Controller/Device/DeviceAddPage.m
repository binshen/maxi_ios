//
// Created by Bin Shen on 2017/2/12.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "DeviceAddPage.h"
#import "DeviceMainPage.h"
#import "TPKeyboardAvoidingScrollView.h"

@interface DeviceAddPage() {

    UITextField *wifiNameTextField;
    UITextField *wifiPswTextField;
}
@end

@implementation DeviceAddPage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"设备配对";

    TPKeyboardAvoidingScrollView *containerView = [[TPKeyboardAvoidingScrollView alloc] initWithFrame:self.view.frame];

    UIImage *bg_image = [UIImage imageNamed:@"icon_wifi"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:bg_image];
    imageView.center = CGPointMake(SCREEN_WIDTH/2, bg_image.size.height/2+30);
    [containerView addSubview:imageView];

    CGFloat _height = bg_image.size.height+30;
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, _height+30, SCREEN_WIDTH, 30)];
    label1.text = @"连接WIFI";
    label1.textColor = [UIColor grayColor];
    label1.font = FONT18;
    label1.textAlignment = NSTextAlignmentCenter;
    [containerView addSubview:label1];

    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, _height+60, SCREEN_WIDTH, 30)];
    label2.text = @"连接一个可用的WIFI，让设备接入网络";
    label2.textColor = [UIColor grayColor];
    label2.font = FONT12;
    label2.textAlignment = NSTextAlignmentCenter;
    [containerView addSubview:label2];

    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(20, _height+90, SCREEN_WIDTH-40, 100)];
    imageView2.image = [UIImage imageNamed:@"bg_wifi"];
    [containerView addSubview:imageView2];

    wifiNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(25, _height+90, SCREEN_WIDTH-50, 50)];
    wifiNameTextField.placeholder = @"WIFI名称";
    [containerView addSubview:wifiNameTextField];

    wifiPswTextField = [[UITextField alloc] initWithFrame:CGRectMake(25, _height+140, SCREEN_WIDTH-50, 50)];
    wifiPswTextField.placeholder = @"请输入密码";
    [containerView addSubview:wifiPswTextField];

    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT-130, SCREEN_WIDTH-40, 40)];
    imageView3.image = [UIImage imageNamed:@"btn_next"];
    imageView3.userInteractionEnabled = YES;
    [imageView3 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doAddDevice:)]];
    [containerView addSubview:imageView3];

    containerView.contentSize = CGSizeMake(self.view.frame.size.width, SCREEN_HEIGHT);
    [self.view addSubview:containerView];
}

-(void)doAddDevice:(UIGestureRecognizer *)gestureRecognizer {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self textFieldShouldReturn:wifiNameTextField];
    [self textFieldShouldReturn:wifiPswTextField];
}

@end