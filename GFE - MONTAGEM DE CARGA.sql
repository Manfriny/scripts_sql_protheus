define filial = '0301';
define pedido = '197487';
define carga = '010177';
define numMov = '00023582';

--PEDIDO DA CARGA
select a.c5_tiplib,C5_CLIENT,a.* from sc5010 a where c5_filial='&filial' and c5_num='&pedido' and D_E_L_E_T_=' ';
select c6_nota,c6_serie,c6_local,c6_localiz,c6_lotectl,a.C6_RESERVA,a.* from sc6010 a where c6_filial='&filial' and c6_num='&pedido' and D_E_L_E_T_=' ';
select c9_nfiscal,c9_serienf,C9_local,C9_lotectl,a.C9_CARGA,a.C9_SEQCAR,a.C9_RESERVA,a.C9_SEQUEN,a.c9_blest,a.c9_blcred,a.* from sC9010 a where c9_filial='&filial' and C9_pedido='&pedido' and D_E_L_E_T_=' ';

--SALDO DO PRODUTO
select * from SB2010 where B2_FILIAL='&filial' and B2_LOCAL='27' and B2_COD='012500041';
select * from SB8010 where B8_FILIAL='&filial' and B8_LOCAL='27' and B8_PRODUTO='012500041' and B8_LOTECTL='C289HB6A21     ';
select * from SBF010 where BF_FILIAL='&filial' /* and BF_LOCAL='27' and BF_PRODUTO='012500041'*/ and BF_LOTECTL='C289HB6A21     ';

select c6_num,c6_local,c6_localiz,c6_lotectl,a.* from sc6010 a where c6_local='27' and c6_localiz='27 FAT 01      ' and c6_lotectl='C289HB6A21     ';


--MONTAGEM CARGA
select d_e_l_e_t_,DAK_XROM,a.* from DAK010 a where DAK_FILIAL='&filial' and DAK_COD = '&carga';
--update DAK010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where DAK_FILIAL='&filial' and DAK_COD = '&carga';

select d_e_l_e_t_,dai_pedido,a.* from DAI010 a where DAI_FILIAL='&filial' and dai_cod='&carga' and dai_pedido='&pedido';
--update DAI010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where DAI_FILIAL='&filial' and dai_cod='&carga' and dai_pedido='&pedido';
--select d_e_l_e_t_,dai_pedido,a.* from DAI010 a where dai_pedido='&pedido';

--PROGRAMACAO ENTREGA
select d_e_l_e_t_,a.* from NJ5010 a where NJ5_FILIAL='&filial' and NJ5_NUMPV='&pedido' and D_E_L_E_T_=' ';
--update NJ5010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where NJ5_FILIAL='&filial' and NJ5_NUMPV='&pedido' and D_E_L_E_T_=' ';

select * from njj010;

--MOVIMENTO DO GFE EH GRAVADO NA GWV 
select d_e_l_e_t_,GWV_NRROM,a.* from gwv010 a where gwv_filial='&filial' and gwv_nrmov='&numMov';
update gwv010 set d_e_l_e_t_='*',R_E_C_D_E_L_=r_e_c_n_o_ where gwv_filial='&filial' and gwv_nrmov='&numMov';
update gwv010 set d_e_l_e_t_=' ',R_E_C_D_E_L_=0 where gwv_filial='&filial' and gwv_nrmov='&numMov';

--01047901
select gwv_nrrom,gwv_nrmov,gwv.gwv_sit,gwv.* from gwv010 gwv where GWV_FILIAL='0301' and gwv_nrrom='01092901';
select gx3.gx3_sit,gx3.* from GX3010 gx3 where gx3.gx3_filial='0301' and gx3.gx3_nrmov='00025665'; -- sit tem que ser = 5 (1-aberto; 2-movimentado; 3-em fila; 4-endereçado; 5-cancelado; 6-concluido)
update gwv010 set GWV_NRROM=' ' where gwv_filial='0301' and gwv_nrmov='00024600';
select gwv_nrmov,gwv.gwv_sit,GWV_NRROM,gwv.* from gwv010 gwv where GWV_FILIAL='0301' and gwv_nrmov='00024600';

select gwv_nrrom,gwv_nrmov,gwv.gwv_sit,gwv.* from gwv010 gwv where GWV_FILIAL='0303' and gwv_nrrom='00012401';
select gx3.gx3_sit,gx3.* from GX3010 gx3 where gx3.gx3_filial='0303' and gx3.gx3_nrmov='00000071'; -- sit tem que ser = 5
update gwv010 set GWV_NRROM=' ' where gwv_filial='0303' and gwv_nrmov='00000071';
select gwv_nrmov,gwv.gwv_sit,GWV_NRROM,gwv.* from gwv010 gwv where GWV_FILIAL='0303' and gwv_nrmov='00000071';




select d_e_l_e_t_,a.* from NJS010 a where NJS_FILIAL='0301' and NJS_NRMOV='00023583' and NJS_SEQ='002' and a.d_e_l_e_t_=' ';
update NJS010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where NJS_FILIAL='0301' and NJS_NRMOV='00023583' and NJS_SEQ='002';

select d_e_l_e_t_,dak.* from dak010 dak where dak_cod='010470';
/*
26/09/2020
01092901 - 00024600
00012401 - 00000071

25/09/2020
01087601 - 00024551
01090501 - 00024576

24/09/2020
01083501 - 00024502
01084001 - 00024506

23/09/2020
01075201 - 00024435
01077101 - 00024439
01077801 - 00024446
01071501 - 00024405
01078601 - 00024453
01074601 - 00024424
01078401 - 00024449
01080801 - 00024479
