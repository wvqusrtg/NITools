//
//  NIViewController.m
//  NITools
//
//  Created by nixinsheng on 08/04/2020.
//  Copyright (c) 2020 nixinsheng. All rights reserved.
//

#import "NIViewController.h"
#import "NITools/NIPrivacyView.h"
#import "NITools/NIVersionManagerView.h"
#import "NITools/UIView+NIFrame.h"
#import "NITools/NSString+VersionCompare.h"
#import "NITools/NIIPTools.h"
#import "MBProgressHUD+Add/UIView+MBPHUD.h"
#import "NITools/NIMacro.h"
#import "NITools/UIColor+NIColor.h"
#import "NITools/NINetworkDetectionView.h"

@interface NIViewController ()
@property(nonatomic,strong) UIButton *btnNext;
@property(nonatomic,strong) UIView *view015;
@property(nonatomic,strong) UIView *view015_2;
@property(nonatomic,strong) NINetworkDetectionView *networkDetectionView;

@end

@implementation NIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.labTitle.text = @"Example for NITools";
    [self.view addSubview:self.btnNext];
    [self versionCompar];
    [self getIpAddress];
    [self printMacro];
    [self tag015_eg];
    [self showNINetworkDetectionView];
}
-(void)showNINetworkDetectionView{
    [self.view addSubview:self.networkDetectionView];
    /**
     //*自定义网络异常视图放到每个控制器视图-最上层
     UIWindow* mainWindow = [self lastWindow];
     [mainWindow addSubview:self.networkDetectionView];
     //self.networkDetectionView.hidden = YES;
     */
}

/**
 iOS 应用获取最上层全屏 Window 的正确方法
 */
- (UIWindow *)lastWindow{
    NSArray *windows = [UIApplication sharedApplication].windows;
    for(UIWindow *window in [windows reverseObjectEnumerator]) {
        if ([window isKindOfClass:[UIWindow class]] && CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds))
            return window;
    }
    return [UIApplication sharedApplication].keyWindow;
}

-(void)tag015_eg{
    [self.view addSubview:self.view015];
    [self.view addSubview:self.view015_2];
}

-(void)printMacro{
    DLog(@"nixs");
    DLog(@"---kScreenHeight:%lf",kScreenHeight);
    kStartTime
    kEndTime;
    
    NIViewSetRadius(self.btnNext, 5.0);
    UIColor* color = [UIColor blueColor];
    NIViewBorderRadius(self.btnNext, 5, color.CGColor);
    
}
///
-(void)getIpAddress{
    NSLog(@"---ipAddress:%@",[NIIPTools NIGetIPAddress]);
}
/// 比较两个版本号的大小（2.0）
/// @param v1 v1 第一个版本号
/// @param v2 v2 第二个版本号
/// @return 版本号相等,返回0; v1小于v2,返回-1; 否则返回1.
/// by:nixs 2020年08月13日19:04:40
-(void)versionCompar{
    //NSInteger resultCompare = [NSString compareVersion:@"0.1.0" to:@"0.1"];
    //NSInteger resultCompare = [NSString compareVersion:@"0.1.0" to:@"0.1.1"];
    NSInteger resultCompare = [NSString NICompareVersion:@"0.1.0" to:@"0.0.1"];
    NSLog(@"---resultCompare:%ld",resultCompare);
}

/// 页面跳转 没有用UINavigationController
-(void)nextPage{
    [self.view showHUDMessage:@"加载中..."];
    /**
     //[self presentViewController:[TYPagerController new] animated:YES completion:nil];
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [self.view hideHUD];
         [self presentViewController:[TYPagerController new] animated:YES completion:nil];
     });
     */
    /**
     NIVersionManagerView *vmView = [[NIVersionManagerView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
     vmView.desc = @"组件化就是将APP拆分成各个组件（或者说模块也行），同时解除这些模块之间的耦合，然后通过主工程将项目所需要的组件组合起来。这样组件化过后的项目就变成了很多小模块，如果新项目中有类似的需求，直接将模块引入稍作修改就能使用了。";
     //修改组件属性
     [vmView.btnOK setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     [self.view addSubview:vmView];
     //组件按钮相应事件block
     vmView.btnOKBlock = ^{
         [self.view showHUDMessage:@"btnOKBlock"];
     };
     vmView.btnExitBlock = ^{
         [self.view showHUDMessage:@"btnExitBlock"];
     };
     */
     NIPrivacyView* priView = [[NIPrivacyView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
     [self.view addSubview:priView];
     priView.btnOKBlock = ^{
         [self.view showHUDMessage:@"btnOKBlock"];
     };
     priView.btnExitBlock = ^{
         [self.view showHUDMessage:@"btnExitBlock"];
     };
     priView.privacyBlock = ^{
       [self.view showHUDMessage:@"隐私详情"];
     };
}

/// 懒加载
-(UIButton *)btnNext{
    if (!_btnNext) {
        _btnNext = [[UIButton alloc] initWithFrame:CGRectMake(20, 88+5, kScreenWidth-40, 50)];
        [_btnNext setTitle:@"下一页" forState:UIControlStateNormal];
        [_btnNext setBackgroundColor:[UIColor redColor]];
        [_btnNext setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_btnNext addTarget:self action:@selector(nextPage) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnNext;
}
-(UIView *)view015{
    if (!_view015) {
        _view015 = [[UIView alloc] initWithFrame:CGRectMake(10, self.btnNext.bottom+5, kScreenWidth/3, 100)];
        //非暗黑-红色、暗黑-蓝色
        [_view015 setBackgroundColor:[UIColor colorWithLightColor:[UIColor redColor] DarkColor:[UIColor blueColor]]];
        
        //阴影 offset 右10、下10 - 注:暗黑模式变换有异常
        [_view015 shadow:[UIColor colorWithLightColor:[UIColor greenColor] DarkColor:[UIColor purpleColor]] opacity:0.9 radius:5.0 offset:CGSizeMake(10, 10)];
    }
    return _view015;
}
-(UIView *)view015_2{
    if (!_view015_2) {
        _view015_2 = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth-kScreenWidth/3-10, self.btnNext.bottom+5, 100, 100)];
        //非暗黑-红色、暗黑-蓝色
        [_view015_2 setBackgroundColor:[UIColor colorWithLightColor:[UIColor redColor] DarkColor:[UIColor blueColor]]];
        //[_view015 round:50.0 RectCorners:UIRectCornerBottomRight];
        [_view015_2 round:50.0 RectCorners:UIRectCornerTopLeft|UIRectCornerBottomRight|UIRectCornerTopRight];
    }
    return _view015_2;
}
-(NINetworkDetectionView *)networkDetectionView{
    if (!_networkDetectionView) {
        _networkDetectionView = [[NINetworkDetectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    }
    return _networkDetectionView;
}
@end
