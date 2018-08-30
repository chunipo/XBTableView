//
//  LWTableViewCell.m
//  LWBaseVc
//
//  Created by weiyuxiang on 2018/8/30.
//  Copyright © 2018年 weiyuxiang. All rights reserved.
//

#import "LWTableViewCell.h"

@interface LWTableViewCell ()

@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation LWTableViewCell



#pragma mark - init
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
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
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(230, 30, 200, 30)];
        _nameLabel.text = @"我是天气";
        _nameLabel.textColor = [UIColor greenColor];
        
    }
    return _nameLabel;
}

@end
