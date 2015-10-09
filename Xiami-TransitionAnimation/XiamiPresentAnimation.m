//
//  XiamiPresentAnimation.m
//  Xiami-TransitionAnimation
//
//  Created by 劉雲志 on 15/10/9.
//  Copyright (c) 2015年 Lyz. All rights reserved.
//

#import "XiamiPresentAnimation.h"
#import "ViewController.h"
#import "PlayViewController.h"
#import "UIView+Layout.h"

@implementation XiamiPresentAnimation

// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5f;
}

// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    //获取两个VC 和 动画发生的容器
    ViewController *fromVC = (ViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    PlayViewController *toVC   = (PlayViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    // 截图，同时将本身隐藏
    UIView * snapShotView = [fromVC.playButton snapshotViewAfterScreenUpdates:NO];
    snapShotView.frame = [containerView convertRect:fromVC.playButton.frame fromView:fromVC.playButton.superview];
    fromVC.playButton.hidden = YES;
    
    
    //设置第二个控制器的位置、透明度
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
//    toVC.view.alpha = 0;
    toVC.playButton.hidden = YES;
    
    //把动画前后的两个ViewController加到容器中,顺序很重要,snapShotView在上方
    [containerView addSubview:toVC.view];
    [containerView addSubview:snapShotView];
    
    //动起来。第二个控制器的透明度0~1；让截图SnapShotView的位置更新到最新；
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f usingSpringWithDamping:1.0f initialSpringVelocity:0.0f options:UIViewAnimationOptionCurveLinear animations:^{
//        toVC.view.alpha = 1.0;
        snapShotView.frame = [containerView convertRect:toVC.playButton.frame fromView:toVC.view];
//        snapShotView.frame  = CGRectOffset(snapShotView.frame, 0, 64);
    } completion:^(BOOL finished) {
        //为了让回来的时候，cell上的图片显示，必须要让cell上的图片显示出来
        toVC.playButton.hidden = NO;
        fromVC.playButton.hidden = NO;
        [snapShotView removeFromSuperview];
        //告诉系统动画结束
//        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
    CGRect toFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(toFrame, 0, [UIView screenHeight] - 49);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f usingSpringWithDamping:1.0f initialSpringVelocity:0.0f options:UIViewAnimationOptionCurveLinear animations:^{
        toVC.view.frame = toFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}


@end
