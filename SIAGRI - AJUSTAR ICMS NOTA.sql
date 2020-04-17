--AJUSTAR CABEÇALHO DA NOTA
select n.npre_not,n.bicm_not,n.vicm_not,n.* from sysdba.nota n where n.nota_not = 91156;
update sysdba.nota n set n.bicm_not = 799.80,n.vicm_not = 95.98 where n.nota_not = 91156;

--AJUSTA ITENS DA NOTA
select i.bicm_ino,vicm_ino,TRIB_INO,i.* from sysdba.inota i where i.npre_not =30101087;
update sysdba.inota i set i.bicm_ino=799.80,vicm_ino=95.98,TRIB_INO='000' where i.npre_not =30101087;