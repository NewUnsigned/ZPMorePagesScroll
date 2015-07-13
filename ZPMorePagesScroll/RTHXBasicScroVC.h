//
//  RTHXBasicScroVC.h
//  RTHXiOSApp
//
//  Created by 融通汇信 on 15/7/2.
//  Copyright (c) 2015年 融通汇信. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RTHXBasicScroVC : UIViewController

@property (nonatomic, strong) NSArray *titleArray;

- (void)registerCollectionCellWithCellClass:(Class)cellClass Indentifier:(NSString *)indentifier;
- (void)setFlowLayoutWithCollectionHeight:(CGFloat)collectionHeight;
- (void)setTitleScView;

@end
