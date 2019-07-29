//
//  GSubPageHeadlineViewController.m
//  GHeadlineFramework
//
//  Created by Caoguo on 2019/1/17.
//  Copyright © 2019 Namegold. All rights reserved.
//

#import "GSubPageHeadlineViewController.h"

@interface GSubPageHeadlineViewController ()

@end

@implementation GSubPageHeadlineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isSubPage = YES;
}

#pragma mark - Public

- (void)loadNewPageDataWithIsUp:(BOOL)isUp {
    CGAffineTransform offScreenUp = CGAffineTransformMakeTranslation(0, - self.tableView.superview.frame.size.height);
    CGAffineTransform offScreenDown = CGAffineTransformMakeTranslation(0, self.tableView.superview.frame.size.height);
    
    // 顶部以及底部view
    [self setNeedDisplayParentViewHeaderOrFooterView:NO];
    
    // 截屏view
    UIView *screenShotView = [self.view snapshotViewAfterScreenUpdates:YES];
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:screenShotView];
    
    [self.view removeFromSuperview];
    
    //将nextPageView放置到屏幕之外并添加到主View上
    if (isUp) {
        self.customParentView.transform = offScreenUp;
    }else {
        self.customParentView.transform = offScreenDown;
    }
    
    //动画开始
    [UIView animateWithDuration:.35f animations:^{
        if (isUp) { //上一篇：当前view滑出屏幕，新View从顶部-->进入屏幕
            screenShotView.transform = offScreenDown;
        }else {  //下一篇：当前view滑出屏幕，新View从顶部-->进入屏幕
            screenShotView.transform = offScreenUp;
        }
        self.customParentView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        //动画完成后清理底层tableView，以及滑出屏幕的view
        [self.view removeFromSuperview];
        [screenShotView removeFromSuperview];
        
        [self setNeedDisplayParentViewHeaderOrFooterView:YES];
        [self resetTableViewContentOffset];
    }];
    !self.newPageHandle?:self.newPageHandle(isUp);
}


- (void)setNeedDisplayParentViewHeaderOrFooterView: (BOOL)display {
    [[self.customParentView viewWithTag:1991] setHidden:!display];
    [[self.customParentView viewWithTag:1992] setHidden:!display];
    [self.topView setHidden:!display];
    [self.moreView setHidden:!display];
}


@end
