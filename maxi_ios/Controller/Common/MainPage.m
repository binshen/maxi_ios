//
// Created by Bin Shen on 17/02/2017.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "MainPage.h"
#import "PageInfo.h"

@interface MainPage ()

@end


@implementation MainPage

- (id)init
{
    self = [super init];
    if (self) {
        [self addTabControllers];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addTabControllers
{
    self.tabBar.tintColor = NAVIGATIONTINTCOLOR;
    self.viewControllers = [PageInfo pageControllers];
}

@end