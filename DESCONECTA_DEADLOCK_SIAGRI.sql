select 
      substr(o.object_name,1,25) 	objeto,
      l.session_id 			session_id,
      l.oracle_username		ora_user,
      l.os_user_name			os_user,
      l.*
from   dba_objects o, v$locked_object l
where  l.object_id = o.object_id
order by 1,3,4;


DECLARE
BEGIN
  --
  -- Arruma DeadLock
  FOR LINHA IN ( SELECT SESSAO."SID" || ',' || SESSAO."SERIAL#" SESSAO FROM DBA_OBJECTS OBJ INNER JOIN v$locked_object TRAVA ON TRAVA."OBJECT_ID" = OBJ.OBJECT_ID INNER JOIN v$session SESSAO ON SESSAO."SID" = TRAVA."SESSION_ID" WHERE OBJ.OWNER = 'SYSDBA' AND OBJ.OBJECT_NAME = 'LOGSESSION' ) LOOP
    BEGIN
        EXECUTE IMMEDIATE 'ALTER SYSTEM DISCONNECT SESSION ''' || LINHA.SESSAO || ''' IMMEDIATE';

        EXCEPTION WHEN OTHERS THEN
          NULL;
    END;
  END LOOP;
END;
