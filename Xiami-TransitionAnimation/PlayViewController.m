//
//  PlayViewController.m
//  Xiami-TransitionAnimation
//
//  Created by 劉雲志 on 15/10/9.
//  Copyright (c) 2015年 Lyz. All rights reserved.
//

#import "PlayViewController.h"
#import "UIView+Layout.h"

@interface PlayViewController ()

@end

@implementation PlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self setupDismissButton];
    [self setupPlayControlButtons];
    
    
    UILabel *vcLabel = [UILabel new];
    vcLabel.text = @"视图控制器二";
    vcLabel.font = [UIFont systemFontOfSize:18.f];
    vcLabel.frame = CGRectMake(0, 0, vcLabel.intrinsicContentSize.width, vcLabel.intrinsicContentSize.height);
    vcLabel.center = self.view.center;
    [self.view addSubview:vcLabel];

}

- (void)dealloc{
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

- (void)setupDismissButton{
    self.dismissButton = [UIButton new];
    [self.dismissButton setImage:[UIImage imageNamed:@"btn_down_normal"] forState:UIControlStateNormal];
    self.dismissButton.frame = CGRectMake(0, 0, 44, 44);
    self.dismissButton.center = CGPointMake(60, 40);
    [self.view addSubview:self.dismissButton];
    [self.dismissButton addTarget:self action:@selector(dismissButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupPlayControlButtons{
    self.playButton = [UIButton new];
    [self.playButton setImage:[UIImage imageNamed:@"play1_press"] forState:UIControlStateNormal];
    self.playButton.frame = CGRectMake(0, 0, self.playButton.intrinsicContentSize.width, self.playButton.intrinsicContentSize.height);
    self.playButton.center = CGPointMake(self.view.center.x, [UIView screenHeight] - 50);
    [self.view addSubview:self.playButton];
}

- (void)dismissButtonDidClicked:(UIButton *)button{
    if (self.delegate && [self.delegate respondsToSelector:@selector(playViewControllerDidClickedDismissButton:)]) {
        [self.delegate playViewControllerDidClickedDismissButton:self];
    }
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
