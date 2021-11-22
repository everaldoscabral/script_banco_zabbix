#!/bin/sh
#BACKUP DO SCHEMA E BANCO DE DADOS ZABBIX (IGNORANDO AS MAIORES TABELAS)

DBNAME=NOME_DO_BANCO_ZABBIX
DBUSER=USUARIO_DO_BANCO
DBPASS=SENHA_DO_BANCO

BK_DEST=DESTINO_DOS_ARQUIVOS

###REALIZANDO BACKUP SOMENTE DO SCHEMA DO BANCO###
sudo mysqldump --no-data --single-transaction -u$DBUSER -p"$DBPASS" "$DBNAME" | /bin/gzip > "$BK_DEST/$DBNAME-`date +%Y-%m-%d`-schema.sql.gz"

##REALIZANDO BACKUP DO BANCO ZABBIX IGNORANDO AS MAIORES TABELAS###
sudo mysqldump -u"$DBUSER"  -p"$DBPASS" "$DBNAME" --single-transaction --skip-lock-tables --routines --no-create-info --no-create-db \
    --ignore-table="$DBNAME.acknowledges" \
    --ignore-table="$DBNAME.alerts" \
    --ignore-table="$DBNAME.auditlog" \
    --ignore-table="$DBNAME.auditlog_details" \
    --ignore-table="$DBNAME.escalations" \
    --ignore-table="$DBNAME.events" \
    --ignore-table="$DBNAME.history" \
    --ignore-table="$DBNAME.history_log" \
    --ignore-table="$DBNAME.history_str" \
    --ignore-table="$DBNAME.history_str_sync" \
    --ignore-table="$DBNAME.history_sync" \
    --ignore-table="$DBNAME.history_text" \
    --ignore-table="$DBNAME.history_uint" \
    --ignore-table="$DBNAME.history_uint_sync" \
    --ignore-table="$DBNAME.dhosts" \
    --ignore-table="$DBNAME.dservices" \
    --ignore-table="$DBNAME.proxy_history" \
    --ignore-table="$DBNAME.proxy_dhistory" \
    --ignore-table="$DBNAME.trends" \
    --ignore-table="$DBNAME.trends_uint" \
    | /bin/gzip > "$BK_DEST/$DBNAME-`date +%Y-%m-%d`-config.sql.gz"
