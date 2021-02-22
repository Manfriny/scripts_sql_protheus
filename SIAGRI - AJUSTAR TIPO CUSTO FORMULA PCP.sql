select f.tcus_for,f.* from formulatecnica f where f.codi_for in (56,55);
update formulatecnica f set f.tcus_for='CM' where f.codi_for in (56,55);
