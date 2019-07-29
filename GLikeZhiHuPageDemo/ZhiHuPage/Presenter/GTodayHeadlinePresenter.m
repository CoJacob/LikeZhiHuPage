//
//  GTodayHeadlinePresenter.m
//  GHeadlineFramework
//
//  Created by Caoguo on 2018/10/16.
//  Copyright © 2018 Namegold. All rights reserved.
//

#import "GTodayHeadlinePresenter.h"

@interface GTodayHeadlinePresenter () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation GTodayHeadlinePresenter

- (void)setTableView:(UITableView *)tableView {
    _tableView = tableView;
    [self setupTableView];
}

- (void)setupTableView {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self _setUp];
}

- (void) _setUp {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView reloadData];
}


#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 25;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"row %ld",(long)indexPath.row];
    cell.backgroundColor = self.isSubPage? [UIColor purpleColor] : [UIColor whiteColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    !self.didScrollCallback?:self.didScrollCallback(scrollView);
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    !self.didEndDragingCallback?:self.didEndDragingCallback(scrollView);
}



@end
