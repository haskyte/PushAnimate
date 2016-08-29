//
//  PresentAnimate.m
//  转场动画
//
//  Created by wujianqiang on 16/8/29.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "PresentAnimate.h"

#define  Width   [UIScreen mainScreen].bounds.size.width
#define  Height  [UIScreen mainScreen].bounds.size.height


@implementation PresentAnimate

- (void)animateTransitionEvent {
    
    // 当前控制器的view
    UIView *currentView   = self.fromViewController.view;
    currentView.transform = CGAffineTransformMakeScale(1.f, 1.f);
    
    // 变化的控制器的view
    UIView *toView = self.toViewController.view;
    CGRect newFrame = toView.frame;
    newFrame.origin.y = Height;
    toView.frame = newFrame;
    
    // 管理容器 + 添加toView
    [self.containerView addSubview:toView];
    
    // 执行动画
    [UIView animateWithDuration:self.transitionDuration
                          delay:0.f
         usingSpringWithDamping:1.f
          initialSpringVelocity:0.f
                        options:0
                     animations:^{
                         currentView.transform = CGAffineTransformMakeScale(0.85, 0.85);
                         toView.center = self.containerView.center;
                     }
                     completion:^(BOOL finished) {
                         [self completeTransition];
                     }];
}

@end
