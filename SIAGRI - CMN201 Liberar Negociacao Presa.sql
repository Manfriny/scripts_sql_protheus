--LIBERACAO DE NEGOCIACAO DE TROCA
select n.DATL_NEG,n.USUL_NEG,nume_neg,n.codi_emp,n.* from negociacao n where n.nume_neg=586 and n.codi_emp=1;
update negociacao n set n.datl_neg=null, n.usul_neg=null where n.nume_neg=586 and n.codi_emp=1;

--LIBERACAO DE PEDIDO PRESO NO F6
select * from sysdba.travarotina t where t.pedi_ped = 6320 and t.codi_emp = 4;


