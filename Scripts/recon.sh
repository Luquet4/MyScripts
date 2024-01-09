#!/bin/bash
if [ "$1"  == "" ]
then
        echo "Modo de usar: $0 url.com.br extfile"
else
        echo "[+] Procurando arquivos $2 na URL $1..."
        echo
        lynx --dump "https://google.com/search?num=500&q=site:"$1"+ext:"$2"" | cut -d "=" -f2 | grep ".$2" | egrep -v "site|google"
fi
