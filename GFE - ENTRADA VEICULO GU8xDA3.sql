--ERRO DE VEICULO COM TAMANHO DIFERENTE
select 'GU8' as Tabela,GU8_PLACA as Placa, GU8_ALTUR as Altura,GU8_LARGUR as Largura,GU8_COMPRI as Comprimento,a.* from GU8010 a where GU8_PLACA='NJY9499';
--union all
select 'DA3' as Tabela,DA3_PLACA as Placa,DA3_ALTEXT as Altura,DA3_LAREXT as Largura,DA3_COMEXT as Comprimento,DA3_MUNPLA,DA3_CAPACN,DA3_XCARRO,a.* from DA3010 a where DA3_PLACA='NJY9499';

-----------------------------------------------------------------------------------------
--MOTORISTA/AJUDANTE BLOQUEADOS  --00572729057  97376523120
select a.r_e_c_n_o_,D_E_L_E_T_,a.da4_blqmot,DA4_CGC,a.* from DA4010 a where DA4_CGC in ('45163812149') ; --and a.d_e_l_e_t_=' ';
update DA4010 set D_E_L_E_T_=' ',R_E_C_D_E_L_=0 where DA4_CGC in ('90077989104'); --00638611199
--update DA4010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where r_e_c_n_o_ in (20222,4124);
--update da4010 set da4_blqmot='1' where r_e_c_n_o_ in (20222,4124);
--select D_E_L_E_T_,a.* from DA4010 a where DA4_nome like '%CAIRO%';
--select D_E_L_E_T_,a.* from DA3010 a where DA3_PLACA='BCQ5851';

select a.r_e_c_n_o_,d_e_l_e_t_,GUU_SIT,GUU_DTSIT,NVL(trim(GUU_DSSIT),' ')GUU_DSSIT,a.* from GUU010 a where GUU_IDFED in ('45163812149') ; --and a.d_e_l_e_t_=' ';
update GUU010 set GUU_SIT=1 where GUU_IDFED in ('90077989104');
--update GUU010 set GUU_NMMTR=GUU_PSEUD where r_e_c_n_o_=9412;
update guu010 guu set guu.d_e_l_e_t_='*',guu.r_e_c_d_e_l_=guu.r_e_c_n_o_ where guu.r_e_c_n_o_ in (186,13270);
update guu010 guu set guu.guu_sit='1' where guu.r_e_c_n_o_ in (13275);
--delete from GUU010 where r_e_c_n_o_ in (5004);

select * from guu010 where GUU_CDMTR='008477';

select D_E_L_E_T_,a.* from DA4010 a where DA4_CGC in ('02116054176');
select * from DAU010;

-----------------------------------------------------------------------------------------
--REGISTROS DELETADOS NA DA4010 E INATIVOS NA GUU010
SELECT
    da.r_e_c_n_o_   AS da_rec,
    da.d_e_l_e_t_   AS da_del,
    da.da4_cgc      AS da_cpf,
    gu.r_e_c_n_o_   AS gu_rec,
    gu.d_e_l_e_t_   AS gu_del,
    gu.guu_sit      AS gu_situ,
    gu.guu_idfed    AS gu_cpf,
    TO_DATE(gu.guu_dtsit, 'YYYYMMDD') AS gu_dt_situ,
    nvl(TRIM(gu.guu_dssit), ' ') AS guu_dssit
FROM
    guu010   gu
    INNER JOIN da4010   da ON da.da4_cgc = gu.guu_idfed
WHERE
    gu.guu_sit = '1'
    AND da.d_e_l_e_t_ = '*';