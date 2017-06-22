//
//  HHSecondViewController.m
//  HHNavigationController
//
//  Created by xiaozuan on 2017/6/20.
//  Copyright © 2017年 xiaozuan. All rights reserved.
//

#import "HHSecondViewController.h"
#import "HHThirdViewController.h"
@interface HHSecondViewController ()

@end

@implementation HHSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.navigationTitle = @"详情";
    self.navigationBackgroundColor = [UIColor grayColor];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.navigationController popViewControllerAnimated:YES];
    HHThirdViewController *thirdVC = [[HHThirdViewController alloc] init];
    [self.navigationController pushViewController:thirdVC animated:YES];
}


@end
