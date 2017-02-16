//
// Created by Bin Shen on 2017/2/12.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "DeviceUpdateNamePage.h"
#import "DeviceConfigPage.h"

@interface DeviceUpdateNamePage() {

}
@end

@implementation DeviceUpdateNamePage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"修改名称";
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor whiteColor], [UIFont systemFontOfSize:20 weight:20], nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil]];
    self.navigationController.navigationBar.titleTextAttributes = dic;

    UIImage* backImage = [UIImage imageNamed:@"btn_back2"];
    UIButton* backButton= [[UIButton alloc] initWithFrame:CGRectMake(0,0,16,20)];
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;


    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 100, 50)];
    label.textAlignment = NSTextAlignmentLeft;
    label.text = @"设备名称：";
    label.font = FONT18;
    [self.view addSubview:label];

    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(120, 20, SCREEN_WIDTH - 140, 50)];
    textField.text = @"淼溪净水器123";
    textField.font = FONT18;
    [self.view addSubview:textField];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT-130, SCREEN_WIDTH-40, 40)];
    imageView.image = [UIImage imageNamed:@"btn_save_device_name"];
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doRenameDevice:)]];
    [self.view addSubview:imageView];
}

-(void)doRenameDevice:(UIGestureRecognizer *)gestureRecognizer {
    DeviceConfigPage * page = [[DeviceConfigPage alloc] initIsFirstPage:NO];
    [self.navigationController pushViewController:page animated:YES];
}

@end