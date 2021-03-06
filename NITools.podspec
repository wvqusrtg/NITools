#
# Be sure to run `pod lib lint NITools.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NITools'
  s.version          = '0.2.4'
  s.summary          = 'NITools:(NSObject+ReadJsonFile)读取本地json文件,返回可能为NSArray/NSDictionary 「2021年05月11日19:59:07」'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '- tag:0.2.4 - NITools:(NSObject+ReadJsonFile)读取本地json文件,返回可能为NSArray/NSDictionary 「2021年05月11日19:59:07」'
  
  s.homepage         = 'https://github.com/wvqusrtg/NITools'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'nixinsheng' => '1911398892@qq.com' }
  s.source           = { :git => 'https://github.com/wvqusrtg/NITools.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  # 这里是最终需要编译出来的代码文件目录，一般不需要改动，记得把代码文件拉到这个文件夹就行
  # s.source_files = 'NITools/Classes/**/*'
  
  s.subspec 'NIMacro' do |ss|
      ss.source_files = 'NITools/Classes/NIMacro/*.{h,m}'
  end
  
  s.subspec 'NICategory' do |ss|
      ss.source_files = 'NITools/Classes/NICategory/*.{h,m}'
  end
  
  s.subspec 'NIIPTool' do |ss|
      ss.source_files = 'NITools/Classes/NIIPTool/*.{h,m}'
  end
  
  s.subspec 'NIView' do |ss|
      ss.source_files = 'NITools/Classes/NIView/*.{h,m}'
      ss.dependency 'Masonry'
      ss.dependency 'YYText'
      ss.dependency 'NITools/NIMacro'
      ss.dependency 'NITools/NICategory'
  end
  
  # 2020年11月10日14:20:21
  s.subspec 'NISandBoxTool' do |ss|
      ss.source_files = 'NITools/Classes/NISandBoxTool/*.{h,m}'
  end
    
  #如下s.resources是旧方法
  # s.resources = 'NITools/Classes/Res/*.{png,xib,nib,bundle}'
  
  #这里存放的是资源文件-新方法
   s.resource_bundles = {
     'NITools' => ['NITools/Assets/*.{png,xib,nib,bundle}']
   }
  # 这里推荐这么写，将该目录下的.h文件暴露出来
  s.public_header_files = 'Pod/Classes/**/*.h'
  # 以下，如果不需要可以不写
  # 这里是此三方库需要依赖的系统动态库
  s.frameworks = 'UIKit', 'MapKit'
  # 这里是此三方库需要依赖的系统静态库
  s.library = 'resolv', 'iconv', 'stdc++', 'c++', 'sqlite3'
  # 此三方库需要依赖的其他CocoaPods仓库，可以依赖多个
  s.dependency 'AFNetworking'
  s.dependency 'Masonry'
  s.dependency 'YYText'
end
