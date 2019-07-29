//
//  GBaseHeadlineViewController.h
//  GHeadlineFramework
//
//  Created by Caoguo on 2019/1/17.
//  Copyright © 2019 Namegold. All rights reserved.
//

#import "GHeadlinePageTopView.h"
#import "GHeadlineMoreView.h"
#import "GTodayHeadlineHeaderView.h"

NS_ASSUME_NONNULL_BEGIN

@interface GBaseHeadlineViewController : UIViewController

@property (nonatomic, strong) UITableView               *tableView;
@property (nonatomic, strong) GTodayHeadlineHeaderView  *headerView;
@property (nonatomic, strong) GHeadlinePageTopView      *topView;
@property (nonatomic, strong) GHeadlineMoreView         *moreView;
@property (nonatomic, assign) BOOL isSubPage;
@property (nonatomic, assign) BOOL isPageViewDisplay;
@property (nonatomic, assign) NSInteger topPageTimestamp;
@property (nonatomic, assign) NSInteger nextPageTimestamp;

- (void)loadNewPageDataWithIsUp:(BOOL)isUp;


- (void)requestNewPageData: (NSInteger )timestamp;

- (void)resetTableViewContentOffset;

- (void)didScrollToBottom;

@end

NS_ASSUME_NONNULL_END
