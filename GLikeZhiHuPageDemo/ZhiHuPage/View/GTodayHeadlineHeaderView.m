//
//  GTodayHeadlineHeaderView.m
//  GHeadlineFramework
//
//  Created by Caoguo on 2018/10/16.
//  Copyright © 2018 Namegold. All rights reserved.
//

#import "GTodayHeadlineHeaderView.h"

@interface GTodayHeadlineHeaderView ()

@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel     *dateTitleLabel;
@property (nonatomic, strong) UIImageView *signImageView;

@property (nonatomic, strong) UILabel      *titleLabel;
@property (nonatomic, strong) UIView      *alphaView;

@property (nonatomic, assign) CGFloat offsetY;

@end

@implementation GTodayHeadlineHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.coverImageView];
        [self addSubview:self.dateTitleLabel];
        [self addSubview:self.signImageView];
    }
    return self;
}

- (void)setDate:(NSDate *)date {
    _date = date;
    self.dateTitleLabel.text = @"";
}


#pragma mark - Getter

- (UIImageView *)coverImageView {
    if (!_coverImageView) {
        _coverImageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-147, 0, 147, 147)];
        _coverImageView.clipsToBounds = YES;
        _coverImageView.contentMode = UIViewContentModeScaleAspectFill;
        _coverImageView.image = [UIImage imageNamed:@"headline_topright"];
    }
    return _coverImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20 + 8, [UIScreen mainScreen].bounds.size.width-140, 24)];
        _titleLabel.font = [UIFont systemFontOfSize:17.f];
        _titleLabel.textColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"选股头条";
    }
    return _titleLabel;
}

- (UILabel *)dateTitleLabel {
    if (!_dateTitleLabel) {
        _dateTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20 + 84, [UIScreen mainScreen].bounds.size.width-50, 25)];
        _dateTitleLabel.font = [UIFont systemFontOfSize:14.f];
        _dateTitleLabel.textColor = [UIColor lightGrayColor];
        _dateTitleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _dateTitleLabel;
}

- (UIImageView *)signImageView {
    if (!_signImageView) {
        _signImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.dateTitleLabel.frame) + 5, 165, 39)];
        _signImageView.clipsToBounds = YES;
        _signImageView.contentMode = UIViewContentModeScaleAspectFill;
        _signImageView.image = [UIImage imageNamed:@"headline_sign"];
    }
    return _signImageView;
}

- (UIView *)alphaView {
    if (!_alphaView) {
        _alphaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _alphaView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
    }
    return _alphaView;
}

- (void)effectScrollWithOffsetY: (CGFloat )offsetY {
    CGFloat _navHeight                = 20;
    CGFloat NavBackgroundTransparency = ((offsetY - 80) / _navHeight);
    NavBackgroundTransparency = (NavBackgroundTransparency > 1) ? 1 : NavBackgroundTransparency;
    self.alphaView.backgroundColor  = [[UIColor whiteColor] colorWithAlphaComponent:NavBackgroundTransparency];
    self.titleLabel.textColor = [[UIColor lightGrayColor] colorWithAlphaComponent:NavBackgroundTransparency];
    if (NavBackgroundTransparency <= 0) {
        self.alphaView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
        self.titleLabel.textColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0];
    }
    self.offsetY = offsetY;
    if (self.offsetY<0) {
        self.offsetY = 0;
    }
}


@end
