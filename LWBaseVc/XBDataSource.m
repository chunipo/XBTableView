//
//  XBDataSource.m
//  LWBaseVc
//
//  Created by weiyuxiang on 2018/8/30.
//  Copyright © 2018年 weiyuxiang. All rights reserved.
//

#import "XBDataSource.h"

@interface XBDataSource () 

@property (nonatomic, strong) NSMutableArray *array;

@property (nonatomic, strong) NSString *cellIdentifier;

@end

@implementation XBDataSource

#pragma mark - init
- (id)initWithIdentifier:(NSString *)identifier{
    if(self = [super init]) {
        _cellIdentifier = identifier;
        
    }
    return self;
}

- (void)addArray:(NSArray *)modelArray{
    [self.array addObjectsFromArray:modelArray];
}


- (id)modelAtIndexPath:(NSIndexPath *)indexPath {
    return self.array.count > indexPath.row ? self.array[indexPath.row] : nil;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id model = [self modelAtIndexPath:indexPath];
    
    
    if(self.cellRoom) {
        self.cellRoom(cell, model,indexPath);
    }
    
//    if ([cell respondsToSelector:@selector(configureCellWithModel:)]) {
//        [cell performSelector:@selector(configureCellWithModel:) withObject:model];
//    }
    
    return cell;
    
}



#pragma mark - lazy load
- (NSMutableArray *)array{
    if (!_array){
        _array = @[].mutableCopy;
    }
    return _array;
}

@end
