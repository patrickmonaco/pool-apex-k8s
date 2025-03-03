def WS=&1
def PWD=&2

grant create database link to demo;

connect demo/&PWD@localhost/FREEPDB1
declare
  l_ts_name     varchar2(30) := 'sysaux';
  l_db_username varchar2(30) := '&WS';
  l_db_password varchar2(30) := '&PWD';
begin
  -- Create Database Link
  
  execute immediate '
    CREATE DATABASE LINK dbmain
    CONNECT TO maindemo IDENTIFIED BY <YOUR_PASSWORD>
    USING ''(DESCRIPTION=
      (ADDRESS=(PROTOCOL=TCP)(HOST=dbmain)(PORT=1521))
      (CONNECT_DATA=(SERVICE_NAME=FREEPDB1))
    )''';
  
end;
/
