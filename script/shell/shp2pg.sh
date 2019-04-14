#!/bin/bash
#Desc:import shp to pg
#use:sh shp2pg.sh 
#Date:2019-4-11 12:53:12
#Author:liyuJian

help(){
    echo "import shp to pg"
    echo "Usage: $0 [OPTION] dbname"
    echo "  -m       the host mode, eg: dev or online, dev as default"
    echo "  -f       the sql file"
    echo "  -h       help"
    exit
}

if [ $# -eq 0 ];then
    help                    #当没有传入参数显示help信息
fi

mode='dev'
fname=''
host=''

while getopts :m:h:f: opt
do
    case $opt in
        m) 
            mode=$OPTARG ;;
        f) 
            fname=$OPTARG ;;
        h)  help ;;
        *)  help ;;              #当传入其它参数显示help信息
    esac
done && shift "$((OPTIND-1))" 

[[ -z "$fname" ]] && help    #当-f传入的参数为空，显示help信息

# 获取后面的参数
# echo $1 # dbname
dbname=$1

# 正式库：
host_online=''
# 测试库：
host_dev=''

# 默认使用测试库
host=host_dev

if [[ $mode -eq 'online' ]]; then
    host=$host_online
fi

echo "createdb -Umap -h ${host} -p 5432 ${dbname}"
echo "shp2pgsql -s 4326 -W GB18030 ./${fname}.shp ${fname} > ${fname}.sql"

# createdb -Umap -h${host} -p 5432 ${dbname} --encoding='UTF8' --lc-collate='zh_CN.utf-8' --lc-ctype='zh_CN.utf-8' --template=template0

# # 建立数据库扩展
# psql -Umap -h ${host} -p 5432 -c 'CREATE EXTENSION postgis;CREATE EXTENSION bdgispg;' ${dbname};

# # shp文件导出sql,(encoding使用gb18030)
# shp2pgsql -s 4326 -W GB18030 ./${fname}.shp ${dbname} > ${fname}.sql

# # 从sql文件恢复数据
# psql -h${host} -p 5432 -U map -d ${dbname} -f ${fname}.sql > ./b.log
