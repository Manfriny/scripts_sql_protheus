--verifico o romaneio
select njj_codctr,a.* from njj010 a where njj_filial='0401' and njj_codrom like '%26911%' and d_e_l_e_t_=' ';

--verifico a autorização do contrato
select njp_qtdfco,njp_qtdfis,a.* from njp010 a where njp_filial='0401' and njp_codctr='002111' and njp_item='007' and d_e_l_e_t_=' ';

--Ajusto a Qtd Fisica e o Qtd Saldo Aut conforme quant correta informada pela Comercialização
update njp010 set njp_qtdfco=(njp_qtdfco-50410),njp_qtdfis=(njp_qtdfis-50410) where njp_filial='0401' and njp_codctr='002111' and njp_item='007' and d_e_l_e_t_=' ';



/*
NJP_QTDAUT - o valor que a autorização tem que ficar.. 
NJP_QTDFCO - o resultado acima...