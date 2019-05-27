# NAC
Objetivo

O objetivo do script, é fazer a realização de backup do servidor (HTTPD)

Arquivos e Diretórios e suas funções Arquivo	Função ss_bckp-a.sh	script que irá gerar os backups do HTTPD de forma automatizada ss_bckp-i.sh	script de interação com o usuário, permitindo visualizar algumas informações e inserir alguns dados.” Diretório	Função cd /bacukp/	Armazenamento dos backups. /var/log	Armazenamento dos logs de backup

1.1 	Requisitos para instalação

Linux CentOS da família RedHat + HTTPD + Crontab e acesso ao sistema com permissão root. 

1.1.	Instruções para download Clone o repositório com o comando: git clone https://github.com/vtrdi4s/NAC.git dê permissão de execução para os scripts da pasta com o comando: chmod +x *.sh 3.	

2	Funcionamento dos scripts

Ao iniciar o script, irá "limpar" a tela do usuário, assim iniciando a interação mais “clean”, seguido será perguntado qual das funções ele deseja realizar.

0.	Escolhendo a opção número [0], o script realizara a verificação da distribuição, caso (CentOS) o script, continuará a interação com o "usuário". Caso a distribuição não seja da Família RedHat, o script será encerrado;

1.	Escolhendo a opção número [1], o script realizara o backup do servidor (httpd), salvando no diretório cd /backup e em formato .tgz;

2.	Caso a opção de escolha seja a número [2], o script irá apresentar os backups já realizado com informações de data e hora em que o script foi realizado, em caso de não haver backups, irá retornar ao "usuário" que não existe uma pasta, portanto não existe backups do httpd.

3.	A opção número [3], automatiza o script, possibilitando o usuário inserir alguns dados, informando em qual momento irá ocorrer o processo de automação de backup;

4.	A opção número [4], simplesmente encerra o script;


4.	Instruções cron:

4.1	Então como se pode ver, a linha é dividida em 6 campos separados por tabs ou espaço, Todos estes campos, sem contar com o 6º, são especificados por números. 

Veja a tabela abaixo para os valores destes campos:
Campo	Função
1º.		Minuto
2º.		Hora
3º.		Dia do mês
4º.		Mês
5º.		Dia da semana
6º.		Programa para execução (script ss_bckp.a.sh) o script de backup sem a interação com o usuário



Campo		    Valores
Minuto	    0-59
Hora		    0-23
Dia do mês	1-31
Mês			    1-12
Dia da semana	0-6 (o “0″ é domingo), 1 é segunda, etc.


4.2.	Agendamento no cron: O instalador irá criar automaticamente um agendamento no cron após informações inseridas no shell script de interação ss_bckp-i.sh, para realizar o agendamento é necessário que os dois arquivos .sh estajam no mesmo diretório.
