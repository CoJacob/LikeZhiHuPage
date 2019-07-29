//
//  GTodayHeadlineViewController.m
//  GHeadlineFramework
//
//  Created by Caoguo on 2018/10/16.
//  Copyright © 2018 Namegold. All rights reserved.
//

#import "GTodayHeadlineViewController.h"
#import "GSubPageHeadlineViewController.h"

@interface GTodayHeadlineViewController ()

@property (nonatomic, strong) GSubPageHeadlineViewController *otherPageViewController;

@end

@implementation GTodayHeadlineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.customNavigationView];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

#pragma mark - Getter

- (GHeadlineNavigationView *)customNavigationView {
    if (!_customNavigationView) {
        _customNavigationView = [[GHeadlineNavigationView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
        _customNavigationView.tag = 1993;
    }
    return _customNavigationView;
}

- (GSubPageHeadlineViewController *)otherPageViewController {
    if (!_otherPageViewController) {
        _otherPageViewController = [[GSubPageHeadlineViewController alloc] init];
        _otherPageViewController.customParentView = self.view;
        _otherPageViewController.parentNavigationView = self.customNavigationView;
    }
    return _otherPageViewController;
}

#pragma mark - Public

- (void)didScrollToBottom {

}

// 分页
- (void)loadNewPageDataWithIsUp:(BOOL)isUp {
    
    CGAffineTransform offScreenUp = CGAffineTransformMakeTranslation(0, - self.tableView.superview.frame.size.height);
    CGAffineTransform offScreenDown = CGAffineTransformMakeTranslation(0, self.tableView.superview.frame.size.height);
    
    //生成原View截图并添加到主View上
    UIView *screenShotView = [self.view snapshotViewAfterScreenUpdates:YES];
    [self.view addSubview:screenShotView];
    
    //TODO:数据相关
    UIView *newPageView = self.otherPageViewController.view;
    newPageView.frame = self.view.bounds;
    //将nextPageView放置到屏幕之外并添加到主View上
    newPageView.transform = isUp ? offScreenUp : offScreenDown;
    if (newPageView.superview) {
        
    }else {
        [self.view addSubview:newPageView];
    }
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    
    [self addChildViewController:self.otherPageViewController];
    [self setNeedDisplaySubViewHeaderOrFooterView:NO view:newPageView];
    
    //动画开始
    [UIView animateWithDuration:0.35 animations:^{
        //上一篇：当前view滑出屏幕，新View从顶部-->进入屏幕
        
        //下一篇：当前view滑出屏幕，新View从顶部-->进入屏幕
        screenShotView.transform = isUp ? offScreenDown : offScreenUp;
        newPageView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        //动画完成后清理滑出屏幕的view
        [screenShotView removeFromSuperview];
        
        [self setNeedDisplaySubViewHeaderOrFooterView:YES view:newPageView];
        [self resetTableViewContentOffset];
    }];
}

- (void)setNeedDisplaySubViewHeaderOrFooterView: (BOOL)display view: (UIView *)newPageView {
    [[newPageView viewWithTag:1991] setHidden:!display];
    [[newPageView viewWithTag:1992] setHidden:!display];
    [self.topView setHidden:!display];
    [self.moreView setHidden:!display];
}


@end
