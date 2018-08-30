//
//  XBDelegate.h
//  LWBaseVc
//
//  Created by weiyuxiang on 2018/8/30.
//  Copyright © 2018年 weiyuxiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XBDelegate : NSObject <UITableViewDelegate,UICollectionViewDelegate>

@property (nonatomic, weak) id <UITableViewDelegate>viewController;

@property (nonatomic, copy) void (^selectedCell)(id tableView,NSIndexPath *indexPath);



@end
