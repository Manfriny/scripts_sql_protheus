-- NOTA ESPECIFICA
SELECT f3_nfiscal,
        f3_nfiscal,
        F3_CHVNFE,
        'update sped.SPED050 SET DOC_CHV='''||F3_CHVNFE||''' where R_E_C_N_O_='||sped.R_E_C_N_O_||';' as my_query
FROM sf3010 
inner join sped.sped050 sped on substr(sped.nfe_id,1,1)=trim(f3_serie) and substr(sped.nfe_id,4,6)=trim(f3_nfiscal)
WHERE f3_filial = '0301' AND f3_serie = '5' AND f3_nfiscal IN ( '002504', '002510', '002561', '002567', '002574', '002580', '002594', '002609', '002618', '002619', '002620', '02649' );

-- TODAS AS NOTAS
SELECT f3_nfiscal,
        f3_nfiscal,
        F3_CHVNFE,
        'update sped.SPED050 SET DOC_CHV='''||F3_CHVNFE||''' where R_E_C_N_O_='||sped.R_E_C_N_O_||';' as my_query
FROM sf3010 
inner join sped.sped050 sped on substr(sped.nfe_id,1,1)=trim(f3_serie) and substr(sped.nfe_id,4,6)=trim(f3_nfiscal)
WHERE f3_filial = '0301'  AND F3_EMISSAO >= '20180101' AND f3_serie = '3' AND sped.DOC_CHV=' ';

--=======================================================================================


SELECT
    f3_nfiscal,
    f3_serie,
    f3_filial,
    f3_chvnfe,
    sp50.status,
    sp50.statuscanc,
    f3_xlemail
FROM
    sf3010 sf3
    INNER JOIN sped.sped050 sp50 ON sp50.doc_chv = f3_chvnfe
                                        AND sp50.d_e_l_e_t_ = ' '
WHERE
    sf3.d_e_l_e_t_ = ' '
    AND sf3.f3_filial = '0301'
    AND sf3.f3_nfiscal BETWEEN '069168   ' AND '069168   '
    AND sf3.f3_serie = '3  '
    AND substr(sf3.f3_cfo,1,1) < '5'
    AND sf3.f3_formul = 'S';