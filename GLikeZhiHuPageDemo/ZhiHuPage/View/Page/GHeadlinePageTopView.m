//
//  GHeadlinePageTopView.m
//  GHeadlineFramework
//
//  Created by Caoguo on 2019/1/17.
//  Copyright © 2019 Namegold. All rights reserved.
//

#import "GHeadlinePageTopView.h"

@interface GHeadlinePageTopView ()

@property (nonatomic, assign) CGFloat randius;
@property (nonatomic, assign) BOOL isLastData;

@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic, strong) UILabel     *titleLabel;

@end

@implementation GHeadlinePageTopView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.originFrameWidth = 30;
        self.space = 0;
        self.triggerSpaceWidth = 60;
        [self addSubview:self.titleLabel];
        self.arrowImageView.transform = CGAffineTransformMakeRotation(M_PI);
    }
    return self;
}

- (void)fold {

}

- (void)updateLastDataStatus {
    self.isLastData = YES;
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
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.arrowImageView.frame) + 15, [UIScreen mainScreen].bounds.size.width, 20)];
        _titleLabel.numberOfLines = 0;
        _titleLabel.text = @"下拉查看后一天";
        _titleLabel.textColor = [UIColor lightGrayColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:14.f];
    }
    return _titleLabel;
}

- (void)effectOffsetY: (CGFloat )offsetY {
    offsetY = - offsetY;
    if (offsetY <= 0) {
        offsetY = 0;
    }
    [self updateTriggerStatus:(offsetY >= self.triggerSpaceWidth)];
    CGFloat _originFrameY = - CGRectGetHeight(self.frame);
    CGFloat _targetFrameY = _originFrameY + offsetY;
    CGRect rect = self.frame;
    rect.origin.y = _targetFrameY;
    self.frame = rect;
//    [self setViewFrameY:_targetFrameY];
}


- (void)updateTriggerStatus: (BOOL)trigger {
    if (self.noMoreTopPageData) {
        self.titleLabel.text = @"已经到顶了";
        return;
    }
    if (trigger) {
        self.titleLabel.text = @"松开查看后一天";
    }else {
        self.titleLabel.text = @"下拉查看后一天";
    }
}

@end
