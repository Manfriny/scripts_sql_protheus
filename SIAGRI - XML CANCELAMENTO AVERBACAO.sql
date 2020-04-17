define CTE =1883;
select XCAN_CSA, n.* from CTRCS n where CTRC_CSA=&CTE; 

define NOTA=79351;
Select XENV_NOT,a.* from NOTA a where nota_not=&NOTA;