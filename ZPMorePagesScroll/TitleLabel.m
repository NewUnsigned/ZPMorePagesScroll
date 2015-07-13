//
//  TitleLable.m
//  RTHXiOSApp
//
//  Created by 融通汇信 on 15/6/15.
//  Copyright (c) 2015年 融通汇信. All rights reserved.
//

#import "TitleLabel.h"

// 默认字体大小
#define NormalSize 14.0
// 选中字体大小
#define SelectedSize 18.0

@implementation TitleLabel

+ (instancetype)titleLabelWithTitle:(NSString *)title
{
    TitleLabel *l = [[TitleLabel alloc] init];
    
    l.userInteractionEnabled = YES;
    l.text = title;
    l.font = [UIFont systemFontOfSize:SelectedSize];
    l.textColor = [UIColor blackColor];
    l.textAlignment = NSTextAlignmentCenter;
    
    [l sizeToFit];
    
    l.font = [UIFont systemFontOfSize:NormalSize];
    
    return l;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.delegate titleLabelDidSelected:self];
}

@end
