//
// Created by Bin Shen on 16/12/2016.
// Copyright (c) 2016 Bin Shen. All rights reserved.
//

#import "LoginPage.h"
#import "GloriaLabel.h"
#import "ForgetPwdPage.h"

@interface LoginPage() {
    UITextField * userPhoneTextField;
    UITextField * userPasswordTextField;
    UIImageView * btnLoginView;

    GloriaLabel * lblForgetPassword;
}
@end

@implementation LoginPage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"登录";

    userPhoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 25, SCREEN_WIDTH-40, 35)];
    userPhoneTextField.placeholder = @"请输入手机号";
    UIImageView *textImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    textImageView1.image = [UIImage imageNamed:@"txt_shouji"];
    userPhoneTextField.leftView = textImageView1;
    userPhoneTextField.leftViewMode = UITextFieldViewModeAlways;
    userPhoneTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    userPhoneTextField.delegate = self;
    userPhoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:userPhoneTextField];
    UIView *lineView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 36, SCREEN_WIDTH-40, 1)];
    lineView1.backgroundColor = BLUE_TEXT_BOTTOM_COLOR;
    [userPhoneTextField addSubview:lineView1];

    userPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 75, SCREEN_WIDTH-40, 35)];
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

    lblForgetPassword = [[GloriaLabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-110, 125, 90, 35)];
    //lblForgetPassword.font = FONT14;
    lblForgetPassword.textColor = [UIColor grayColor];
    lblForgetPassword.textAlignment = NSTextAlignmentCenter;
    lblForgetPassword.text = @"忘记密码";
    lblForgetPassword.userInteractionEnabled = YES;
    [lblForgetPassword addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToForgetPassword:)]];
    [self.view addSubview:lblForgetPassword];

    btnLoginView = [[UIImageView alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT-140, SCREEN_WIDTH-40, 40)];
    btnLoginView.image = [UIImage imageNamed:@"btn_login2"];
    btnLoginView.userInteractionEnabled = YES;
    [btnLoginView.layer setMasksToBounds:YES];
    [btnLoginView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doUserLogin:)]];
    [self.view addSubview:btnLoginView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)goToForgetPassword:(UIGestureRecognizer *)gestureRecognizer {
    ForgetPwdPage * forgetPwdPage = [[ForgetPwdPage alloc] initIsFirstPage:NO];
    [self.navigationController pushViewController:forgetPwdPage animated:YES];
}

-(void)doUserLogin:(UIGestureRecognizer *)gestureRecognizer {

//    [GetAppDelegate showMainPage];

    // 执行登录操作
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.labelText = @"登录中...";
    // 隐藏时候从父控件中移除
    HUD.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    HUD.dimBackground = YES;

    NSString *path = [[NSString alloc] initWithFormat:@"/user/login"];
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:userPhoneTextField.text forKey:@"tel"];
    [param setValue:userPasswordTextField.text forKey:@"password"];

    MKNetworkHost *host = [[MKNetworkHost alloc] initWithHostName:MAXI_API_BASE_PATH];
    host.defaultParameterEncoding = MKNKParameterEncodingJSON;
    MKNetworkRequest *request = [host requestWithPath:path params:param httpMethod:HTTPPOST];
    BASE_INFO_FUN(param);
    [request addCompletionHandler: ^(MKNetworkRequest *completedRequest) {

        HUD.hidden = YES;

        //NSString *response = [completedRequest responseAsString];
        NSError *error = [completedRequest error];
        NSData *data = [completedRequest responseData];

        if (data == nil)
        {
            BASE_ERROR_FUN(error);
            [Global alertMessageEx:@"请检查网络." title:@"登录失败" okTtitle:nil cancelTitle:@"确定" delegate:self];
        }
        else
        {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            BASE_INFO_FUN(json);

            long code = [[json objectForKey:@"code"] longValue];
            NSDictionary *content = [json objectForKey:@"content"];
            if (code >= 0 && ![content isEqual:[NSNull null]])
            {
                _loginUser = [content mutableCopy];

                // 存储用户信息
                [UserDefault setObject:@"1" forKey:@"isLogin"];
                [UserDefault setObject:content[@"_id"] forKey:@"_id"];
                [UserDefault setObject:content[@"tel"] forKey:@"tel"];
                [UserDefault setObject:content[@"password"] forKey:@"password"];
                [UserDefault setObject:content[@"name"] forKey:@"name"];
                [UserDefault synchronize];//使用synchronize强制立即将数据写入磁盘,防止在写完NSUserDefaults后程序退出导致的数据丢失

                // 跳转主界面
                [GetAppDelegate showMainPage];
            }
            else
            {
                [UserDefault setObject:@"0" forKey:@"isLogin"];
                [Global alertMessageEx:[json objectForKey:@"error"] title:@"登录失败" okTtitle:nil cancelTitle:@"确定" delegate:self];
            }
        }
    }];

    [host startRequest:request];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSInteger textLength = 0;

    if ([string isEqualToString:@""]) {
        textLength = textField.text.length-1;
    }
    else
    {
        textLength = textField.text.length+1;
    }

    BOOL flag = YES;
    if( textField == userPhoneTextField )
    {
//        // 检测手机号是否合法
//        if( textLength == 11 && [StringUtil isMobile:[userPhoneTextField.text stringByAppendingString:string]] == NO)
//        {
//            [Global alertMessage:@"手机号码不合法，请重新输入！"];
//        }

        // 大于11位数不让输入
        if( textLength > 11 )
            return NO;
    }
    return flag;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self textFieldShouldReturn:userPhoneTextField];
    [self textFieldShouldReturn:userPasswordTextField];
}

@end