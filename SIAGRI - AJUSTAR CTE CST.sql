select c.trib_csa,c.ctrc_csa,c.* from CTRCS c where c.codi_emp=10 and c.ctrc_csa=3402;
update CTRCS c set c.trib_csa='000' where c.codi_emp=10 and c.ctrc_csa=3402;