# NITools


[![CI Status](https://img.shields.io/travis/nixinsheng/NITools.svg?style=flat)](https://travis-ci.org/nixinsheng/NITools)
[![Version](https://img.shields.io/cocoapods/v/NITools.svg?style=flat)](https://cocoapods.org/pods/NITools)
[![License](https://img.shields.io/cocoapods/l/NITools.svg?style=flat)](https://cocoapods.org/pods/NITools)
[![Platform](https://img.shields.io/cocoapods/p/NITools.svg?style=flat)](https://cocoapods.org/pods/NITools)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## 效果
![版本更新](./Res/demo.gif)
![隐私政策](./Res/demo2.gif)

## 目录结构
```
/Users/nixs/Documents/iOSDemo/NITools/NITools
nixs@nixs-iMac NITools % tree -N
.
├── Assets
└── Classes
    ├── NICategory
    │   ├── NSString+VersionCompare.h - app版本比较分类
    │   ├── NSString+VersionCompare.m
    │   ├── UIView+NIFrame.h - UIView 扩展分类-注意和Masnory一起引入工程时候，不要用Masnory宏定义
    │   └── UIView+NIFrame.m
    ├── NIIPTool
    │   ├── NIIPTools.h - 获取ip地址工具类,支持获取ipv6地址
    │   └── NIIPTools.m
    └── NIView
        ├── NIPrivacyView.h - app启动隐私说明「自定义view」
        ├── NIPrivacyView.m
        ├── NIVersionManagerView.h - 版本更新描述「自定义view」
        └── NIVersionManagerView.m

5 directories, 10 files
nixs@nixs-iMac NITools %
```

## 使用示例
 - 参见./Example/NITools/NIViewController.m

## 版本更新内容
 - 计划更新：组件的色系要能统一修改、组件属性尽量多开放、属性能精细修改、（NITools待更新）
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
pod 'NITools', '~> 0.1.3'
```

## Author

<p style="color:red">nixinsheng, 1911398892@qq.com</p>

有问题微信联系包教会「注明来意」-本人微信号:wvqusrtg

## License

NITools is available under the MIT license. See the LICENSE file for more info.

NITools

