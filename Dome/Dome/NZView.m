//
//  NZView.m
//  Dome
//
//  Created by 诸超杰 on 16/9/5.
//  Copyright © 2016年 dome.naizui. All rights reserved.
//

#import "NZView.h"

@implementation NZView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews {
    [super layoutSubviews];
    if (!self.markString) {
    self.markString = @"begin";
    }
    NSLog(@"NZViewBy =========%@",self.markString);
}

@end
