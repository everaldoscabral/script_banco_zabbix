# script_banco_zabbix.sh

Esse script realiza o backup do schema do banco bem como backup do banco do Zabbix mas ignorando as maiores tabelas.

# Editar os seguintes campos no script:
```
yum install git gzip dos2unix

git clone https://github.com/everaldoscabral/script_banco_zabbix.git

cd script_banco_zabbix/

chmod +x script_banco_zabbix.sh

dos2unix script_banco_zabbix.sh

./script_banco_zabbix.sh
```
Após finalizar o processo de backup, caso queira testar o restore do schema e do banco:

# Restaurando o schema do banco do Zabbix #
sudo gunzip < ARQUIVO-schema.sql.gz | sudo mysql -u USUARIO -pSENHA BANCO_DE_RESTORE

# Restaurando o banco do Zabbix #
sudo gunzip < ARQUIVO-config.sql.gz | sudo mysql -u USUARIO -pSENHA BANCO_DE_RESTORE
