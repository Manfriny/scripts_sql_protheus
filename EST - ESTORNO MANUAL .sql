select B2_QACLASS,a.* from sb2010 a where b2_filial='0301' and b2_cod='010800181' and b2_local='43';
update sb2010 set B2_QACLASS=0 where b2_cod='040300058' and b2_local='43';
select sd3.d_e_l_e_t_,sd3.r_e_c_n_o_,sd3.d3_estorno,sd3.d3_cod,sd3.d3_local,sd3.d3_lotectl,sd3.* from sd3010 sd3 where sd3.d3_filial='0401' and sd3.d3_cod='012500268' and sd3.d3_local='26' and sd3.d3_lotectl='UFM01333'; and sd3.d3_numseq='99EYFS';
--update sd3010 sd3 set sd3.d3_estorno='S' where sd3.r_e_c_n_o_=634765;
--update sd3010 sd3 set sd3.d_e_l_e_t_='*',sd3.r_e_c_d_e_l_=sd3.r_e_c_n_o_ where sd3.d3_filial='0301' and sd3.d3_numseq='99GGW9';

select sd5.d_e_l_e_t_,sd5.r_e_c_n_o_,sd5.d5_estorno,sd5.d5_produto,sd5.d5_local,sd5.d5_lotectl,sd5.* from sd5010 sd5 where sd5.d5_filial='0301' and sd5.d5_produto='010300137' and sd5.d5_local='26' and sd5.d5_lotectl='DC252462519' and sd5.d5_numseq='99EYFS';
--update sd5010 sd5 set sd5.d5_estorno='S' where sd5.r_e_c_n_o_=335766;
--update sd5010 sd5 set sd5.d_e_l_e_t_='*' where sd5.d5_filial='0301' and sd5.d5_numseq='99GGW9';

select sdb.d_e_l_e_t_,sdb.r_e_c_n_o_,sdb.db_estorno,sdb.db_produto,sdb.db_local,sdb.db_lotectl,sdb.* from sdb010 sdb where sdb.db_filial='0301' and sdb.db_produto='010300137' and sdb.db_local='26' and sdb.db_lotectl='DC252462519' and sdb.db_numseq='99EYFS';
--update sdb010 set db_estorno='S' where r_e_c_n_o_=299827;
--update sdb010 sdb set sdb.d_e_l_e_t_='*' where sdb.db_filial='0301' and db_numseq='99GGW9';

select a.d_e_l_e_t_,a.r_e_c_n_o_,a.* from sb8010 a where b8_filial='0301' and a.b8_produto='040300058' and a.b8_local='43' and a.b8_lotectl='059194500' and a.d_e_l_e_t_=' ';
--update sb8010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where r_e_c_n_o_=69203;


select a.d_e_l_e_t_,a.r_e_c_n_o_,a.* from sbf010 a where bf_filial='0301' and a.bf_produto='040300058' and a.bf_local='43' and a.bf_lotectl='059194500' and a.d_e_l_e_t_=' ';
--update sbf010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where r_e_c_n_o_=2582223;





--CONSULTA PELO NUMERO SEQUENCIAL -- 99LDGL 99LDGZ [99LDGO (99LDMW)] 99LDGN
select sd3.d_e_l_e_t_,sd3.r_e_c_n_o_,sd3.d3_estorno,sd3.d3_cod,sd3.d3_local,sd3.d3_lotectl,sd3.* from sd3010 sd3 where sd3.d3_numseq='99LDGN';
update sd3010 sd3 set sd3.d_e_l_e_t_='*',sd3.r_e_c_d_e_l_=sd3.r_e_c_n_o_ where sd3.d3_numseq='99LDGN';
update sd3010 sd3 set sd3.d3_estorno='S' where sd3.d3_numseq='99LDGN';
select sd5.d_e_l_e_t_,sd5.r_e_c_n_o_,sd5.d5_estorno,sd5.d5_produto,sd5.d5_local,sd5.d5_lotectl,sd5.* from sd5010 sd5 where sd5.d5_numseq='99LDGN';
update sd5010 sd5 set sd5.d_e_l_e_t_='*'  where sd5.d5_numseq='99LDGN';
update sd5010 sd5 set sd5.d5_estorno='S'  where sd5.d5_numseq='99LDGN';
select sdb.d_e_l_e_t_,sdb.r_e_c_n_o_,sdb.db_estorno,sdb.db_produto,sdb.db_local,sdb.db_lotectl,sdb.* from sdb010 sdb where sdb.db_numseq='99LDGN';
update sdb010 sdb set sdb.d_e_l_e_t_='*' where sdb.db_numseq='99LDGN';
update sdb010 sdb set sdb.db_estorno='S' where sdb.db_numseq='99LDGN';
select sda.d_e_l_e_t_,sda.r_e_c_n_o_,sda.da_produto,sda.da_local,sda.da_lotectl,sda.* from sda010 sda where sda.da_numseq='99LDGN';
update sda010 sda set sda.d_e_l_e_t_='*' where sda.da_numseq='99LDGN';
select np9.d_e_l_e_t_,np9.* from np9010 np9 where np9.np9_lote='059194500' and NP9_LOCAL='43';
update np9010 np9 set np9.d_e_l_e_t_='*',np9.r_e_c_d_e_l_=np9.r_e_c_n_o_ where np9.np9_lote='059194500' and NP9_LOCAL='43';

--TABELA DE LAN�AMENTO DE PERDAS
select d_e_l_e_t_,bc_locorig,a.* from sbc010 a where BC_SEQSD3 in ('99LDGL');
update sbc010 set d_e_l_e_t_='*' where BC_SEQSD3 in ('99L8YH', '99L4LK', '99L477', '99L58U', '99L47X', '99L47Z', '99L8OA', '99L49J', '99L4A9');

--
select r_e_c_n_o_,a.* from sbj010 a where bj_filial='0301' and bj_cod='010300087' and bj_local='25' and bj_lotectl='DP1654762519' order by bj_data desc;
update sbj010 set d_e_l_e_t_='*', r_e_c_d_e_l_=r_e_c_n_o_ where r_e_c_n_o_=23087801;

select d_e_l_e_t_,a.* from np9010 a where np9_lote='DN2000360020';
update np9010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where np9_lote='DN2000360020' and NP9_LOCAL='43';