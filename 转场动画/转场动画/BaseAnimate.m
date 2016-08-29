//
//  BaseAnimate.m
//  转场动画
//
//  Created by wujianqiang on 16/8/29.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "BaseAnimate.h"

@interface BaseAnimate ()

@property (nonatomic, weak) id <UIViewControllerContextTransitioning> transitionContext;

@property (nonatomic, weak) UIViewController  *fromViewController;
@property (nonatomic, weak) UIViewController  *toViewController;
@property (nonatomic, weak) UIView            *containerView;

@end


@implementation BaseAnimate

#pragma mark - 初始化
- (instancetype)init {
    self = [super init];
    if (self) {
        // 默认参数设置
        [self deafultSet];
    }
    return self;
}

- (void)deafultSet {
    _transitionDuration = 0.5f;
}

#pragma mark - 动画代理
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return _transitionDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    self.fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    self.toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    self.containerView      = [transitionContext containerView];
    self.transitionContext  = transitionContext;
    
    [self animateTransitionEvent];
}

- (void)animateTransitionEvent {
    
}

#pragma mark -
- (void)completeTransition {
    [self.transitionContext completeTransition:!self.transitionContext.transitionWasCancelled];
}
@end
