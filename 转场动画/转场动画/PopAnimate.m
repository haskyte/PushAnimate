//
//  PopAnimate.m
//  转场动画
//
//  Created by wujianqiang on 16/8/29.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "PopAnimate.h"


@implementation PopAnimate


- (void)animateTransitionEvent {
    
    UIImageView *tmpImageView  = [[UIImageView alloc] initWithFrame:CGRectMake(50, 200, [UIScreen mainScreen].bounds.size.width/6.0, [UIScreen mainScreen].bounds.size.height/6.0)];
    tmpImageView.image = [UIImage imageNamed:@"backimage@2x"];
    
    [self.containerView addSubview:self.toViewController.view];
    [self.containerView addSubview:tmpImageView];
    
    self.toViewController.view.alpha   = 0.f;
    
    [UIView animateWithDuration:self.transitionDuration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         tmpImageView.frame = [UIScreen mainScreen].bounds;
                         
                         self.fromViewController.view.alpha = 0.f;
                         self.toViewController.view.alpha   = 1.f;
             
                     } completion:^(BOOL finished) {
             
                         [tmpImageView removeFromSuperview];
                         [self completeTransition];
    
                     }];
}

@end
