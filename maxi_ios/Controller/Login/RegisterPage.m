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

    GloriaLabel * getCheckCodeLabel;
    UIButton * registerBtn;
    UIButton *requestCodeBtn;
    dispatch_source_t _timer;
}
@end

@implementation RegisterPage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"注册";
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor blackColor], [UIFont systemFontOfSize:20 weight:20], nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil]];
    self.navigationController.navigationBar.titleTextAttributes = dic;
    [self setNavigationLeft:@"返回" sel:@selector(backAction)];

    userPhoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 25, SCREEN_WIDTH-40, 35)];
    userPhoneTextField.placeholder = @"请输入手机号";
    UIImageView *userPhoneImageView = [[UIImageView alloc] initWithFrame:CGRectMake(-20, 0, 32, 30)];
    userPhoneImageView.image = [UIImage imageNamed:@"shouji"];
    userPhoneTextField.leftView = userPhoneImageView;
    userPhoneTextField.leftViewMode = UITextFieldViewModeAlways;
    //userPhoneTextField.borderStyle = UITextBorderStyleRoundedRect;
    userPhoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    userPhoneTextField.delegate = self;
    [userPhoneTextField setSecureTextEntry:YES];
    [self.view addSubview:userPhoneTextField];

    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 36, SCREEN_WIDTH-40, 1)];
    lineView.backgroundColor = [UIColor blueColor];
    [userPhoneTextField addSubview:lineView];

    userCodeTextField = [[WPTextField alloc] initWithFrame:CGRectMake(20, 75, SCREEN_WIDTH-150, 35)];
    userCodeTextField.placeholder = @"请输入验证码";
    userCodeTextField.delegate = self;
    [self.view addSubview:userCodeTextField];

    userPasswordTextField = [[WPTextField alloc] initWithFrame:CGRectMake(20, 125, SCREEN_WIDTH-40, 35)];
    userPasswordTextField.placeholder = @"请输入登录密码";
    userPasswordTextField.delegate = self;
    [self.view addSubview:userPasswordTextField];

    requestCodeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    requestCodeBtn.frame = CGRectMake(SCREEN_WIDTH-120, 50, 120, 40);
    [requestCodeBtn setTitleColor:BLACKTEXTCOLOR_SUB forState:UIControlStateNormal];
    requestCodeBtn.userInteractionEnabled = NO;
    [requestCodeBtn addTarget:self action:@selector(getCheckCodeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:requestCodeBtn];

    getCheckCodeLabel = [[GloriaLabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-110, 75, 90, 35)];
    getCheckCodeLabel.font = FONT14;
    getCheckCodeLabel.backgroundColor = BLUE_BUTTON_COLOR;
    getCheckCodeLabel.textColor = [UIColor whiteColor];
    getCheckCodeLabel.textAlignment = NSTextAlignmentCenter;
    getCheckCodeLabel.text = @"获取验证码";
    [self.view addSubview:getCheckCodeLabel];
}

//获取验证码
-(void)getCheckCodeAction {

}

@end