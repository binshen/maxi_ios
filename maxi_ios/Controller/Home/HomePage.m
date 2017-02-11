//
// Created by Bin Shen on 2017/2/8.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "HomePage.h"
#import "GloriaLabel.h"
#import "SDCycleScrollView.h"
#import "UIButton+ImageTitleStyle.h"

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
    containerView.contentSize = CGSizeMake(self.view.frame.size.width, 800);
    [self.view addSubview:containerView];

    NSArray *imageNames = @[@"home_slider1.png", @"home_slider1.png", @"home_slider1.png", @"home_slider1.png"];
    CGFloat w = self.view.bounds.size.width;
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, w, 120) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [containerView addSubview:cycleScrollView];

    UIImage *img1 = [UIImage imageNamed:@"icon1_mxjs"];
    CGFloat width = img1.size.width+10;
    CGFloat height = img1.size.height;
    CGFloat len = (SCREEN_WIDTH-4*width)/8;
    UIButton *icon1 = [[UIButton alloc] initWithFrame:CGRectMake(len, 135, width, height)];
    [icon1 setTitle:@"淼溪净水" forState:UIControlStateNormal];
    [icon1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [icon1 setFont:FONT12];
    [icon1 setImage:img1 forState:UIControlStateNormal];
    [icon1 setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:2];
    [containerView addSubview:icon1];

    UIImage *img2 = [UIImage imageNamed:@"icon2_znjj"];
    UIButton *icon2 = [[UIButton alloc] initWithFrame:CGRectMake(len*3+width, 135, width, height)];
    [icon2 setTitle:@"智能家居" forState:UIControlStateNormal];
    [icon2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [icon2 setFont:FONT12];
    [icon2 setImage:img2 forState:UIControlStateNormal];
    [icon2 setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:2];
    [containerView addSubview:icon2];

    UIImage *img3 = [UIImage imageNamed:@"icon3_ycyl"];
    UIButton *icon3 = [[UIButton alloc] initWithFrame:CGRectMake(len*5+width*2, 135, width, height)];
    [icon3 setTitle:@"远程医疗" forState:UIControlStateNormal];
    [icon3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [icon3 setFont:FONT12];
    [icon3 setImage:img3 forState:UIControlStateNormal];
    [icon3 setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:2];
    [containerView addSubview:icon3];

    UIImage *img4 = [UIImage imageNamed:@"icon4_bmfw"];
    UIButton *icon4 = [[UIButton alloc] initWithFrame:CGRectMake(len*7+width*3, 135, width, height)];
    [icon4 setTitle:@"便民服务" forState:UIControlStateNormal];
    [icon4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [icon4 setFont:FONT12];
    [icon4 setImage:img4 forState:UIControlStateNormal];
    [icon4 setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:2];
    [containerView addSubview:icon4];

    UIImage *img5 = [UIImage imageNamed:@"icon5_wmdc"];
    UIButton *icon5 = [[UIButton alloc] initWithFrame:CGRectMake(len, 165+height, width, height)];
    [icon5 setTitle:@"外卖订餐" forState:UIControlStateNormal];
    [icon5 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [icon5 setFont:FONT12];
    [icon5 setImage:img5 forState:UIControlStateNormal];
    [icon5 setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:2];
    [containerView addSubview:icon5];

    UIImage *img6 = [UIImage imageNamed:@"icon6_sgsx"];
    UIButton *icon6 = [[UIButton alloc] initWithFrame:CGRectMake(len*3+width, 165+height, width, height)];
    [icon6 setTitle:@"蔬果生鲜" forState:UIControlStateNormal];
    [icon6 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [icon6 setFont:FONT12];
    [icon6 setImage:img6 forState:UIControlStateNormal];
    [icon6 setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:2];
    [containerView addSubview:icon6];

    UIImage *img7 = [UIImage imageNamed:@"icon7_zxjc"];
    UIButton *icon7 = [[UIButton alloc] initWithFrame:CGRectMake(len*5+width*2, 165+height, width, height)];
    [icon7 setTitle:@"装修建材" forState:UIControlStateNormal];
    [icon7 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [icon7 setFont:FONT12];
    [icon7 setImage:img7 forState:UIControlStateNormal];
    [icon7 setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:2];
    [containerView addSubview:icon7];

    UIImage *img8 = [UIImage imageNamed:@"icon8_sqzx"];
    UIButton *icon8 = [[UIButton alloc] initWithFrame:CGRectMake(len*7+width*3, 165+height, width, height)];
    [icon8 setTitle:@"社区资讯" forState:UIControlStateNormal];
    [icon8 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [icon8 setFont:FONT12];
    [icon8 setImage:img8 forState:UIControlStateNormal];
    [icon8 setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:2];
    [containerView addSubview:icon8];

    UIImageView *sp = [[UIImageView alloc] initWithFrame:CGRectMake(0, 180+height*2, SCREEN_WIDTH, 3)];
    sp.image = [UIImage imageNamed:@"line_h_gray"];
    [containerView addSubview:sp];

    UIImageView *sp_v = [[UIImageView alloc] initWithFrame:CGRectMake(0, 183+height*2, 5, 35)];
    sp_v.image = [UIImage imageNamed:@"line_v_red"];
    [containerView addSubview:sp_v];

    GloriaLabel *lbl_ad = [[GloriaLabel alloc] initWithFrame:CGRectMake(15, 183+height*2, SCREEN_WIDTH-15, 35)];
    lbl_ad.text = @"广告位";
    lbl_ad.textColor = [UIColor grayColor];
    [containerView addSubview:lbl_ad];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //Dispose of any resources that can be recreated.
}
@end