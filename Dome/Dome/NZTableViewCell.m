//
//  NZTableViewCell.m
//  Dome
//
//  Created by 诸超杰 on 16/9/5.
//  Copyright © 2016年 dome.naizui. All rights reserved.
//

#import "NZTableViewCell.h"

@interface NZTableViewCell ()
@property (nonatomic, strong) UIView *bottomView;
@end

@implementation NZTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(NSString *)model {
    if (self.bottomView) {
        [self.bottomView removeFromSuperview];
        self.bottomView = nil;
    }
//    [self setNeedsLayout];
//    [self layoutIfNeeded];
    NSLog(@"1");
    CGFloat x = self.topView.frame.origin.x;
    CGFloat y = self.topView.frame.origin.y;
    CGFloat height = self.topView.frame.size.height;
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(x, y + height, 20, 20)];
    self.bottomView.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:self.bottomView];
    NSLog(@"2");
    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"Cell:layoutSubviews");
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
