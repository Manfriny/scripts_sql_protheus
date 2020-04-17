select 
    trim(TOTVSLG_USER(ct2.CT2_USERGI)) usr_inclusao,
    trim(TOTVSLG_DATA(ct2.CT2_USERGI)) dat_inclusao,
    trim(TOTVSLG_USER(ct2.CT2_USERGA)) usr_alteracao,
    trim(TOTVSLG_DATA(ct2.CT2_USERGI)) dat_alteracao,
    ct2.CT2_FILIAL as Filial,
    to_date(ct2.CT2_DATA,'YYYYMMDD') as Data,
    ct2.CT2_LOTE as Lote,
    ct2.CT2_SBLOTE as SubLote,
    ct2.CT2_DOC as Documento,
    trim(ct2.CT2_ORIGEM) as Origem,
    'R$ '||RPAD(ct2.CT2_VALOR,8,0) as Valor,
    case ct2.D_E_L_E_T_ when ' ' then 'NAO' else 'SIM' end as Excluido 
from 
    CT2010 ct2 
where 
    CT2_FILIAL='0301'         
    and CT2_DATA='20180614' 
    and CT2_LOTE='008820' 
    and CT2_SBLOTE='001' 
    and CT2_DOC='000001' 
    and CT2_VALOR=10017.60
    --and ct2.CT2_ORIGEM like '%610/008%'
    ;