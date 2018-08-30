//
//  XBDataSource.h
//  LWBaseVc
//
//  Created by weiyuxiang on 2018/8/30.
//  Copyright © 2018年 weiyuxiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CellRoom)(id cell, id model, NSIndexPath * indexPath);

//适合一级数组
@interface XBDataSource : NSObject <UITableViewDataSource>

/** 创建方法 */
- (id)initWithIdentifier:(NSString *)identifier;

/** cell 的创建 */
@property (nonatomic, copy) CellRoom cellRoom;

/** 数据 */
- (void)addArray:(NSArray *)modelArray;

@end
