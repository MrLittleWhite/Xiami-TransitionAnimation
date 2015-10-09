//
//  ViewController.m
//  Xiami-TransitionAnimation
//
//  Created by 劉雲志 on 15/10/9.
//  Copyright (c) 2015年 Lyz. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Layout.h"
#import "PlayViewController.h"

#import "XiamiPresentAnimation.h"
#import "XiamiDismissAnimation.h"

@interface ViewController ()<PlayViewControllerDelegate,UIViewControllerTransitioningDelegate>{
    UIButton *bottomPlayBar;
    XiamiPresentAnimation *presentAnimation;
    XiamiDismissAnimation *dismissAnimation;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor cyanColor];
    [self setupBottomPlayBar];
    [self setupPlayControlButtons];
    
    presentAnimation = [XiamiPresentAnimation new];
    dismissAnimation = [XiamiDismissAnimation new];
    
    UILabel *vcLabel = [UILabel new];
    vcLabel.text = @"视图控制器一";
    vcLabel.font = [UIFont systemFontOfSize:18.f];
    vcLabel.frame = CGRectMake(0, 0, vcLabel.intrinsicContentSize.width, vcLabel.intrinsicContentSize.height);
    vcLabel.center = self.view.center;
    [self.view addSubview:vcLabel];
}

- (void)setupBottomPlayBar{
    bottomPlayBar = [UIButton new];
    bottomPlayBar.frame = CGRectMake(0,[UIView screenHeight]-49,
                                     [UIView screenWidth],49);
    bottomPlayBar.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:bottomPlayBar];
    [bottomPlayBar addTarget:self action:@selector(bottomBarDidClicked) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupPlayControlButtons{
    self.playButton = [UIButton new];
    [self.playButton setImage:[UIImage imageNamed:@"play_press"] forState:UIControlStateNormal];
    self.playButton.frame = CGRectMake(0, 0, self.playButton.intrinsicContentSize.width, self.playButton.intrinsicContentSize.height);
    self.playButton.center = CGPointMake([UIView screenWidth]*0.65, bottomPlayBar.frame.size.height*0.5);
    [bottomPlayBar addSubview:self.playButton];
}

- (void)bottomBarDidClicked{
    PlayViewController *pvc = [PlayViewController new];
    pvc.delegate = self;
    pvc.transitioningDelegate = self;
    [self presentViewController:pvc animated:YES completion:nil];
}

- (void)playViewControllerDidClickedDismissButton:(PlayViewController *)playViewController{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark UIViewControllerTransitioningDelegate
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return presentAnimation;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return dismissAnimation;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
