//
// Created by Bin Shen on 2017/2/12.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "DeviceMainPage.h"
#import "DeviceAddPage.h"
#import "DeviceDetailPage.h"
#import "BaseNavCtrl.h"

@interface DeviceMainPage()<UITableViewDataSource,UITableViewDelegate> {

    UITableView *_tableView;
    NSMutableArray *deviceArray;
}
@end

@implementation DeviceMainPage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"淼溪净水";
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor whiteColor], [UIFont systemFontOfSize:20 weight:20], nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil]];
    self.navigationController.navigationBar.titleTextAttributes = dic;

    UIImage* backImage = [UIImage imageNamed:@"btn_back2"];
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

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, bg_image.size.height, SCREEN_WIDTH, SCREEN_HEIGHT-bg_image.size.height-40) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];

    [self loadDeviceInfoList:YES];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

-(void)loadDeviceInfoList:(BOOL)bTips
{
    deviceArray = [[NSMutableArray alloc] init];

    NSDictionary *device1 = [NSDictionary dictionaryWithObjectsAndKeys:@"淼溪净水器设备1",@"name",@"1",@"status",@"出水水质：非常棒",@"desc",nil];
    [deviceArray addObject:device1];
    NSDictionary *device2 = [NSDictionary dictionaryWithObjectsAndKeys:@"淼溪净水器设备2",@"name",@"0",@"status",@"出水水质：不理想",@"desc",nil];
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    NSUInteger row = [indexPath row];
    NSDictionary *device = [deviceArray objectAtIndex:row];
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

@end