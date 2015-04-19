#!/bin/bash

CLASS_PATH="Nonce1.java"
JAVA_FILE="Nonce1"
##option - 1 change the method name
##option - 2 change the nonce name
OPTION="2"
#TIMES - times that the class will execute with different method/nonce
TIMES="5"
METHOD_NAME="throwExcep8"
NONCE_NAME="nonce8"

 function get_nonce_full_name()
 {
   NONCE_CURRENT_NAME=$NONCE_NAME
   echo $NONCE_CURRENT_NAME
 }

 function get_method_full_name()
 {
   METHOD_CURRENT_NAME=$METHOD_NAME
   echo $METHOD_CURRENT_NAME
 }

 function counter()
 {
 echo `expr $1 + 1`
 }

 function get_only_num()
 {
   if [ $OPTION -eq "1" ]; then {
   NAME=$(get_method_full_name)
   } elif [ $OPTION -eq "2" ]; then {
   NAME=$(get_nonce_full_name)
   }
   fi
   echo $NAME | grep -o '[0-9]\+'
 }

 function get_only_name()
 {
   if [ $OPTION -eq "1" ]; then {
   NAME=$(get_method_full_name)
   } elif [ $OPTION -eq "2" ]; then {
   NAME=$(get_nonce_full_name)
   }
   fi
   echo $NAME | grep -o '[a-z,A-Z,_]\+'
 }

 function get_new_name() {
  COUNTER=$(counter `get_only_num`)
  NAME=$(get_only_name)
  NEW_NAME=$NAME$COUNTER
  echo $NEW_NAME
 }

 if [ $OPTION -eq "1" ]; then {
   OLD_NAME=$(get_method_full_name)
   for i in `seq 1 $TIMES`;
   do
        echo run number: $i
        NEW_NAME=$(get_new_name)
        cp $CLASS_PATH test.java
        sed "s/$OLD_NAME/$NEW_NAME/g" test.java > $CLASS_PATH
        METHOD_NAME=$NEW_NAME
        OLD_NAME=$NEW_NAME
        echo new method name :$METHOD_NAME
        javac $CLASS_PATH
        java $JAVA_FILE
   done
 } elif [ $OPTION -eq "2" ]; then {
   OLD_NAME=$(get_nonce_full_name)
   for i in `seq 1 $TIMES`;
   do
     echo run number: $i
     NEW_NAME=$(get_new_name)
     echo $NEW_NAME
     cp $CLASS_PATH test.java
     sed "s/$OLD_NAME/$NEW_NAME/g" test.java > $CLASS_PATH
     NONCE_NAME=$NEW_NAME
     OLD_NAME=$NEW_NAME
     echo new nonce name :$NONCE_NAME
     javac $CLASS_PATH
     java $JAVA_FILE
   done
 }
 fi
