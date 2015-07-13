//
//  RTHXBasicScroVC.m
//  RTHXiOSApp
//
//  Created by 融通汇信 on 15/7/2.
//  Copyright (c) 2015年 融通汇信. All rights reserved.
//

#import "RTHXBasicScroVC.h"
#import "TitleLabel.h"
#import "ContentCell.h"
#import "CALayer+Anim.h"

#define RTHX_ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define RTHX_ScreenHeight [UIScreen mainScreen].bounds.size.height
#define RTHX_TitleSelectedColor [UIColor redColor]
#define RTHX_TitleNormalColor   [UIColor blackColor]

const CGFloat UnderLineAnimationDuration = 0.2f;
const CGFloat UnderLineHeigth            = 4.0f;
const CGFloat RedLineWidth               = 55.0f;

@interface RTHXBasicScroVC ()<UICollectionViewDataSource,UISearchControllerDelegate,TitleLabelDelegate,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionViewFlowLayout *listCollectionViewFlowLayout;
@property (nonatomic, strong) UICollectionView           *listCollectionView;
@property (nonatomic, strong) UIScrollView               *titleScrollView;
@property (nonatomic, strong) UIView                     *underLine;
@property (nonatomic, assign) CGFloat                     currentOffset;
@property (nonatomic, assign) BOOL                        isShakeLeft;
@property (nonatomic, assign) NSInteger                   curLblTag;

@end

@implementation RTHXBasicScroVC

#pragma mark - lifeCycleMethed
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.listCollectionView.pagingEnabled     = YES;
    self.listCollectionView.delegate          = self;
    self.listCollectionView.dataSource        = self;
    self.listCollectionView.backgroundColor   = [UIColor whiteColor];
    self.titleScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, RTHX_ScreenWidth, 40)];
    [self.view addSubview:self.titleScrollView];
    self.titleScrollView.backgroundColor = [UIColor whiteColor];
    [self setTitleScView];
}

- (void)registerCollectionCellWithCellClass:(Class)cellClass  Indentifier:(NSString *)indentifier
{
    [self.listCollectionView registerClass:cellClass forCellWithReuseIdentifier:indentifier];
}

- (void)setFlowLayoutWithCollectionHeight:(CGFloat)collectionHeight
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake(RTHX_ScreenWidth, collectionHeight);
    self.listCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 104, RTHX_ScreenWidth, collectionHeight) collectionViewLayout:flowLayout];
    [self.view addSubview:self.listCollectionView];
}

#pragma mark - CollectionViewDataresoure
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.titleArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSAssert(NO, @"This method must be overriden in the subclass");
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UICollectionViewCell alloc]initWithFrame:self.listCollectionView.bounds];
    }
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.currentOffset = scrollView.contentOffset.x;
    for (NSInteger index = 0; index < self.titleArray.count; index++) {
        if (scrollView.contentOffset.x == index * RTHX_ScreenWidth) {
            [self setTitleColorAndScrollToItemWithIndex:index];
        }
    }
}

#pragma mark - ChannelLabelDelegate
- (void)titleLabelDidSelected:(TitleLabel *)label {
    _isShakeLeft = (label.tag - _curLblTag) > 0 ? NO : YES;
    for (NSInteger index = 0; index < self.titleArray.count; index++) {
        if (label.tag == 1000 + index) {
            _curLblTag = label.tag;
            [self setTitleColorAndScrollToItemWithIndex:index];
        }
    }
}

- (void)setTitleScView
{
    CGFloat lblW = RTHX_ScreenWidth / self.titleArray.count;
    CGFloat lblH = _titleScrollView.frame.size.height;
    CGFloat lblY = 0;

    for (int i = 0; i < self.titleArray.count; i++) {
        TitleLabel *titleLbel   = [TitleLabel titleLabelWithTitle:self.titleArray[i]];
        titleLbel.tag = 1000 + i;
        if (i == 0) {
            titleLbel.textColor = [UIColor redColor];
                 self.curLblTag = titleLbel.tag;
        }
        titleLbel.delegate = self;
        CGFloat lblX = lblW * i;
        titleLbel.frame = CGRectMake(lblX, lblY, lblW, lblH);
        [self.titleScrollView addSubview:titleLbel];
    }
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    CGFloat underLineY = self.listCollectionView.frame.origin.y - 4;
    self.underLine     = [[UIView alloc]initWithFrame:CGRectMake(0, underLineY, RTHX_ScreenWidth / self.titleArray.count, UnderLineHeigth)];
    [self.view addSubview:_underLine];
    
    UIView *redLine  = [[UIView alloc]init];
    CGFloat redLineW = RedLineWidth;
    CGFloat redLineH = _underLine.frame.size.height;
    CGFloat redLineX = (_underLine.frame.size.width - redLineW) / 2;
    CGFloat redLineY = 0;
    redLine.backgroundColor = [UIColor redColor];
    redLine.frame = CGRectMake(redLineX, redLineY, redLineW, redLineH);
    [self.underLine addSubview:redLine];
    
    UIView *separateLine = [[UIView alloc]initWithFrame:CGRectMake(0, 39, RTHX_ScreenWidth, 1)];
    separateLine.backgroundColor = [UIColor lightGrayColor];
    separateLine.alpha   = 0.3;
    [self.titleScrollView addSubview:separateLine];
}

- (void)setTitleColorAndScrollToItemWithIndex:(NSInteger)index
{
    for (id titleLbl in self.titleScrollView.subviews) {
        if ([titleLbl isKindOfClass:[TitleLabel class]]) {
            TitleLabel *title1 = (TitleLabel *)titleLbl;
            if (title1.tag != 1000 + index) {
                title1.textColor = RTHX_TitleNormalColor;
            }else{
                title1.textColor = RTHX_TitleSelectedColor;
            }
        }
    }
    [self underLineScrollWithDistance:index * RTHX_ScreenWidth/self.titleArray.count];
    [self collectionViewScrollToItem:index];
}

- (void)scrollViewDidScroll:(nonnull UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x - self.currentOffset > 0) {
        self.isShakeLeft = NO;
    }else{
        self.isShakeLeft = YES;
    }
}

- (void)collectionViewScrollToItem:(NSInteger)item
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
    [self.listCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    if (self.isShakeLeft) {
        [self.underLine.layer shakeFinanceTitleLeft];
    }else{
        [self.underLine.layer shakeFinanceTitleRight];
    }
}

- (void)underLineScrollWithDistance:(CGFloat)Distance
{
    [UIView animateWithDuration:UnderLineAnimationDuration animations:^{
        CGRect tempFrame     = self.underLine.frame;
        tempFrame.origin.x   = Distance;
        self.underLine.frame = tempFrame;
    }];
}

#pragma mark - lazy loading
- (NSArray *)titleArray
{
    if (_titleArray == nil) {
        _titleArray = [NSArray array];
    }
    return _titleArray;
}

@end
