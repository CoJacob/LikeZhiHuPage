//
//  GHeadlineMoreView.m
//  GHeadlineFramework
//
//  Created by Caoguo on 2019/1/17.
//  Copyright © 2019 Namegold. All rights reserved.
//

#import "GHeadlineMoreView.h"

@interface GHeadlineMoreView ()

@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) UILabel     *titleLabel;

@end

@implementation GHeadlineMoreView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.originFrameWidth = 30;
        self.space = 0;
        self.triggerSpaceWidth = 60;
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)fold {
    
}

- (void)updateLastDataStatus {
//    self.isLastData = YES;
}

#pragma mark - Getter

- (UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 36, 36)];
        _arrowImageView.image = [UIImage imageNamed:@"headline_guide_arrow"];
    }
    return _arrowImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, [UIScreen mainScreen].bounds.size.width, 20)];
        _titleLabel.numberOfLines = 0;
        _titleLabel.text = @"上拉查看前一天";
        _titleLabel.textColor = [UIColor lightGrayColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:14.f];
    }
    return _titleLabel;
}

- (void)effectOffsetY: (CGFloat )offsetY {
    if (offsetY <= 0) {
        offsetY = 0;
    }
    [self updateTriggerStatus:(offsetY >= self.triggerSpaceWidth)];
    CGFloat _originFrameY = [UIScreen mainScreen].bounds.size.height;
    CGFloat _targetFrameY = _originFrameY - offsetY;
    CGRect rect = self.frame;
    rect.origin.y = _targetFrameY;
    self.frame = rect;
}

- (void)updateViewFrameY: (CGFloat )frameY {
    CGRect rect = self.frame;
    rect.origin.y = frameY;
    self.frame = rect;
}

- (void)updateViewFrameWidth: (CGFloat )frameWidth {
    CGRect rect = self.frame;
    rect.size.width = frameWidth;
    self.frame = rect;
}


- (void)updateTriggerStatus: (BOOL)trigger {
    if (self.noMoreNextPageData) {
        self.titleLabel.text = @"已经到底了";
        return;
    }
    if (trigger) {
        self.titleLabel.text = @"松开查看前一天";
    }else {
        self.titleLabel.text = @"上拉查看前一天";
    }
}

@end
