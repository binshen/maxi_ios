//
// Created by Bin Shen on 18/02/2017.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "DeviceDetail2Page.h"

@interface DeviceDetail2Page() {

}
@end

@implementation DeviceDetail2Page

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"用水量";

    UIImage *img_a = [UIImage imageNamed:@"icon_2_7days"];
    CGFloat w_a = img_a.size.width;
    CGFloat h_a = img_a.size.height;
    UIImageView *imgView_a = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, w_a, h_a)];
    imgView_a.image = img_a;
    [self.view addSubview:imgView_a];
    UILabel *lbl_a = [[UILabel alloc] initWithFrame:CGRectMake(w_a+40, 20, SCREEN_WIDTH-w_a-40, h_a)];
    lbl_a.text = @"剩余水量（30L）";
    lbl_a.textAlignment = NSTextAlignmentLeft;
    lbl_a.textColor = [UIColor blackColor];
    lbl_a.font = FONT15;
    [self.view addSubview:lbl_a];

    UIImage *img_b = [UIImage imageNamed:@"icon_2_rest"];
    UIImageView *imgView_b = [[UIImageView alloc] initWithFrame:CGRectMake(20, 40+h_a, w_a, h_a)];
    imgView_b.image = img_b;
    [self.view addSubview:imgView_b];
    UILabel *lbl_b = [[UILabel alloc] initWithFrame:CGRectMake(w_a+40, 40+h_a, SCREEN_WIDTH-w_a-40, h_a)];
    lbl_b.text = @"7天用水量统计";
    lbl_b.textAlignment = NSTextAlignmentLeft;
    lbl_b.textColor = [UIColor blackColor];
    lbl_b.font = FONT15;
    [self.view addSubview:lbl_b];

    CGFloat height = 40+2*h_a;
    UIImage *img1 = [UIImage imageNamed:@"icon_2_1"];
    CGFloat w = img1.size.width;
    CGFloat h = img1.size.height;
    UIImageView *imgView1 = [[UIImageView alloc] initWithFrame:CGRectMake(23, height+15, w, h)];
    imgView1.image = img1;
    [self.view addSubview:imgView1];
    UILabel *lbl11 = [[UILabel alloc] initWithFrame:CGRectMake(w_a+40, height+15, SCREEN_WIDTH-w_a-40, h)];
    lbl11.text = @"2016-12-28";
    lbl11.textAlignment = NSTextAlignmentLeft;
    lbl11.textColor = [UIColor grayColor];
    lbl11.font = FONT12;
    [self.view addSubview:lbl11];
    UILabel *lbl12 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, height+15, 40, h)];
    lbl12.text = @"1L";
    lbl12.textAlignment = NSTextAlignmentRight;
    lbl12.textColor = [UIColor blueColor];
    lbl12.font = FONT12;
    [self.view addSubview:lbl12];

    UIImage *img2 = [UIImage imageNamed:@"icon_2_2"];
    UIImageView *imgView2 = [[UIImageView alloc] initWithFrame:CGRectMake(23, height+20+h, w, h)];
    imgView2.image = img2;
    [self.view addSubview:imgView2];
    UILabel *lbl21 = [[UILabel alloc] initWithFrame:CGRectMake(w_a+40, height+20+h, SCREEN_WIDTH-w_a-40, h)];
    lbl21.text = @"2016-12-27";
    lbl21.textAlignment = NSTextAlignmentLeft;
    lbl21.textColor = [UIColor grayColor];
    lbl21.font = FONT12;
    [self.view addSubview:lbl21];
    UILabel *lbl22 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, height+20+h, 40, h)];
    lbl22.text = @"2L";
    lbl22.textAlignment = NSTextAlignmentRight;
    lbl22.textColor = [UIColor blueColor];
    lbl22.font = FONT12;
    [self.view addSubview:lbl22];

    UIImage *img3 = [UIImage imageNamed:@"icon_2_3"];
    UIImageView *imgView3 = [[UIImageView alloc] initWithFrame:CGRectMake(23, height+25+2*h, w, h)];
    imgView3.image = img3;
    [self.view addSubview:imgView3];
    UILabel *lbl31 = [[UILabel alloc] initWithFrame:CGRectMake(w_a+40, height+25+2*h, SCREEN_WIDTH-w_a-40, h)];
    lbl31.text = @"2016-12-26";
    lbl31.textAlignment = NSTextAlignmentLeft;
    lbl31.textColor = [UIColor grayColor];
    lbl31.font = FONT12;
    [self.view addSubview:lbl31];
    UILabel *lbl32 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, height+25+h, 40, h)];
    lbl32.text = @"0L";
    lbl32.textAlignment = NSTextAlignmentRight;
    lbl32.textColor = [UIColor blueColor];
    lbl32.font = FONT12;
    [self.view addSubview:lbl32];

    UIImage *img4 = [UIImage imageNamed:@"icon_2_4"];
    UIImageView *imgView4 = [[UIImageView alloc] initWithFrame:CGRectMake(23, height+30+3*h, w, h)];
    imgView4.image = img4;
    [self.view addSubview:imgView4];
    UILabel *lbl41 = [[UILabel alloc] initWithFrame:CGRectMake(w_a+40, height+30+3*h, SCREEN_WIDTH-w_a-40, h)];
    lbl41.text = @"2016-12-25";
    lbl41.textAlignment = NSTextAlignmentLeft;
    lbl41.textColor = [UIColor grayColor];
    lbl41.font = FONT12;
    [self.view addSubview:lbl41];
    UILabel *lbl42 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, height+30+3*h, 40, h)];
    lbl42.text = @"0L";
    lbl42.textAlignment = NSTextAlignmentRight;
    lbl42.textColor = [UIColor blueColor];
    lbl42.font = FONT12;
    [self.view addSubview:lbl42];

    UIImage *img5 = [UIImage imageNamed:@"icon_2_5"];
    UIImageView *imgView5 = [[UIImageView alloc] initWithFrame:CGRectMake(23, height+35+4*h, w, h)];
    imgView5.image = img5;
    [self.view addSubview:imgView5];
    UILabel *lbl51 = [[UILabel alloc] initWithFrame:CGRectMake(w_a+40, height+35+4*h, SCREEN_WIDTH-w_a-40, h)];
    lbl51.text = @"2016-12-24";
    lbl51.textAlignment = NSTextAlignmentLeft;
    lbl51.textColor = [UIColor grayColor];
    lbl51.font = FONT12;
    [self.view addSubview:lbl51];
    UILabel *lbl52 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, height+35+4*h, 40, h)];
    lbl52.text = @"0L";
    lbl52.textAlignment = NSTextAlignmentRight;
    lbl52.textColor = [UIColor blueColor];
    lbl52.font = FONT12;
    [self.view addSubview:lbl52];

    UIImage *img6 = [UIImage imageNamed:@"icon_2_6"];
    UIImageView *imgView6 = [[UIImageView alloc] initWithFrame:CGRectMake(23, height+40+5*h, w, h)];
    imgView6.image = img6;
    [self.view addSubview:imgView6];
    UILabel *lbl61 = [[UILabel alloc] initWithFrame:CGRectMake(w_a+40, height+40+5*h, SCREEN_WIDTH-w_a-40, h)];
    lbl61.text = @"2016-12-23";
    lbl61.textAlignment = NSTextAlignmentLeft;
    lbl61.textColor = [UIColor grayColor];
    lbl61.font = FONT12;
    [self.view addSubview:lbl61];
    UILabel *lbl62 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, height+40+5*h, 40, h)];
    lbl62.text = @"0L";
    lbl62.textAlignment = NSTextAlignmentRight;
    lbl62.textColor = [UIColor blueColor];
    lbl62.font = FONT12;
    [self.view addSubview:lbl62];

    UIImage *img7 = [UIImage imageNamed:@"icon_2_7"];
    UIImageView *imgView7 = [[UIImageView alloc] initWithFrame:CGRectMake(23, height+45+6*h, w, h)];
    imgView7.image = img7;
    [self.view addSubview:imgView7];
    UILabel *lbl71 = [[UILabel alloc] initWithFrame:CGRectMake(w_a+40, height+45+6*h, SCREEN_WIDTH-w_a-40, h)];
    lbl71.text = @"2016-12-22";
    lbl71.textAlignment = NSTextAlignmentLeft;
    lbl71.textColor = [UIColor grayColor];
    lbl71.font = FONT12;
    [self.view addSubview:lbl71];
    UILabel *lbl72 = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, height+45+6*h, 40, h)];
    lbl72.text = @"0L";
    lbl72.textAlignment = NSTextAlignmentRight;
    lbl72.textColor = [UIColor blueColor];
    lbl72.font = FONT12;
    [self.view addSubview:lbl72];
}

@end