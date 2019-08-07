//
//  UITableView+init.m
//  RiceDonate
//
//  Created by 梁齐才 on 17/3/23.
//  Copyright © 2017年 ricedonate. All rights reserved.
//

#import "UITableView+LQCinit.h"

@implementation UITableView (LQCinit)


+ (UITableView *)lqc_plainTableViewWithDelegate:(id<UITableViewDelegate,UITableViewDataSource>)delegate{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = delegate;
    tableView.dataSource = delegate;
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    return tableView;
}

+ (UITableView *)lqc_groupTableViewWithDelegate:(id <UITableViewDelegate,UITableViewDataSource>)delegate{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = delegate;
    tableView.dataSource = delegate;
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
    tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    return tableView;
}


@end
