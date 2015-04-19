#!/bin/bash
#

A=$1
B=$2
C="$3"

echo $1 $2 $3

function fun()
{
  if [ "$1" ]; then
    echo $1
  fi
}

fun $C
#echo $D









#
# DATE=`date +%Y-%m-%d:%H:%M:%S`
# echo $DATE
# #
# function pass_back_a_string() {
#     eval "$1='foo bar rab oof'"
# }
#
# return_var=''
# pass_back_a_string return_var
# echo $return_var
#



# function fun1()
# {
#   return "11"
# }
# res=$(fun1)
# echo $res

#
# if [ $1 -eq "1" ]; then
#   OPTION="method"
#   echo $OPTION
# elif [ $1 -eq "2" ]; then
#   OPTION="field"
#   echo $OPTION
# fi



# function getSomeString {
#    echo "tadaa"
# }
#
# VARIABLE=$(getSomeString)
#
# echo $VARIABLE
