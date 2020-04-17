 define FilialCOM = '0402';
 define FilialSEM = '0401';
 define Tabela = 'SEB';
 
--CREATE TABLE SEB0401BKP as 
SELECT
    *
FROM
    SEB010 seb
WHERE
    d_e_l_e_t_ = ' '
    and seb.eb_filial='&FilialCOM'
    and not exists (select * from SEB010 tab where tab.D_E_L_E_T_=seb.D_E_L_E_T_ and tab.Eb_banco=seb.EB_banco and tab.eb_filial='&FilialSEM')
ORDER BY
    eb_banco,
    eb_filial;
    
--========================================================================
--CREATE TABLE SEB0301BKP as 
select
N1.*
FROM 
    SEB010 N1
    LEFT JOIN SEB010 N2 ON 
        N2.EB_BANCO=N1.EB_BANCO
        AND N2.D_E_L_E_T_=' ' AND N2.EB_FILIAL='&FilialSEM'
WHERE 
    N1.EB_FILIAL='&FilialCOM' AND N1.D_E_L_E_T_=' ' AND N2.EB_BANCO IS NULL;