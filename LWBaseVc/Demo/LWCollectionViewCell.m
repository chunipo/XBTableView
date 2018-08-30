//
//  LWCollectionViewCell.m
//  LWBaseVc
//
//  Created by weiyuxiang on 2018/8/30.
//  Copyright © 2018年 weiyuxiang. All rights reserved.
//

#import "LWCollectionViewCell.h"

@interface LWCollectionViewCell ()


@end

@implementation LWCollectionViewCell

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self setLayout];
    }
    return self;
}

#pragma mark - layout
- (void)setLayout{
    [self.contentView addSubview:self.nameLabel];
}

#pragma mark - lazy load

- (UILabel *)nameLabel{
    if (!_nameLabel){
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 30, 200, 30)];
        _nameLabel.text = @"我是天气";
        _nameLabel.textColor = [UIColor greenColor];
        
    }
    return _nameLabel;
}


@end
