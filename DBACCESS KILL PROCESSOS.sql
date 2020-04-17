--Query Verificar Sessoes Existentes ...
SELECT s.sid, 
      s.serial#, 
      p.spid, 
      s.osuser, 
      s.program 
FROM   v$process p, 
      v$session s 
WHERE  p.addr = s.paddr 
order by sid,osuser; 
    
--Executar o KILL ...     
---------------------------PID ,SERIAL#----------
ALTER SYSTEM KILL SESSION '1151,17209' IMMEDIATE;     
    
--Query Verificar Sessoes foi desconectada ...
SELECT s.sid, 
      s.serial#, 
      p.spid, 
      s.osuser, 
      s.program 
FROM   v$process p, 
      v$session s 
WHERE  p.addr = s.paddr 
order by program

--By Rômulo Ferrari