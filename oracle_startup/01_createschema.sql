-- create schema which will shared through DB Links
alter session set container=FREEPDB1;
create user maindemo identified by <YOUR_PASSWORD>;
grant connect, resource to maindemo;
alter user maindemo quota unlimited on USERS;
create table maindemo.catalog(id integer PRIMARY KEY, dd date, title varchar2(200));
insert into maindemo.catalog values (1, SYSDATE, 'Globalization');
commit;