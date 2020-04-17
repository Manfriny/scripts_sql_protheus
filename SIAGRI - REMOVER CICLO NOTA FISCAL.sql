select CODI_CIC,n.* from sysdba.nota n where n.nota_not in (91917);
update sysdba.nota n set n.codi_cic=null where n.nota_not in (91917);