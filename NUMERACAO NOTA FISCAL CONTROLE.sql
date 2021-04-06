--===== Deixar na Proxima Numeração ===============================
select * from sx5010 sx5
where X5_FILIAL='0302' and x5_tabela = '01';

--===== Preencher o campo DTUSO com a Ultima nota Emitida ==========
--===== Deixar o proximo numero desejado em branco =================
select * from sd9010 d9 where d9.d9_filial='0302' and d9.d9_serie='1' ;and d9.d9_doc >= '026850' and d9.d9_doc <= '029192' order by d9.d9_doc;
update sd9010 d9 set d9.d9_dtuso='20210319',d9.d9_hora='12:09' where d9.d9_filial='0302' and d9.d9_serie='1' and d9.d9_doc >= '026850' and d9.d9_doc <= '029192';



/*

026847                                                 