select * from nota n where n.codi_emp=6 and n.nota_not=1329 and n.seri_not=3;

select i.lote_lot,i.* from inota i where i.npre_not=30101218;

select * from movlotne m where m.npre_not=30101218 ;

--abrir a tela fatu2032 de notas de saida, ir na aba 4-Doc Relacionados e usar as notas ja devolvidas no select abaixo 

--select * from (
select * from movlotnt mt where mt.codi_psv=01020279 and mt.codi_emp=6 and NUME_NFE in (
83794,
83854,
83878,
83905,
83935,
83938,
84152,
84283,
84412,
84437,
84469,
84629,
84765,
84966,
85138
)
--) where LOTE_LOT='SFH00532'
;