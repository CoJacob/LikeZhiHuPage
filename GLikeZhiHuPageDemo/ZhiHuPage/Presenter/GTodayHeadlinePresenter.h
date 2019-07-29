//
//  GTodayHeadlinePresenter.h
//  GHeadlineFramework
//
//  Created by Caoguo on 2018/10/16.
//  Copyright © 2018 Namegold. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTodayHeadlinePresenter : NSObject

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) BOOL isSubPage;

@property (nonatomic, copy) void(^didScrollCallback)(UIScrollView *scrollView);
@property (nonatomic, copy) void(^didEndDragingCallback)(UIScrollView *scrollView);


@end

NS_ASSUME_NONNULL_END
