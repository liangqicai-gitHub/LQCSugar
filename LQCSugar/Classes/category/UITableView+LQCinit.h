//
//  UITableView+init.h
//  RiceDonate
//
//  Created by 梁齐才 on 17/3/23.
//  Copyright © 2017年 ricedonate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (LQCinit)

+ (UITableView *)lqc_plainTableViewWithDelegate:(id <UITableViewDelegate,UITableViewDataSource>)delegate;

+ (UITableView *)lqc_groupTableViewWithDelegate:(id <UITableViewDelegate,UITableViewDataSource>)delegate;

@end
