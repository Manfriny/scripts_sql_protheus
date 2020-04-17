DECLARE CURSOR CUR1 IS select 'DROP SEQUENCE '||sequence_owner||'.'||sequence_name||'' as COMMAND_DEL from SYS.all_sequences where sequence_owner='TOTVS12PRD';
BEGIN
  FOR R1 IN CUR1 LOOP
    EXECUTE IMMEDIATE R1.COMMAND_DEL;
    COMMIT;
  END LOOP;
END;    
