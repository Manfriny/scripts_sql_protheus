Define filial='0301';
Define safra='2016';
Define datainicial='20160101';
Define dtvalidadecorreta='20161231';

--comparar data de validade 
select distinct np9_lote lote,np9_prod produto,np9_data,np9_codsaf safra,np9_dtval validade_np9,b8_dtvalid validade_sb8,d5_dtvalid validade_sd5,d3_dtvalid validade_sd3 from np9010 np9
inner join sb8010 sb8 on np9.np9_filial=sb8.b8_filial and np9.np9_prod=sb8.b8_produto and np9.np9_lote=sb8.b8_lotectl
inner join sd3010 sd3 on np9.np9_filial=sd3.d3_filial and np9.np9_prod=sd3.d3_cod and np9.np9_lote=sd3.d3_lotectl 
inner join sd5010 sd5 on np9.np9_lote=sd5.d5_lotectl 
where np9.np9_filial='&filial' and np9.np9_codsaf='&safra' and np9.np9_tiplot='1'  and np9.np9_data>='&datainicial' 
and (np9.np9_dtval<>sb8.b8_dtvalid or np9.np9_dtval<>sd5.d5_dtvalid or np9.np9_dtval<>sd3.d3_dtvalid)
and np9.D_E_L_E_T_=' ' and sb8.D_E_L_E_T_=' ' and sd5.D_E_L_E_T_=' ' and sd3.D_E_L_E_T_=' '
order by np9.np9_data desc; 

UPDATE SB8010 SET B8_DTVALID='&dtvalidadecorreta' where  B8_DATA>='&datainicial' and B8_DTVALID<>'&dtvalidadecorreta'
and B8_lotectl in 
(select lote from (select distinct np9_lote lote,np9_prod produto,np9_data,np9_codsaf safra,np9_dtval validade_np9,b8_dtvalid validade_sb8,d5_dtvalid validade_sd5,d3_dtvalid validade_sd3 from np9010 np9
inner join sb8010 sb8 on np9.np9_filial=sb8.b8_filial and np9.np9_prod=sb8.b8_produto and np9.np9_lote=sb8.b8_lotectl
inner join sd3010 sd3 on np9.np9_filial=sd3.d3_filial and np9.np9_prod=sd3.d3_cod and np9.np9_lote=sd3.d3_lotectl 
inner join sd5010 sd5 on np9.np9_lote=sd5.d5_lotectl 
where np9.np9_filial='&filial' and np9.np9_codsaf='&safra' and np9.np9_tiplot='1'  and np9.np9_data>='&datainicial' 
and (np9.np9_dtval<>sb8.b8_dtvalid)
and np9.D_E_L_E_T_=' ' and sb8.D_E_L_E_T_=' ' and sd5.D_E_L_E_T_=' ' and sd3.D_E_L_E_T_=' '
order by np9.np9_data desc));

UPDATE SD5010 SET D5_DTVALID='&dtvalidadecorreta' where d5_data>='&datainicial' and D5_DTVALID<>'&dtvalidadecorreta'
and d5_lotectl in 
(select lote from (select distinct np9_lote lote,np9_prod produto,np9_data,np9_codsaf safra,np9_dtval validade_np9,b8_dtvalid validade_sb8,d5_dtvalid validade_sd5,d3_dtvalid validade_sd3 from np9010 np9
inner join sb8010 sb8 on np9.np9_filial=sb8.b8_filial and np9.np9_prod=sb8.b8_produto and np9.np9_lote=sb8.b8_lotectl
inner join sd3010 sd3 on np9.np9_filial=sd3.d3_filial and np9.np9_prod=sd3.d3_cod and np9.np9_lote=sd3.d3_lotectl 
inner join sd5010 sd5 on np9.np9_lote=sd5.d5_lotectl 
where np9.np9_filial='&filial' and np9.np9_codsaf='&safra' and np9.np9_tiplot='1'  and np9.np9_data>='&datainicial' 
and (np9.np9_dtval<>sd5.d5_dtvalid)
and np9.D_E_L_E_T_=' ' and sb8.D_E_L_E_T_=' ' and sd5.D_E_L_E_T_=' ' and sd3.D_E_L_E_T_=' '
order by np9.np9_data desc));

UPDATE SD3010 SET D3_DTVALID='20161231' where  d3_emissao>='&datainicial' and D3_DTVALID<>'&dtvalidadecorreta'
and d3_lotectl in 
(select lote from (select distinct np9_lote lote,np9_prod produto,np9_data,np9_codsaf safra,np9_dtval validade_np9,b8_dtvalid validade_sb8,d5_dtvalid validade_sd5,d3_dtvalid validade_sd3 from np9010 np9
inner join sb8010 sb8 on np9.np9_filial=sb8.b8_filial and np9.np9_prod=sb8.b8_produto and np9.np9_lote=sb8.b8_lotectl
inner join sd3010 sd3 on np9.np9_filial=sd3.d3_filial and np9.np9_prod=sd3.d3_cod and np9.np9_lote=sd3.d3_lotectl 
inner join sd5010 sd5 on np9.np9_lote=sd5.d5_lotectl 
where np9.np9_filial='&filial' and np9.np9_codsaf='&safra' and np9.np9_tiplot='1'  and np9.np9_data>='&datainicial' 
and (np9.np9_dtval<>sd3.d3_dtvalid)
and np9.D_E_L_E_T_=' ' and sb8.D_E_L_E_T_=' ' and sd5.D_E_L_E_T_=' ' and sd3.D_E_L_E_T_=' '
order by np9.np9_data desc));

