def NM=&1
def NI=&2
def PWD=&3


declare
  l_db_nodename varchar2(30) := '&NM';
  l_db_index varchar2(20) := '&NI';
  l_db_password varchar2(30) := '&PWD';
  
begin
  -- instance level
  apex_instance_admin.set_parameter('ENV_BANNER_ENABLE'   , 'Y');
  apex_instance_admin.set_parameter('ENV_BANNER_LABEL'    , l_db_nodename);  
  apex_instance_admin.set_parameter('ENV_BANNER_COLOR'    , 'accent-' || l_db_index);    
  apex_instance_admin.set_parameter('ENV_BANNER_POS'      , 'LEFT');  
  
  commit;
end;
/

