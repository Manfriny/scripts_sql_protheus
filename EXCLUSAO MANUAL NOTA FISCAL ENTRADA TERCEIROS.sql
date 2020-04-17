--EXCLUSÃO DA NOTA FISCAL DE ENTRADA
select d_e_l_e_t_,f1_doc,a.* from sf1010 a where f1_doc like '%89388%' and f1_serie='3';
select d_e_l_e_t_,d1_doc,a.d1_pedido,a.* from sd1010 a where d1_doc like '%89388%' and d1_serie='3';

--EXCLUSÃO DO REGISTRO NO LIVRO FISCAL
select d_e_l_e_t_,f3_nfiscal,a.* from sf3010 a where f3_nfiscal like '%89388%' and f3_serie='3';
select d_e_l_e_t_,ft_nfiscal,a.* from sft010 a where ft_nfiscal like '%89388%' and ft_serie='3';

--VERIFICAR/EXCLUIR TITULO A PAGAR
select d_e_l_e_t_,a.* from SE2010 a where E2_filial='0301' and E2_NUM like '%89388%';

--VERIFICAR/EXCLUIR MOVIMENTAÇÃO TITULO
select * from se5010;

--RETORNAR PEDIDO DE COMPRA PARA STATUS VERDE (EM ABERTO)
select C7_QUJE,C7_ENCER,C7_QTDACLA,c7_residuo,C7_CONTRA,C7_CONAPRO from sc7010 where c7_num='442039'; /*C7_CONAPRO ser diferente de B */
update sc7010 set C7_QUJE=0,C7_ENCER=' ',C7_QTDACLA=0,c7_residuo=' ',C7_CONTRA=' ' where c7_filial='0301' and c7_num='442039';

--SPED
--==================== ENTIDADES ====================
--000001-0301 / 000013-0302 / 000040-0303 / 000002-0401 / 000004-0402
select * from SPED.sped050 where id_ent='000001' and nfe_id like '%3%000000111%';
select * from SPED.sped054 where id_ent='000001' and nfe_id like '%3%000000111%';
