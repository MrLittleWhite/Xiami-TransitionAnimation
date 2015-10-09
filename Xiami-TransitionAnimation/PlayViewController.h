//
//  PlayViewController.h
//  Xiami-TransitionAnimation
//
//  Created by 劉雲志 on 15/10/9.
//  Copyright (c) 2015年 Lyz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PlayViewControllerDelegate;

@interface PlayViewController : UIViewController

@property (nonatomic, weak) id<PlayViewControllerDelegate> delegate;

@property (nonatomic, strong) UIButton *playButton;

@property (nonatomic, strong) UIButton *dismissButton;

@end

@protocol PlayViewControllerDelegate <NSObject>

- (void)playViewControllerDidClickedDismissButton:(PlayViewController *)playViewController;

@end