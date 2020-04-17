select 
C7_NUM,
C7_QUANT,
C7_QUJE,
c7_residuo,
C7_QTDACLA,
C7_NUMCOT
C7_QTDSOL,
a.* 
from sc7010 a where c7_num='435308';


update sc7010 set c7_residuo = 'S' where c7_num='435308';

select b1_codgtin,b1_codbar,a.* from sb1010 a where b1_cod='010300029';
update sb1010 set b1_codgtin='000000000000000' where b1_cod='010300029';