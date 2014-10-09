ROOT_DIR=/root/latest-laravel/

#filename
MASTER_FILE="laravel-4.2.tar.gz"
DEVELOP_FILE="laravel-5.0.tar.gz"

cd $ROOT_DIR

latest()
{
    rm -rf laravel
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
        rm -rf $ROOT_DIR/$2 && \
        tar zcf $ROOT_DIR/$2 laravel/
        rm -rf laravel
    fi
}

make_zip "4.2" $MASTER_FILE
make_zip "develop" $DEVELOP_FILE

cd -

git add -A
git commit -am "update@$(date +%Y-%m-%d_%H%M%S)"
git push
