//
//  NINetworkDetectionView.m
//  AFNetworking
//
//  Created by nixs on 2020/8/14.
//

#import "NINetworkDetectionView.h"
#define MainScreenRect [UIScreen mainScreen].bounds
#import "Masonry.h"
#import "NIMacro.h"
#import "UIImage+NILibrary.h"

@implementation NINetworkDetectionView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    self.bgView = [UIView new];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kScreenWidth*0.8);
        make.height.mas_equalTo(135);
        make.center.mas_equalTo(self);
    }];
    [self.bgView.layer setCornerRadius:5];
    //UIImage *img = IMAGE(@"netError");// 该种方法行不通-上面两种方法都行
    
    //一、旧方法
//    NSURL *bundleURL = [[NSBundle mainBundle] URLForResource:@"NITools" withExtension:@"bundle"];
//    NSBundle *bundle = [NSBundle bundleWithURL:bundleURL];
//    UIImage *img = [UIImage imageNamed:@"netError" inBundle:bundle compatibleWithTraitCollection:nil];
    
    //二、优化如下:
//    NSBundle *bundle = [NSBundle bundleForClass:[NINetworkDetectionView class]];
//    NSURL *bundleURL = [bundle URLForResource:@"NITools" withExtension:@"bundle"];
//    NSBundle *resourceBundle = [NSBundle bundleWithURL: bundleURL];
//    UIImage *img = [UIImage imageNamed:@"netError" inBundle:resourceBundle compatibleWithTraitCollection:nil];
    
    //三、优化抽离分类如下:(2020年08月16日17:20:48)
    UIImage *img = [UIImage NIBundleImageNamed:@"netError" withClassName:@"NINetworkDetectionView"];
    
    self.noNetWorkImageView = [[UIImageView alloc] initWithImage:img];
    [self.bgView addSubview:self.noNetWorkImageView];
    [self.noNetWorkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
        make.centerX.mas_equalTo(self.bgView);
        make.top.mas_equalTo(self.bgView.mas_top).offset(15);
    }];
    
    self.labDesc = [UILabel new];
    self.labDesc.text = @"网络异常或断开连接,\n请检查手机网络!";
    self.labDesc.font = [UIFont systemFontOfSize:18];
    self.labDesc.textColor = [UIColor redColor];
    self.labDesc.textAlignment = NSTextAlignmentCenter;
    self.labDesc.numberOfLines = 0;
    [self.bgView addSubview:self.labDesc];
    [self.labDesc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.noNetWorkImageView.mas_bottom).offset(5);
        //make.height.equalTo(50);
        make.left.right.mas_equalTo(self.bgView);
    }];
}
-(void)showJRNetworkDetectionView{
    _alertWindow=[[UIWindow alloc] initWithFrame:MainScreenRect];
    _alertWindow.windowLevel=UIWindowLevelAlert;
    [_alertWindow becomeKeyWindow];
    [_alertWindow makeKeyAndVisible];
    [_alertWindow addSubview:self];
    //[self setShowAnimation];
}

@end
