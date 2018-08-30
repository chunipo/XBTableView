//
//  XBBaseViewController.m
//  LWBaseVc
//
//  Created by weiyuxiang on 2018/8/29.
//  Copyright © 2018年 weiyuxiang. All rights reserved.
//

#import "XBBaseViewController.h"
#import "XBDataSource.h"
#import "XBDelegate.h"
#import "LWTableViewCell.h"
#import "LWCollectionViewCell.h"
#import "LWModel.h"



@interface XBBaseViewController ()<UITableViewDelegate,UICollectionViewDelegate>

@property (nonatomic, strong) XBDataSource *dataSource;
@property (nonatomic, strong) XBDelegate *delegate;

@end

static NSString * const cell = @"isCell";

@implementation XBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    BOOL is = NO;
    
    is?[self initTableView]:[self initCollectionView];
    
}

#pragma mark - delegate
//- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    NSLog(@"%@",self);
//
//}


//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%@",self);
//}

#pragma mark - init
/**tableview相关*/
- (void)initTableView{
    
    //cell 的创建
    self.dataSource.cellRoom = ^(id cell, id model, NSIndexPath *indexPath) {
        LWTableViewCell *lwCell = (LWTableViewCell *)cell;
        LWModel *lwModel = (LWModel *)model;
        lwCell.textLabel.text = lwModel.name;
        
    };

    //cell的点击
    __weak __typeof(&*self)weakself = self;
    self.delegate.selectedCell = ^(id tableView, NSIndexPath *indexPath) {
        NSLog(@"%@",weakself);
    };
    [self.dataSource addArray:self.tablewArray];
    [self.view addSubview:self.tableView];
}

/**collectionView相关*/
- (void)initCollectionView{
    
    self.dataSource.cellRoom = ^(id cell, id model, NSIndexPath *indexPath) {
        LWCollectionViewCell *lwCell = (LWCollectionViewCell *)cell;
        LWModel *lwModel = (LWModel *)model;
        lwCell.nameLabel.text = lwModel.name;
        
    };
    [self.dataSource addArray:self.tablewArray];
    [self.view addSubview:self.collectionView];
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
        [_tableView registerClass:[LWTableViewCell class] forCellReuseIdentifier:cell];
        _tableView.dataSource = self.dataSource;
        _tableView.delegate = self.delegate;
        self.delegate.viewController = self;
        _tableView.rowHeight = 100;
    }
    return _tableView;
}

- (XBDataSource *)dataSource{
    if (!_dataSource){
        _dataSource = [[XBDataSource alloc]initWithIdentifier:cell];
    }
    return _dataSource;
}

- (XBDelegate *)delegate{
    if (!_delegate){
        _delegate = [[XBDelegate alloc]init];
    }
    return _delegate;
}

- (UICollectionView *)collectionView{
    if (!_collectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        layout.itemSize = CGSizeMake(100, 100);
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, self.view.frame.size.height-90) collectionViewLayout:layout];
        [_collectionView registerClass:[LWCollectionViewCell class] forCellWithReuseIdentifier:cell];
        _collectionView.dataSource = self.dataSource;
        _collectionView.delegate = self.delegate;
        self.delegate.viewController = self;
    }
    return _collectionView;
}

@end
