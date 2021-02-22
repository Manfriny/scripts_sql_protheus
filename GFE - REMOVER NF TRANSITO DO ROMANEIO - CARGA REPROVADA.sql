--===== STATUS DO ROMANEIO ================================
/*
0=Pendente;
1=Completo;
2=Atualizado;
3=Confirmado;
4=Cancelado;
5=Pendente Aprovacao;
6=Previsto
*/                                     
--===== CABECALHO DO ROMANEIO ================================
select njj_nfpnum,njj_nfpser,a.njj_status,a.* from njj010 a where njj_filial='0301' and njj_codrom in (
--update njj010 set njj_nfpnum=' ',njj_nfpser=' ' where njj_filial='0301' and njj_codrom in (
'0000017440'
);

--===== ITENS DO ROMANEIO ====================================
select NJM_NFPNUM,NJM_NFPSER,a.* from njm010 a where njm_filial='0301' and njm_codrom in (
--update njm010 set NJM_NFPNUM=' ',NJM_NFPSER=' ' where njm_filial='0301' and njm_codrom in (
'0000017440'
);