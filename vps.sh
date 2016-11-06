#!/bin/bash
#@gtavpn
#Multi Script V1.2
#
corPadrao="\033[0m"
azul="\033[0;34m"
purpleClaro="\033[1;35m"
cyanClaro="\033[1;36m"
azul="\033[0;34m"
#
#

apt-get install figlet -y
clear
echo "\033[41;1;37m O que deseja fazer ?\033[0m "
echo "$cyanClaro [1] Limitar Login"
echo "$cyanClaro [2] Configurar Vps"
echo "$cyanClaro [3] Apagar Usuário"
echo "$cyanClaro [4] Criar Novo Usuário"
echo "$cyanClaro [5] Ver Usuários Conectados"
echo "$cyanClaro [6] Adicionar Host"
echo "$cyanClaro [7] Limitar memória"
echo "$cyanClaro [8] Sobre o Multi Script"
read deseja
if [ "$deseja" = "1" ]
then
cd /etc/security/
echo "$cyanClaro Qual nome do usuario ?"
read usuario
echo "$cyanClaro Qual numero maximo de login ?"
read numero
echo "$usuario           hard    maxlogins          $numero" >> limits.conf
echo "\033[44;1;37m$usuario configurado para logar apenas $numero vez !!!\033[0m "
fi
if [ "$deseja" = "2" ]
then
apt-get update
apt-get install squid3 -y
apt-get install squid -y
yum install squid -y
clear
figlet Legados
echo  "$cyanClaro Qual seu nome ?"
read nome
echo  "$cyanClaro Qual o ip da vps ?"
read ip
cd /etc/squid*
rm -f squid.conf
echo "visible_hostname $nome" >> squid.conf
echo "http_port 80"  >> squid.conf
echo "acl ip url_regex  $ip" >> squid.conf
echo "acl liberado url_regex -i .claro.com.br" >> squid.conf
echo "http_access allow ip" >> squid.conf
echo "http_access allow liberado" >> squid.conf
echo "http_access deny all" >> squid.conf
echo "Port 443" >> /etc/ssh/sshd_config
service ssh restart
service sshd restart
service squid restart 1> /dev/null 2>/dev/null
service squid3 restart 1> /dev/null 2>/dev/null
echo "\033[44;1;37mSua vps foi configurada $nome\033[0m "
echo "\033[44;1;37mIP SSH: $ip\033[0m "
echo "\033[44;1;37mPorta SSH: 22/443\033[0m "
echo "\033[44;1;37mProxy Squid: $ip:80\033[0m "
echo "\033[44;1;37m$nome crie um usuário e teste sua vps !!!\033[0m "
fi
if [ "$deseja" = "3" ]
then
echo  "$cyanClaro Qual nome do usuário que deseja apagar ?"
read nome
userdel -rf $nome
cat /etc/passwd | grep $nome
deluser $nome
echo "\033[44;1;37m$nome apagado !!!\033[0m "
fi
if [ "$deseja" = "4" ]
then
echo  "$cyanClaro Qual nome deseja para o novo usuário ?"
read nome
useradd -M -s /bin/false $nome
passwd $nome
echo "\033[44;1;37m$nome criado !!!\033[0m"
fi
if [ "$deseja" = "5" ]
then
echo  "$cyanClaro Qual nome do usuario ?"
read nome
clear
echo "\033[44;1;37mUsuário: $nome\033[0m"
echo
ps x | grep $nome | wc -l
echo 
echo
fi
if [ "$deseja" = "6" ]
then
echo "$cyanClaro Qual host deseja adicionar ?"
read host
cd /etc/squid*
echo "acl liberado url_regex -i $host" >> squid.conf
service squid restart 1> /dev/null 2>/dev/null
service squid3 restart 1> /dev/null 2>/dev/null
echo "\033[44;1;37m$host adicionado !!!\033[0m"
fi
if [ "$deseja" = "7" ]
then
echo "$cyanClaro Qual nome do usuario ?"
read usuario
cd /etc/security/
echo "$@usuario      tipo de limite      recurso      valor do limite" >> limits.conf
echo "$cyanClaro Qual a quantidade de memoria que ele pode gastar (Em KBS) ?"
read memoria
echo "$usuario           hard    memlock          $memoria" >> limits.conf
echo "\033[44;1;37m$usuario configurado para usar apenas $memoria kbs da memória !!!\033[0m"
fi
if [ "$deseja" = "8" ]
then
figlet Vinicius
sleep 3s
figlet Legados Da Net
sleep 3s
echo  "$purpleClaro Multi Script V1.2"
echo  "$purpleClaro Criador: @Gtavpn"
echo  "$purpleClaro Canal: @LegadosDaNet"
echo  "$purpleClaro “Algumas pessoas acham que foco significa dizer sim para a coisa em que você vai se focar. Mas não é nada disso. Significa dizer não às centenas de outras boas ideias que existem. Você precisa selecionar cuidadosamente”"
fi
