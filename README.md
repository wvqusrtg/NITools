# NITools


[![CI Status](https://img.shields.io/travis/nixinsheng/NITools.svg?style=flat)](https://travis-ci.org/nixinsheng/NITools)
[![Version](https://img.shields.io/cocoapods/v/NITools.svg?style=flat)](https://cocoapods.org/pods/NITools)
[![License](https://img.shields.io/cocoapods/l/NITools.svg?style=flat)](https://cocoapods.org/pods/NITools)
[![Platform](https://img.shields.io/cocoapods/p/NITools.svg?style=flat)](https://cocoapods.org/pods/NITools)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## 目录结构
```
/Users/nixs/Documents/iOSDemo/NITools/NITools
nixs@nixs-iMac NITools % tree
.
├── Assets
└── Classes
    ├── NICategory(UIView 扩展分类-注意和Masnory一起引入工程时候，不要用Masnory宏定义)
    │   ├── UIView+NIFrame.h
    │   └── UIView+NIFrame.m
    └── NIView(自定义View)
        ├── NIPrivacyView.h(app启动隐私说明)
        ├── NIPrivacyView.m
        ├── NIVersionManagerView.h(版本更新描述)
        └── NIVersionManagerView.m

4 directories, 6 files
nixs@nixs-iMac NITools %
```
## 效果
![版本更新](./Res/demo.gif)
![隐私政策](./Res/demo2.gif)

## Requirements

- iOS 8.0 or later

## Installation

NITools is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NITools'
```

## Author

nixinsheng, 1911398892@qq.com

## License

NITools is available under the MIT license. See the LICENSE file for more info.

NITools

## 版本更新内容
 - tag:0.1.1 - NITools：优化NIPrivacyView.h/m(开放尽可能多的属性-方便使用者精细定制化)
 - tag:0.1.0 - NITools：自定义view分类(UIView+NIFrame.h/m)、启动隐私政策自定义view组件(NIPrivacyView.h/m)、版本更新自定义view组件(NIVersionManagerView.h/m)


## Tips by myself
[1.如何搭建自己的CocoaPods三方库，并且在库中依赖其他三方库](https://www.jianshu.com/p/0e55143901b4)

[2.git pull 问题:fatal: refusing to merge unrelated histories解决](https://blog.csdn.net/qq_39400546/article/details/100150320)

[3.CocoaPods 操作过程中出现的错误](https://www.jianshu.com/p/9a5ec24ff437)