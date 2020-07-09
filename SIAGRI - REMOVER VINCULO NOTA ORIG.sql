select n.ccfo_cfo,n.codi_top,n.* from sysdba.nota n where n.codi_emp=9 and n.nota_not in (1575);
update sysdba.nota n set CCFO_CFO=694913,CODI_TOP=297 where n.codi_emp=9 and n.nota_not in (1575);

select i.ccfo_cfo,i.codi_top,i.* from sysdba.inota i where i.npre_not in (30127405);
update sysdba.inota i set CCFO_CFO=694913,CODI_TOP=297 where i.npre_not in (30127405);


select * from sysdba.notaorig g where g.notd_nfr in (30127405);
--Gerar o backup exportando o INSERT primeiro.
delete from sysdba.notaorig g where g.notd_nfr in (30127405);