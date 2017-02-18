//
// Created by Bin Shen on 17/02/2017.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "NearByPage.h"

@interface NearByPage() {


}
@end

@implementation NearByPage

- (void)viewDidLoad {
    [super viewDidLoad];

    NSDictionary *dic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor blackColor], [UIFont systemFontOfSize:20 weight:20], nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil]];
    self.navigationController.navigationBar.titleTextAttributes = dic;
}

@end