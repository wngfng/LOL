//
//  WFSectionHeaderView.h
//  LOL
//
//  Created by qingyun on 16/1/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WFFriendGroup;
@interface WFSectionHeaderView : UITableViewHeaderFooterView
@property (nonatomic, strong) WFFriendGroup *friendGroup;
@property (nonatomic, strong) void (^headerViewClick)();
+(instancetype)headerViewWithTableView:(UITableView *)tableView;
@end
