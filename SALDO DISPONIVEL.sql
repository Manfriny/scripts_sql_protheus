select 
    B2_FILIAL,
    B2_COD,
    trim(nvl((select sb1010.B1_DESC from sb1010 where b1_cod=b2_cod and ROWNUM >=1),'')) as descr,
    B2_QATU 
from 
    SB2010 
where 
    B2_FILIAL in ('0401','0402') and B2_QATU > 0 
order by 
    B2_FILIAL,descr;