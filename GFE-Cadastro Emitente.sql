select GU3_SIT,GU3_CDERP,GU3_CDCERP,trim(GU3_ENDER) as end ,GU3_IE,a.* from GU3010 a where GU3_CDERP='278989629' and GU3_CDCERP='06';
update GU3010 set GU3_SIT='1' where GU3_CDERP='278989629' and GU3_CDCERP='06';

select a1_msblql,a.* from sa1010 a where a1_cod='278989629';
select a2_msblql,a.* from sa2010 a where a2_cod='278989629';

