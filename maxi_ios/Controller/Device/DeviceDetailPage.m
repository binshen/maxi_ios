//
// Created by Bin Shen on 2017/2/12.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "DeviceDetailPage.h"
#import "DeviceConfigPage.h"
#import "JPTabViewController.h"

@interface DeviceDetailPage() {

}
@end

@implementation DeviceDetailPage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"淼溪净水";
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor blackColor], [UIFont systemFontOfSize:20 weight:20], nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil]];
    self.navigationController.navigationBar.titleTextAttributes = dic;

    UIImage* backImage = [UIImage imageNamed:@"btn_back"];
    UIButton* backButton= [[UIButton alloc] initWithFrame:CGRectMake(0,0,16,20)];
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;

    UIImage* addImage = [UIImage imageNamed:@"btn_config"];
    UIButton* addButton= [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-35,0,20,20)];
    [addButton setBackgroundImage:addImage forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(deviceConfigAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:addButton];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;

    UIImage *bg_status = [UIImage imageNamed:@"bg_status_1"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:bg_status];
    imageView.center = CGPointMake(SCREEN_WIDTH/2, bg_status.size.height/2+20);
    [self.view addSubview:imageView];

    CGFloat _height = bg_status.size.height+10;
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(40, _height+20, SCREEN_WIDTH/2-40, 20)];
    label1.text = @"进水水质/TDS:90";
    label1.textColor = [UIColor grayColor];
    label1.font = FONT11;
    label1.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label1];

    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2+20, _height+20, SCREEN_WIDTH/2-20, 20)];
    label2.text = @"设备编号:123";
    label2.textColor = [UIColor grayColor];
    label2.font = FONT11;
    label2.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label2];

    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(40, _height+40, SCREEN_WIDTH/2-40, 20)];
    label3.text = @"出水水质/TDS:12";
    label3.textColor = [UIColor grayColor];
    label3.font = FONT11;
    label3.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label3];

    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2+20, _height+40, SCREEN_WIDTH/2-20, 20)];
    label4.text = @"累计用水量:2L";
    label4.textColor = [UIColor grayColor];
    label4.font = FONT11;
    label4.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label4];

//    UIViewController *redController = [[UIViewController alloc] init];
//    [redController setTitle:@"RED"];
//    [[redController view] setBackgroundColor:[UIColor redColor]];
//
//    UIViewController *greenController = [[UIViewController alloc] init];
//    [greenController setTitle:@"GREEN"];
//    [[greenController view] setBackgroundColor:[UIColor greenColor]];
//
//    UIViewController *blueController = [[UIViewController alloc] init];
//    [blueController setTitle:@"BLUE"];
//    [[blueController view] setBackgroundColor:[UIColor blueColor]];
//
//    JPTabViewController *tabViewController = [[JPTabViewController alloc] initWithControllers:@[redController, greenController, blueController]];
//    [self.view addSubview:tabViewController.view];
}

-(void)deviceConfigAction:(id)sender {
    DeviceConfigPage * page = [[DeviceConfigPage alloc] initIsFirstPage:NO];
    [self.navigationController pushViewController:page animated:YES];
}

@end