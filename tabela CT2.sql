SELECT *
FROM CT2010_BACKUP
WHERE CT2_FILIAL = '0301'
AND CT2_TPSALD LIKE '%5'
AND CT2_DATA BETWEEN '20151230' AND '20151230' and D_E_L_E_T_=' ';


create table ct2010_teste as SELECT *
FROM CT2010_BACKUP
WHERE CT2_FILIAL = '0301'
AND CT2_TPSALD LIKE '%5'
AND CT2_DATA BETWEEN '20151230' AND '20151230';


----
SELECT *
FROM CT2010
WHERE CT2_FILIAL = '0301'
AND CT2_TPSALD LIKE '%5'
AND CT2_DATA BETWEEN '20151231' AND '20151231' and D_E_L_E_T_=' '
and ct2_lote='001020';

update CT2010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where CT2_FILIAL = '0301'
AND CT2_TPSALD LIKE '%5'
AND CT2_DATA BETWEEN '20151231' AND '20151231' and D_E_L_E_T_=' '
and ct2_lote='001020';





