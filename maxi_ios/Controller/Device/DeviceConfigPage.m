//
// Created by Bin Shen on 2017/2/12.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "DeviceConfigPage.h"
#import "DeviceMainPage.h"
#import "DeviceUpdateNamePage.h"
#import "DeviceRechargePage.h"

@interface DeviceConfigPage()<UITableViewDataSource,UITableViewDelegate> {

    UITableView *_tableView;
    NSMutableArray *configArray;
}
@end

@implementation DeviceConfigPage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"系统设置";
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor blackColor], [UIFont systemFontOfSize:20 weight:20], nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil]];
    self.navigationController.navigationBar.titleTextAttributes = dic;

    UIImage* backImage = [UIImage imageNamed:@"btn_back"];
    UIButton* backButton= [[UIButton alloc] initWithFrame:CGRectMake(0,0,16,20)];
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-40) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];

    [self loadDeviceInfoList:YES];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT-130, SCREEN_WIDTH-40, 40)];
    imageView.image = [UIImage imageNamed:@"btn_unbind_device"];
    imageView.userInteractionEnabled = YES;
    [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doUnbindDevice:)]];
    [self.view addSubview:imageView];
}

-(void)loadDeviceInfoList:(BOOL)bTips
{
    configArray = [[NSMutableArray alloc] init];

    NSDictionary *device1 = [NSDictionary dictionaryWithObjectsAndKeys:@"净化器名称变更",@"name",@"出水水质：非常棒",@"image",nil];
    [configArray addObject:device1];
    NSDictionary *device2 = [NSDictionary dictionaryWithObjectsAndKeys:@"水量充值",@"name",@"出水水质：不理想",@"image",nil];
    [configArray addObject:device2];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [configArray count];
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
    NSString * identifier = @"configMainList";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    NSUInteger row = [indexPath row];
    NSDictionary *config = [configArray objectAtIndex:row];
    cell.textLabel.text = [config valueForKey:@"name"];
    cell.detailTextLabel.text = @"";
    cell.imageView.image = [UIImage imageNamed:[config valueForKey:@"image"]];
    cell.detailTextLabel.textColor = BLACKTEXTCOLOR_SUB;
    cell.textLabel.font = FONT16;
    cell.textLabel.textColor = BLACKTEXTCOLOR_TITLE;
    cell.detailTextLabel.font = FONT14;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    int index = [indexPath row];
    if(index == 0) {
        DeviceUpdateNamePage * page = [[DeviceUpdateNamePage alloc] initIsFirstPage:NO];
        [self.navigationController pushViewController:page animated:YES];
    } else {
        DeviceRechargePage * page = [[DeviceRechargePage alloc] initIsFirstPage:NO];
        [self.navigationController pushViewController:page animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doUnbindDevice:(UIGestureRecognizer *)gestureRecognizer {
    DeviceMainPage * page = [[DeviceMainPage alloc] initIsFirstPage:NO];
    [self.navigationController pushViewController:page animated:YES];
}

@end