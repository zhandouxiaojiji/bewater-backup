workspace=$(cd "$(dirname "$0")"; pwd)/..

if [ $# -le 0 ]
then
    echo '请输入发布配置，如: publish.sh test (all发布所有)'
    exit
fi

file=$workspace/script/publish/nodename.lua

echo 'return "'$1'"' > $file

cd $workspace/../../skynet
./skynet ${workspace}/etc/publish.cfg

