#!/bin/bash

DB_NAME=${DB_NAME:-${PGSQL_ENV_DB_NAME}}
OUTPUT_FILE_NAME=${OUTPUT_FILE_NAME}
TS=$(date +%Y%m%dT%H%M%S)

if [[ ${DB_NAME} == "" ]]; then
	echo "Missing DB_NAME env variable"
	exit 1
fi

if [[ ${OUTPUT_FILE_NAME} == "" ]]; then
	echo "Missing OUTPUT_FILE_NAME env variable"
	exit 1
fi

sqlite3 ${DB_NAME} .dump | gzip -c | cat > /sqlitedump/${OUTPUT_FILE_NAME}_${TS}.sql.gz

