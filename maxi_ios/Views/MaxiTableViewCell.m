//
// Created by Bin Shen on 19/02/2017.
// Copyright (c) 2017 Bin Shen. All rights reserved.
//

#import "MaxiTableViewCell.h"


@implementation MaxiTableViewCell

//http://blog.sina.com.cn/s/blog_65cbfb2b0101cd60.html
//http://www.cnblogs.com/wendingding/p/3761730.html
//http://blog.csdn.net/u012350430/article/details/51181728

- (void)layoutSubviews {
    [super layoutSubviews];

    self.detailTextLabel.frame = CGRectMake(self.detailTextLabel.frame.origin.x,
            self.detailTextLabel.frame.origin.y + (self.textLabel.frame.size.height-self.detailTextLabel.frame.size.height-6)/2,
            self.detailTextLabel.bounds.size.width,
            self.detailTextLabel.bounds.size.height);
}

@end