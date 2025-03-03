# compute a value between 1 and 16 for Banner color coding
hash=$(( (0x$(echo -n "${NODE_NAME}" | md5sum | cut -c1-8) % 16) + 1 ))
sql sys/${ORACLE_PWD}@localhost:1521/FREEPDB1 as sysdba <<EOF
alter session set container=FREEPDB1;
@/ords-entrypoint.d/createws.sql DEMO ${ORACLE_PWD}
@/ords-entrypoint.d/addbanner.sql ${NODE_NAME} ${hash} ${ORACLE_PWD}
@/ords-entrypoint.d/createdblink.sql DEMO ${ORACLE_PWD}
exit
EOF
