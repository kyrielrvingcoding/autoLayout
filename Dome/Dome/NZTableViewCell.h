//
//  NZTableViewCell.h
//  Dome
//
//  Created by 诸超杰 on 16/9/5.
//  Copyright © 2016年 dome.naizui. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface NZTableViewCell : UITableViewCell
- (void)setModel:(NSString *)model;
@property (weak, nonatomic) IBOutlet UIView *topView;

@end
