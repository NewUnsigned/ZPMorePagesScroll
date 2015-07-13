//
//  ContentCell.h
//  RTHXiOSApp
//
//  Created by 融通汇信 on 15/6/15.
//  Copyright (c) 2015年 融通汇信. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ContentCell : UICollectionViewCell

@property (nonatomic,strong) UITableViewController *listVC;
@property (nonatomic,copy) NSString *urlString;
- (void)setListViewControllerWithCellItem:(NSInteger)item;

@end
