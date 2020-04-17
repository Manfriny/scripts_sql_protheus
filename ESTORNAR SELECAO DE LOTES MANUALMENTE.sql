--carga completa
define filial='0301';
define carga='009634';

--verificar se tem nota fiscal emitira... se "SIM" nao pode excluir sem ter cancelado a nota
SELECT *
FROM sc9010
WHERE c9_filial='&filial'
AND c9_carga  ='&carga'
AND D_E_L_E_T_ =' ';

--verifico quais registros tenho que excluir as reservas
select * from sc0010 where c0_filial='&filial' and c0_num in (select nj6_reserv from nj6010 where nj6_filial ='&filial' and NJ6_CODCAR='&carga' and D_E_L_E_T_=' ');
--Excluo as reservas pela tela mesmo de reservas no Protheus, módulo Faturamento,caminho Atualizações+Pedidos+Controle de reservas


--Verifico a seleção de lotes 
select nj6_reserv from nj6010 where nj6_filial ='&filial' and NJ6_CODCAR='&carga' and D_E_L_E_T_=' ';
--Excluo a seleção de lotes 
update nj6010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where nj6_filial ='&filial' and NJ6_CODCAR='&carga' and D_E_L_E_T_=' ';commit;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--estornar somente parte da carga 
define filial='0301';
define pedido='016041';
define carga='001169';

SELECT *
FROM nj6010
WHERE nj6_filial='&filial' and nj6_numpv='&pedido' and NJ6_CODCAR='&carga'
AND D_E_L_E_T_ =' '
;
--ir na tela de controle de reservas do Protheus  e excluir as reservas mostradas nesse select

SELECT *
FROM nj5010
WHERE nj5_filial='&filial' and nj5_numpv='&pedido' 
AND D_E_L_E_T_ =' ';

SELECT *
FROM sc9010
WHERE c9_filial='&filial'
AND c9_pedido  ='&pedido'
--and c9_carga='&carga'
AND D_E_L_E_T_ =' ';



update nj5010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_  where NJ5_NUMPV||NJ5_ITEM IN (SELECT NJ6_NUMPV||NJ6_ITEM FROM nj6010 WHERE nj6_filial='&filial' and nj6_numpv='&pedido' and NJ6_CODCAR='&carga'  AND D_E_L_E_T_ =' ') AND D_E_L_E_T_=' ';

update nj6010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where nj6_filial ='&filial' and NJ6_NUMPV='&pedido' and D_E_L_E_T_=' ';commit;

--depois disso a equipe comercial pode ajustar o pedido de venda (geralmente corrigir a inscrição estadual), já informar os lote no pedido, depois fazer a liberação e repassar para equipe de faturamento fazer o faturamento direto só desse pedido que havia ficado sem faturar
--Obs importante.: para que esse último passo seja realizado(de ajustar o pedido e colocar os lotes), a nf denegada já tem que ter sido excluída do sistema e os lotes tem que te sido endereçados novamente.
