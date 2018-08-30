//
//  XBBaseViewController.h
//  LWBaseVc
//
//  Created by weiyuxiang on 2018/8/29.
//  Copyright © 2018年 weiyuxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XBBaseViewController : UIViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *tablewArray;

@end
