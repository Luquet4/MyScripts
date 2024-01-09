#!/bin/bash
if [ "$1" == "" ]
then
	echo "Modo de uso: $0 ip"
else
	echo "[+] Realizando pesquisa reversa..."
	for ip in $(seq 224 239)
do
	host $1.$ip | grep -v "37-59-174"
done
fi
