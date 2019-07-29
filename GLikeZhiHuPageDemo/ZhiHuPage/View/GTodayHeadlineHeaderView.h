//
//  GTodayHeadlineHeaderView.h
//  GHeadlineFramework
//
//  Created by Caoguo on 2018/10/16.
//  Copyright © 2018 Namegold. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTodayHeadlineHeaderView : UIView

@property (nonatomic, strong) NSDate *date;

- (void)effectScrollWithOffsetY: (CGFloat )offsetY;

@end

NS_ASSUME_NONNULL_END
