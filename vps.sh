#!/bin/bash
#@gtavpn
#Multi Script V1.3 final
#
corPadrao="\033[0m"
azul="\033[0;34m"
purpleClaro="\033[1;35m"
cyanClaro="\033[1;36m"
azul="\033[0;34m"

x="teste"
menu ()
{
while true $x != "teste"
do
clear
echo "================================================"
echo "Multi script"
echo "Criado por: @Gtavpn"
echo ""
echo "$cyanClaro 1)Configurar vps"
echo""
echo "$cyanClaro 2)Apagar usuário"
echo ""
echo "$cyanClaro 3)Criar novo usuário"
echo ""
echo "$cyanClaro 4)Ver usuários conectados"
echo""
echo "$cyanClaro 5)Adicionar host "
echo""
echo "$cyanClaro 6)Sobre o script"
echo""
echo "================================================"

echo "Digite a opção desejada:"
read x
echo "Opção informada ($x)"
echo "================================================"

case "$x" in 


    1)
      apt-get update
yum get update
apt-get install squid3 -y
apt-get install squid -y
yum intall squid -y
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
sleep 20
      
echo "================================================"
;;
    2)
      echo  "$cyanClaro Qual nome do usuário que deseja apagar ?"
read nome
userdel -rf $nome
cat /etc/passwd | grep $nome
deluser $nome
echo "\033[44;1;37m$nome apagado !!!\033[0m "
sleep 20

echo "================================================"
;;
   3)
      echo  "$cyanClaro Qual nome deseja para o novo usuário ?"
read nome
useradd -M -s /bin/false $nome
passwd $nome
echo "\033[44;1;37m$nome criado !!!\033[0m"
sleep 20

echo "================================================"
;;
    4)
       echo  "$cyanClaro Qual nome do usuario ?"
read nome
clear
echo "\033[44;1;37mUsuário: $nome\033[0m"
echo
ps x | grep $nome | wc -l
echo 
sleep 35

echo "================================================"
;;      
     5)  
       echo "$cyanClaro Qual host deseja adicionar ?"
read host
cd /etc/squid*
echo "acl liberado url_regex -i $host" >> squid.conf
service squid restart 1> /dev/null 2>/dev/null
service squid3 restart 1> /dev/null 2>/dev/null
echo "\033[44;1;37m$host adicionado !!!\033[0m"
sleep 20

echo "================================================"
;;
    6) 
    figlet Vinicius
sleep 3s
figlet Legados Da Net
sleep 3s
echo  "$purpleClaro Multi Script V1.2"
echo  "$purpleClaro Criador: @Gtavpn"
echo  "$purpleClaro Canal: @LegadosDaNet"
echo  "$purpleClaro “Qualquer usuário pode editar e modificar quaisquer parte do script.”"
sleep 20

echo "================================================"

*)
        echo "Opção inválida!"
esac
done

}
menu
