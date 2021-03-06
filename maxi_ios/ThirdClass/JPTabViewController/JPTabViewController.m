//
//  JPTabViewController.m
//  JPTabViewController
//
//  Created by Jean-Philippe DESCAMPS on 19/03/2014.
//  Copyright (c) 2014 Jean-Philippe. All rights reserved.
//

#import "JPTabViewController.h"

@interface JPTabViewController ()

@property (nonatomic, strong) UIScrollView *contentScrollView;

@property (nonatomic, strong) NSArray *controllers;

@property (nonatomic, strong) NSMutableArray *tabs;

@property (nonatomic, strong) UIView *indicatorView;

@end

@implementation JPTabViewController

- (id)initWithControllers:(NSArray *)controllers
{
    if(self = [self init])
    {
        _controllers = controllers;
        selectedTab = NSIntegerMax;
        _delegate = nil;
        _indicatorView = [[UIView alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _indicatorView.backgroundColor= BLUE_TEXT_COLOR_2;
    if (_controllers != nil)
    {
        [self loadUI];
    }
}

-(void)viewWillLayoutSubviews
{
    _contentScrollView.frame = CGRectMake(0.0, _menuHeight, self.view.frame.size.width, self.view.frame.size.height-_menuHeight);
    
    for (int i=0; i < [_controllers count]; i++)
    {
        // Create content view
        UIViewController *controller = [_controllers objectAtIndex:i];
        
        [[controller view] setFrame:CGRectMake(i * _contentScrollView.frame.size.width, 0.0, _contentScrollView.frame.size.width, _contentScrollView.frame.size.height)];
    }

    [_contentScrollView setContentSize:CGSizeMake(self.view.frame.size.width * [_controllers count], self.view.frame.size.height - _menuHeight)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)loadUI
{
    _menuHeight = 40.0;
    
    _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, _menuHeight, self.view.frame.size.width, self.view.frame.size.height - _menuHeight)];
    [_contentScrollView setPagingEnabled:YES];
    [_contentScrollView setDelegate:self];
    _contentScrollView.bounces = NO;
    
    float tabWidth = self.view.frame.size.width / [_controllers count];
    _tabs = [[NSMutableArray alloc] init];
    for (int i=0; i < [_controllers count]; i++)
    {
        // Create content view
        UIViewController *controller = [_controllers objectAtIndex:i];

        [[controller view] setFrame:CGRectMake(i * _contentScrollView.frame.size.width, 0.0, _contentScrollView.frame.size.width, _contentScrollView.frame.size.height)];
        [_contentScrollView addSubview:[controller view]];
        
        // Create button
        UIButton *tab = [[UIButton alloc] initWithFrame:CGRectMake(i * tabWidth, 0, tabWidth, _menuHeight)];
        [tab setTitle:controller.title forState:UIControlStateNormal];
        [tab setFont:[UIFont boldSystemFontOfSize:15]];
        [tab setTitleColor:i == 0 ? BLUE_TEXT_COLOR_2 : [UIColor blackColor] forState:UIControlStateNormal];
        [tab addTarget:self action:@selector(selectTab:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:tab];
        [_tabs addObject:tab];
    }
    
    UIButton *tab = [_tabs objectAtIndex:0];
    selectedTab = 0;

    _indicatorView.frame = CGRectMake(30, _menuHeight-3, tabWidth-60, 3);
    [self.view addSubview:_indicatorView];

    [self.view addSubview:_contentScrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat width = scrollView.frame.size.width;
    int page = (scrollView.contentOffset.x + (0.5f * width)) / width;
    float tabWidth = _indicatorView.frame.size.width+60;
    _indicatorView.frame = CGRectMake(page * tabWidth+30, _menuHeight-3, tabWidth-60, 3);
    selectedTab = page;
}

- (void)selectTab:(id)sender
{
    selectedTab = [_tabs indexOfObject:sender];
    CGRect rect = CGRectMake(self.view.frame.size.width * selectedTab, 0.0, self.view.frame.size.width, _contentScrollView.contentSize.height);
    [_contentScrollView scrollRectToVisible:rect animated:YES];

    if(_delegate && [_delegate respondsToSelector:@selector(currentTabHasChanged:)] )
    {
        [_delegate currentTabHasChanged:selectedTab];
    }

    [[_tabs objectAtIndex:selectedTab] setTitleColor:BLUE_TEXT_COLOR_2 forState:UIControlStateNormal];
    [[_tabs objectAtIndex:selectedTab==0?1:0] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

- (void)selectTabNum:(NSInteger)index
{
    if(index<0 || index>=[_tabs count])
    {
        return;
    }
    UIButton *tab = [_tabs objectAtIndex:index];
    [self selectTab:tab];
}

- (NSInteger)selectedTab
{
    return selectedTab;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //NSLog(@"%d", selectedTab);
    [[_tabs objectAtIndex:selectedTab] setTitleColor:BLUE_TEXT_COLOR_2 forState:UIControlStateNormal];
    [[_tabs objectAtIndex:selectedTab==0?1:0] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

@end
