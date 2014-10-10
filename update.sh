ROOT_DIR=/root/latest-laravel/

#filename
MASTER_FILE="laravel-master.tar.gz"
DEVELOP_FILE="laravel-5.0.tar.gz"

cd $ROOT_DIR

latest()
{
    rm -rf laravel
    echo ""
    echo ""
    echo "branch:$1";
    git clone https://github.com/laravel/laravel && \
    cd laravel && git checkout $1 && composer install && \
    cd $ROOT_DIR
}


make_zip()
{
    latest $1

    if [[ $? -eq 0 ]]; then
        cd $ROOT_DIR && \
        rm -f $2 && \
        tar zcvf $2 laravel/*
        rm -rf laravel
    fi
}

check_error()
{
    if [[ $? != 0 ]]; then
        exit
    fi
}

# 提交到latest-laravel
commit_zip()
{
    cd $ROOT_DIR
    echo "current dir:" pwd
    git add -A
    git commit -am "update@$(date +%Y_%m_%d_%H%M%S)"
    git push
}

report_error()
{
    `node reporter.js`
}


make_zip "master" $MASTER_FILE
# 不用检查错误，或者有一个能更新就更新一个
make_zip "develop" $DEVELOP_FILE

