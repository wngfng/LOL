//
//  WFFriendGroup.h
//  LOL
//
//  Created by qingyun on 16/1/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFFriendGroup : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSArray *friends;
@property (nonatomic) NSInteger online;
@property (nonatomic) BOOL isOpen;

-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)friendGroupEithDictionary:(NSDictionary *)dict;

@end
