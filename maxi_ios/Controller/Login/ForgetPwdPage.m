//
// Created by Bin Shen on 2017/2/8.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "ForgetPwdPage.h"
#import "GloriaLabel.h"

@interface ForgetPwdPage() {

    UITextField * userPhoneTextField;
    UITextField * userCodeTextField;
    UITextField * userPasswordTextField;
    UIImageView * btnResetPwdView;

    GloriaLabel * getCheckCodeLabel;
    UIImageView * btnRequestCodeView;

    dispatch_source_t _timer;
}
@end

@implementation ForgetPwdPage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"忘记密码";
    UIImage* backImage = [UIImage imageNamed:@"btn_back"];
    UIButton* backButton= [[UIButton alloc] initWithFrame:CGRectMake(0,0,16,20)];
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;

    userPhoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 25, SCREEN_WIDTH-40, 35)];
    userPhoneTextField.placeholder = @"  请输入手机号";
    UIImageView *textImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(-20, 0, 32, 30)];
    textImageView1.image = [UIImage imageNamed:@"shouji"];
    userPhoneTextField.leftView = textImageView1;
    userPhoneTextField.leftViewMode = UITextFieldViewModeAlways;
    userPhoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    userPhoneTextField.delegate = self;
    [userPhoneTextField setSecureTextEntry:YES];
    [self.view addSubview:userPhoneTextField];
    UIView *lineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 36, SCREEN_WIDTH-40, 1)];
    lineView1.backgroundColor = kUIColorFromRGB(0x1b96fe);
    [userPhoneTextField addSubview:lineView1];

    userCodeTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 75, SCREEN_WIDTH-150, 35)];
    userCodeTextField.placeholder = @"  请输入验证码";
    UIImageView *textImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(-20, 0, 32, 30)];
    textImageView2.image = [UIImage imageNamed:@"code"];
    userCodeTextField.leftView = textImageView2;
    userCodeTextField.leftViewMode = UITextFieldViewModeAlways;
    userCodeTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    userCodeTextField.delegate = self;
    [userCodeTextField setSecureTextEntry:YES];
    [self.view addSubview:userCodeTextField];
    UIView *lineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 36, SCREEN_WIDTH-150, 1)];
    lineView2.backgroundColor = kUIColorFromRGB(0x1b96fe);
    [userCodeTextField addSubview:lineView2];

    userPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 125, SCREEN_WIDTH-40, 35)];
    userPasswordTextField.placeholder = @"  请输入6-16位新密码";
    UIImageView *textImageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(-20, 0, 32, 30)];
    textImageView3.image = [UIImage imageNamed:@"mima"];
    userPasswordTextField.leftView = textImageView3;
    userPasswordTextField.leftViewMode = UITextFieldViewModeAlways;
    userPasswordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    userPasswordTextField.delegate = self;
    [userPasswordTextField setSecureTextEntry:YES];
    [self.view addSubview:userPasswordTextField];
    UIView *lineView3 = [[UIView alloc]initWithFrame:CGRectMake(0, 36, SCREEN_WIDTH-40, 1)];
    lineView3.backgroundColor = kUIColorFromRGB(0x1b96fe);
    [userPasswordTextField addSubview:lineView3];

    btnRequestCodeView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-110, 75, 90, 35)];
    btnRequestCodeView.image = [UIImage imageNamed:@"btn_request_code"];
    btnRequestCodeView.userInteractionEnabled = YES;
    [btnRequestCodeView.layer setMasksToBounds:YES];
    [btnRequestCodeView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doRequestCode:)]];
    [self.view addSubview:btnRequestCodeView];

    getCheckCodeLabel = [[GloriaLabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-110, 75, 90, 35)];
    getCheckCodeLabel.font = FONT14;
    getCheckCodeLabel.textColor = kUIColorFromRGB(0x1b96fe);
    getCheckCodeLabel.textAlignment = NSTextAlignmentCenter;
    getCheckCodeLabel.text = @"获取验证码";
    [self.view addSubview:getCheckCodeLabel];

    btnResetPwdView = [[UIImageView alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT-140, SCREEN_WIDTH-40, 40)];
    btnResetPwdView.image = [UIImage imageNamed:@"btn_reset_pwd"];
    btnResetPwdView.userInteractionEnabled = YES;
    [btnResetPwdView.layer setMasksToBounds:YES];
    [btnResetPwdView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doResetPwd:)]];
    [self.view addSubview:btnResetPwdView];
}

//获取验证码
-(void)getCheckCodeAction {

}

-(void)doRequestCode:(UIGestureRecognizer *)gestureRecognizer {

}

-(void)doResetPwd:(UIGestureRecognizer *)gestureRecognizer {

}
@end