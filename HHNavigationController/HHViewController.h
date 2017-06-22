//
//  HHViewController.h
//  HHNavigationController
//
//  Created by xiaozuan on 2017/6/20.
//  Copyright © 2017年 xiaozuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHViewController : UIViewController

@property (nonatomic, strong) UIView *navigationView; //自定义导航栏
@property (nonatomic, strong) UIControl *navigationTitleView; //标题视图
@property (nonatomic, copy) NSString *navigationTitle; //标题文字
@property (nonatomic, strong) UIColor *navigationBackgroundColor; //导航栏背景色
@property (nonatomic, strong) UIButton *navigationLeftButton; //导航栏左侧按钮
@property (nonatomic, strong) UIButton *navigationRightButton; //导航栏右侧按钮
@property (nonatomic, copy) NSArray<UIButton *> *navigationLeftButtons; //导航栏左侧按钮集合（最多两个）
@property (nonatomic, copy) NSArray<UIButton *> *navigationRightButtons; //导航栏右侧按钮集合（最多两个）
@property (nonatomic, assign) CGFloat navigationAlpha; //导航栏背景透明度

@end
