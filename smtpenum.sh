#!/bin/bash
clear
if [[ -z "$1" ]]; then
echo "Usage:  ./smtpenum.sh <hostname> <user list>"
exit 0
fi
if [[ -z "$2" ]]; then
echo "Usage:  ./forward_dns.sh <hostname> </path/to/subdomains>"
exit 0
fi
echo "Discovered Users: "
for i in $(cat $2); do 
  echo VRFY $i | nc $1 25 | grep -v  -E '(220|unknown)' &
done
exit
