
//
//  BaseViewController.m
//  004Basic
//
//  Created by ai-nixs on 2020/8/2.
//  Copyright © 2020 nixs. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //防止控制器跳转有卡顿现象
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.labTitle];
    
}
-(UILabel *)labTitle{
    if (!_labTitle) {
        _labTitle =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 88)];
        _labTitle.text = @"Home";
        _labTitle.font = [UIFont systemFontOfSize:20 weight:10];
        _labTitle.textColor = [UIColor whiteColor];
        _labTitle.textAlignment = NSTextAlignmentCenter;
        _labTitle.backgroundColor = [UIColor redColor];
    }
    return _labTitle;
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
