--verifico o romaneio
select njj_codctr,a.* from njj010 a where njj_filial='0301' and njj_codrom like '%19950%' and d_e_l_e_t_=' ';

select njr.njr_qtefco,njr.njr_qtefis,njr.* from njr010 njr where njr.njr_filial='0302' and njr.njr_codctr='000712';
update njr010 njr set njr.njr_qtefco=709983,njr.njr_qtefis=709983 where njr.njr_filial='0301' and njr.njr_codctr='004370';
--759479

--verifico a autorização do contrato
select njp_qtdfco,njp_qtdfis,a.* from njp010 a where njp_filial='0302' and njp_codctr='000712' and njp_item='008' and d_e_l_e_t_=' ';

--Ajusto a Qtd Fisica e o Qtd Saldo Aut conforme quant correta informada pela Comercialização
update njp010 set njp_qtdfco=(njp_qtdfco-24670),njp_qtdfis=(njp_qtdfis-24670) where njp_filial='0302' and njp_codctr='000712' and njp_item='008' and d_e_l_e_t_=' ';

select njj_codctr,njj.njj_codaut,sum(NJJ_QTDFIS) as NJJ_QTDFIS from njj010 njj where njj.njj_filial='0302' and njj.njj_codctr='000632' and njj.njj_codaut='001' GROUP BY njj_codctr,njj.njj_codaut;
--2865544
/*
NJP_QTDAUT - o valor que a autorização tem que ficar.. 
NJP_QTDFCO - o resultado acima...