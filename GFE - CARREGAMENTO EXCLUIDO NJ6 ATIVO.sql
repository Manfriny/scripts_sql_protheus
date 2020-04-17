--JOAO
select PKG_EXPEDICAO.F_VERIFICA_CARREGAMENTO('009634') from dual;
--
-- Carregamentos excluidos com seleção de lotes ativas
SELECT DISTINCT
  DAK.DAK_FILIAL,
  DAK.DAK_COD,
  DAK.DAK_SEQCAR,
  DAK_DATA
FROM 
  DAK010 DAK
  INNER JOIN NJ6010 NJ6 ON
        NJ6.NJ6_CODCAR = DAK.DAK_COD
        AND NJ6.NJ6_SEQCAR = DAK.DAK_SEQCAR
        AND NJ6.D_E_L_E_T_ = ' '
WHERE
   DAK.D_E_L_E_T_ = '*' and DAK.DAK_FILIAL='0301'
ORDER BY
      dak.dak_cod desc,
      DAK.DAK_DATA DESC;
      

--TABELA AGENDAMENTO GFE - PEGAR NUM MOVIMENTO
select gwv.gwv_nrmov,gwv.* from gwv010 gwv where gwv.gwv_filial='0301' and gwv.gwv_nrrom='00963401';
--TABELA MOVIMENTO GFE - ACESSO DO VEICULO
select * from gx3010 where gx3_nrmov='00020729';
select d_e_l_e_t_,a.* from dak010 a where dak_cod='009634';
select d_e_l_e_t_,a.* from dai010 a where dai_cod='009634';

--EXCLUIR A SELEÇÃO DOS LOTES
select d_e_l_e_t_,a.r_e_c_n_o_,a.* from NJ6010 a where nj6_filial='0301' and nj6_codcar='009634' and nj6_numpv='178829';
update nj6010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where r_e_c_n_o_ in(
'33887',
'33888',
'33889',
'33890',
'34401',
'34402',
'34403',
'34404',
'34405');
--EXCLUIR AS RESERVAS DAQUELE LOTE EXCLUIDO NA NJ6
select c6_reserva from sc6010 where c6_filial='0301' and c6_num='178829';
select * from sc6010 where c6_reserva in ('014651','014652','014655','014654','014653');
select c9_reserva from sc9010 where c9_filial='0301' and c9_pedido='178829';
select * from sc9010 where c9_reserva in ('014651','014652','014655','014654','014653');
select d_e_l_e_t_,a.* from sc0010 a where c0_num in ('014651','014652','014653','014654','014655');
select d_e_l_e_t_,a.* from sc0010 a where c0_lotectl='ST1155560019' and C0_LOCALIZ='R-D BL22QD01   ' and C0_NUM='014653';
update sc0010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where c0_lotectl='ST1154860019' and C0_LOCALIZ='R-D BL45QD05   ' and C0_NUM='014651';
update sc0010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where c0_lotectl='ST1155060019' and C0_LOCALIZ='R-D BL48QD02   ' and C0_NUM='014652';
update sc0010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where c0_lotectl='EX1950962519' and C0_LOCALIZ='R-E BL89QD03   ' and C0_NUM='014655';
update sc0010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where c0_lotectl='ST1156160019' and C0_LOCALIZ='R-K BL20QD04   ' and C0_NUM='014654';
update sc0010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where c0_lotectl='ST1155560019' and C0_LOCALIZ='R-D BL22QD01   ' and C0_NUM='014653';

--=============================
select a.C6_LOCAL,a.C6_LOCALIZ,a.C6_LOTECTL,a.C6_RESERVA,a.* from SC6010 a where c6_filial='0301' and c6_num in ('174572','175413') and a.D_E_L_E_T_=' ';
update SC6010 set C6_LOTECTL='DC202455018',C6_LOCALIZ='R-C BL13QD02   ' where c6_num='167789';
select a.C9_LOCAL,a.C9_CARGA,a.c9_seqcar,a.C9_LOTECTL,a.C9_RESERVA,a.* from SC9010 a where c9_filial='0301' and c9_pedido in ('174572','175413') and a.D_E_L_E_T_=' ';
update SC9010 set C9_LOCAL='99' where c9_pedido='167789';
select D_E_L_E_T_,R_E_C_N_O_,a.* from NJ6010 a where NJ6_CODCAR='005121';
--update NJ6010 set D_E_L_E_T_=' ',R_E_C_D_E_L_=0 where R_E_C_N_O_=25131;
--update NJ6010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where R_E_C_N_O_ in ('32488','32489');
select * from DAK010 where DAK_COD='005121';
--update DAK010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where DAK_COD='003883';
select * from DAI010 where dai_cod='005121';
--update DAI010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where dai_cod='003883';

select * from SB8010 where B8_PRODUTO='010400033';


select * from sc0010 where c0_num='000005' and c0_lotectl='DC202455018';
update sc0010 set D_E_L_E_T_=' ',R_E_C_D_E_L_=0 where c0_num='000005' and c0_lotectl='DC202455018';

