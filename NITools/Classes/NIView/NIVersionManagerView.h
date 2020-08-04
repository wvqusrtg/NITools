//
//  NIVersionManagerView.h
//  AFNetworking
//
//  Created by nixs on 2020/8/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NIVersionManagerView : UIView
@property(nonatomic,strong)UIView* bgView;
@property(nonatomic,strong)UILabel* labTitle;
@property(nonatomic,strong)UIView* lineView;//分割线
@property(nonatomic,strong)UILabel* labDesc;
@property(nonatomic,strong)NSString* title;//标题
@property(nonatomic,strong)NSString* desc;//描述信息(版本更新内容)

@property(nonatomic,strong)UIButton* btnExit;
@property(nonatomic,strong)UIButton* btnOK;

@property (nonatomic,copy) void(^btnExitBlock)(void);
@property (nonatomic,copy) void(^btnOKBlock)(void);

@end

NS_ASSUME_NONNULL_END
