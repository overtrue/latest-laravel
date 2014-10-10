# latest-laravel
ROOT_DIR=/root/latest-laravel/

#filename
MASTER_FILE="laravel-master.tar.gz"
DEVELOP_FILE="laravel-5.0.tar.gz"

cd $ROOT_DIR

# 更新并安装
latest_and_install()
{
    rm -rf laravel
    echo ""
    echo "*** 切换分支：$1***"
    echo "branch:$1";
    git clone https://github.com/laravel/laravel && \
    cd laravel && git checkout $1 && composer install && \
    cd $ROOT_DIR
}

# 打包
make_zip()
{
    latest_and_install $1

    if [[ $? -eq 0 ]]; then
        echo "*** 开始打包：$2 ***"
        cd $ROOT_DIR && \
        rm -f $2 && \
        tar zcvf $2 laravel/*
        rm -rf laravel
        echo "*** 打包完毕：$2 ***"
    fi
}

# 检查错误并提交
check_error()
{
    if [[ $? != 0 ]]; then
        echo "*** 错误：$? ***"
        report_error && exit
    else
        commit_zip
    fi
}

# 提交到latest-laravel
commit_zip()
{
    cd $ROOT_DIR
    echo "当前目录:" pwd
    git add -A && \
    git commit -am "update@$(date +%Y-%m-%d %H%M%S)" && \
    git push
}

# 报告错误(issue)
report_error()
{
    `node reporter.js`
}


make_zip "master" $MASTER_FILE
# 不用检查错误，或者有一个能更新就更新一个
make_zip "develop" $DEVELOP_FILE

