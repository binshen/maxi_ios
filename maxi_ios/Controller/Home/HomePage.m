//
// Created by Bin Shen on 2017/2/8.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "HomePage.h"
#import "SDCycleScrollView.h"

@interface HomePage() {


}
@end

@implementation HomePage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.backgroundColor = kUIColorFromRGB(0x2698f9);
    self.navigationItem.hidesBackButton = YES;
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_logo"]];
    self.navigationItem.titleView = imgView;

    // https://github.com/gsdios/SDCycleScrollView
    UIScrollView *containerView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    containerView.contentSize = CGSizeMake(self.view.frame.size.width, 1200);
    [self.view addSubview:containerView];

    NSArray *imageNames = @[@"home_slider1.png", @"home_slider1.png", @"home_slider1.png", @"home_slider1.png"];
    CGFloat w = self.view.bounds.size.width;
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, w, 120) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [containerView addSubview:cycleScrollView];

    UIImage *img1 = [UIImage imageNamed:@"icon1_mxjs"];
    CGFloat width = img1.size.width;
    CGFloat height = img1.size.height;
    UIImageView *icon1 = [[UIImageView alloc] initWithImage: img1];
    CGFloat len = (SCREEN_WIDTH-4*width)/8;
    icon1.frame = CGRectMake(len, 130, width, height);
    [containerView addSubview:icon1];

    UIImage *img2 = [UIImage imageNamed:@"icon2_znjj"];
    UIImageView *icon2 = [[UIImageView alloc] initWithImage: img2];
    icon2.frame = CGRectMake(len*3+width, 130, width, height);
    [containerView addSubview:icon2];

    UIImage *img3 = [UIImage imageNamed:@"icon3_ycyl"];
    UIImageView *icon3 = [[UIImageView alloc] initWithImage: img3];
    icon3.frame = CGRectMake(len*5+2*width, 130, width, height);
    [containerView addSubview:icon3];

    UIImage *img4 = [UIImage imageNamed:@"icon4_bmfw"];
    UIImageView *icon4 = [[UIImageView alloc] initWithImage: img4];
    icon4.frame = CGRectMake(len*7+3*width, 130, width, height);
    [containerView addSubview:icon4];

    UIImage *img5 = [UIImage imageNamed:@"icon5_wmdc"];
    UIImageView *icon5 = [[UIImageView alloc] initWithImage: img5];
    icon5.frame = CGRectMake(len, 180+height, width, height);
    [containerView addSubview:icon5];

    UIImage *img6 = [UIImage imageNamed:@"icon6_sgsx"];
    UIImageView *icon6 = [[UIImageView alloc] initWithImage: img6];
    icon6.frame = CGRectMake(len*3+width, 180+height, width, height);
    [containerView addSubview:icon6];

    UIImage *img7 = [UIImage imageNamed:@"icon7_zxjc"];
    UIImageView *icon7 = [[UIImageView alloc] initWithImage: img7];
    icon7.frame = CGRectMake(len*5+2*width, 180+height, width, height);
    [containerView addSubview:icon7];

    UIImage *img8 = [UIImage imageNamed:@"icon8_sqzx"];
    UIImageView *icon8 = [[UIImageView alloc] initWithImage: img8];
    icon8.frame = CGRectMake(len*7+3*width, 180+height, width, height);
    [containerView addSubview:icon8];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //Dispose of any resources that can be recreated.
}
@end