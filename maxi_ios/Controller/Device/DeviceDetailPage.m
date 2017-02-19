//
// Created by Bin Shen on 2017/2/12.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "DeviceDetailPage.h"
#import "DeviceConfigPage.h"
#import "JPTabViewController.h"
#import "DeviceDetail1Page.h"
#import "DeviceDetail2Page.h"

@interface DeviceDetailPage() {

}
@end

@implementation DeviceDetailPage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"淼溪净水";

    UIImage* addImage = [UIImage imageNamed:@"btn_config"];
    UIButton* addButton= [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-35,0,20,5)];
    [addButton setBackgroundImage:addImage forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(deviceConfigAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:addButton];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;

    //UIImage *bg_status = [self imageCompressWithSimple:[UIImage imageNamed:@"bg_status_1"] scaledToSize:CGSizeMake(SCREEN_WIDTH/3, SCREEN_WIDTH/3)];
    UIImage *bg_status = [UIImage imageNamed:@"bg_status_1"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:bg_status];
    imageView.center = CGPointMake(SCREEN_WIDTH/2, bg_status.size.height/2+20);
    [self.view addSubview:imageView];

    CGFloat _height = bg_status.size.height+10;
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(40, _height+20, SCREEN_WIDTH/2-40, 20)];
    label1.text = @"进水水质/TDS:90";
    label1.textColor = GRAY_TEXT_COLOR;
    label1.font = FONT12;
    label1.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label1];

    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2+20, _height+20, SCREEN_WIDTH/2-20, 20)];
    label2.text = @"设备编号:123";
    label2.textColor = GRAY_TEXT_COLOR;
    label2.font = FONT12;
    label2.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label2];

    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(40, _height+40, SCREEN_WIDTH/2-40, 20)];
    label3.text = @"出水水质/TDS:12";
    label3.textColor = GRAY_TEXT_COLOR;
    label3.font = FONT12;
    label3.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label3];

    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2+20, _height+40, SCREEN_WIDTH/2-20, 20)];
    label4.text = @"累计用水量:2L";
    label4.textColor = GRAY_TEXT_COLOR;
    label4.font = FONT12;
    label4.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label4];

    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, _height+60, SCREEN_WIDTH, SCREEN_HEIGHT-_height-80)];
    UIViewController *page1 = [[DeviceDetail1Page alloc] init];
    UIViewController *page2 = [[DeviceDetail2Page alloc] init];
    JPTabViewController *tabViewController = [[JPTabViewController alloc] initWithControllers:@[page1, page2]];
    [self addChildViewController:tabViewController];
    [containerView addSubview:tabViewController.view];

    [self.view addSubview:containerView];
}

//- (UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size {
//    UIGraphicsBeginImageContext(size);
//    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
//    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return newImage;
//}

-(void)deviceConfigAction:(id)sender {
    DeviceConfigPage * page = [[DeviceConfigPage alloc] initIsFirstPage:NO];
    [self.navigationController pushViewController:page animated:YES];
}

@end