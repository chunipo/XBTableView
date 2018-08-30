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

#pragma mark - tableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.rowArray.count;
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
    
    
    return cell;
    
}

#pragma mark - collectionDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.rowArray.count==0?1:self.rowArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id model = [self modelAtIndexPath:indexPath];
    
    
    if(self.cellRoom) {
        self.cellRoom(cell, model,indexPath);
    }
    return cell;
}




#pragma mark - lazy load
- (NSMutableArray *)array{
    if (!_array){
        _array = @[].mutableCopy;
    }
    return _array;
}

- (NSArray *)rowArray{
    if (!_rowArray){
        _rowArray = @[].copy;
    }
    return _rowArray;
}

@end
