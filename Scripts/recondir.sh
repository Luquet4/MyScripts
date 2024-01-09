#!/bin/bash
for palavra2 in $(cat /usr/share/seclists/Discovery/Web-Content/raft-large-directories.txt)
do
resposta2=$(curl -s -H "User-Agent: Mozilla" -o /dev/null -w "%{http_code}" $1/$palavra2.$2)
if [ $resposta2 == "200" ]
then
echo "Arquivo Encontrado: $1/$palavra2.$2"
fi
done

