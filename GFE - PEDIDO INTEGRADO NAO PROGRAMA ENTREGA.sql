--PEDIDO DE VENDA INTEGRADO e LIBERADO, POREM NAO APARECE NA PROGRAMAÇÃO DE ENTREGA

--verifificar se esta cancelado/excluido/deletado
select c5.c5_xdtlanc,c5.c5_xusrcan,c5.c5_xdtcanc,c5.c5_xhrcanc,c5.c5_num,c5.c5_nota,c5.* from sc5010 c5 where c5.c5_filial='0301' and c5.c5_num='198691';
--Update sc5010 c5 set c5.c5_xusrcan=' ',c5.c5_xdtcanc=' ',c5.c5_xhrcanc=' ' where c5.c5_filial='0301' and c5.c5_num='198691';

--verificar o campo C6_BLQ... se tiver um "R", teve eliminação de Resíduo.(SE NAO ESTIVER EM BRANCO, NAO VISUALIZA NA PROGRAMAÇÃO)
select c6.c6_nota,c6.c6_blq,c6.* from sc6010 c6 where c6.c6_filial='0301' and c6.c6_num='198691';
--update sc6010 c6 set c6.c6_blq=' ' where c6.c6_filial='0301' and c6.c6_num='198691';

--verificar liberação do pedido.
select c9.c9_carga,c9.c9_seqcar,c9.c9_nfiscal,c9.* from sc9010 c9 where c9.c9_pedido='198691';


