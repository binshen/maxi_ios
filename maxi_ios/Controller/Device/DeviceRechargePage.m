//
// Created by Bin Shen on 2017/2/12.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "DeviceRechargePage.h"
#import "DeviceConfigPage.h"

@interface DeviceRechargePage() {

    UITextField * rechargeValueTextField;
}
@end

@implementation DeviceRechargePage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"充值";

    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 50)];
    label1.textAlignment = NSTextAlignmentLeft;
    label1.text = @"充值设备：";
    label1.font = FONT18;
    [self.view addSubview:label1];

    UILabel *textField1 = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, SCREEN_WIDTH - 140, 50)];
    textField1.text = @"淼溪净水器123";
    textField1.font = FONT18;
    [self.view addSubview:textField1];

    UIImage *img_s1 = [UIImage imageNamed:@"bg_separator"];
    UIImageView *imgView_s1 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 65, SCREEN_WIDTH-40, 1)];
    imgView_s1.image = img_s1;
    [self.view addSubview:imgView_s1];

    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 100, 50)];
    label2.textAlignment = NSTextAlignmentLeft;
    label2.text = @"充值金额：";
    label2.font = FONT18;
    [self.view addSubview:label2];

    rechargeValueTextField = [[UITextField alloc] initWithFrame:CGRectMake(120, 70, SCREEN_WIDTH - 140, 50)];
    rechargeValueTextField.placeholder = @"请输入充值金额";
    rechargeValueTextField.text = @"";
    rechargeValueTextField.font = FONT18;
    rechargeValueTextField.keyboardType = UIKeyboardTypeDecimalPad;
    [self.view addSubview:rechargeValueTextField];

    UIImage *img_s2 = [UIImage imageNamed:@"bg_separator"];
    UIImageView *imgView_s2 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 125, SCREEN_WIDTH-40, 1)];
    imgView_s2.image = img_s2;
    [self.view addSubview:imgView_s2];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT-130, SCREEN_WIDTH-40, 40)];
    imageView.image = [UIImage imageNamed:@"btn_confirm_recharge"];
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doRechargeDevice:)]];
    [self.view addSubview:imageView];
}

-(void)doRechargeDevice:(UIGestureRecognizer *)gestureRecognizer {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self textFieldShouldReturn:rechargeValueTextField];
}

@end