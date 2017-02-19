//
// Created by Bin Shen on 2017/2/8.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "HomePage.h"
#import "GloriaLabel.h"
#import "SDCycleScrollView.h"
#import "UIButton+ImageTitleStyle.h"
#import "DeviceMainPage.h"

@interface HomePage() {

    MBProgressHUD *HUD;
}
@end

@implementation HomePage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.backgroundColor = kUIColorFromRGB(0x2698f9);
    self.navigationController.navigationBar.barTintColor = kUIColorFromRGB(0x2698f9);

    self.navigationItem.hidesBackButton = YES;
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_logo"]];
    self.navigationItem.titleView = imgView;

    // https://github.com/gsdios/SDCycleScrollView
    UIScrollView *containerView = [[UIScrollView alloc] initWithFrame:self.view.frame];


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
    [icon1 addTarget:self action:@selector(clickIcon1Handler:) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:icon1];

    UIImage *img2 = [UIImage imageNamed:@"icon2_znjj"];
    UIButton *icon2 = [[UIButton alloc] initWithFrame:CGRectMake(len*3+width, 135, width, height)];
    [icon2 setTitle:@"智能家居" forState:UIControlStateNormal];
    [icon2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [icon2 setFont:FONT12];
    [icon2 setImage:img2 forState:UIControlStateNormal];
    [icon2 setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:2];
    [icon2 addTarget:self action:@selector(clickIcon2Handler:) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:icon2];

    UIImage *img3 = [UIImage imageNamed:@"icon3_ycyl"];
    UIButton *icon3 = [[UIButton alloc] initWithFrame:CGRectMake(len*5+width*2, 135, width, height)];
    [icon3 setTitle:@"远程医疗" forState:UIControlStateNormal];
    [icon3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [icon3 setFont:FONT12];
    [icon3 setImage:img3 forState:UIControlStateNormal];
    [icon3 setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:2];
    [icon3 addTarget:self action:@selector(clickIcon3Handler:) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:icon3];

    UIImage *img4 = [UIImage imageNamed:@"icon4_bmfw"];
    UIButton *icon4 = [[UIButton alloc] initWithFrame:CGRectMake(len*7+width*3, 135, width, height)];
    [icon4 setTitle:@"便民服务" forState:UIControlStateNormal];
    [icon4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [icon4 setFont:FONT12];
    [icon4 setImage:img4 forState:UIControlStateNormal];
    [icon4 setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:2];
    [icon4 addTarget:self action:@selector(clickIcon4Handler:) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:icon4];

    UIImage *img5 = [UIImage imageNamed:@"icon5_wmdc"];
    UIButton *icon5 = [[UIButton alloc] initWithFrame:CGRectMake(len, 165+height, width, height)];
    [icon5 setTitle:@"外卖订餐" forState:UIControlStateNormal];
    [icon5 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [icon5 setFont:FONT12];
    [icon5 setImage:img5 forState:UIControlStateNormal];
    [icon5 setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:2];
    [icon5 addTarget:self action:@selector(clickIcon5Handler:) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:icon5];

    UIImage *img6 = [UIImage imageNamed:@"icon6_sgsx"];
    UIButton *icon6 = [[UIButton alloc] initWithFrame:CGRectMake(len*3+width, 165+height, width, height)];
    [icon6 setTitle:@"蔬果生鲜" forState:UIControlStateNormal];
    [icon6 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [icon6 setFont:FONT12];
    [icon6 setImage:img6 forState:UIControlStateNormal];
    [icon6 setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:2];
    [icon6 addTarget:self action:@selector(clickIcon6Handler:) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:icon6];

    UIImage *img7 = [UIImage imageNamed:@"icon7_zxjc"];
    UIButton *icon7 = [[UIButton alloc] initWithFrame:CGRectMake(len*5+width*2, 165+height, width, height)];
    [icon7 setTitle:@"装修建材" forState:UIControlStateNormal];
    [icon7 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [icon7 setFont:FONT12];
    [icon7 setImage:img7 forState:UIControlStateNormal];
    [icon7 setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:2];
    [icon7 addTarget:self action:@selector(clickIcon7Handler:) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:icon7];

    UIImage *img8 = [UIImage imageNamed:@"icon8_sqzx"];
    UIButton *icon8 = [[UIButton alloc] initWithFrame:CGRectMake(len*7+width*3, 165+height, width, height)];
    [icon8 setTitle:@"社区资讯" forState:UIControlStateNormal];
    [icon8 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [icon8 setFont:FONT12];
    [icon8 setImage:img8 forState:UIControlStateNormal];
    [icon8 setButtonImageTitleStyle:ButtonImageTitleStyleTop padding:2];
    [icon8 addTarget:self action:@selector(clickIcon8Handler:) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:icon8];

    UIImageView *sp1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 180+height*2, SCREEN_WIDTH, 3)];
    sp1.image = [UIImage imageNamed:@"line_h_gray"];
    [containerView addSubview:sp1];

    UIImageView *sp_v1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 183+height*2, 5, 35)];
    sp_v1.image = [UIImage imageNamed:@"line_v_red"];
    [containerView addSubview:sp_v1];

    GloriaLabel *lbl_ad1 = [[GloriaLabel alloc] initWithFrame:CGRectMake(15, 183+height*2, SCREEN_WIDTH-15, 35)];
    lbl_ad1.text = @"广告位";
    lbl_ad1.textColor = [UIColor grayColor];
    [containerView addSubview:lbl_ad1];

    UIView *view1 = [[UIView alloc] init];

    UIImage *img11 = [UIImage imageNamed:@"demo_ad1"];
    CGFloat h1 = img11.size.height;
    UIImageView *ad11 = [[UIImageView alloc] initWithFrame:CGRectMake(10,10,(SCREEN_WIDTH-30)/2, h1)];
    ad11.image = img11;
    [view1 addSubview:ad11];

    UIImage *img12 = [UIImage imageNamed:@"demo_ad2"];
    CGFloat h2 = img12.size.height;
    UIImageView *ad12 = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-30)/2+20,10,(SCREEN_WIDTH-30)/2, h2)];
    ad12.image = img12;
    [view1 addSubview:ad12];

    UIImage *img13 = [UIImage imageNamed:@"demo_ad2"];
    CGFloat h3 = img13.size.height;
    UIImageView *ad13 = [[UIImageView alloc] initWithFrame:CGRectMake(10, h1+20,(SCREEN_WIDTH-30)/2, h3)];
    ad13.image = img13;
    [view1 addSubview:ad13];

    UIImage *img14 = [UIImage imageNamed:@"demo_ad1"];
    CGFloat h4 = img14.size.height;
    UIImageView *ad14 = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-30)/2+20,h2+20,(SCREEN_WIDTH-30)/2, h4)];
    ad14.image = img14;
    [view1 addSubview:ad14];

    view1.backgroundColor = [UIColor lightGrayColor];
    view1.frame = CGRectMake(0, 218+height*2, SCREEN_WIDTH, h1+h3+30);
    [containerView addSubview:view1];

    CGFloat x_height = 218+height*2+h1+h3+30;

    UIImageView *sp_v2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, x_height, 5, 35)];
    sp_v2.image = [UIImage imageNamed:@"line_v_red"];
    [containerView addSubview:sp_v2];

    GloriaLabel *lbl_ad2 = [[GloriaLabel alloc] initWithFrame:CGRectMake(15, x_height, SCREEN_WIDTH-15, 35)];
    lbl_ad2.text = @"广告位";
    lbl_ad2.textColor = [UIColor grayColor];
    [containerView addSubview:lbl_ad2];


    UIView *view2 = [[UIView alloc] init];
    UIImageView *ad21 = [[UIImageView alloc] initWithFrame:CGRectMake(10,10,(SCREEN_WIDTH-30)/2, h1)];
    ad21.image = img11;
    [view2 addSubview:ad21];
    UIImageView *ad22 = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-30)/2+20,10,(SCREEN_WIDTH-30)/2, h2)];
    ad22.image = img12;
    [view2 addSubview:ad22];
    UIImageView *ad23 = [[UIImageView alloc] initWithFrame:CGRectMake(10, h1+20,(SCREEN_WIDTH-30)/2, h3)];
    ad23.image = img13;
    [view2 addSubview:ad23];
    UIImageView *ad24 = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-30)/2+20,h2+20,(SCREEN_WIDTH-30)/2, h4)];
    ad24.image = img14;
    [view2 addSubview:ad24];
    view2.backgroundColor = [UIColor lightGrayColor];
    view2.frame = CGRectMake(0, x_height+35, SCREEN_WIDTH, h1+h3+30);
    [containerView addSubview:view2];

    containerView.contentSize = CGSizeMake(self.view.frame.size.width, x_height+h1+h2+178);
    [self.view addSubview:containerView];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //Dispose of any resources that can be recreated.
}

-(void)clickIcon1Handler:(id)sender {
    DeviceMainPage * page = [[DeviceMainPage alloc] initIsFirstPage:NO];
    [self.navigationController pushViewController:page animated:YES];
}

-(void)clickIcon2Handler:(id)sender {
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.labelText = @"您点击了：智能家居";
    HUD.mode = MBProgressHUDModeCustomView;
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(1);
    } completionBlock:^{
        [HUD removeFromSuperview];
        HUD = nil;
    }];
}

-(void)clickIcon3Handler:(id)sender {
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.labelText = @"您点击了：远程医疗";
    HUD.mode = MBProgressHUDModeCustomView;
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(1);
    } completionBlock:^{
        [HUD removeFromSuperview];
        HUD = nil;
    }];
}

-(void)clickIcon4Handler:(id)sender {
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.labelText = @"您点击了：便民服务";
    HUD.mode = MBProgressHUDModeCustomView;
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(1);
    } completionBlock:^{
        [HUD removeFromSuperview];
        HUD = nil;
    }];
}

-(void)clickIcon5Handler:(id)sender {
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.labelText = @"您点击了：外卖订餐";
    HUD.mode = MBProgressHUDModeCustomView;
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(1);
    } completionBlock:^{
        [HUD removeFromSuperview];
        HUD = nil;
    }];
}

-(void)clickIcon6Handler:(id)sender {
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.labelText = @"您点击了：蔬果生鲜";
    HUD.mode = MBProgressHUDModeCustomView;
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(1);
    } completionBlock:^{
        [HUD removeFromSuperview];
        HUD = nil;
    }];
}

-(void)clickIcon7Handler:(id)sender {
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.labelText = @"您点击了：装修建材";
    HUD.mode = MBProgressHUDModeCustomView;
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(1);
    } completionBlock:^{
        [HUD removeFromSuperview];
        HUD = nil;
    }];
}

-(void)clickIcon8Handler:(id)sender {
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.labelText = @"您点击了：社区资讯";
    HUD.mode = MBProgressHUDModeCustomView;
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(1);
    } completionBlock:^{
        [HUD removeFromSuperview];
        HUD = nil;
    }];
}

@end