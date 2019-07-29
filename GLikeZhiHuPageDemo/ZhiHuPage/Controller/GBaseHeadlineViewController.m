//
//  GBaseHeadlineViewController.m
//  GHeadlineFramework
//
//  Created by Caoguo on 2019/1/17.
//  Copyright © 2019 Namegold. All rights reserved.
//

#import "GBaseHeadlineViewController.h"
#import "GTodayHeadlinePresenter.h"

@interface GBaseHeadlineViewController ()

@property (nonatomic, strong) GTodayHeadlinePresenter *presenter;

@end

@implementation GBaseHeadlineViewController

- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.moreView];
    [self _setUp];
}

- (BOOL)fd_prefersNavigationBarHidden {
    return YES;
}

- (void) _setUp {
    self.presenter.tableView = self.tableView;
}

- (void)setIsSubPage:(BOOL)isSubPage {
    _isSubPage = isSubPage;
    self.presenter.isSubPage = _isSubPage;
}

#pragma mark - Getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tag = 1995;
    }
    return _tableView;
}

- (GTodayHeadlineHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[GTodayHeadlineHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20 + 116)];
        _headerView.backgroundColor = [UIColor whiteColor];
    }
    return _headerView;
}

- (GHeadlinePageTopView *)topView {
    if (!_topView) {
        _topView = [[GHeadlinePageTopView alloc] initWithFrame:CGRectMake(0, -100, CGRectGetWidth([UIScreen mainScreen].bounds), 100)];
        _topView.originFrameWidth = 30;
        _topView.space = 0;
        _topView.triggerSpaceWidth = 80.f;
        _topView.backgroundColor = [UIColor whiteColor];
        _topView.tag = 1991;
    }
    return _topView;
}

- (GHeadlineMoreView *)moreView {
    if (!_moreView) {
        _moreView = [[GHeadlineMoreView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight([UIScreen mainScreen].bounds), CGRectGetWidth([UIScreen mainScreen].bounds), 100)];
        _moreView.originFrameWidth = 30;
        _moreView.space = 0;
        _moreView.triggerSpaceWidth = 80.f;
        _moreView.backgroundColor = [UIColor whiteColor];
        _moreView.tag = 1992;
    }
    return _moreView;
}


- (GTodayHeadlinePresenter *)presenter {
    if (!_presenter) {
        _presenter = [[GTodayHeadlinePresenter alloc] init];
        __weak __typeof__(self) weakSelf = self;
        _presenter.didScrollCallback = ^(UIScrollView * _Nonnull scrollView) {
            [weakSelf didScroll:scrollView];
        };
        _presenter.didEndDragingCallback = ^(UIScrollView * _Nonnull scrollView) {
            [weakSelf didEndDragging:scrollView];
        };
    }
    return _presenter;
}

#pragma mark - Public


- (void)requestNewPageData: (NSInteger )timestamp {

}

- (void)resetTableViewContentOffset {
    [self.tableView setContentOffset:CGPointZero animated:NO];
}

#pragma mark - Private

- (void)didScroll: (UIScrollView *)scrollView {
    if (scrollView.contentOffset.y > 0) {
        CGFloat _contentSizeHeight = scrollView.contentSize.height;
        if (_contentSizeHeight < [UIScreen mainScreen].bounds.size.height) {
            _contentSizeHeight = [UIScreen mainScreen].bounds.size.height;
        }
        CGFloat _offsetY = (scrollView.contentOffset.y - (_contentSizeHeight - [UIScreen mainScreen].bounds.size.height));
        [self.moreView effectOffsetY:_offsetY];
        [self didScrollToBottom];
    }else {
        [self.topView effectOffsetY:scrollView.contentOffset.y];
    }
}

- (void)didEndDragging: (UIScrollView *)scrollView {
    if (scrollView.contentOffset.y > 0) {
        CGFloat _contentSizeHeight = scrollView.contentSize.height;
        CGFloat _offsetY = (scrollView.contentOffset.y - (_contentSizeHeight - [UIScreen mainScreen].bounds.size.height));
        if (_offsetY >= self.moreView.triggerSpaceWidth) {
            if (!self.moreView.noMoreNextPageData) {
                [self addImpactFeedbackEffect];
                [self gotoNexpage];
                [self.moreView fold];
            }
        }
    }else {
        if (scrollView.contentOffset.y < - self.topView.triggerSpaceWidth) {
            if (!self.topView.noMoreTopPageData) {
                [self addImpactFeedbackEffect];
                [self gotoLastPage];
                [self.topView fold];
            }
        }
    }
}

- (void)didScrollToBottom {
    
}

- (void)addImpactFeedbackEffect {
    if (@available(iOS 10.0, *)) {
        UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
        [generator prepare];
        [generator impactOccurred];
    } else {
        // Fallback on earlier versions
    }
}

- (void)gotoLastPage {
    [self loadNewPageDataWithIsUp:YES];
}

- (void)gotoNexpage {
    [self loadNewPageDataWithIsUp:NO];
}

// 分页
- (void)loadNewPageDataWithIsUp:(BOOL)isUp {
    
}



@end
