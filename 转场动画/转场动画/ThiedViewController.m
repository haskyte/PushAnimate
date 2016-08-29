//
//  ThiedViewController.m
//  转场动画
//
//  Created by wujianqiang on 16/8/29.
//  Copyright © 2016年 wujianqiang. All rights reserved.
//

#import "ThiedViewController.h"

#define Height [UIScreen mainScreen].bounds.size.height
#define Width [UIScreen mainScreen].bounds.size.width

@interface ThiedViewController ()<UINavigationControllerDelegate, UIViewControllerTransitioningDelegate>

@end

@implementation ThiedViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    [self createView];
    
    [self createButton];
}

/**
 *  创建view
 */
- (void)createView {
    
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, Height/ 3.f, Width, Height*2 / 3.f)];
    whiteView.backgroundColor = [UIColor greenColor];
    whiteView.alpha = 1;
    [self.view addSubview:whiteView];
    
}

/**
 *  创建按钮
 */
- (void)createButton {
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, Height/2.0, 100,30)];
    [button setTitle:@"dismiss" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button];
    [button addTarget:self
               action:@selector(buttonsEvent:)
     forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonsEvent:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
