//
//  DismissAnimate.m
//  转场动画
//
//  Created by wujianqiang on 16/8/29.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "DismissAnimate.h"

@implementation DismissAnimate

- (void)animateTransitionEvent {
    
    // 当前控制器的view
    UIView *currentView = self.fromViewController.view;
    
    // 变化的控制器的view
    UIView *toView   = self.toViewController.view;
    toView.transform = CGAffineTransformMakeScale(0.85, 0.85);
    
    // 执行动画
    [UIView animateWithDuration:self.transitionDuration
                          delay:0.f
         usingSpringWithDamping:1.f
          initialSpringVelocity:0.f
                        options:0
                     animations:^{
                         CGRect newFrame = currentView.frame;
                         newFrame.origin.y = Height;
                         currentView.frame = newFrame;
                         toView.transform = CGAffineTransformMakeScale(1.f, 1.f);
                     }
                     completion:^(BOOL finished) {
                         [self completeTransition];
                     }];
}


@end
