//
// Created by Bin Shen on 18/02/2017.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "DeviceDetail1Page.h"

@interface DeviceDetail1Page() {

}
@end

@implementation DeviceDetail1Page

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"滤芯状态";

    UIImage *img1 = [UIImage imageNamed:@"icon_1_1"];
    CGFloat w = img1.size.width;
    CGFloat h = img1.size.height;
    UIImageView *imgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, w, h)];
    imgView1.image = img1;
    [self.view addSubview:imgView1];
    UILabel *lbl11 = [[UILabel alloc] initWithFrame:CGRectMake(w+40, 10, SCREEN_WIDTH-w-100, 15+h/2)];
    lbl11.text = @"PP棉（剩余10天）";
    lbl11.textAlignment = NSTextAlignmentLeft;
    lbl11.textColor = [UIColor blackColor];
    lbl11.font = FONT15;
    [self.view addSubview:lbl11];
    UILabel *lbl12 = [[UILabel alloc] initWithFrame:CGRectMake(w+40, 15+h/2, SCREEN_WIDTH-w-100, 15+h/2)];
    lbl12.text = @"去除水中微泥，铁锈，虫卵...";
    lbl12.textAlignment = NSTextAlignmentLeft;
    lbl12.textColor = [UIColor grayColor];
    lbl12.font = FONT11;
    [self.view addSubview:lbl12];
    UILabel *lbl13 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, 20, 40, h)];
    lbl13.text = @"10%";
    lbl13.textAlignment = NSTextAlignmentRight;
    lbl13.textColor = [UIColor redColor];
    lbl13.font = FONT15;
    [self.view addSubview:lbl13];

    UIImage *img_s = [UIImage imageNamed:@"bg_separator"];
    UIImageView *imgView_s = [[UIImageView alloc] initWithFrame:CGRectMake(0, 35+h, SCREEN_WIDTH, 1)];
    imgView_s.image = img_s;
    [self.view addSubview:imgView_s];

    UIImage *img2 = [UIImage imageNamed:@"icon_1_2"];
    UIImageView *imgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 50+h, w, h)];
    imgView2.image = img2;
    [self.view addSubview:imgView2];
    UILabel *lbl21 = [[UILabel alloc] initWithFrame:CGRectMake(w+40, 40+h, SCREEN_WIDTH-w-100, 15+h/2)];
    lbl21.text = @"活性炭（剩余30天）";
    lbl21.textAlignment = NSTextAlignmentLeft;
    lbl21.textColor = [UIColor blackColor];
    lbl21.font = FONT15;
    [self.view addSubview:lbl21];
    UILabel *lbl22 = [[UILabel alloc] initWithFrame:CGRectMake(w+40, 45+3*h/2, SCREEN_WIDTH-w-100, 15+h/2)];
    lbl22.text = @"去除水中杀虫剂，洗涤剂...";
    lbl22.textAlignment = NSTextAlignmentLeft;
    lbl22.textColor = [UIColor grayColor];
    lbl22.font = FONT11;
    [self.view addSubview:lbl22];
    UILabel *lbl23 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, 50+h, 40, h)];
    lbl23.text = @"40%";
    lbl23.textAlignment = NSTextAlignmentRight;
    lbl23.textColor = [UIColor orangeColor];
    lbl23.font = FONT15;
    [self.view addSubview:lbl23];

    UIImage *img3 = [UIImage imageNamed:@"icon_1_3"];
    UIImageView *imgView3 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 80+2*h, w, h)];
    imgView3.image = img3;
    [self.view addSubview:imgView3];
    UILabel *lbl31 = [[UILabel alloc] initWithFrame:CGRectMake(w+40, 70+2*h, SCREEN_WIDTH-w-100, 15+h/2)];
    lbl31.text = @"压缩炭（剩余90天）";
    lbl31.textAlignment = NSTextAlignmentLeft;
    lbl31.textColor = [UIColor blackColor];
    lbl31.font = FONT15;
    [self.view addSubview:lbl31];
    UILabel *lbl32 = [[UILabel alloc] initWithFrame:CGRectMake(w+40, 75+5*h/2, SCREEN_WIDTH-w-100, 15+h/2)];
    lbl32.text = @"去除水中异色，异味...";
    lbl32.textAlignment = NSTextAlignmentLeft;
    lbl32.textColor = [UIColor grayColor];
    lbl32.font = FONT11;
    [self.view addSubview:lbl32];
    UILabel *lbl33 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, 80+2*h, 40, h)];
    lbl33.text = @"60%";
    lbl33.textAlignment = NSTextAlignmentRight;
    lbl33.textColor = [UIColor blueColor];
    lbl33.font = FONT15;
    [self.view addSubview:lbl33];

    UIImage *img4 = [UIImage imageNamed:@"icon_1_4"];
    UIImageView *imgView4 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 110+3*h, w, h)];
    imgView4.image = img4;
    [self.view addSubview:imgView4];
    UILabel *lbl41 = [[UILabel alloc] initWithFrame:CGRectMake(w+40, 100+3*h, SCREEN_WIDTH-w-100, 15+h/2)];
    lbl41.text = @"压缩炭（剩余90天）";
    lbl41.textAlignment = NSTextAlignmentLeft;
    lbl41.textColor = [UIColor blackColor];
    lbl41.font = FONT15;
    [self.view addSubview:lbl41];
    UILabel *lbl42 = [[UILabel alloc] initWithFrame:CGRectMake(w+40, 105+7*h/2, SCREEN_WIDTH-w-100, 15+h/2)];
    lbl42.text = @"去除水中异色，异味...";
    lbl42.textAlignment = NSTextAlignmentLeft;
    lbl42.textColor = [UIColor grayColor];
    lbl42.font = FONT11;
    [self.view addSubview:lbl42];
    UILabel *lbl43 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, 110+3*h, 40, h)];
    lbl43.text = @"60%";
    lbl43.textAlignment = NSTextAlignmentRight;
    lbl43.textColor = [UIColor blueColor];
    lbl43.font = FONT15;
    [self.view addSubview:lbl43];

    UIImage *img5 = [UIImage imageNamed:@"icon_1_5"];
    UIImageView *imgView5 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 140+4*h, w, h)];
    imgView5.image = img5;
    [self.view addSubview:imgView5];
    UILabel *lbl51 = [[UILabel alloc] initWithFrame:CGRectMake(w+40, 130+4*h, SCREEN_WIDTH-w-100, 15+h/2)];
    lbl51.text = @"压缩炭（剩余90天）";
    lbl51.textAlignment = NSTextAlignmentLeft;
    lbl51.textColor = [UIColor blackColor];
    lbl51.font = FONT15;
    [self.view addSubview:lbl51];
    UILabel *lbl52 = [[UILabel alloc] initWithFrame:CGRectMake(w+40, 135+9*h/2, SCREEN_WIDTH-w-100, 15+h/2)];
    lbl52.text = @"去除水中异色，异味...";
    lbl52.textAlignment = NSTextAlignmentLeft;
    lbl52.textColor = [UIColor grayColor];
    lbl52.font = FONT11;
    [self.view addSubview:lbl52];
    UILabel *lbl53 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, 140+4*h, 40, h)];
    lbl53.text = @"60%";
    lbl53.textAlignment = NSTextAlignmentRight;
    lbl53.textColor = [UIColor blueColor];
    lbl53.font = FONT15;
    [self.view addSubview:lbl53];
}

@end