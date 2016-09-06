//
//  NZViewController.m
//  Dome
//
//  Created by 诸超杰 on 16/9/5.
//  Copyright © 2016年 dome.naizui. All rights reserved.
//

#import "NZViewController.h"
#import "NZView.h"
@interface NZViewController ()
@property (nonatomic, strong) NZView *nzView;
@end

@implementation NZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nzView = [[NZView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.nzView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.nzView];
    
    self.nzView.markString = @"setLayoutSubviews";
    
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.backgroundColor = [UIColor purpleColor];
    button.frame = CGRectMake(200, 100, 50, 50);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(addNzViewSubview) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)addNzViewSubview {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(25, 25, 50, 50)];
    view.backgroundColor = [UIColor redColor];
//    self.nzView.frame = CGRectMake(200, 200, 100, 100);
//    self.nzView.markString = @"layoutIfNeeded";
//    [self.nzView setNeedsLayout];
//    [self.nzView layoutIfNeeded];
    self.nzView.markString = @"subView";
    [self.nzView addSubview:view];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
