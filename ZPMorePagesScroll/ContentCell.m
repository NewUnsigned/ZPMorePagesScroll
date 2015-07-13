//
//  ContentCell.m
//  RTHXiOSApp
//
//  Created by 融通汇信 on 15/6/15.
//  Copyright (c) 2015年 融通汇信. All rights reserved.
//

#import "ContentCell.h"

@implementation ContentCell

- (void)setUrlString:(NSString *)urlString
{
    _urlString = urlString.copy;
}
- (void)setListViewControllerWithCellItem:(NSInteger)item
{
    UIStoryboard *listSB = [UIStoryboard storyboardWithName:@"FinanceList" bundle:nil];
    self.listVC = listSB.instantiateInitialViewController;
    self.listVC.view.frame = self.bounds;
    [self addSubview:self.listVC.view];
}

@end
