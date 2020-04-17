select  a.C6_LOCAL,a.C6_LOCALIZ,a.C6_LOTECTL,a.* from sc6010 a where c6_num='167812';
select  a.C9_LOCAL,a.C9_LOTECTL,a.C9_LOCAL,a.* from sc9010 a where c9_pedido='167812';

select * from sb2010 where b2_filial='0301' and b2_local='22' and B2_COD='010300076';
select * from sbj010 where bj_filial='0301' and bj_local='22' and bj_COD='010300076' and BJ_LOTECTL in ('G346','G230');
select * from sbk010 where bk_filial='0301' and bk_local='22' and bk_COD='010300076' and bk_LOTECTL in ('G346','G230');


/*
G346        239
G230        125