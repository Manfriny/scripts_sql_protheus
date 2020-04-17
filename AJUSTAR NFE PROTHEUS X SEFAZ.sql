select F2_FIMP,a.F2_CHVNFE,a.* from sf2010 a where f2_filial='0302' and f2_doc='004575' and a.D_E_L_E_T_=' ';
update sf2010 set F2_FIMP='S',F2_CHVNFE=' ' where f2_filial='0302' and f2_doc='004575' and D_E_L_E_T_=' ';

select f3_nfiscal,f3_codrsef,a.F3_OBSERV,a.F3_CHVNFE,a.F3_PROTOC,a.F3_DTCANC,a.* from sf3010 a where f3_filial='0302' and f3_nfiscal='004575';
update sf3010 set f3_codrsef=100,F3_CHVNFE='?????????????',F3_PROTOC='?????',F3_OBSERV=' ',F3_DTCANC=' ' where f3_filial='0302' and f3_nfiscal='004575';

select ft_nfiscal,a.ft_OBSERV,a.ft_CHVNFE,a.ft_DTCANC,a.* from sft010 a where ft_filial='0302' and ft_nfiscal='004575';
update sft010 set ft_OBSERV=' ',ft_CHVNFE='??????????',ft_DTCANC=' ' where ft_filial='0302' and ft_nfiscal='004575';

select * from sped.sped050 where /*ID_ENT='000013' and*/ NFE_ID like '%1%004575%';
update sped.sped050 set STATUS=6,STATUSCANC=0,NFE_PROT='??????';

select * from sped.sped054 where /*ID_ENT='000013' and*/ NFE_ID like '%1%004575%';
update sped.sped054 set CSTAT_SEFR=100,XMOT_SEFR='Autorizado o uso da NF-e',NFE_PROT='??????',DTVER_LOTP='2019????',HRVER_LOTP='11:45:00' where ID_ENT='000013' and NFE_ID like '%1%004575%';


select * from sped.sped052;
select * from sped.sped150;


