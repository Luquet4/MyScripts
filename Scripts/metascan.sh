#!/bin/bash
if [ "$1"  == "" ]
then
	echo "Modo de usar: $0 url.com.br extfile"
else
	echo "[+] Procurando arquivos $2 na URL $1..."
	echo
	lynx --dump "https://google.com/search?&q=site:$1+ext:$2" | grep ".$2" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//'  > $1.metadados.txt
	echo
	cat $1.metadados.txt
	echo
	echo "[+] Baixando arquivos encontrados..."
DIR="/root/$1-metadados"
if [ -d "$DIR" ]
then
        wget -q -i $1.metadados.txt -P $1-metadados
	echo
	echo "[+] Arquivos baixados com sucesso!"
	echo
	echo "[+] Analisando os Metadados dos arquivos baixados..."
	echo
	exiftool /root/$1-metadados/*.$2 > metadados
	cat metadados
	rm -r /root/$1-metadados
else
		mkdir $1-metadados
		wget -q -i $1.metadados.txt -P $1-metadados
        	echo "[+] Analisando os Metadados dos arquivos baixados"
        	exiftool /root/$1-metadados/*.$2 > metadados
		echo
		cat metadados
		rm -r /root/$1-metadados
fi
fi
	echo "[+] Nova pesquisa? [y/n]"
	read var
while [ $var = "y" ]
do if [ "$var" == "y" ]
then
	echo "[+] Digite a URL"
	read url
	echo
	echo "[+] Digite a Extensao do arquivo"
	read ext
        echo "[+] Procurando arquivos $ext na URL $url..."
        echo
        lynx --dump "https://google.com/search?&q=site:$url+ext:$ext" | grep ".$ext" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//'  > $url.metadados.txt
        echo
        cat $url.metadados.txt
        echo
        echo "[+] Baixando arquivos encontrados..."
DIR="/root/$url-metadados"
if [ -d "$DIR" ]
then
        wget -q -i $url.metadados.txt -P $url-metadados
        echo
        echo "[+] Arquivos baixados com sucesso!"
        echo
        echo "[+] Analisando os Metadados dos arquivos baixados..."
        echo
        exiftool /root/$url-metadados/*.$ext > metadados
        cat metadados
	rm -r /root/$url-metadados
else
                mkdir $url-metadados
                wget -q -i $url.metadados.txt -P $url-metadados
                echo "[+] Analisando os Metadados dos arquivos baixados"
                exiftool /root/$url-metadados/*.$ext > metadados
                echo
                cat metadados
		rm -r /root/$url-metadados
fi
		echo
		echo "[+] Nova pesquisa?"
		read var
		if [ "$var" == "n" ]
	then
		echo "[+] Obrigado por utilizar!"
	else
		echo "[+] Obrigado por utilizar!"

	fi
fi
done
