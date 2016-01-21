//
//  WFFriends.m
//  LOL
//
//  Created by qingyun on 16/1/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "WFFriends.h"

@implementation WFFriends

-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)friendWithDictionary:(NSDictionary *)dict{
    return [[self alloc]initWithDictionary:dict];
}

@end
