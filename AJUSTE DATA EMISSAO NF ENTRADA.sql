define filial='0401';
define nota='000003204';
define serie='1';
define datAtual='20191229';
define datNova='20191228';

--====================== ALTERAR REGISTROS ======================
select f1_doc,f1_emissao,    a.* from sf1010 a where f1_filial='&filial' and f1_doc     in ('&nota') and f1_serie='&serie' and f1_emissao='&datAtual' and D_E_L_E_T_=' ' order by a.f1_doc;
update sf1010 set f1_emissao = '&datNova'      where f1_filial='&filial' and f1_doc     in ('&nota') and f1_serie='&serie' and f1_emissao='&datAtual' and D_E_L_E_T_=' ';

select d1_doc,d1_emissao,    a.* from sd1010 a where d1_filial='&filial' and d1_doc     in ('&nota') and d1_serie='&serie' and d1_emissao='&datAtual' and D_E_L_E_T_=' ' order by a.d1_doc;
update sd1010 set d1_emissao = '&datNova'      where d1_filial='&filial' and d1_doc     in ('&nota') and d1_serie='&serie' and d1_emissao='&datAtual' and D_E_L_E_T_=' ';

select da_doc,da_data,       a.* from sda010 a where da_filial='&filial' and da_doc     in ('&nota') and da_serie='&serie' and da_data   ='&datAtual' and D_E_L_E_T_=' ' order by a.da_doc;
update sda010 set da_data    = '&datNova'      where da_filial='&filial' and da_doc     in ('&nota') and da_serie='&serie' and da_data   ='&datAtual' and D_E_L_E_T_=' ';

select db_doc,db_data,       a.* from sdb010 a where db_filial='&filial' and db_doc     in ('&nota') and db_serie='&serie' and db_data   ='&datAtual' and D_E_L_E_T_=' ' order by a.db_doc;
update sdb010 set db_data    = '&datNova'      where db_filial='&filial' and db_doc     in ('&nota') and db_serie='&serie' and db_data   ='&datAtual' and D_E_L_E_T_=' ';

select d5_doc,d5_data,       a.* from sd5010 a where d5_filial='&filial' and d5_doc     in ('&nota') and d5_serie='&serie' and d5_data   ='&datAtual' and D_E_L_E_T_=' ' order by a.d5_doc;
update sd5010 set d5_data    = '&datNova'      where d5_filial='&filial' and d5_doc     in ('&nota') and d5_serie='&serie' and d5_data   ='&datAtual' and D_E_L_E_T_=' ';

select ft_nfiscal,ft_emissao,a.* from sft010 a where ft_filial='&filial' and ft_nfiscal in ('&nota') and ft_serie='&serie' and ft_emissao='&datAtual' and D_E_L_E_T_=' ' order by a.ft_nfiscal;
update sft010 set FT_EMISSAO = '&datNova'      where ft_filial='&filial' and ft_nfiscal in ('&nota') and ft_serie='&serie' and ft_emissao='&datAtual' and D_E_L_E_T_=' ';

select f3_nfiscal,f3_emissao,a.* from sf3010 a where f3_filial='&filial' and f3_nfiscal in ('&nota') and f3_serie='&serie' and f3_emissao='&datAtual' and D_E_L_E_T_=' ' order by a.f3_nfiscal;
update sf3010 set F3_EMISSAO = '&datNova'      where f3_filial='&filial' and f3_nfiscal in ('&nota') and f3_serie='&serie' and f3_emissao='&datAtual' and D_E_L_E_T_=' ';

--====================== VERIFICAR ALTERACAO ======================
select f1_doc,f1_emissao,    a.* from sf1010 a where f1_filial='&filial' and f1_doc     in ('&nota') and f1_serie='&serie' and f1_emissao='&datNova' and D_E_L_E_T_=' ' order by a.f1_doc;
select d1_doc,d1_emissao,    a.* from sd1010 a where d1_filial='&filial' and d1_doc     in ('&nota') and d1_serie='&serie' and d1_emissao='&datNova' and D_E_L_E_T_=' ' order by a.d1_doc;
select da_doc,da_data,       a.* from sda010 a where da_filial='&filial' and da_doc     in ('&nota') and da_serie='&serie' and da_data   ='&datNova' and D_E_L_E_T_=' ' order by a.da_doc;
select db_doc,db_data,       a.* from sdb010 a where db_filial='&filial' and db_doc     in ('&nota') and db_serie='&serie' and db_data   ='&datNova' and D_E_L_E_T_=' ' order by a.db_doc;
select d5_doc,d5_data,       a.* from sd5010 a where d5_filial='&filial' and d5_doc     in ('&nota') and d5_serie='&serie' and d5_data   ='&datNova' and D_E_L_E_T_=' ' order by a.d5_doc;
select ft_nfiscal,ft_emissao,a.* from sft010 a where ft_filial='&filial' and ft_nfiscal in ('&nota') and ft_serie='&serie' and ft_emissao='&datNova' and D_E_L_E_T_=' ' order by a.ft_nfiscal;
select f3_nfiscal,f3_emissao,a.* from sf3010 a where f3_filial='&filial' and f3_nfiscal in ('&nota') and f3_serie='&serie' and f3_emissao='&datNova' and D_E_L_E_T_=' ' order by a.f3_nfiscal;
