//
//  BaseAnimate.h
//  转场动画
//
//  Created by wujianqiang on 16/8/29.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define  Width   [UIScreen mainScreen].bounds.size.width
#define  Height  [UIScreen mainScreen].bounds.size.height


@interface BaseAnimate : NSObject<UIViewControllerAnimatedTransitioning>

/**
 *  动画执行时间
 */
@property (nonatomic) NSTimeInterval  transitionDuration;

/**
 *  动画事件
 */
- (void)animateTransitionEvent;

/**
 *  源头控制器
 */
@property (nonatomic, readonly, weak) UIViewController *fromViewController;

/**
 *  目标控制器
 */
@property (nonatomic, readonly, weak) UIViewController *toViewController;

/**
 *  containerView
 */
@property (nonatomic, readonly, weak) UIView *containerView;

/**
 *  动画事件结束
 */
- (void)completeTransition;

@end
