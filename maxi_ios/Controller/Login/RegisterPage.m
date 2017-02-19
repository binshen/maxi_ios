//
// Created by Bin Shen on 18/12/2016.
// Copyright (c) 2016 Bin Shen. All rights reserved.
//

#import "RegisterPage.h"
#import "GloriaLabel.h"

@interface RegisterPage() {

    UITextField * userPhoneTextField;
    UITextField * userCodeTextField;
    UITextField * userPasswordTextField;
    UIImageView * btnRegisterView;

    GloriaLabel * getCheckCodeLabel;
    UIImageView * btnRequestCodeView;

    dispatch_source_t _timer;
}
@end

@implementation RegisterPage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"注册";

    userPhoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 25, SCREEN_WIDTH-40, 35)];
    userPhoneTextField.placeholder = @"请输入手机号";
    UIImageView *textImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    textImageView1.image = [UIImage imageNamed:@"txt_shouji"];
    userPhoneTextField.leftView = textImageView1;
    userPhoneTextField.leftViewMode = UITextFieldViewModeAlways;
    userPhoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    userPhoneTextField.delegate = self;
    [userPhoneTextField setSecureTextEntry:YES];
    [self.view addSubview:userPhoneTextField];
    UIView *lineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 36, SCREEN_WIDTH-40, 1)];
    lineView1.backgroundColor = BLUE_TEXT_BOTTOM_COLOR;
    [userPhoneTextField addSubview:lineView1];

    userCodeTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 75, SCREEN_WIDTH-150, 35)];
    userCodeTextField.placeholder = @"请输入验证码";
    UIImageView *textImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    textImageView2.image = [UIImage imageNamed:@"txt_code"];
    userCodeTextField.leftView = textImageView2;
    userCodeTextField.leftViewMode = UITextFieldViewModeAlways;
    userCodeTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    userCodeTextField.delegate = self;
    [userCodeTextField setSecureTextEntry:YES];
    [self.view addSubview:userCodeTextField];
    UIView *lineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 36, SCREEN_WIDTH-150, 1)];
    lineView2.backgroundColor = BLUE_TEXT_BOTTOM_COLOR;
    [userCodeTextField addSubview:lineView2];

    userPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 125, SCREEN_WIDTH-40, 35)];
    userPasswordTextField.placeholder = @"请输入6-16位密码";
    UIImageView *textImageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    textImageView3.image = [UIImage imageNamed:@"txt_mima"];
    userPasswordTextField.leftView = textImageView3;
    userPasswordTextField.leftViewMode = UITextFieldViewModeAlways;
    userPasswordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    userPasswordTextField.delegate = self;
    [userPasswordTextField setSecureTextEntry:YES];
    [self.view addSubview:userPasswordTextField];
    UIView *lineView3 = [[UIView alloc]initWithFrame:CGRectMake(0, 36, SCREEN_WIDTH-40, 1)];
    lineView3.backgroundColor = BLUE_TEXT_BOTTOM_COLOR;
    [userPasswordTextField addSubview:lineView3];

    btnRequestCodeView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-110, 75, 90, 35)];
    btnRequestCodeView.image = [UIImage imageNamed:@"btn_request_code"];
    btnRequestCodeView.userInteractionEnabled = YES;
    [btnRequestCodeView.layer setMasksToBounds:YES];
    [btnRequestCodeView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doRequestCode:)]];
    [self.view addSubview:btnRequestCodeView];

    getCheckCodeLabel = [[GloriaLabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-110, 75, 90, 35)];
    getCheckCodeLabel.font = FONT14;
    getCheckCodeLabel.textColor = BLUE_TEXT_BOTTOM_COLOR;
    getCheckCodeLabel.textAlignment = NSTextAlignmentCenter;
    getCheckCodeLabel.text = @"获取验证码";
    [self.view addSubview:getCheckCodeLabel];

    btnRegisterView = [[UIImageView alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT-140, SCREEN_WIDTH-40, 40)];
    btnRegisterView.image = [UIImage imageNamed:@"btn_register2"];
    btnRegisterView.userInteractionEnabled = YES;
    [btnRegisterView.layer setMasksToBounds:YES];
    [btnRegisterView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doRegister:)]];
    [self.view addSubview:btnRegisterView];
}

//获取验证码
-(void)getCheckCodeAction {

}

-(void)doRequestCode:(UIGestureRecognizer *)gestureRecognizer {

}

-(void)doRegister:(UIGestureRecognizer *)gestureRecognizer {

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self textFieldShouldReturn:userPhoneTextField];
    [self textFieldShouldReturn:userCodeTextField];
    [self textFieldShouldReturn:userPasswordTextField];
}

@end