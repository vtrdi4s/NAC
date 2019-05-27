#==========[SHELL SCRIPT DE BACKUP INTERATIVO]===========
#!/bin/bash
#VICTOR
#RM79508
clear
menu ()
{
while true $x != "backup"
do
echo "Escolha uma das alternativas:"
echo "[0]..Verificar a distribuição"
echo "[1]..Realizar o backup do apache"
echo "[2]..Verificar os arquivos de backup"
echo "[3]..Ativar processo de automação de backup"
echo "[4]..Sair"
echo "=============================================================="
read x
case "$x" in
  (0)
      ds() {
    test -f /etc/redhat-release
    if [ $? == '0' ]; then
      echo "O sistema operacional é valido para o procedimento de backup!"
    else
      echo "A distribuição não é compativel!"
      exit
    fi  
    }
    ds
    sleep 3
    clear
echo "=============================================================="    
;;
    (1)

#Familia Red Hat        
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
        dados
        backup
        sleep 3
  clear
echo "=============================================================="
;;
   (2)
bckps_g() {
     du -hs /backup/*.tgz

}    
     bckps_g 
     sleep 5
     clear
echo "=============================================================="
;;  
    (3)
        test -f /etc/redhat-release
        if [ $? == '0' ]; then

            echo "Automação do Script"
            echo " "
            read -p "Digite a hora - 0 a 23: " H
            read -p "Digite a minuto - 0 a 59: " M
            read -p "Digite a Dia do Mês - 1 a 31: " DDM
            read -p "Digite a Mês - 1 a 12: " ME
            read -p "Digite a Dia da Semana - 0 a 6 (0 é Domingo): " DDS
            echo  "$M $H $DDM $ME $DDS root /script/NAC/ss_bckp-a.sh" | tee -a /var/spool/cron/root
            if [ $? = 0 ]; then
              echo "Agendando realizado" 
            else
                echo "Erro" 
            fi
fi 
      sleep 4
      clear
echo "=============================================================="
;;
    (4)
        exit

esac
done
}
menu

