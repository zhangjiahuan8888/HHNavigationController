//
//  HHNavigationController.m
//  HHNavigationController
//
//  Created by xiaozuan on 2017/6/20.
//  Copyright © 2017年 xiaozuan. All rights reserved.
//

#import "HHNavigationController.h"
#import "PushTransitionAnimation.h"
#import "PopTransitionAnimation.h"
@interface HHNavigationController ()<UINavigationControllerDelegate>

@end

@implementation HHNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.navigationBar.hidden = YES;
//    self.interactivePopGestureRecognizer.delegate = (id)self;
    //添加边缘返回手势
    UIScreenEdgePanGestureRecognizer *edgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
    edgePanGestureRecognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:edgePanGestureRecognizer];
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        PushTransitionAnimation *pushTransitionAnimation = [PushTransitionAnimation new];
        return pushTransitionAnimation;
    }
    else if (operation == UINavigationControllerOperationPop) {
        PopTransitionAnimation *popTransitionAnimation = [PopTransitionAnimation new];
        return popTransitionAnimation;
    }
    return nil;
}


- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{

    PopTransitionAnimation *popTransitionAnimation = [PopTransitionAnimation new];
    if ([animationController isKindOfClass:[popTransitionAnimation class]]) {
        return self.percentDrivenInteractiveTransition;
    }
    return nil;

}

#pragma mark - 判断页面数，页面数>1时执行手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.viewControllers.count > 1) {
        return YES;
    }
    else{
        return NO;
    }
}

#pragma mark - 手势具体方法
- (void)panGestureRecognizer:(UIPanGestureRecognizer *)gesture{
    CGPoint point = [gesture translationInView:gesture.view];
    CGFloat progress = point.x / gesture.view.bounds.size.width;
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.percentDrivenInteractiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self popViewControllerAnimated:YES];
    }
    else if (gesture.state == UIGestureRecognizerStateChanged) {
        [self.percentDrivenInteractiveTransition updateInteractiveTransition:progress];
    }
    else if (gesture.state == UIGestureRecognizerStateCancelled || gesture.state == UIGestureRecognizerStateEnded) {
        //判断手势滑动距离是否超过屏幕的一半，如果超过一半则完成pop动画
        if (progress > 0.5) {
            [self.percentDrivenInteractiveTransition finishInteractiveTransition];
        }
        else{
            [self.percentDrivenInteractiveTransition cancelInteractiveTransition];
        }
        self.percentDrivenInteractiveTransition = nil;
    }
}

#pragma mark - 设置返回按钮
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIButton *button = [[UIButton alloc] init];
        [button setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
        
        // 设置按钮的尺寸为背景图片的尺寸
        CGSize size = button.currentBackgroundImage.size;
        button.bounds = CGRectMake(0, 0, size.width, size.height);
        
        [button addTarget:self action:@selector(popAction) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
//        viewController.navigationItem.leftBarButtonItem = backItem;
        
    }
    [super pushViewController:viewController animated:animated];
}
- (void)popAction{
    [self popViewControllerAnimated:YES];
}

@end
