//
//  GSubPageHeadlineViewController.h
//  GHeadlineFramework
//
//  Created by Caoguo on 2019/1/17.
//  Copyright © 2019 Namegold. All rights reserved.
//

#import "GBaseHeadlineViewController.h"
#import "GHeadlineNavigationView.h"

NS_ASSUME_NONNULL_BEGIN

@interface GSubPageHeadlineViewController : GBaseHeadlineViewController

@property (nonatomic, weak) UIView *customParentView;
@property (nonatomic, weak) GHeadlineNavigationView *parentNavigationView;
@property (nonatomic, copy) void(^newPageHandle)(BOOL isUp);

@end

NS_ASSUME_NONNULL_END
