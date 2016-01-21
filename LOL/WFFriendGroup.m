//
//  WFFriendGroup.m
//  LOL
//
//  Created by qingyun on 16/1/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "WFFriendGroup.h"
#import "WFFriends.h"
@implementation WFFriendGroup

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dic in self.friends) {
            WFFriends *friends = [WFFriends friendWithDictionary:dic];
            [array addObject:friends];
        }
        self.friends = array;
        self.isOpen = NO;
    }
    return self;
}
+(instancetype)friendGroupEithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}

@end
