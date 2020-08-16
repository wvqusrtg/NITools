# NITools


[![CI Status](https://img.shields.io/travis/nixinsheng/NITools.svg?style=flat)](https://travis-ci.org/nixinsheng/NITools)
[![Version](https://img.shields.io/cocoapods/v/NITools.svg?style=flat)](https://cocoapods.org/pods/NITools)
[![License](https://img.shields.io/cocoapods/l/NITools.svg?style=flat)](https://cocoapods.org/pods/NITools)
[![Platform](https://img.shields.io/cocoapods/p/NITools.svg?style=flat)](https://cocoapods.org/pods/NITools)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## 效果
 - 自定义view组件效果

![版本更新](./Res/demo.gif)
![隐私政策](./Res/demo2.gif)
 - 阴影、指定圆角、暗黑颜色适配

![UIView+NIFrame、UIColor+NIColor](./Res/WechatIMG51.png)
![UIView+NIFrame、UIColor+NIColor](./Res/WechatIMG52.png)

## 目录结构
```
/Users/nixs/Documents/iOSDemo/NITools/NITools
nixs@nixs-iMac Classes % tree -N
.
├── NICategory
│   ├── NSString+VersionCompare.h - app版本比较分类
│   ├── NSString+VersionCompare.m
│   ├── UIColor+NIColor.h - iOS13-适配暗黑颜色控制
│   ├── UIColor+NIColor.m
│   ├── UIView+NIFrame.h - UIView 扩展分类(新增边框、圆角、指定圆角控制)-注意和Masnory一起引入工程时候，不要用Masnory宏定义
│   └── UIView+NIFrame.m
├── NIIPTool
│   ├── NIIPTools.h - 获取ip地址工具类,支持获取ipv6地址
│   └── NIIPTools.m
├── NIMacro
│   └── NIMacro.h - 常用宏定义整理
└── NIView
    ├── NIPrivacyView.h - app启动隐私说明「自定义view」
    ├── NIPrivacyView.m
    ├── NIVersionManagerView.h - 版本更新描述「自定义view」
    └── NIVersionManagerView.m

4 directories, 13 files
nixs@nixs-iMac Classes %
```

## 使用示例
 - 参见./Example/NITools/NIViewController.m

## 版本更新内容
 - 计划更新：组件的色系要能统一修改、组件属性尽量多开放、属性能精细修改、（NITools待更新）
 - tag:0.2.0 - NITools：pod类里使用图片资源文件-优化抽离NSBundle+NILibrary、UIImage+NILibrary分类 
 - tag:0.1.9 - NITools：自定义View(NINetworkDetectionView.h/m-加载图片优化)使用资源文件-优化NSBundle引入资源文件 
 - tag:0.1.8 - NITools：自定义View(NINetworkDetectionView.h/m)使用资源文件-优化NSBundle引入资源文件
 - tag:0.1.7 - NITools：自定义View(NINetworkDetectionView.h/m)使用资源文件
 - tag:0.1.6 - NITools：优化NITools.podspec 去除s.dependency 'AFNetworking'强制要求的版本
 - tag:0.1.5 - NITools：优化UIView+NIFrame.h/m-支持设置圆角、设置边框、设置圆角&边框、给指定哪几个角设置圆角、设置阴影；新增：UIColor+NIColor.h/m适配暗黑模式颜色
 - tag:0.1.4 - NITools：常用宏整理NIMacro/Macro.h(注:你可以拷贝出来放到你工程的PCH里,也可以PCH里直接引用该头文件)
 - tag:0.1.3 - NITools：新增NSString分类(NSString+VersionCompare.h/m)-app发布版本号比较;新增获取ip地址工具类-支持获取ipv6地址
 - tag:0.1.2 - NITools：优化NIPrivacyView.h/m(开放尽可能多的属性-方便使用者精细定制化)-「个人实践：pod lib编译验证不过、pod trunk push上传异常、 trunk push 到 CocoaPods 成功后 pod search 却搜不到的解决方法」;Allow Non-modular includes in Framework Mo 「修复」;
    <p style="color:red">-需要详细资料小伙伴联系我微信:wvqusrtg</p>

 - tag:0.1.0 - NITools：自定义view分类(UIView+NIFrame.h/m)、启动隐私政策自定义view组件(NIPrivacyView.h/m)、版本更新自定义view组件(NIVersionManagerView.h/m)

## Requirements

- iOS 8.0 or later

## Installation

NITools is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NITools', '~> 0.2.0'
```

## Author

<p style="color:red">nixinsheng, 1911398892@qq.com</p>

有问题微信联系包教会「注明来意」-本人微信号:wvqusrtg

## License

NITools is available under the MIT license. See the LICENSE file for more info.

NITools

## Tips
- pod install 记录(Example - tag:0.1.6)
```
nixs@nixs-iMac Example % pod install
Analyzing dependencies
Downloading dependencies
Installing AFNetworking (3.2.1)
Installing NITools 0.1.6
Generating Pods project
Integrating client project
Pod installation complete! There is 1 dependency from the Podfile and 4 total pods installed.
nixs@nixs-iMac Example %
```