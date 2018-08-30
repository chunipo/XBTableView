//
//  XBBaseViewController.m
//  LWBaseVc
//
//  Created by weiyuxiang on 2018/8/29.
//  Copyright © 2018年 weiyuxiang. All rights reserved.
//

#import "XBBaseViewController.h"
#import "XBDataSource.h"
#import "LWTableViewCell.h"
#import "LWModel.h"

@interface XBBaseViewController ()<UITableViewDelegate>

@property (nonatomic, strong) XBDataSource *dataSource;

@end

@implementation XBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataSource.cellRoom = ^(id cell, id model, NSIndexPath *indexPath) {
        LWTableViewCell *lwCell = (LWTableViewCell *)cell;
        LWModel *lwModel = (LWModel *)model;
        lwCell.textLabel.text = lwModel.name;
        
    };
    [self.dataSource addArray:self.tablewArray];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







#pragma mark - lazy load
- (NSMutableArray *)tablewArray{
    if (!_tablewArray){
        _tablewArray = @[].mutableCopy;
        for (int i = 0; i<10; i++) {
            LWModel *model = [[LWModel alloc]init];
            model.name = [NSString stringWithFormat:@"我是回调里添加的%i",i];
            [_tablewArray addObject:model];
        }
        
    }
    return _tablewArray;
    
}

- (UITableView *)tableView{
    if (!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, self.view.frame.size.height-90)];
        [_tableView registerClass:[LWTableViewCell class] forCellReuseIdentifier:@"idd"];
        _tableView.dataSource = self.dataSource;
        _tableView.delegate = self;
        _tableView.rowHeight = 100;
    }
    return _tableView;
}

- (XBDataSource *)dataSource{
    if (!_dataSource){
        _dataSource = [[XBDataSource alloc]initWithIdentifier:@"idd"];
    }
    return _dataSource;
}

@end
