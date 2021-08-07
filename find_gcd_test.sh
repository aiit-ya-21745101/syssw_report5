#!/bin/bash

# args:
# $1=pattern_name:str
# $2=args:str
# $3=expected_echo:string
# $4=expected_exit:number
function exec_find_gcd_test() {
    err_flg=false
    actual_echo=$(./find_gcd.sh $2)
    actual_exit="$?"
    echo pattern: $1

    echo " " "expected echo is"  $3
    echo " " "actual echo is" $actual_echo
    if [ "$actual_echo" != "$3" ]; then
        err_flg=true
    fi
    
    echo " " "expected exit is" $4
    echo " " "actual exit is" $actual_exit
    if [ $actual_exit != "$4" ]; then
        err_flg=true
    fi
    
    if [ $err_flg == true ]; then
        error_cnt=$((++error_cnt))
        echo fail
    else
        echo success
    fi
    
    echo
    
}

error_cnt=0
exec_find_gcd_test "正常系 同じ数字" "2 2" "2" 0
exec_find_gcd_test "正常系 違う数字 大小" "24 16" "8" 0
exec_find_gcd_test "正常系 違う数字 小大" "24 16" "8" 0
exec_find_gcd_test "引数が少ない" "24" "ERROR: input is invalid." 1
exec_find_gcd_test "引数が数値でない" "a 16" "ERROR: input is invalid." 1
exec_find_gcd_test "引数が小数" "1.1 16" "ERROR: input is invalid." 1
exec_find_gcd_test "引数が0" "0 16" "ERROR: input is invalid." 1
exec_find_gcd_test "引数がマイナス" "-2 16" "ERROR: input is invalid." 1

if [ $error_cnt -eq 0 ];then
    exit 0
fi
exit 1