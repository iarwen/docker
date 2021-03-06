#!/bin/bash
docker rm $(docker ps -aq) 2> /dev/null

declare -a folders=("centos7" "jdk8" "tomcat7" "zookeeper")
#container prefix 
csprefix="registry.aliyuncs.com/glodonedu/" 
#cs name
declare -a cs=("centos:7.1"  "jdk:1.8" "tomcat:7" "zookeeper:3.4")

#current directory
basepath=$(cd `dirname $0`; pwd)

for ((i=0; i<${#folders[*]}; i++))
do
        echo "${csprefix}${cs[$i]}" "$basepath/${folders[$i]}"
	docker rmi "${csprefix}${cs[$i]}" 2> /dev/null
        docker build -t "${csprefix}${cs[$i]}" "$basepath/../${folders[$i]}"
done

docker images
