#!/bin/sh
### lnmp  openresy  1.9.15   php7.1 
BASE_PATH=$(pwd)
useradd www;
gropadd www;

if [ ! -d ~/software ]
then
    mkdir $BASE_PATH/software;
    cd $BASE_PATH/software;
else
    echo "already have ~/software folder\r\n"
fi;

if [ ! -d /usr/local/openresty ]
then
    yum install readline-devel pcre-devel openssl-devel gcc
    wget  https://openresty.org/download/openresty-1.9.15.1.tar.gz;
    tar -zxvf openresty-1.9.15.1.tar.gz;
    cd $BASE_PATH/software/openresty-1.9.15.1;
    ./configure --prefix=/usr/local/openresty
    make && make install
else 
    echo "openresty already installed......\r\n";
fi

if [ ! -d /usr/local/php7 ]
then
    yum install bzip2  && tar -xvf php-5.5.38.tar.bz2
    yum install -y gcc gcc-c++ gd-devel libmcrypt-devel libcurl-devel openssl-devel zlib-devel libxml2-devel bzip2-devel libxslt-devel
    cd $BASE_PATH/software
    if [ ! -f ~/software/php-7.1.11.tar.bz2 ];then
        wget http://jp2.php.net/distributions/php-7.1.11.tar.bz2
        tar -xvf php-7.1.11.tar.bz2
    fi
    cd $BASE_PATH/software/php-7.1.11
    ./configure  --prefix=/usr/local/php7 --with-config-file-path=/usr/local/php7/etc --with-curl --enable-mbstring --enable-ftp --with-jpeg-dir=/usr --with-png-dir=/usr --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-pear --with-openssl --enable-gd-native-ttf --with-libxml-dir=/usr --with-xmlrpc --enable-fpm --enable-xml --enable-sockets --with-gd --with-zlib --with-iconv --enable-zip --enable-soap --enable-pcntl --enable-cli --enable-sysvsem --enable-sysvshm --enable-sysvmsg --enable-wddx --with-gettext --enable-exif --with-mhash --enable-shmop --with-mcrypt -with-freetype-dir=/usr/local/freetype --enable-sigchild --enable-bcmath --with-bz2 --with-pcre-dir
    make && make install
    ln -s /usr/local/php7/bin/php /usr/local/bin
else 
    echo "/usr/local/php7 already installed...\r\n";
fi






