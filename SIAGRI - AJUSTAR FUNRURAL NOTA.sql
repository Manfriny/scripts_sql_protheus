
-- Consultar na NOTA, o campo NPRE_NOT pra usar na tabela INOTA
--ALTERAR TOTAL DA NOTA
select n.tota_not,n.* from nota n where n.nota_not=100844 and n.seri_not=3;
update nota n set n.tota_not= 57005.79 where n.nota_not=100844 and n.seri_not=3;
--============================================================================
-- Pesquisar a nota pelo campo NPRE_NOT que buscou no select anterior
--ALTERAR VALOR FUNRURAL
select i.vlfr_ino,i.* from sysdba.inota i where i.npre_not = 30125494;
update sysdba.inota i set i.vlfr_ino=57.06 where i.npre_not = 30125494;