-- TABELA DO PEDIDO DE COMPRA
select c7_emissao,a.* from sc7010 a where c7_filial='0301' and c7_num='436196';

--TABELA SCR GRAVA A LINHA A SER APROVADA
select * from scr010 where cr_num='436196';
update scr010 set CR_EMISSAO='20191129' where cr_num='436196';

--20191129