# script_banco_zabbix.sh

Esse script realiza o backup do schema do banco bem como backup do banco do Zabbix mas ignorando as maiores tabelas.

Após finalizar o processo de backup, agora é a hora de realizar o restore do schema e do banco.

# Restaurando o banco do Zabbix #
sudo gunzip < ARQUIVO-config.sql.gz | sudo mysql -u USUARIO -pSENHA BANCO_DE_RESTORE

# Restaurando o schema do banco do Zabbix #
sudo gunzip < ARQUIVO-schema.sql.gz | sudo mysql -u USUARIO -pSENHA BANCO_DE_RESTORE

# Obs.: Dar permissão de execução ao script: chmod +x script_banco_zabbix.sh
