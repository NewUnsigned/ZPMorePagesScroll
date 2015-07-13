//
//  ViewController.m
//  ZPMorePagesScroll
//
//  Created by 融通汇信 on 15/7/13.
//  Copyright (c) 2015年 融通汇信. All rights reserved.
//

#import "ViewController.h"
#import "ContentCell.h"

#define RTHX_ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    self.navigationItem.title = @"我的项目";
    self.titleArray = @[@"投资项目",@"理财服务",@"债权转让"];
    
    [self setFlowLayoutWithCollectionHeight:RTHX_ScreenHeight - 104];
    [self registerCollectionCellWithCellClass:[ContentCell class] Indentifier:@"Finance_Cell"];
    
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"Finance_Cell";
    ContentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    if (cell.listVC == nil) {
        [cell setListViewControllerWithCellItem:indexPath.item];
    }
    if (![self.childViewControllers containsObject:cell.listVC]) {
        [self addChildViewController:(UIViewController *)cell.listVC];
    }
    cell.backgroundColor = [UIColor whiteColor ];
    return cell;
}

@end
