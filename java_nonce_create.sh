#! /bin/bash

JAVA_FILE="Nonce1.java"
CLASS_NAME="Nonce1"
JAVA_OPTS="-agentlib:TakipiAgent"
CURRENT_NAME="throwExcep1"
#CURRENT_NAME="nonce1"

#set -x

# This function get int value (number from the "cuurent name") and return this number+1
function counter()
{
  echo `expr $1 + 1`
}

# This function get as value the current name and return only the number
function get_only_num()
{
  CURRENT_NAME=$1
  echo $CURRENT_NAME | grep -o '[0-9]\+'
}

# This function get as value the current name and return only the letters
function get_only_name()
{
  CURRENT_NAME=$1
  echo $CURRENT_NAME | grep -o '[a-z,A-Z,_]\+'
}

# This function get as value the current name and return the new name
function get_new_name()
{
 CURRENT_NAME=$1

 COUNTER=$(counter `get_only_num $CURRENT_NAME`)
 NAME=$(get_only_name $CURRENT_NAME)
 NEW_NAME=$NAME$COUNTER
 echo $NEW_NAME
}

# This function check the if the current name is a field or method
function option()
{
  OPTION=$1

  if [ $OPTION -eq "1" ]; then
    CURRENT_OPTION="method"
  elif [ $OPTION -eq "2" ]; then
    CURRENT_OPTION="field"
  fi
}

# This function check if entered current name as $3 argument for this script
function check_if_entered_name()
{
  if [ "$1" ]; then
    CURRENT_NAME=$1
  fi
}

# This function change the current name to the new
function change()
{
  CURRENT_NAME=$1
  NEW_NAME=$2

  cp $JAVA_FILE test.java
  sed "s/$CURRENT_NAME/$NEW_NAME/g" test.java > $JAVA_FILE
}

# This function create the directory name (for the java file)
function dir_name()
{
  if [ $NEW_DIR -eq "1" ]; then
  NUM=$1
  DATE=`date +%Y-%m-%d-%H-%M-%S`
  DIR_NAME="$DATE-takipi-$NUM"
  elif [ $NEW_DIR -eq "2" ]; then
  DIR_NAME="takipi"
  fi
  echo $DIR_NAME
}

#  This function compile and run the java program with takipi agent
function run_java_program
{
  NUM=$1
  DIR_NAME=$(dir_name $NUM)

  if [ ! -d "$DIR_NAME" ]; then
      mkdir $DIR_NAME
  fi

  cp $CLASS_NAME* $DIR_NAME
  javac $DIR_NAME/$JAVA_FILE
  java $JAVA_OPTS -cp $DIR_NAME $CLASS_NAME
}

# This function clears the java file before execution.
function clear()
{
  CURRENT_NAME=$1
  FIRST_NAME=$2

  cp $JAVA_FILE test.java
  sed "s/$CURRENT_NAME/$FIRST_NAME/g" test.java > $JAVA_FILE
}

# This function just keep runing .
function keep_run()
{
  i=1
  while [ $i -lt 4 ]
  do
    echo "keep run...press Ctrl+C to exit"
    sleep 300
  done

}

function run()
{
  CURRENT_NAME=$1
  NUM=$2

  NEW_NAME=$(get_new_name $CURRENT_NAME)
  change $CURRENT_NAME $NEW_NAME
  run_java_program $NUM
}

function main()
{
  NEW_DIR="$1"
  TIMES="$2"
  A="$3"
  check_if_entered_name $A
  FIRST_NAME=$CURRENT_NAME


  for i in `seq 1 $TIMES`;
  do
    echo run number: $i
    run $CURRENT_NAME $i
    CURRENT_NAME=$NEW_NAME
  done

  clear $CURRENT_NAME $FIRST_NAME
#  keep_run
}

main $@
