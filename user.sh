#!/usr/bin/bash

my_input="/home/l00169734/user_group.csv"
declare -a fname
declare -a lname
declare -a user
declare -a dept
declare -a pass

while IFS=, read -r FirstName LastName Username Department Password;
do
		fname+=("$FirstName")
		lname+=("$LastName")
		user+=("$Username")
		dept+=("Department")
		pass+=("$Password")
		
done<$my_input

for index in  "${user[@]}";
do
		sudo groupadd "${dept[$index]}";
		sudo useradd -g "${dept[$index]}"\
					 -d "/home/${user[$index]}"\
					 -s "/bin/bash"\
					 -p "$(echo "${pass[$index]}" | openssl passwd -l -stdin)" "${user[$index]}"
					 done