def WS=&1
def PWD=&2

declare
  l_ts_name     varchar2(30) := 'sysaux';
  l_db_username varchar2(30) := '&WS';
  l_db_password varchar2(30) := '&PWD';
begin
  -- Create tablespace.
  -- execute immediate 'create tablespace ' || l_ts_name || ' datafile size 100m autoextend on next 100m';

  -- Create user.
  execute immediate 'create user ' || l_db_username || ' identified by ' || l_db_password ||
    ' default tablespace ' || l_ts_name || ' quota unlimited on  ' || l_ts_name;

  -- Grant privileges.
  for cur_rec in (select privilege
                  from   sys.dba_sys_privs
                  where  grantee = 'APEX_GRANTS_FOR_NEW_USERS_ROLE')
  loop
    execute immediate 'grant ' || cur_rec.privilege || ' to ' || l_db_username;
  end loop;
end;
/

declare
  l_workspace       varchar2(30) := '&WS';
  l_db_username     varchar2(30) := '&WS';
  l_admin_username  varchar2(30) := '&WS';
  l_admin_password  varchar2(30) := '<YOUR_PASSWORD>';
  l_admin_email     varchar2(30) := 'admin@example.com';
begin
  apex_instance_admin.add_workspace(
    p_workspace      => l_workspace,
    p_primary_schema => l_db_username);

  apex_util.set_workspace(
    p_workspace => l_workspace);

  apex_util.create_user(
    p_user_name                    => l_admin_username,
    p_web_password                 => l_admin_password,
    p_developer_privs              => 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
    p_email_address                => l_admin_email,
    p_default_schema               => l_db_username,
    p_change_password_on_first_use => 'Y' );

  commit;
end;
/
