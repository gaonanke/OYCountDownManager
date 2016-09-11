//
//  ViewController.m
//  CellCountDown
//
//  Created by herobin on 16/9/11.
//  Copyright © 2016年 herobin. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "TableViewCell.h"
#import "OYCountDownManager.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 启动倒计时管理
    [kCountDownManager start];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    // 模拟从服务器取得数据 -- 例如:服务器返回的数据为剩余时间数
    NSInteger count = arc4random_uniform(10000+1); //生成0-1万之间的随机正整数
    Model *model = [[Model alloc]init];
    model.count = [NSString stringWithFormat: @"%zd", count];
    model.title = [NSString stringWithFormat:@"第%zd条数据", indexPath.row];
    // 传递模型
    cell.model = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

@end
