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

    userCodeTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 75, SCREEN_WIDTH-150, 35)];
    userCodeTextField.placeholder = @"请输入验证码";
    UIImageView *textImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    textImageView2.image = [UIImage imageNamed:@"txt_code"];
    userCodeTextField.leftView = textImageView2;
    userCodeTextField.leftViewMode = UITextFieldViewModeAlways;
    userCodeTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    userCodeTextField.delegate = self;
    userCodeTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:userCodeTextField];
    UIView *lineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 36, SCREEN_WIDTH-150, 1)];
    lineView2.backgroundColor = BLUE_TEXT_BOTTOM_COLOR;
    [userCodeTextField addSubview:lineView2];

    userPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, 125, SCREEN_WIDTH-40, 35)];
    userPasswordTextField.placeholder = @"请输入6-16位新密码";
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

    btnResetPwdView = [[UIImageView alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT-140, SCREEN_WIDTH-40, 40)];
    btnResetPwdView.image = [UIImage imageNamed:@"btn_reset_pwd"];
    btnResetPwdView.userInteractionEnabled = YES;
    [btnResetPwdView.layer setMasksToBounds:YES];
    [btnResetPwdView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doResetPwd:)]];
    [self.view addSubview:btnResetPwdView];
}

//获取验证码
-(void)doRequestCode:(UIGestureRecognizer *)gestureRecognizer {
    if(userPhoneTextField.text.length == 0)
    {
        [Global alertMessageEx:@"请输入手机号." title:@"错误信息" okTtitle:nil cancelTitle:@"OK" delegate:self];
        return;
    }

    NSString *path = [[NSString alloc] initWithFormat:@"/user/request_code"];
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:userPhoneTextField.text forKey:@"tel"];

    MKNetworkHost *host = [[MKNetworkHost alloc] initWithHostName:MAXI_API_BASE_PATH];
    host.defaultParameterEncoding = MKNKParameterEncodingJSON;
    MKNetworkRequest *request = [host requestWithPath:path params:param httpMethod:HTTPPOST];
    BASE_INFO_FUN(param);
    [request addCompletionHandler: ^(MKNetworkRequest *completedRequest) {

        NSError *error = [completedRequest error];
        NSData *data = [completedRequest responseData];

        if(data == nil)
        {
            [Global alertMessageEx:[error localizedDescription] title:@"错误信息" okTtitle:nil cancelTitle:@"OK" delegate:self];
        }
        else
        {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            BASE_INFO_FUN(json);
            NSInteger *code = [[json objectForKey:@"code"] integerValue];
            if (code >= 0)
            {
                //发送成功提示
                [self startCountDown];
            }
            else
            {
                [Global alertMessageEx:@"网络故障，请稍候重试" title:@"错误信息" okTtitle:nil cancelTitle:@"OK" delegate:self];
            }
        }
    }];
    [host startRequest:request];
}

-(void)doResetPwd:(UIGestureRecognizer *)gestureRecognizer {
    if(userPhoneTextField.text.length == 0)
    {
        [Global alertMessageEx:@"请输入手机号." title:@"错误信息" okTtitle:nil cancelTitle:@"OK" delegate:self];
    }
    else if(userCodeTextField.text.length == 0)
    {
        [Global alertMessageEx:@"请输入验证码." title:@"错误信息" okTtitle:nil cancelTitle:@"OK" delegate:self];
    }
    else if(userPasswordTextField.text.length == 0)
    {
        [Global alertMessageEx:@"请输入新密码." title:@"错误信息" okTtitle:nil cancelTitle:@"OK" delegate:self];
    }
    else
    {
        NSString *path = [[NSString alloc] initWithFormat:@"/user/register"];
        NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
        [param setValue:userPhoneTextField.text forKey:@"tel"];
        [param setValue:userPasswordTextField.text forKey:@"password"];
        [param setValue:userCodeTextField.text forKey:@"code"];
        [param setValue:@"XXXX" forKey:@"name"];

        MKNetworkHost *host = [[MKNetworkHost alloc] initWithHostName:MAXI_API_BASE_PATH];
        host.defaultParameterEncoding = MKNKParameterEncodingJSON;
        MKNetworkRequest *request = [host requestWithPath:path params:param httpMethod:HTTPPOST];
        BASE_INFO_FUN(param);
        [request addCompletionHandler: ^(MKNetworkRequest *completedRequest) {

            NSError *error = [completedRequest error];
            NSData *data = [completedRequest responseData];

            if(data == nil)
            {
                [Global alertMessageEx:[error localizedDescription] title:@"错误信息" okTtitle:nil cancelTitle:@"OK" delegate:self];
            }
            else
            {
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                BASE_INFO_FUN(json);
                long code = [[json objectForKey:@"code"] longValue];
                if (code >= 0)
                {
                    //[Global alertMessageEx:@"恭喜你，账号注册成功!" title:@"提示信息" okTtitle:nil cancelTitle:@"OK" delegate:self];
                    [self.navigationController popViewControllerAnimated:YES];
                }
                else
                {
                    NSString *error = [json objectForKey:@"error"];
                    [Global alertMessageEx:error title:@"错误信息" okTtitle:nil cancelTitle:@"OK" delegate:self];
                }
            }
        }];
        [host startRequest:request];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self textFieldShouldReturn:userPhoneTextField];
    [self textFieldShouldReturn:userCodeTextField];
    [self textFieldShouldReturn:userPasswordTextField];
}

#pragma mark custom function begin
////倒计时提醒
-(void)startCountDown{
    __block int timeout = 59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                btnRequestCodeView.userInteractionEnabled=YES;
                btnRequestCodeView.alpha=1;

                //[sendBtn setTitle:@"重新获取验证码" forState:UIControlStateNormal];
                getCheckCodeLabel.text = @"重新获取";

            });
        }
        else
        {
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];

            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                FxLog(@"____%@",strTime);
                btnRequestCodeView.userInteractionEnabled=NO;
                btnRequestCodeView.alpha=0.4;
                //[sendBtn setTitle:[NSString stringWithFormat:@"%@s",strTime] forState:UIControlStateNormal];
                getCheckCodeLabel.text = [NSString stringWithFormat:@"剩余%@秒",strTime];
            });

            timeout--;

        }
    });
    dispatch_resume(_timer);
}
# pragma mark custom function end

@end