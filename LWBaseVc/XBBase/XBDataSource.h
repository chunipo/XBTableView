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
@interface XBDataSource : NSObject <UITableViewDataSource,UICollectionViewDataSource>

/************************************必传*********************************/

/** 创建方法 */
- (id)initWithIdentifier:(NSString *)identifier;


/** 数据 ,sectionde的返回，默认用这个数组就可以了 */
- (void)addArray:(NSArray *)modelArray;

/** cell 的创建 */
@property (nonatomic, copy) CellRoom cellRoom;

/************************************非必传*********************************/

/** row 的返回 ,默认为1，可以不写*/
@property (nonatomic, strong) NSArray *rowArray;


@end
