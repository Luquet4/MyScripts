#!/bin/bash
if [ "$1"  == "" ]
then
	echo "[+] Modo de usar: $0 url.com.br"
else
	echo "[+] Realizando pesquisa de Name Servers"
	echo
	for palavra in $(cat /usr/share/wordlists/rockyou.txt)
do
	host $palavra.$1 | grep -v "NXDOMAIN"
done
fi
