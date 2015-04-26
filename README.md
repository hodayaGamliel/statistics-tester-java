# nonce-creator-tester

Description
===========
bash script - loop that runs simple java program - and change variable/method name (create a nonce). 


Option 1 - on your machine:
===========================
requirement : java >= 6 , [Takipi](https://app.takipi.com/) .   

- clone this repository 
- ./java_nonce_create.sh new_dir times name_to_change(optional)**

Option 2 - use vagrant :
========================
- clone this repository
- vagrant up 
- vagrant ssh
- cd /vagrant
- change the key by using  "sudo ./change_secret_key.sh <YOUR_KEY>"
- ./java_nonce_create.sh option times name_to_change(optional)**


** explain:
- new_dir:
  1 - to create a new directory every execute ,
  2 -  to use thr same directory for all executions .
- times - number of times to run this java code. 
- name_to_change -the current name of the method/variable you want to change - optional (by default it's the name of the method - throwExcep1 , you can change it to variable name - nonce1). 
