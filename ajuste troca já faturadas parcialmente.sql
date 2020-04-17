define filial='0301';
define pedido='014775';

--1ª etapa

--limpar registros deletados
delete sc9010 where c9_filial='&filial' and c9_pedido='&pedido' and D_E_L_E_T_='*';commit;--limpar registros deletados do pedido.
delete nj5010 where nj5_filial='&filial' and nj5_numpv='&pedido' and D_E_L_E_T_='*';commit; --limpar registros deletados da NJ5 referentes ao pedido.

--excluir os itens da SC9, incluindo os faturados
select * from sc9010 where c9_filial='&filial' and c9_pedido='&pedido' and D_E_L_E_T_=' ';
update sc9010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where c9_filial='&filial' and c9_pedido='&pedido' and D_E_L_E_T_=' ';commit;

--verificar se existe  carga para os itens não faturados, se houver orientar para que a carga seja estornada, repassar o nº das cargas para o solicitante 
select dai_cod from dai010 where dai_filial='&filial' and dai_pedido='&pedido'  and dai_nfisca=' ' and D_E_L_E_T_=' ';


--orientar a equipe comercial a excluir os agendamentos(programações de entrega) para os itens não faturados
select * from nj5010 where nj5_filial='&filial' and nj5_numpv='&pedido';

update nj5010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where nj5_filial='&filial' and nj5_numpv='&pedido';

--depois disso a equipe comercial poderá alterar o acordo de troca via sistema (não alterando o item já faturado) e em seguida  nos avisar para executarmos a 2ª etapa

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2ª etapa
--voltar o item faturado na sc9 apagados anteriormente
select * from sc9010 where c9_filial='&filial' and c9_pedido='&pedido' and c9_nfiscal<> ' ';
update sc9010 set D_E_L_E_T_=' ',R_E_C_D_E_L_=0 where c9_filial='&filial' and c9_pedido='&pedido'  and c9_nfiscal<> ' ';

--ajustar empenho na SC6 dos itens não faturados
select C6_ITEM,C6_PRODUTO,C6_QTDVEN, C6_QTDEMP,C6_QTDEMP2 from sc6010 where c6_filial='&filial' and c6_num='&pedido'  and D_E_L_E_T_=' ';
UPDATE SC6010 SET C6_QTDEMP=0,C6_QTDEMP2=0 where c6_filial='&filial' and c6_num='&pedido' AND C6_QTDEMP<>0;
UPDATE SC6010 SET C6_QTDEMP=0,C6_QTDEMP2=0 where c6_filial='&filial' and c6_num='&pedido' AND C6_item='04';

--orientar equipe comercial a liberar novamente o pedido, o sistema tem que recriar os registros na tabela sc9
-- orientar a lançar os agendamentos dos itens não faturados

--depois do pedido ter sido liberado novamente checar os itens não faturados só para ver se ficaram ok para prosseguirem com o processo
select * from sc9010 where c9_filial='&filial' and c9_pedido='&pedido' 
and c9_nfiscal= ' '
and D_E_L_E_T_=' ' ;

--voltar itens da programação de entrega já faturados e deletados anteriormente
update nj5010 set D_E_L_E_T_=' ',R_E_C_D_E_L_=0 where nj5_filial='&filial' and nj5_numpv='&pedido' and nj5_item in (select c9_item  from sc9010 where c9_filial='&filial' and c9_pedido='&pedido' and c9_nfiscal<> ' ' and D_E_L_E_T_=' ' and c9_item not in (select nj5_item from nj5010 where nj5_filial='&filial' and nj5_numpv='&pedido' and D_E_L_E_T_=' '));

select nj5_item from nj5010 where nj5_filial='&filial' and nj5_numpv='&pedido' ;



