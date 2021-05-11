# (git提交模块)-该模块待分离
echo '---[1]-git提交代码、打tag'
# 添加所有
git add .
# 添加本次更新内容文本
echo '------[1-1]-请输入git commit 待提交的更新描述内容:(字符串)'
read commit_desc
git commit -m "$commit_desc"
# 远程代码仓库地址
git remote add origin 'https://github.com/wvqusrtg/NITools.git'
git push origin master
# （注：这里的版本号必须和podspec里写的版本号一致）
echo '------[1-2]-请输入git tag 待提交的更新tag:(eg:0.0.1)'
read tag_desc
git tag $tag_desc
git push --tags

echo '---1.验证库是否有问题'
pod lib lint NITools.podspec --use-libraries --allow-warnings
echo '---2.提交库'
pod trunk push NITools.podspec --use-libraries --allow-warnings
echo '---3.查询校验'
pod search NITools