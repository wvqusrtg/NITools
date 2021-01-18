echo '---step1: 📣 请输入目标操作路径(直接拉进来也行):'
read path
cd $path
echo '---step2: 📣 确认目标操作路径如下:'
pwd 
echo '---step3: 📣 展示目标路径下文件及目录:'
ls
echo '--- 🔔 ⏰ / 🌐 git操作 - 请输入要执行的操作编号---'
echo '----------------------------------------------------------------'
echo '                    1 - git add/commit/push                     '
echo '                    2 - git (show)log                           '
echo '                    3 - git (add)tag                            '
echo '                    4 - git (show)tag                           '
echo '                    5 - git pull                                '
echo '                    6 - git (show)branch                        '
echo '----------------------------------------------------------------'
echo '--- 📣 您输入的操作序号为:'
read aNum
case $aNum in
    1)  echo '--- 📌 你选择了 1'
        echo '--- 🔔 请输入git commit提交描述的内容:'
        read desc
        echo "---你刚输入描述内容为:$desc"

        echo "-------------BEGIN 全量提交代码到gitee仓库----------------"
        #Verify variable is provided
        if [ "$desc" = "" ]; then
                echo -e "提交描述内容不能为空,请添加..."
                exit 1
        fi

        echo "-------------step1:本路径下全量代码添加到提交队列----------------"
        git add *
        echo "-------------step2:添加本次提交描述----------------"
        echo "${desc}"
        git commit -a -m "${desc}"
        echo "-------------step3:提交到远程 origin master分支----------------"
        git push -u origin master

        echo "-------------💐🎉🎈END 全量提交完成----------------"

        echo "-------------展示提交日志----------------"
        #git log
    ;;
    2)  echo '--- 📌 你选择了 2 - git (show)log:'
        git log
    ;;
    3)  echo '--- 📌 你选择了 3'
        echo '--- 🔔 请输入tag:'
        read tag
        echo "---$tag"
        echo '请输入本次提交tag的描述'        
        read DESCCOMMIT
        echo '---$DESCCOMMIT'
        echo "-------------BEGIN 添加tag----------------"

        #Verify variable is provided
        if [ "$tag" = "" ]; then
                echo -e "tag不能为空,请添加..."
                exit 1
        fi

        #添加标签
        echo "-------------step1:开始添加tag:${tag}----------------"
        git tag -a "${tag}" -m "${DESCCOMMIT}"
        echo "-------------step2:tag:${tag}提交到origin----------------"
        git push origin --tags
        echo "-------------💐🎉🎈tag:${tag}提交完成----------------"
        echo "-------------END 展示所有提交tag----------------"
        git tag
    ;;    
    4)  echo '--- 📌 你选择了 4 - git (show)tag:'
        git tag
    ;;
    5)  echo '--- 📌 你选择了 5 - git pull:'
        git pull
    ;;
    6)  echo '--- 📌 你选择了 6 - git (show)branch:'
        git branch
    ;;   
    *)  echo '--- 💡💡💡 你没有输入操作序号.'
    ;;
esac