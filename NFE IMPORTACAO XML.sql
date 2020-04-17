SELECT  DISTINCT
    decode(dt.r_e_c_n_o_,null,'MANUAL','IMPORTACAO') as TIPO_ENTRADA,
    f1.f1_filial as filial,
    f1.f1_doc as numero,    
    f1.f1_serie as serie,    
    f1.f1_fornece as fornecedor,    
    f1.f1_loja as loj_fornec,
    to_date(f1.f1_dtdigit,'YYYYMMDD') as dat_protheus,
    totvslg_user(f1.f1_userlgi) as usu_inclusao,
    totvslg_data(f1.f1_userlgi) as dat_inclusao,
    totvslg_user(f1.f1_userlga) as usu_alteracao,
    totvslg_data(f1.f1_userlga) as dat_alteracao
FROM
    totvs12prd.sf1010   f1
    INNER JOIN totvs12prd.sd1010   d1 ON f1.f1_filial = d1.d1_filial
                            AND f1.f1_doc = d1.d1_doc
                            AND f1.f1_serie = d1.d1_serie
                            AND f1.d_e_l_e_t_ = d1.d_e_l_e_t_
    LEFT JOIN totvs12prd.sdt010   dt ON f1.f1_filial = dt.dt_filial
                            AND f1.f1_fornece = dt.dt_fornec
                            and f1.f1_loja=dt.dt_loja
                            and f1.f1_doc=dt.dt_doc
                            and f1.f1_serie =dt.dt_serie
                            and f1.d_e_l_e_t_ = dt.d_e_l_e_t_
WHERE
    f1.f1_filial = :filial
    AND f1.f1_emissao BETWEEN :datainicial AND :dataFinal
    AND f1.d_e_l_e_t_ = ' ' order by dat_protheus;


