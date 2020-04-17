select n.ccfo_cfo,n.codi_top,n.* from nota n where codi_emp=7 and n.nota_not in (540,543) and n.seri_not=3;
update nota n set n.ccfo_cfo=555320,n.codi_top=45 where codi_emp=7 and n.nota_not in (540,543) and n.seri_not=3;


select i.ccfo_cfo,i.codi_top,i.* from inota i where i.npre_not in (30094287,30094334);
update inota i set i.ccfo_cfo=555320,i.codi_top=45 where i.npre_not in (30094287,30094334);



/*
45 CFOP 5553-20