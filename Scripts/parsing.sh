#!/bin/bash
if [ "$1" == "" ]
then
	echo -e "\033[01;32m ################################################################ \e[0m"
	echo -e "\033[01;33m DESEC SECURITY \e[0m"
	echo -e "\033[01;33m Modo de uso: $0 exemplo.com.br \e[0m"
	echo -e "\033[01;32m ################################################################ \e[0m"


else
$rpt == "y"
while [ $rpt == "y" ]
do
        echo -e "\033[01;32m ################################################################ \e[0m"
	echo
	echo -e "\033[01;36m [+] Resolvendo URLs em \e[01;31m$1 \e[0m"
wget -O - -o /dev/null  $1 > $1.ip.txt
        echo
	echo -e "\033[01;32m ################################################################ \e[0m"
	echo
	echo -e "\033[01;31m [+] Concluido: \e[01;36m Salvando resultados em \e[01;34m $1.ip.txt \e[0m"
        echo
	echo -e "\033[01;32m ################################################################ \e[0m"
	echo
	echo -e "\033[01;33m [+] Buscando Hosts...\e[0m"
	echo
grep href $1.ip.txt | cut -d "/" -f 3 | grep '\.' | cut -d '"' -f 1 | grep -v "<l" > lista
cat lista
	echo
	echo -e "\033[01;32m ################################################################ \e[0m"
	echo
	echo -e "\033[01;33m [+] Buscando endereços...\e[0m"
	echo
for url in $(cat lista);
do host $url | grep "has address";
	echo
        echo -e "\033[01;32m ################################################################ \e[0m"
	echo
	echo -e "\e[01;33m - Nova pesquisa? \e[01;031m[y/n] \e[0m"
	read rpt
done
done
