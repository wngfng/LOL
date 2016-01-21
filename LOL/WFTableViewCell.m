//
//  WFTableViewCell.m
//  LOL
//
//  Created by qingyun on 16/1/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "WFTableViewCell.h"
#import "WFFriends.h"
@implementation WFTableViewCell

-(void)setFriend:(WFFriends *)friend{
    _friend = friend;
    self.textLabel.text = friend.name;
    self.detailTextLabel.text = friend.intro;
    self.imageView.image = [UIImage imageNamed:friend.icon];
    self.textLabel.textColor = friend.vip ? [UIColor redColor] : [UIColor blackColor];
}

- (void)awakeFromNib {
    // Initialization code
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
