//
//  WFSectionHeaderView.m
//  LOL
//
//  Created by qingyun on 16/1/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "WFSectionHeaderView.h"
#import "WFFriendGroup.h"
@interface WFSectionHeaderView ()
@property (nonatomic, strong) UIButton *bgBtn;
@property (nonatomic, strong) UILabel *label;
@end
@implementation WFSectionHeaderView
static NSString *headerViewIdentifier = @"headerView";
+(instancetype)headerViewWithTableView:(UITableView *)tableView{
    WFSectionHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerViewIdentifier];
    if (headerView == nil) {
        headerView = [[WFSectionHeaderView alloc] initWithReuseIdentifier:headerViewIdentifier];
    }
    return headerView;
}
//重写重用的初始化方法（添加子视图）
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIButton *bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:bgBtn];
        //添加背景
        UIImage *image = [[UIImage imageNamed:@"buddy_header_bg"]resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 1) resizingMode:UIImageResizingModeStretch];
        UIImage *hightLightedImage = [[UIImage imageNamed:@"buddy_header_bg_highlighted"]resizableImageWithCapInsets:UIEdgeInsetsMake(44, 0, 44, 1) resizingMode:UIImageResizingModeStretch];
        [bgBtn setImage:image forState:UIControlStateNormal];
        [bgBtn setImage:hightLightedImage forState:UIControlStateHighlighted];
        [bgBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [bgBtn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [bgBtn addTarget:self action:@selector(bgBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        //设置显示内容位置和图片模式
        bgBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        bgBtn.contentEdgeInsets = UIEdgeInsetsMake(0,10,0,0);
        bgBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        bgBtn.imageView.contentMode = UIViewContentModeCenter;
        bgBtn.imageView.clipsToBounds = NO;
        //btn上添加label
        UILabel *label = [[UILabel alloc]init];
        [self.contentView addSubview:label];
        label.textAlignment = NSTextAlignmentLeft;
        _bgBtn = bgBtn;
        _label = label;
    }
    return self;
}
//子视图布局
-(void)layoutSubviews{
    [super layoutSubviews];
    //设置bgBtn和label的frame
    _bgBtn.frame = self.bounds;
    CGFloat labelW = 100;
    CGFloat labelH = self.bounds.size.height;
    CGFloat labelX = self.bounds.size.width - labelW - 20;
    CGFloat labelY = 0;
    _label.frame = CGRectMake(labelX, labelY, labelW, labelH);
}
//重写friendGroupsetter方法
-(void)setFriendGroup:(WFFriendGroup *)friendGroup{
    _friendGroup = friendGroup;
    [_bgBtn setTitle:friendGroup.name forState:UIControlStateNormal];
    _label.text = [NSString stringWithFormat:@"%ld/%ld",friendGroup.online,friendGroup.friends.count];
    if (friendGroup.isOpen) {
        _bgBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        _bgBtn.imageView.transform = CGAffineTransformIdentity;
    }
}

-(void)bgBtnClick:(UIButton *)sender{
    _friendGroup.isOpen = !_friendGroup.isOpen;
    if (_headerViewClick) {
        _headerViewClick();
    }
}
@end
