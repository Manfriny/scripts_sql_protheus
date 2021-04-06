select l.* from sysdba.lancontab l where l.sequ_lct = 30184983;
select c.orig_clc,c.* from sysdba.cablanctb c where c.sequ_clc = 22271527;
update sysdba.cablanctb c set c.orig_clc='MA' where c.sequ_clc = 22271527; -- OP
-- Alterar ORIG_CLC de NE para MA



/*
chamado exemplo:
https://jira.tecagro.com/browse/TSD-32264