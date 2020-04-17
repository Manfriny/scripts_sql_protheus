select 
    TOTVSLG_USER(c2.C2_USERLGI) as usr_inclusao,
    TOTVSLG_DATA(c2.C2_USERLGI) as dat_inclusao,
    TOTVSLG_USER(c2.C2_USERLGA) as usr_alteracao,
    TOTVSLG_DATA(c2.C2_USERLGA) as dat_alteracao,
    c2.* 
from 
    SC2010 c2 
where 
    C2_NUM='162167' 
    and D_E_L_E_T_=' ';
    
    
--  434172 
select 
    TOTVSLG_USER(D1.D1_USERLGI) as usr_inclusao,
    TOTVSLG_DATA(D1.D1_USERLGI) as dat_inclusao,
    TOTVSLG_USER(D1.D1_USERLGA) as usr_alteracao,
    TOTVSLG_DATA(D1.D1_USERLGA) as dat_alteracao,
    d1_doc,
    D1.D1_SERIE,
    D1.* 
from 
    SD1010 D1 
where 
    d1_doc in ('000506641','011994771')
--    D1.D1_PEDIDO='434172' 
    and D_E_L_E_T_=' ';

select C9.C9_NFISCAL,C9.* from sC9010 C9 where C9.C9_PEDIDO='014196';
select f1.F1_DOC,f1.F1_FILIAL,f1.F1_VALBRUT,f1.* from SF1010 f1 where F1_pe='052347';


select TOTVSLG_USER(d1_USERLGI) as usr_inclusao,
    TOTVSLG_DATA(d1_USERLGI) as dat_inclusao,
    TOTVSLG_USER(d1_USERLGA) as usr_alteracao,
    TOTVSLG_DATA(d1_USERLGA) as dat_alteracao,

d1.D1_FILIAL,d1_doc,d1.D1_EMISSAO,d1.D1_VUNIT,d1.D1_TOTAL,d1.D1_DTDIGIT,d1.* from SD1010 d1 where D1_PEDIDO='014196' and d1.D_E_L_E_T_=' ';
