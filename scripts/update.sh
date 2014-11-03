#!/bin/bash
# Latest-laravel 更新脚本
# @author Carlos <anzhengchao@gmail.com>
# @link   http://github.com/overtrue


# latest-laravel
SCRIPT_DIR=/root/latest-laravel/scripts
ROOT_DIR=${SCRIPT_DIR}/../

#filename
MASTER_FILE="laravel-master.tar.gz"
DEVELOP_FILE="laravel-develop.tar.gz"

# 更新并安装
latest_and_install()
{
    cd $ROOT_DIR/

    if [[ -d "laravel" ]]; then
        rm -rf laravel
    fi
    echo ""
    echo "*** 切换分支：$1 ***"
    echo "branch:$1"
    git clone https://github.com/laravel/laravel --depth=1 && \
    cd laravel && git checkout $1 && composer install

    # 替换掉google字体
    if [[ -f "resources/views/hello.php" ]]; then
        sed -ie 's/@import.*//' resources/views/hello.php
        sed -ie "s/'Lato'/Arial, Helvetica/" resources/views/hello.php
    fi
    if [[ -f "app/views/hello.php" ]]; then
        sed -ie 's/@import.*//' app/views/hello.php
        sed -ie "s/'Lato'/Arial, Helvetica/" app/views/hello.php
    fi

    return 0
}

# 清理git仓库
clean_repo()
{

    cd $ROOT_DIR

    echo "*** 清理文件 ***"
    git pull && \
    git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch *.tar.gz' --prune-empty --tag-name-filter cat -- --all && \
    git push origin --force --all && \
    git push origin --force --tags && \
    rm -rf .git/refs/original/ && \
    git reflog expire --expire=now --all && \
    git gc --prune=now

    return 0
}

# 打包
make_zip()
{
    latest_and_install $1

    if [[ $? -eq 0 ]]; then
        echo "*** 开始打包：$2 ***"
        cd $ROOT_DIR && \
        rm -f $2 && \
        # tar zcf $2 laravel/*
        cd laravel && git archive --format=tar HEAD | gzip > $ROOT_DIR/$2
        cd ../ && rm -rf laravel
        echo "*** 打包完毕：$2 ***"
    fi
}

# 提交到latest-laravel
commit_zip()
{
    cd $ROOT_DIR
    echo "当前目录:`pwd`"
    git add *.gz && \
    git commit -am "update@$(date +%Y-%m-%d_%H%M%S)" && \
    git pull && \
    git push
}

# 检查错误并提交
check_and_commit()
{
    if [[ $? != 0 ]]; then
        echo "*** 错误：$? ***"
        exit
    else
        commit_zip
    fi
}

# 报告错误(issue)
report_error()
{
    cd $SCRIPT_DIR
    `node reporter.js` && rm -rf output
}

clean_repo

# master
master_output=$(make_zip "master" $MASTER_FILE)

if [[ $? != 0 ]]; then
    echo "$master_output" 2>&1 | tee $SCRIPT_DIR/output
fi

# master
develop_output=$(make_zip "develop" $DEVELOP_FILE)

if [[ $? != 0 ]]; then
    echo "$develop_output"  2>&1 | tee $SCRIPT_DIR/output
fi

check_and_commit

if [[ -f "$SCRIPT_DIR/output" ]]; then
    report_error
    echo "*** 上报错误完成！ ***"
    rm -rf $SCRIPT_DIR/output
fi

date
