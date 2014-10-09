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
    git clone https://github.com/laravel/laravel && git checkout $1
}

install()
{
    if [[ $? -eq 0 ]]; then
        composer install
    fi
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

make_zip "master" $MASTER_FILE
make_zip "develop" $DEVELOP_FILE

git add -A
git commit -am "update@$(date +%Y_%m_%d_%H%M%S)"
git push
