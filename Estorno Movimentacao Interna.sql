select 
totvslg_user(a.d3_userlgi) as usu_inclusao,
totvslg_data(a.d3_userlgi) as dat_inclusao,
totvslg_user(a.d3_userlga) as usu_altera,
totvslg_data(a.d3_userlga) as dat_altera,
d3_numseq,
d_e_l_e_t_,a.* from sd3010 a where d3_numseq='99F1TL' order by d3_emissao;

MATR435 - kardex por lote