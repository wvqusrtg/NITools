//
//  NINetworkDetectionView.h
//  AFNetworking
//
//  Created by nixs on 2020/8/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 学习引入资源文件 by:nixs 2020年08月14日17:21:43
@interface NINetworkDetectionView : UIView
@property(nonatomic,strong)UIView* bgView;
@property(nonatomic,strong)UILabel* labDesc;
@property (nonatomic,strong)UIWindow *alertWindow;
@property(nonatomic,strong)UIImageView* noNetWorkImageView;
-(void)showJRNetworkDetectionView;

@end

NS_ASSUME_NONNULL_END
