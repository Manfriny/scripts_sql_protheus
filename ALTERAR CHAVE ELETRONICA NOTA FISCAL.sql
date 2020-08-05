--==================== ENTIDADES ====================
--000001-0301 / 000013-0302 / 000040-0303 / 000002-0401 / 000004-0402
define entidade = '000004';
define filial   = '0402';
define nota     = '042658';
define serie    = '1';
define chave    = '52200702745323000210550010000426581199249580';

select f1_doc,f1_serie,f1_chvnfe,sf1.* from sf1010 sf1 where f1_filial='&filial' and f1_doc='&nota' and sf1.d_e_l_e_t_=' ';
update sf1010 sf1 set sf1.f1_chvnfe='&chave' where f1_filial='&filial' and f1_doc='&nota' and sf1.d_e_l_e_t_=' ';
select sD1.* from sD1010 sD1 where D1_filial='&filial' and D1_doc='&nota' and sd1.d_e_l_e_t_=' ';


select f3_nfiscal, f3_chvnfe,sf3.* from sf3010 sf3 where f3_filial='&filial' and f3_nfiscal='&nota' and F3_CFO < '3999' and sf3.d_e_l_e_t_=' ';
update sf3010 sf3 set sf3.f3_chvnfe='&chave' where f3_filial='&filial' and f3_nfiscal='&nota' and F3_CFO < '3999' and sf3.d_e_l_e_t_=' ';

select ft_chvnfe,sft.* from sft010 sft where ft_filial='&filial' and ft_nfiscal='&nota' and sft.ft_tipomov='E' and sft.d_e_l_e_t_=' ';
update sft010 sft set sft.ft_chvnfe='&chave' where ft_filial='&filial' and ft_nfiscal='&nota' and sft.ft_tipomov='E' and sft.d_e_l_e_t_=' ';

select sped.doc_chv,sped.* from SPED.sped050 sped where sped.id_ent='&entidade' and sped.NFE_ID like '%'||'&serie'||'%'||'&nota'||'%' and sped.d_e_l_e_t_=' ';

select ID_ENT, 
SPED.NFE_ID,
      UTL_RAW.CAST_TO_VARCHAR2(DBMS_LOB.SUBSTR(XML_ERP,500,1)) AS XML_ERP,
      UTL_RAW.CAST_TO_VARCHAR2(DBMS_LOB.SUBSTR(XML_SIG,500,1)) AS XML_SIG,
      UTL_RAW.CAST_TO_VARCHAR2(DBMS_LOB.SUBSTR(XML_SIGCAN,500,1)) AS XML_SIGCAN
from sped.sped050 SPED where id_ent='&entidade' and sped.nfe_id like '%'||'&Serie'||'%'||'&Nota'||'%' and d_e_l_e_t_=' ';

--=============================================================================================================================
--SAIDA--
select f2_doc,f2_serie,f2_chvnfe,sf2.* from sf2010 sf2 where f2_filial='&filial' and f2_doc='&nota' and sf2.d_e_l_e_t_=' ';
update sf2010 sf2 set sf2.f2_chvnfe='&chave' where f2_filial='&filial' and f2_doc='&nota' and sf2.d_e_l_e_t_=' ';
select sd2.* from sd2010 sd2 where d2_filial='&filial' and d2_doc='&nota' and sd2.d_e_l_e_t_=' ';


select f3_nfiscal, f3_chvnfe,sf3.* from sf3010 sf3 where f3_filial='&filial' and f3_nfiscal='&nota' and F3_CFO > '3999' and sf3.d_e_l_e_t_=' ';
update sf3010 sf3 set sf3.f3_chvnfe='&chave' where f3_filial='&filial' and f3_nfiscal='&nota' and F3_CFO > '3999' and sf3.d_e_l_e_t_=' ';

select ft_chvnfe,sft.* from sft010 sft where ft_filial='&filial' and ft_nfiscal='&nota' and sft.ft_tipomov='S' and sft.d_e_l_e_t_=' ';
update sft010 sft set sft.ft_chvnfe='&chave' where ft_filial='&filial' and ft_nfiscal='&nota' and sft.ft_tipomov='S' and sft.d_e_l_e_t_=' ';

select sped.doc_chv,sped.* from SPED.sped050 sped where sped.id_ent='&entidade' and sped.NFE_ID like '%'||'&serie'||'%'||'&nota'||'%' and sped.d_e_l_e_t_=' ';
select ID_ENT, 
SPED.NFE_ID,
      UTL_RAW.CAST_TO_VARCHAR2(DBMS_LOB.SUBSTR(XML_ERP,500,1)) AS XML_ERP,
      UTL_RAW.CAST_TO_VARCHAR2(DBMS_LOB.SUBSTR(XML_SIG,500,1)) AS XML_SIG,
      UTL_RAW.CAST_TO_VARCHAR2(DBMS_LOB.SUBSTR(XML_SIGCAN,500,1)) AS XML_SIGCAN
from sped.sped050 SPED where id_ent='&entidade' and sped.nfe_id like '%'||'&Serie'||'%'||'&Nota'||'%' and d_e_l_e_t_=' ';


/*
0302 - 020150 - 1 - 52200703482332000229550010000201501565297230
0302 - 020169 - 1 - 52200703482332000229550010000201691907805456
0401 - 093813 - 2 - 52200702745323000130550020000938131955330643
0401 - 093833 - 2 - 52200702745323000130550020000938331504539435
0402 - 042658 - 1 - 52200702745323000210550010000426581199249580
