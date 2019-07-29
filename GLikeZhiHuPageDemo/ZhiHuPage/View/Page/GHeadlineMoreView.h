//
//  GHeadlineMoreView.h
//  GHeadlineFramework
//
//  Created by Caoguo on 2019/1/17.
//  Copyright © 2019 Namegold. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GHeadlineMoreView : UIView

@property (nonatomic, assign) CGFloat space;
@property (nonatomic, assign) CGFloat originFrameWidth;
@property (nonatomic, assign) CGFloat triggerSpaceWidth; // default is 60.f

@property (nonatomic, assign) BOOL noMoreNextPageData;

- (void)effectOffsetY: (CGFloat )offsetY;

- (void)fold;

- (void)updateLastDataStatus;

@end

NS_ASSUME_NONNULL_END
