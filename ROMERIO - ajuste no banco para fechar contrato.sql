select d1.d1_ctrog,d1.d1_identb6,d1.d1_doc,d1.d1_serie,to_date(d1.d1_dtdigit,'YYYYMMDD') as d1_dtdigit ,d1.* from sd1010 d1 where d1.d1_filial='0302' 
and d1.d1_doc IN ('102252','102262','102282','102284','102286','102288','102293','102295','102327','102333','102337','102340','104286','109692','109696');
--000602
select d1.d1_ctrog,d1.d1_identb6,d1.d1_doc,d1.d1_serie,to_date(d1.d1_dtdigit,'YYYYMMDD') as d1_dtdigit ,d1.* from sd1010 d1 where d1.d1_filial='0302' and d1.d1_doc IN ( 
'102252',
'102262',
'102282',
'102284',
'102286',
'102288',
'102293',
'102295',
'102327',
'102333',
'102337',
'102340' 
);

update sd1010 d1 set d1.d1_ctrog='000632' where d1.d1_filial='0302' and d1.d1_doc IN ( 
'102252',
'102262',
'102282',
'102284',
'102286',
'102288',
'102293',
'102295',
'102327',
'102333',
'102337',
'102340' 
);


select d1.d1_ctrog,d1.d1_identb6,d1.d1_doc,d1.d1_serie,to_date(d1.d1_dtdigit,'YYYYMMDD') as d1_dtdigit ,d1.* from sd1010 d1 where d1.d1_filial='0302' and d1.d1_doc IN ( 
'109692',   
'109696'   
);
--000635
update sd1010 d1 set d1.d1_ctrog='000632' where d1.d1_filial='0302' and d1.d1_doc IN ( 
'109692',   
'109696'   
);






select d1.d1_ctrog,d1.d1_doc,d1.d1_serie,to_date(d1.d1_dtdigit,'YYYYMMDD') as d1_dtdigit,d1.d1_quant,d1.d1_qtdedev ,d1.* from sd1010 d1 where d1.d1_filial='0302' and d1.d1_ctrog='000632' and d1.d1_cod='020500003' and d1.d_e_l_e_t_=' ';
select d1.d1_ctrog,sum(d1.d1_quant) from sd1010 d1 where d1.d1_filial='0302' and d1.d1_ctrog='000632' and d1.d1_cod='020500003' GROUP BY d1.d1_ctrog;

select f4.f4_tesdv,f4.* from sf4010 f4 where f4_filial='0302' and F4_CODIGO in ('260','261');

/*
d1_sdoc (serie doc)
d1_sldexp

*/

select f1.f1_doc,f1.* from sf1010 f1 where f1.f1_filial='0302' and f1.f1_doc in (select d1.d1_doc from sd1010 d1 where d1.d1_filial='0302' and d1.d1_ctrog='000632' and d1.d1_cod='020500003' and d1.d_e_l_e_t_=' ') order by f1.f1_doc;

select d1.d1_doc,d1.* from sd1010 d1 where d1.d1_filial='0302' and d1.d1_doc in ('109692','104286','102382');
select b6.* from sb6010 b6 where b6.b6_filial='0302' and b6.b6_produto='020500003' and b6.b6_ident in ('99LPTG','99M4FK','99OP37') and b6.d_e_l_e_t_=' ';



