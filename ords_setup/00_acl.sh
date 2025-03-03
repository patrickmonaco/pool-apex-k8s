sql sys/${ORACLE_PWD}@localhost:1521/FREEPDB1 as sysdba <<EOF
alter session set container=FREEPDB1;
@/ords-entrypoint.d/acl.sql
EOF
