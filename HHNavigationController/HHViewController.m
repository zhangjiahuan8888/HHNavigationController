//
//  HHViewController.m
//  HHNavigationController
//
//  Created by xiaozuan on 2017/6/20.
//  Copyright © 2017年 xiaozuan. All rights reserved.
//

#import "HHViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define DEVICE_5S 320
#define DEVICE_6 375
#define DEVICE_6P 414
#define DEFAULT_NAVIGATIONCOLOR [UIColor colorWithRed:0.0/255.0 green:174.0/255.0 blue:242.0/255.0 alpha:1.0f]

@interface HHViewController ()

@end

@implementation HHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNavigationViewDependDevice];
}

#pragma mark - 创建导航栏视图
- (void)createNavigationViewDependDevice{
    //初始化navigationView并添加
    self.navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    self.navigationView.backgroundColor = DEFAULT_NAVIGATIONCOLOR;
    
    [self.view addSubview:self.navigationView];
    
    
    if (self.navigationController.viewControllers.count > 1) {
        self.hidesBottomBarWhenPushed = YES;
        
        UIButton *button = [[UIButton alloc] init];
        [button setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
        
        // 设置按钮的尺寸为背景图片的尺寸
        CGSize size = button.currentBackgroundImage.size;
        button.bounds = CGRectMake(0, 0, size.width, size.height);
        
        [button addTarget:self action:@selector(popAction) forControlEvents:UIControlEventTouchUpInside];
        
//        UIBarButtonItem *backItem = [[UIBar/ButtonItem alloc] initWithCustomView:button];
        //        viewController.navigationItem.leftBarButtonItem = backItem;
        self.navigationLeftButton = button;
    }
}
- (void)popAction{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 改变导航栏背景透明度
- (void)setNavigationAlpha:(CGFloat)navigationAlpha{
    self.navigationView.backgroundColor = [self.navigationView.backgroundColor colorWithAlphaComponent:navigationAlpha];
}

#pragma mark - 改变导航栏颜色
- (void)setNavigationBackgroundColor:(UIColor *)navigationBackgroundColor{
    self.navigationView.backgroundColor = navigationBackgroundColor;
}
#pragma mark - 设置导航栏标题
- (void)setNavigationTitle:(NSString *)navigationTitle{
    //    根据文本计算宽度
    CGSize labelSize = [navigationTitle sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18.0f]}];
    
    //初始化labelTitle并调整位置
    if (labelSize.width > SCREEN_WIDTH) {
        labelSize.width = SCREEN_WIDTH;
    }
    UILabel *labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelSize.width, 42)];
    CGPoint center = self.navigationView.center;
    center.y = center.y + 8;
    labelTitle.center = center;
    
    //文字基本设置
    labelTitle.textColor = [UIColor whiteColor];
    labelTitle.numberOfLines = 1;
    labelTitle.lineBreakMode = NSLineBreakByTruncatingTail;
    labelTitle.textAlignment = NSTextAlignmentCenter;
    labelTitle.font = [UIFont boldSystemFontOfSize:18.0f];
    labelTitle.text = navigationTitle;
    [self.navigationView addSubview:labelTitle];
}
#pragma mark - 添加导航栏左侧按钮
- (void)setNavigationLeftButton:(UIButton *)navigationLeftButton{
    //判断是文字按钮还是图片按钮，两者坐标稍有不同
    CGFloat leftButtonWidth = navigationLeftButton.frame.size.width;
    CGFloat leftButtonHeight = navigationLeftButton.frame.size.height;
    
    navigationLeftButton.frame = CGRectMake(10, self.navigationView.frame.size.height / 2 - 8, leftButtonWidth, leftButtonHeight);
    
    [self.navigationView addSubview:navigationLeftButton];
}
#pragma mark - 添加导航栏右侧按钮
- (void)setNavigationRightButton:(UIButton *)navigationRightButton{
    //同上
    CGFloat rightButtonWidth = navigationRightButton.frame.size.width;
    CGFloat rightButtonHeight = navigationRightButton.frame.size.height;
    
    navigationRightButton.frame = CGRectMake(SCREEN_WIDTH - navigationRightButton.frame.size.width - 10, self.navigationView.frame.size.height / 2 - 8, rightButtonWidth, rightButtonHeight);
    
    [self.navigationView addSubview:navigationRightButton];
}

@end
