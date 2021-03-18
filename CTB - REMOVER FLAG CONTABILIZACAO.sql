--Remover Flag de Contabilização NOTA SAIDA
select f2.f2_dtlanc,f2.f2_client,f2.f2_loja,f2.* from sf2010 f2 where f2_filial='0303' and f2.f2_doc='006730' and f2.f2_serie='3';
update sf2010 f2 set f2.f2_dtlanc=' ' where f2_filial='0303' and f2.f2_doc='006730' and f2.f2_serie='3';

select d2.d2_origlan, d2.d2_codlan, d2.d2_dtlctct, d2.* from sd2010 d2 where d2.d2_filial='0303' and d2_doc='006730' and d2.d2_serie='3';
update sd2010 d2 set d2.d2_origlan=' ', d2.d2_codlan=' ', d2.d2_dtlctct=' ' where d2.d2_filial='0303' and d2_doc='006730' and d2.d2_serie='3';

--=============================================================================================
--Remover Flag de Contabilização NOTA ENTRADA
select f1.f1_dtlanc,f1.f1_fornece,f1.f1_loja,f1.* from sf1010 f1 where f1_filial='0303' and f1.f1_doc='006730' and f1.f1_serie='3';
update sf1010 f1 set f1.f1_dtlanc=' ' where f1_filial='0303' and f1.f1_doc='006730' and f1.f1_serie='3';

select d1.d1_origlan, d1.d1_codlan, d1.* from sd1010 d1 where d1.d1_filial='0303' and d1_doc='006730' and d1.d1_serie='3';
update sd1010 d1 set d1.d1_origlan=' ', d1.d1_codlan=' ' where d1.d1_filial='0303' and d1_doc='006730' and d1.d1_serie='3';