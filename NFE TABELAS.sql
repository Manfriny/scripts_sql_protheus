define Filial='0401';
define Pedido='022604';
define Nota='000118026';

--NOTA ENTRADA TERCEIROS
select e.F1_DTDIGIT,e.* from SF1010 e where e.F1_FILIAL='&Filial' and e.F1_DOC='&Nota';
update SF1010 e set e.F1_DTDIGIT='20180806' where e.F1_FILIAL='&Filial' and e.F1_DOC='&Nota';
select e.D1_DTDIGIT,e.* from SD1010 e where e.D1_FILIAL='&Filial' and e.D1_DOC='&Nota';
update SD1010 e set e.D1_DTDIGIT='20180806' where e.D1_FILIAL='&Filial' and e.D1_DOC='&Nota';
select e.* from SF3010 e where e.F3_FILIAL='&Filial' and e.F3_NFISCAL='&Nota';
select e.* from SFT010 e where e.FT_FILIAL='&Filial' and e.FT_NFISCAL='&Nota';

--NOTA ENTRADA FORMULARIO PROPRIO
select * from SC7010 where C7_FILIAL='&Filial' and C7_NUM='&Pedido';
select * from SC9010 where C9_FILIAL='&Filial' and C9_NUM='&Pedido';
select * from SF1010 where F1_FILIAL='&Filial' and F1_DOC='&Nota';
select * from SD1010 where D1_FILIAL='&Filial' and D1_DOC='&Nota';
select * from SF3010 where F3_FILIAL='&Filial' and F3_NFISCAL='&Nota';
select * from SFT010 where FT_FILIAL='&Filial' and FT_NFISCAL='&Nota';
select * from SPED.SPED050 where NFE_ID like '&Nota';
select * from SPED.SPED054 where NFE_ID like '&Nota';
select * from SPED.SPED150;

/*
--NOTA SAIDA
sc5
sc6
sc9
sf2
sd2
sf3
sft
sped050
sped054
sped150