//
//  SecondViewController.m
//  转场动画
//
//  Created by wujianqiang on 16/8/29.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"
#import "PopAnimate.h"
#import "PresentAnimate.h"
#import "DismissAnimate.h"
#import "ThiedViewController.h"

@interface SecondViewController ()<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.delegate = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 导航栏控制器动画代理
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    if ([toVC isKindOfClass:[ViewController class]]) {
        PopAnimate *transition = [[PopAnimate alloc] init];
        return transition;
    }else{
        return nil;
    }
}

#pragma mark - 定制转场动画 (Present 与 Dismiss动画代理)
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    
    // 推出控制器的动画
    return [PresentAnimate new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    DismissAnimate *dismissAnimate   = [DismissAnimate new];
    dismissAnimate.transitionDuration = 1.f;
    
    // 退出控制器动画
    return dismissAnimate;
}

- (IBAction)presentThird:(UIButton *)sender {
    [self performSegueWithIdentifier:@"presentThird" sender:nil];
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"presentThird"]) {
        ThiedViewController *thirdVC = segue.destinationViewController;
        thirdVC.transitioningDelegate = self;
        thirdVC.modalPresentationStyle = UIModalPresentationCustom;
    }
}

@end
