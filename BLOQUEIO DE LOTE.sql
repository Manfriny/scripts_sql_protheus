
-- Tabela rotina de BLOQUEIO no estoque/custos - SDD
select * from SDD010;

-- Apontamento do LOTE - NP9
select np9_status,np9.* from NP9010 np9 where NP9_LOTE in (
'G327','G533','G305','G321', 'G342', 'G294', 'G299', 'G316', 'G296', 'G341', 'G292', 
'G348','G555','G344','G288', 'G286', 'G291', '22P1004','G317','22P1003','G526','G230','G407','G356','G304','G406');


update NP9010 set NP9_STATUS='1'
where NP9_STATUS <> 1 and NP9_LOTE in (
'G327','G533','G305','G321', 'G342', 'G294', 'G299', 'G316', 'G296', 'G341', 'G292', 
'G348','G555','G344','G288', 'G286', 'G291', '22P1004','G317','22P1003','G526','G230','G407','G356','G304','G406');