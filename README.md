# nonce-creator-tester

Description
===========
bash script - loop that run simple java program - and change variable/method name (create a nonce). 


Option 1 - on your machine:
===========================
requirement : java >= 6 , [Takipi](https://app.takipi.com/) .  

clone this repository and run :
./nonce_create.sh option times name_to_change(optional)**

Option 2 - use vagrant :
========================
- clone this repository
- vagrant up 
- vagrant ssh
- ./nonce_create.sh option times name_to_change(optional)**



** explain:
- option:
  1 - change the method name ,
  2 -  change the variable name .
- times - number of times to run this java code. 
- name_to_change -the current name of the method/variable you want to change - optional (by default it's the name of the method - throwExcep1 , you can change it to variable name - nonce1). 
