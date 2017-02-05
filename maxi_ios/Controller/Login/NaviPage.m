//
// Created by Bin Shen on 2017/2/5.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "NaviPage.h"

@interface NaviPage() {

    UIImageView * btnLoginView;
    UIImageView * btnRegisterView;
}
@end

@implementation NaviPage
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];

    self.navigationController.navigationBarHidden = YES;

}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    //self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *image = [UIImage imageNamed:@"bj"];
    self.view.layer.contents = (id) image.CGImage;    // 如果需要背景透明加上下面这句
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;

    btnLoginView = [[UIImageView alloc] initWithFrame:CGRectMake(10, SCREEN_HEIGHT-75, 140, 40)];
    btnLoginView.image = [UIImage imageNamed:@"btn_login.png"];
    btnLoginView.userInteractionEnabled = YES;
    [btnLoginView.layer setMasksToBounds:YES];
    [self.view addSubview:btnLoginView];

    btnRegisterView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-150, SCREEN_HEIGHT-75, 140, 40)];
    btnRegisterView.image = [UIImage imageNamed:@"btn_login.png"];
    btnRegisterView.userInteractionEnabled = YES;
    [btnRegisterView.layer setMasksToBounds:YES];
    [self.view addSubview:btnRegisterView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end