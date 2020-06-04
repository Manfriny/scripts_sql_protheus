define filial='0301';
define armazem = '21';
define dat = '20200602';

--EXCLUIR A IMPORTAÇAO INVENTARIO
select * from sb7010 where b7_filial='&filial' and b7_local in ('21','22') and b7_data = '&dat' and d_e_l_e_t_=' ' order by b7_data desc;
--update sb7010 set d_e_l_e_t_='*' where b7_filial='&filial' and b7_local in ('21','22') and b7_data = '&dat' and d_e_l_e_t_=' ';

--=======================================================================================================
define numContagem = '0036';

--EXCLUIR UMA CONTAGEM DENTRO DE UM INVENTÁRIO
select * from zs3010 where zs3_inve='&numContagem' and zs3_cont in ('&armazem');
--update zs3010 set d_e_l_e_t_='*' where zs3_inve='&numContagem' and zs3_cont in ('&armazem');
--update zs3010 set d_e_l_e_t_=' ' where zs3_inve='&numContagem' and zs3_cont in ('&armazem') and ZS3_STATUS='1';

--EXCLUIR ITENS DE UMA CONTAGEM
select * from zs4010 where ZS4_FILIAL='&filial' and ZS4_INVE='&numContagem' and ZS4_DATA='&dat' and d_e_l_e_t_=' ';
--update zs4010 set d_e_l_e_t_=' ' where ZS4_FILIAL='&filial' and ZS4_INVE='&numContagem' and ZS4_DATA='&dat' and d_e_l_e_t_='*';