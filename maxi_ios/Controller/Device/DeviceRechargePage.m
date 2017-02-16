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
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor whiteColor], [UIFont systemFontOfSize:20 weight:20], nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil]];
    self.navigationController.navigationBar.titleTextAttributes = dic;

    UIImage* backImage = [UIImage imageNamed:@"btn_back2"];
    UIButton* backButton= [[UIButton alloc] initWithFrame:CGRectMake(0,0,16,20)];
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;


    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 100, 50)];
    label1.textAlignment = NSTextAlignmentLeft;
    label1.text = @"充值设备：";
    label1.font = FONT18;
    [self.view addSubview:label1];

    UILabel *textField1 = [[UILabel alloc] initWithFrame:CGRectMake(120, 20, SCREEN_WIDTH - 140, 50)];
    textField1.text = @"淼溪净水器123";
    textField1.font = FONT18;
    [self.view addSubview:textField1];

    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 100, 50)];
    label2.textAlignment = NSTextAlignmentLeft;
    label2.text = @"充值金额：";
    label2.font = FONT18;
    [self.view addSubview:label2];

    UITextField *textField2 = [[UITextField alloc] initWithFrame:CGRectMake(120, 70, SCREEN_WIDTH - 140, 50)];
    textField2.placeholder = @"请输入充值金额";
    textField2.text = @"";
    textField2.font = FONT18;
    [self.view addSubview:textField2];

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