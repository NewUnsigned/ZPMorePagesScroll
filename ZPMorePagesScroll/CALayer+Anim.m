
#import "CALayer+Anim.h"

@implementation CALayer (Anim)


/*
 *  摇动
 */
-(void)shake{
    CAKeyframeAnimation *kfa = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    CGFloat s = 5;
    kfa.values = @[@(-s),@(0),@(s),@(0),@(-s),@(0),@(s),@(0)];
    //时长
    kfa.duration = 0.3f;
    //重复
    kfa.repeatCount = 2;
    //移除
    kfa.removedOnCompletion = YES;
    [self addAnimation:kfa forKey:@"shake"];
}

-(void)shakeFinanceTitleRight{
    CAKeyframeAnimation *kfa = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    CGFloat s = 5;
    kfa.values = @[@(-s),@(s),@(-s),@(0)];
    //时长
    kfa.duration = 0.5f;
    //重复
    kfa.repeatCount = 1;
    //移除
    kfa.removedOnCompletion = YES;
    [self addAnimation:kfa forKey:@"shake"];
}

-(void)shakeFinanceTitleLeft{
    CAKeyframeAnimation *kfa = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    CGFloat s = 5;
    kfa.values = @[@(s),@(-s),@(s),@(0)];
    //时长
    kfa.duration = 0.5f;
    //重复
    kfa.repeatCount = 1;
    //移除
    kfa.removedOnCompletion = YES;
    [self addAnimation:kfa forKey:@"shake"];
}

@end
