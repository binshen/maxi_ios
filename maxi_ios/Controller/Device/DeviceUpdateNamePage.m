//
// Created by Bin Shen on 2017/2/12.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "DeviceUpdateNamePage.h"
#import "DeviceConfigPage.h"

@interface DeviceUpdateNamePage() {

    UITextField * deviceNameTextField;
}
@end

@implementation DeviceUpdateNamePage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"修改名称";

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 50)];
    label.textAlignment = NSTextAlignmentLeft;
    label.text = @"设备名称：";
    label.font = FONT18;
    [self.view addSubview:label];

    deviceNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(120, 10, SCREEN_WIDTH - 140, 50)];
    deviceNameTextField.text = @"淼溪净水器123";
    deviceNameTextField.font = FONT18;
    [self.view addSubview:deviceNameTextField];

    UIImage *img_s = [UIImage imageNamed:@"bg_separator"];
    UIImageView *imgView_s = [[UIImageView alloc] initWithFrame:CGRectMake(20, 65, SCREEN_WIDTH-40, 1)];
    imgView_s.image = img_s;
    [self.view addSubview:imgView_s];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT-130, SCREEN_WIDTH-40, 40)];
    imageView.image = [UIImage imageNamed:@"btn_save_device_name"];
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doRenameDevice:)]];
    [self.view addSubview:imageView];
}

-(void)doRenameDevice:(UIGestureRecognizer *)gestureRecognizer {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self textFieldShouldReturn:deviceNameTextField];
}

@end