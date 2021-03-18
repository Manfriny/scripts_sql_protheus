update notaorigentreemp k
set k.tipo_noe = 'RE'
where k.tipo_noe = 'OR'
and (exists(select a.*
              from nfentra a
              where a.demi_nfe >= '01/03/2021' -- ate dia 16
              and a.ccfo_cfo = '115221'
              and a.codi_emp = k.emde_noe
              and a.codi_tra = k.trad_noe 
              and a.nume_nfe = k.notd_noe 
              and a.seri_nfe = k.serd_noe));