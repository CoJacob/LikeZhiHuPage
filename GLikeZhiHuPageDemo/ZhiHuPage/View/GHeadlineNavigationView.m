//
//  GHeadlineNavigationView.m
//  GHeadlineFramework
//
//  Created by Caoguo on 2019/1/17.
//  Copyright © 2019 Namegold. All rights reserved.
//

#import "GHeadlineNavigationView.h"

@interface GHeadlineNavigationView ()



@end

@implementation GHeadlineNavigationView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
//        [self addSubview:self.listButton];
//        [self addSubview:self.customShareButton];
//        [self addSubview:self.closeButton];
    }
    return self;
}

#pragma mark - Getter

//- (UIButton *)listButton {
//    if (!_listButton) {
//        _listButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _listButton.frame = CGRectMake(KScreenWidth-150, KStatusBarHeight + 7 , 30, 30);
//        [_listButton setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.5]];
//        _listButton.clipsToBounds = YES;
//        _listButton.layer.cornerRadius = 15.f;
//        _listButton.titleLabel.font = [UIFont fontWithName:@"iconfont" size:16.f];
//        [_listButton setTitle:@"\U0000e647" forState:UIControlStateNormal];
//        [_listButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [_listButton addTarget:self action:@selector(listButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _listButton;
//}
//
//- (UIButton *)customShareButton {
//    if (!_customShareButton) {
//        _customShareButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _customShareButton.frame = CGRectMake(KScreenWidth-100, KStatusBarHeight + 7 , 30, 30);
//        [_customShareButton setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.5]];
//        _customShareButton.clipsToBounds = YES;
//        _customShareButton.layer.cornerRadius = 15.f;
//        _customShareButton.titleLabel.font = [UIFont fontWithName:@"iconfont" size:16.f];
//        [_customShareButton setTitle:@"\U0000e6eb" forState:UIControlStateNormal];
//        [_customShareButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [_customShareButton addTarget:self action:@selector(customShareButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _customShareButton;
//}
//
//- (UIButton *)closeButton {
//    if (!_closeButton) {
//        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _closeButton.frame = CGRectMake(KScreenWidth-50, KStatusBarHeight+ 7 , 30, 30);
//        [_closeButton setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.5]];
//        _closeButton.clipsToBounds = YES;
//        _closeButton.layer.cornerRadius = 15.f;
//        _closeButton.titleLabel.font = [UIFont fontWithName:@"iconfont" size:16.f];
//        [_closeButton setTitle:@"\U0000e618" forState:UIControlStateNormal];
//        [_closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [_closeButton addTarget:self action:@selector(closeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _closeButton;
//}
//
//#pragma mark - Public
//
//- (void)updateSuperViewWhenTransformAnimationWithView: (UIView *)view
//                                      isLoadOtherPage: (BOOL)loadOtherPage {
//    UIView *customNavigationView  = [view viewWithTag:1993];
//    [customNavigationView removeFromSuperview];
//    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
//    [keyWindow addSubview:customNavigationView];
//    [self performHandleBlock:^{
//        [customNavigationView removeFromSuperview];
//        [view addSubview:customNavigationView];
//    } afterDelay:.36f];
//}
//
//#pragma mark - IBActions
//
//- (void)customShareButtonAction: (UIButton *)button {
//    !self.customShareButtonHandle?:self.customShareButtonHandle();
//}
//
//- (void)closeButtonAction: (UIButton *)button {
//    !self.closeButtonHandle?:self.closeButtonHandle();
//}
//
//- (void)listButtonAction: (UIButton *)button {
////    [[MRouter sharedRouter] handleURL:[NSURL URLWithString:@"native://nativeapp/headlineList"] userInfo:nil];
//}

@end
