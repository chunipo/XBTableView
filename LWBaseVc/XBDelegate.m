//
//  XBDelegate.m
//  LWBaseVc
//
//  Created by weiyuxiang on 2018/8/30.
//  Copyright © 2018年 weiyuxiang. All rights reserved.
//

#import "XBDelegate.h"

@implementation XBDelegate

//runtime方法
- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    if([super respondsToSelector:aSelector]) {
        return self;
    } else if ([self.viewController respondsToSelector:aSelector]) {
        return self.viewController;
    }
    return self;
}


- (BOOL)respondsToSelector:(SEL)aSelector
{
    return [super respondsToSelector:aSelector] || [self.viewController respondsToSelector:aSelector];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"%@",self);
    if([self respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.viewController tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //延长 cell 的线至边界
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

@end
