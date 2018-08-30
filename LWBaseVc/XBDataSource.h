//
//  XBDataSource.h
//  LWBaseVc
//
//  Created by weiyuxiang on 2018/8/30.
//  Copyright © 2018年 weiyuxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CellRoom)(id cell, id model, NSIndexPath * indexPath);

@interface XBDataSource : NSObject <UITableViewDataSource>

- (id)initWithIdentifier:(NSString *)identifier;

@property (nonatomic, strong) NSMutableArray *array;

@property (nonatomic, strong) NSString *cellIdentifier;

@property (nonatomic, copy) CellRoom cellRoom;


- (void)addArray:(NSArray *)modelArray;

@end
