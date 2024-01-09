#!/bin/bash
if [ $1 == "" ] && [ $2 == ""]
then
echo "Modo de usar: $0 site.com.br txt"
else
for palavra in $(cat /usr/share/wordlists/dirb/small.txt)
do
resposta=$(curl -s -H "User-Agent: Mozilla"  -o /dev/null -w "%{http_code}" $1/$palavra/)
if [ $resposta == "200" ]
then 
echo "Diretorio Encontrado: $1/$palavra"
fi
done
echo
echo "Realizando consulta de arquivos..."
for palavra2 in $(cat /usr/share/wordlists/dirb/small.txt)
do
resposta2=$(curl -s -H "User-Agent: Mozilla" -o /dev/null -w "%{http_code}" $1/$palavra2.$2)
if [ $resposta2 == "200" ]
then
echo "Arquivo Encontrado: $1/$palavra2.$2"
fi
done
fi
