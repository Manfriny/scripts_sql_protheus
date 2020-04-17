select sd3.d_e_l_e_t_,sd3.r_e_c_n_o_,sd3.r_e_c_d_e_l_,sd3.d3_doc,sd3.d3_numseq,sd3.d3_estorno,sd3.* from sd3010 sd3 where sd3.d3_filial='0301' and d3_numseq='99GGW9';
update sd3010 sd3 set sd3.d_e_l_e_t_='*',r_e_c_d_e_l_=sd3.r_e_c_n_o_ where sd3.d3_filial='0301' and d3_numseq='99GGW9';

select sd5.d_e_l_e_t_,sd5.d5_doc,sd5.d5_numseq,sd5.d5_estorno,sd5.* from sd5010 sd5 where sd5.d5_filial='0301' and sd5.d5_numseq='99GGW9';
update sd5010 sd5 set sd5.d_e_l_e_t_='*' where sd5.d5_filial='0301' and sd5.d5_numseq='99GGW9';

select sdb.d_e_l_e_t_,sdb.db_doc,sdb.db_numseq,sdb.db_estorno,sdb.* from sdb010 sdb where sdb.db_filial='0301' and db_numseq='99GGW9';
update sdb010 sdb set sdb.d_e_l_e_t_='*' where sdb.db_filial='0301' and db_numseq='99GGW9';

select * from sd3010 where d3_numseq='99GGW9'

/*
SELECT sb8.b8_doc,sb8.* FROM sb8010 sb8 WHERE sb8.b8_filial = '0301' AND sb8.b8_produto = '011500015' AND sb8.b8_local = '41' AND sb8.b8_lotectl = 'MN951365019    ' AND sb8.d_e_l_e_t_ = ' ';
SELECT * FROM sbf010 sbf WHERE sbf.bf_filial = '0301' AND sbf.bf_localiz = 'GERAL' AND sbf.bf_lotectl = 'MN951365019' AND sbf.bf_produto = '011500015' AND sbf.bf_local = '41' AND sbf.d_e_l_e_t_ = ' ';