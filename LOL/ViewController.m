//
//  ViewController.m
//  LOL
//
//  Created by qingyun on 16/1/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "WFFriendGroup.h"
#import "WFFriends.h"
#import "WFSectionHeaderView.h"
#import "WFTableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *datas;

@end

@implementation ViewController

-(NSArray *)datas{
    if (_datas == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"hero" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *models = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            WFFriendGroup *friendGroup = [WFFriendGroup friendGroupEithDictionary:dict];
            [models addObject:friendGroup];
        }
        _datas = models;
    }
    return _datas;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tabelView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:tabelView];
    tabelView.dataSource = self;
    tabelView.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.datas.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //取到当前section对应的模型
    WFFriendGroup *friendGroup = self.datas[section];
    if (friendGroup.isOpen) {
        return friendGroup.friends.count;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    WFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[WFTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    WFFriendGroup *friendGroup = self.datas[indexPath.section];
    WFFriends * friend = friendGroup.friends[indexPath.row];
    cell.friend = friend;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    WFSectionHeaderView *sectionHeaderView = [WFSectionHeaderView headerViewWithTableView:tableView];
    WFFriendGroup *friendGroup = self.datas[section];
    sectionHeaderView.friendGroup = friendGroup;
    //刷新表示图
    sectionHeaderView.headerViewClick = ^{
        [tableView reloadData];
    };
    return sectionHeaderView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
