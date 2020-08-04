//
//  NIVersionManagerView.m
//  AFNetworking
//
//  Created by nixs on 2020/8/4.
//

#import "NIVersionManagerView.h"
// 测试直接引入三方依赖Masnory
#import "Masonry.h"
// 屏幕
#define kScreenWidth [UIScreen mainScreen].bounds.size.width     //屏幕宽度
#define kScreenHeight [UIScreen mainScreen].bounds.size.height   //屏幕高度
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

@implementation NIVersionManagerView

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
        make.width.mas_equalTo(kScreenWidth*0.9);
        make.center.mas_equalTo(self);
    }];
    [self.bgView.layer setCornerRadius:5];
    
    self.labTitle = [UILabel new];
    self.labTitle.text = @"温馨提示";
    self.labTitle.textAlignment = NSTextAlignmentCenter;
    [self.bgView addSubview:self.labTitle];
    [self.labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.bgView);
        make.height.mas_equalTo(30);
        make.top.mas_equalTo(self.bgView.mas_top).mas_equalTo(5);
    }];
    
    self.lineView = [UIView new];
    self.lineView.backgroundColor = RGBACOLOR(218, 218, 218, 1);
    [self.bgView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labTitle.mas_bottom).offset(10);
        make.height.mas_equalTo(1);
        make.left.mas_equalTo(self.bgView).offset(20);
        make.right.mas_equalTo(self.bgView).offset(-20);
    }];
    
    self.labDesc = [UILabel new];
    self.labDesc.text = @"描述信息";
    self.labDesc.textAlignment = NSTextAlignmentCenter;
    self.labDesc.textColor = [UIColor grayColor];
    self.labDesc.numberOfLines = 0;
    [self.bgView addSubview:self.labDesc];
    [self.labDesc mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.left.right.mas_equalTo(self.bgView);
        make.left.mas_equalTo(self.bgView).offset(15);
        make.right.mas_equalTo(self.bgView).offset(-15);
        make.top.mas_equalTo(self.lineView.mas_bottom).mas_equalTo(10);
    }];
    
    self.btnExit = [UIButton new];
    [self.btnExit setTitle:@"退出" forState:UIControlStateNormal];
    [self.btnExit setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.btnExit.layer.borderWidth = 1;
    self.btnExit.layer.borderColor = [UIColor redColor].CGColor;
    [self.btnExit setBackgroundColor:[UIColor whiteColor]];
    [self.btnExit addTarget:self action:@selector(btnExitClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:self.btnExit];
    [self.btnExit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labDesc.mas_bottom).offset(20);
        make.left.mas_equalTo(self.bgView).offset(20);
        make.width.mas_equalTo((kScreenWidth-60)/2.5);
        make.height.mas_equalTo(50);
    }];
    [self.btnExit.layer setCornerRadius:5];
    
    self.btnOK = [UIButton new];
    [self.btnOK setTitle:@"立即更新" forState:UIControlStateNormal];
    [self.btnOK setBackgroundColor:[UIColor redColor]];
    [self.btnOK addTarget:self action:@selector(btnOKClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:self.btnOK];
    [self.btnOK mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labDesc.mas_bottom).offset(20);
        make.right.mas_equalTo(self.bgView).offset(-20);
        make.width.mas_equalTo((kScreenWidth-60)/2.5);
        make.height.mas_equalTo(50);
    }];
    [self.btnOK.layer setCornerRadius:5];
    
    [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.btnOK.mas_bottom).mas_equalTo(20);
    }];
}
-(void)btnExitClicked:(UIButton*)btn{
    if (self.btnExitBlock) {
        self.btnExitBlock();
    }
}
-(void)btnOKClicked:(UIButton*)btn{
    if(self.btnOKBlock){
        self.btnOKBlock();
    }
}

-(void)setTitle:(NSString *)title{
    _title = title;
    self.labTitle.text = _title.length>0?self.title:@"温馨提示";
}
-(void)setDesc:(NSString *)desc{
    _desc = desc;
    self.labDesc.text = _desc.length>0?self.desc:@"描述信息";
}

@end
