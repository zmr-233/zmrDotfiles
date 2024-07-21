#!/bin/bash  
#Removes old revisions of snaps  
#CLOSE ALL SNAPS BEFORE RUNNING THIS  
# 该文件用于清理snap包相关内容
# 详见笔记或者https://linux.cn/article-15089-1.html
set -eu  
LANG=en_US.UTF-8 
snap list --all | awk '/disabled/{print $1, $3}' |
      while read snapname revision; do
          snap remove "$snapname" --revision="$revision"
      done
