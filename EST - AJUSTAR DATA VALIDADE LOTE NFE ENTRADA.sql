--Registros de Lotes contidos na tabes SD1... nao foi encontrado nas tabelas SFT/SF3
select d1_doc,d1_serie,d1_lotectl,d1_lotefor,d1_dfabric,d1_dtvalid from sd1010 where d1_filial='0303' and d1_doc='093833';
update sd1010 set d1_dtvalid='20210131' where d1_filial='0303' and d1_doc='093833';

--Quando a nota fiscal tem Lote, estes sao registrados na tabela F0A.
select * from f0a010 where F0A_FILIAL='0303' and F0A_TPMOV='E' and F0A_DOC='093833' and F0A_SERIE='3';
update f0a010 set F0A_VALID='20210131' where F0A_FILIAL='0303' and F0A_TPMOV='E' and F0A_DOC='093833' and F0A_SERIE='3';