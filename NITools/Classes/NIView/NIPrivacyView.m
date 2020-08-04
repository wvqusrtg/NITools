//
//  NIPrivacyView.m
//  AFNetworking
//
//  Created by nixs on 2020/8/4.
//

#import "NIPrivacyView.h"
// 测试直接引入三方依赖Masnory
#import "Masonry.h"
#import "YYText.h"
// 屏幕
#define kScreenWidth [UIScreen mainScreen].bounds.size.width     //屏幕宽度
#define kScreenHeight [UIScreen mainScreen].bounds.size.height   //屏幕高度
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
/** 弱引用 */
#define WEAKSELF __weak typeof(self) weakSelf = self
#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;
/** 避免self的提前释放 */
#define STRONGSELF __weak typeof(weakSelf) strongSelf = weakSelf

@interface NIPrivacyView()
@property(nonatomic,strong)UIView* bgView;
@property(nonatomic,strong)UILabel* labTitle;
@property(nonatomic,strong)UIView* lineView;//分割线
@property (nonatomic , strong)   YYLabel *labDesc;
@property(nonatomic,strong)NSString* title;//标题
@property(nonatomic,strong)NSString* desc;//描述信息(具体内容)

@property(nonatomic,strong)UIButton* btnExit;
@property(nonatomic,strong)UIButton* btnOK;
@property (nonatomic,copy) void(^btnExitBlock)(void);
@property (nonatomic,copy) void(^btnOKBlock)(void);
@property (nonatomic,copy) void(^privacyBlock)(void);

@end

@implementation NIPrivacyView
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
    
    self.labDesc = [[YYLabel alloc] init];
    //设置整段字符串的颜色
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:15],NSForegroundColorAttributeName: [UIColor grayColor]};
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"        感谢您信任XXXX!\n        我们一直采取行业领先的安全防护措施来保护您的信息安全。我们会根据您使用服务的具体功能需要收集使用信息(可能涉及账户、交易、设备等相关信息)。我们不会向任何第三方提供您的信息，除非得到您的授权。若我们将信息用于您未授权用途或目的，我们会事先再次征求您的同意。\n        您可以阅读我们完整的《XXXX隐私政策》了解我们的承若。如果您继续使用我们的服务，表示您已经充分阅读和理解隐私政策的全部内容。" attributes:attributes];
    NSRange range = [[text string] rangeOfString:@"《XXXX隐私政策》"];
    [text yy_setTextUnderline:[YYTextDecoration decorationWithStyle:YYTextLineStyleSingle] range:range];
    //设置高亮色和点击事件
    WEAKSELF;
    [text yy_setTextHighlightRange:range color:[UIColor redColor] backgroundColor:[UIColor clearColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        NSLog(@"点击了《隐私政策》-by:nixinsheng");
        [weakSelf privacyClicked];
    }];
    self.labDesc.attributedText = text;
    self.labDesc.userInteractionEnabled = YES;
    self.labDesc.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    self.labDesc.textAlignment = NSTextAlignmentLeft;
    self.labDesc.numberOfLines = 0;
    self.labDesc.preferredMaxLayoutWidth = kScreenWidth-45;
    self.labDesc.lineBreakMode = NSLineBreakByCharWrapping;
    [self.labDesc sizeToFit];
    [self.bgView addSubview:self.labDesc];
    //计算 string 的高度
    CGSize attSize = [text boundingRectWithSize:CGSizeMake(kScreenWidth-40, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    [self.labDesc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bgView).offset(15);
        make.right.mas_equalTo(self.bgView).offset(-15);
        make.top.mas_equalTo(self.lineView.mas_bottom).mas_equalTo(5);
        make.height.mas_equalTo(attSize.height+50);
    }];
    
    self.btnExit = [UIButton new];
    [self.btnExit setTitle:@"不同意" forState:UIControlStateNormal];
    [self.btnExit setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.btnExit.layer.borderWidth = 1;
    self.btnExit.layer.borderColor = [UIColor redColor].CGColor;
    [self.btnExit setBackgroundColor:[UIColor whiteColor]];
    [self.btnExit addTarget:self action:@selector(btnExitClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:self.btnExit];
    [self.btnExit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labDesc.mas_bottom).offset(5);
        make.left.mas_equalTo(self.bgView).offset(20);
        make.width.mas_equalTo((kScreenWidth-60)/2.5);
        make.height.mas_equalTo(50);
    }];
    [self.btnExit.layer setCornerRadius:5];
    
    self.btnOK = [UIButton new];
    [self.btnOK setTitle:@"同意" forState:UIControlStateNormal];
    [self.btnOK setBackgroundColor:[UIColor redColor]];
    [self.btnOK addTarget:self action:@selector(btnOKClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.bgView addSubview:self.btnOK];
    [self.btnOK mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.labDesc.mas_bottom).offset(5);
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
-(void)privacyClicked{
    if (self.privacyBlock) {
        self.privacyBlock();
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
