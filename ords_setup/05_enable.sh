sql sys/${ORACLE_PWD}@localhost:1521/FREEPDB1 as sysdba <<EOF
grant inherit privileges on user SYS to ORDS_METADATA;
BEGIN
   ORDS.ENABLE_SCHEMA(p_enabled => TRUE,
                      p_schema => 'DEMO',
                      p_url_mapping_type => 'BASE_PATH',
                      p_auto_rest_auth => FALSE);
END;
/
exit

EOF
