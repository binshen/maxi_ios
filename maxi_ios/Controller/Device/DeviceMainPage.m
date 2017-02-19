//
// Created by Bin Shen on 2017/2/12.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "DeviceMainPage.h"
#import "DeviceAddPage.h"
#import "DeviceDetailPage.h"
#import "BaseNavCtrl.h"
#import "MaxiTableViewCell.h"

@interface DeviceMainPage()<UITableViewDataSource,UITableViewDelegate> {

    UITableView *_tableView;
    NSMutableArray *deviceArray;
}
@end

@implementation DeviceMainPage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"淼溪净水";

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

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, bg_image.size.height, SCREEN_WIDTH, SCREEN_HEIGHT-bg_image.size.height-40) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];

    [self loadDeviceInfoList:YES];

    self.hidesBottomBarWhenPushed = YES;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

-(void)loadDeviceInfoList:(BOOL)bTips
{
    deviceArray = [[NSMutableArray alloc] init];

    NSDictionary *device1 = [NSDictionary dictionaryWithObjectsAndKeys:@"淼溪净水器设备1\n",@"name",@"1",@"status",@"出水水质：非常棒",@"desc",nil];
    [deviceArray addObject:device1];
    NSDictionary *device2 = [NSDictionary dictionaryWithObjectsAndKeys:@"淼溪净水器设备2\n",@"name",@"0",@"status",@"出水水质：不理想",@"desc",nil];
    [deviceArray addObject:device2];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [deviceArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * identifier = @"deviceMainList";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[MaxiTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    NSUInteger row = [indexPath row];
    NSDictionary *device = [deviceArray objectAtIndex:row];
    cell.textLabel.numberOfLines = 2;
    cell.textLabel.text = [device valueForKey:@"name"];
    int status = [device[@"status"] integerValue];
    if(status == 1) {
        cell.detailTextLabel.text = @"正在运行";
        cell.imageView.image = [UIImage imageNamed:@"icon_start"];
        cell.detailTextLabel.textColor = kUIColorFromRGB(0x6bb3ed);
    } else {
        cell.detailTextLabel.text = @"停止运行";
        cell.imageView.image = [UIImage imageNamed:@"icon_stop"];
        cell.detailTextLabel.textColor = kUIColorFromRGB(0xff3f54);
    }
    cell.textLabel.font = FONT16;
    cell.textLabel.textColor = BLACKTEXTCOLOR_TITLE;
    cell.detailTextLabel.font = FONT14;

    UILabel *labelDesc = [[UILabel alloc] initWithFrame:CGRectMake(cell.imageView.image.size.width+30, 30, 200, 30)];
    labelDesc.text = [device valueForKey:@"desc"];
    labelDesc.font = FONT13;
    labelDesc.textAlignment = NSTextAlignmentLeft;
    labelDesc.textColor = GRAY_TEXT_COLOR_2;
    [cell.contentView addSubview:labelDesc];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

//    _selectedDevice = [[deviceArray objectAtIndex:[indexPath row]] mutableCopy];

//    DeviceDetailPage *page = [[DeviceDetailPage alloc] initIsFirstPage:NO];
//    [self presentViewController:[[BaseNavCtrl alloc] initWithRootViewController:page] animated:YES completion:nil];

    DeviceDetailPage *page = [[DeviceDetailPage alloc] initIsFirstPage:NO];
    [self.navigationController pushViewController:page animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addAction:(id)sender {
    DeviceAddPage * page = [[DeviceAddPage alloc] initIsFirstPage:NO];
    [self.navigationController pushViewController:page animated:YES];
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    static NSString *ID = @"header";
//    // 先从缓存池中找header
//    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
//
//    UILabel *label = nil;
//    if (header == nil) { // 缓存池中有，自己创建
//        header = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:ID];
//        header.contentView.backgroundColor = [UIColor blackColor];
//
//        label = [[UILabel alloc] init];
//        label.textColor = MAIN_TAB_ACTIVE_COLOR;
////        label.width = 200;
////        label.x = TopicCellMargin;
//        label.autoresizingMask = UIViewAutoresizingFlexibleHeight;
//        label.tag = 99;
//        [header.contentView addSubview:label];
//    }else{
//        // 从缓冲池中取出来
//        label = (UILabel *)[header viewWithTag:99];
//    }
//
//    // 设置文字
//    if (section == 0) {
//        label.text = @"最热评论";
//    }else{
//        label.text = @"最新评论";
//    }
//
//    return header;
//}

@end