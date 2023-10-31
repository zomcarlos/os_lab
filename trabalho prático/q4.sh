#!/bin/bash
data=$(date "+%Y-%m-%d")
echo $data
tar -zcvf BKP-$data.tar.gz $1
mv BKP-$data.tar.gz $2
ls $2
