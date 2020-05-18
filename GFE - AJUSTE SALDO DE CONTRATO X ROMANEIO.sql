--verifico o romaneio
select njj_codctr,a.* from njj010 a where njj_filial='0401' and njj_codrom like '%26911%' and d_e_l_e_t_=' ';

--verifico a autorização do contrato
select njp_qtdfco,njp_qtdfis,a.* from njp010 a where njp_filial='0402' and njp_codctr='001530' and njp_item='001' and d_e_l_e_t_=' ';

--Ajusto a Qtd Fisica e o Qtd Saldo Aut conforme quant correta informada pela Comercialização
update njp010 set njp_qtdfco=(njp_qtdfco-40270),njp_qtdfis=(njp_qtdfis-40270) where njp_filial='0402' and njp_codctr='001530' and njp_item='001' and d_e_l_e_t_=' ';



/*
select NJR_QTSFCO,NJR_QTSFIS,njr_qslfco,NJR_SLDFIS,a.* from njr010 a where njr_filial='0401' and njr_codctr='001890';
update njr010 set NJR_QTSFCO=1904000,NJR_QTSFIS=1904000,njr_qslfco=195200,NJR_SLDFIS=195200 where njr_filial='0401' and njr_codctr='001890';
select * from njp010 where njp_filial='0401' and njp_codctr='001890';