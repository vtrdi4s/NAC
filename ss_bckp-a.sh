#==========[SHELL SCRIPT DE BACKUP AUTOMATICO]===========
#!/bin/bash
clear
test -f /etc/redhat-release
                if [ $? == '0' ]; then            
#procedimento de backup automatico
dados() {
    DATE=$(date '+%d-%m-%y-%Hh%Mmin')  #data e hora atual
    test -d /backup || mkdir /backup #teste de pasta
    }

backup() {
    tar -czvf "/backup/etc-$DATE.tgz" "/etc/httpd/" "/var/log/httpd" "/var/www" #pasta a ser copiada 

    if [ $? == '0' ]; then
       echo ""
       echo "$DATE - Backup concluído" >> /var/log/backup-$DATE.log
       echo "Backup foi concluído com sucesso, gerado pelo usuário:$USER" 
       else
       echo "$DATE - Falha na execução do script" >> /var/log/backup.log
    fi
    }
    else
        echo "Distribuição incompativel"
    fi
dados
backup
sleep 4 
clear
