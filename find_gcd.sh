#!/bin/bash

# args: number number
function check_vals() {
    num_regexp="^[1-9][0-9]*$"
    if expr "$1" : $num_regexp > /dev/null  && expr "$2" : $num_regexp > /dev/null ; then
        return
    fi
    
    echo "ERROR: input is invalid."
    exit 1
}

# args: number number
find_gcd() {
    ## 小さいほうの数を初期値に両方の数字を割る
    ## 両方の数字が割り切れたら終了
    ## 割る数をデクリメント
    n=0
    if [[ $1<=$2 ]];then
        n=$1
    else
        n=$2
    fi

    for ((;n!=0;n--)); do
        if [ `expr $1 % $n` == 0 ] && [ `expr $2 % $n` == 0 ]
        then
            echo $n
            break
        fi
    done
}

check_vals $1 $2
find_gcd $1 $2
exit 0