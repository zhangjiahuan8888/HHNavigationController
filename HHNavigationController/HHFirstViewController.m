//
//  HHFirstViewController.m
//  HHNavigationController
//
//  Created by xiaozuan on 2017/6/20.
//  Copyright © 2017年 xiaozuan. All rights reserved.
//

#import "HHFirstViewController.h"
#import "HHSecondViewController.h"
@interface HHFirstViewController ()

@end

@implementation HHFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationTitle = @"首页";
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationBackgroundColor = [UIColor redColor];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    HHSecondViewController *secondVC = [[HHSecondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}


@end
