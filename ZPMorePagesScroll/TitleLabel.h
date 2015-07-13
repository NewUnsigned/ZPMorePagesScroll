//
//  TitleLable.h
//  RTHXiOSApp
//
//  Created by 融通汇信 on 15/6/15.
//  Copyright (c) 2015年 融通汇信. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TitleLabel;

@protocol TitleLabelDelegate <NSObject>

- (void)titleLabelDidSelected:(TitleLabel *)label;

@end

@interface TitleLabel : UILabel
+ (instancetype)titleLabelWithTitle:(NSString *)title;

@property (nonatomic,weak) id<TitleLabelDelegate> delegate;
@end
