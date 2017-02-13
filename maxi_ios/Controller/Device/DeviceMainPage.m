//
// Created by Bin Shen on 2017/2/12.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "DeviceMainPage.h"
#import "DeviceAddPage.h"

@interface DeviceMainPage() {

}
@end

@implementation DeviceMainPage

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

    UIImage* addImage = [UIImage imageNamed:@"btn_add"];
    UIButton* addButton= [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-35,0,20,20)];
    [addButton setBackgroundImage:addImage forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:addButton];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;

    UIScrollView *containerView = [[UIScrollView alloc] initWithFrame:self.view.frame];

    UIImage *bg_image = [UIImage imageNamed:@"bg_device"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:bg_image];
    [containerView addSubview:imageView];

    UILabel *countLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/6, bg_image.size.height/3, 120, 50)];
    countLabel.textAlignment = NSTextAlignmentLeft;
    countLabel.text = @"2台";
    [countLabel setTextColor:[UIColor whiteColor]];
    [countLabel setFont:[UIFont boldSystemFontOfSize:26]];
    [containerView addSubview:countLabel];

    containerView.contentSize = CGSizeMake(self.view.frame.size.width, bg_image.size.height);
    [self.view addSubview:containerView];
}

-(void)addAction:(id)sender {
    DeviceAddPage * page = [[DeviceAddPage alloc] initIsFirstPage:NO];
    [self.navigationController pushViewController:page animated:YES];
}

@end