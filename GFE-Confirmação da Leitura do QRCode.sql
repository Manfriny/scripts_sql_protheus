select * from NJ6010;
select * from ZS8010;

--============================================================

--GFEE006 - Leitura QRCode:
 select 
nj6.NJ6_QTDE,
                (SELECT NVL(SUM(ZS8.ZS8_QUANT),0)                                
                FROM ZS8010 ZS8 WHERE ZS8.D_E_L_E_T_  =' '                       
                AND ZS8.ZS8_FILIAL=nj6.NJ6_FILIAL                         
                AND ZS8.ZS8_ORDEMC=nj6.NJ6_CODCAR||nj6.NJ6_SEQCAR         
                AND ZS8.ZS8_PROD=nj6.NJ6_PRODUT                           
                AND ZS8.ZS8_LOTE=nj6.NJ6_LOTECT                           
                AND ZS8.ZS8_PEDIDO=nj6.NJ6_NUMPV                          
                AND ZS8.ZS8_ITEMPV=nj6.NJ6_ITEM                           
                AND ZS8.ZS8_SEQPV=nj6.NJ6_SEQUEN                          
                AND ZS8.ZS8_LOCAL=nj6.NJ6_LOCAL) as ZS8_QTDE 						
                
from NJ6010 nj6 										
WHERE nj6.D_E_L_E_T_ =' ' AND nj6.NJ6_CODCAR='010178' and nj6.NJ6_SEQCAR='01'; 

select * from nj6010 nj6 where nj6.D_E_L_E_T_ =' ' AND nj6.NJ6_CODCAR='010178';
select * from zs8010 where ZS8_ORDEMC='010178' and ZS8_PEDIDO='178844' and D_E_L_E_T_=' ';

select * from NJ6010 where NJ6_CODCAR='005226' and NJ6_SEQCAR='01' and D_E_L_E_T_=' '; 
select * from ZS8010 where ZS8_ORDEMC='00023583' and ZS8_PEDIDO='197487' and D_E_L_E_T_=' ';
--update ZS8010 set D_E_L_E_T_='*' where ZS8_ORDEMC='00522601' and ZS8_PEDIDO='178844' and D_E_L_E_T_=' ';

select * from GWV010 where GWV_NRMOV = '00017096';
select * from GX3010 where GX3_NRMOV  = '00017096';
select * from GX3010 where GX3_XPLACA  = 'PQJ8266' and GX3_DTCRIA='20190430';  --ACHAR NUMERO MOVIMENTO
select * from GX5010 where GX5_CDPTCT = 'ARM.SEL.LOTES   ' and GX5_NRMOV='00017096';
--update GX5010 set GX5_RESPOS='1' where GX5_CDPTCT = 'ARM.SEL.LOTES   ' and GX5_NRMOV='00017096';
select * from Gx5010 where GX5_NRMOV='00017096';

select * from ZS8010 where zs8_filial='0301' and ZS8_ORDEMC like '%005226%' and ZS8_PEDIDO in ('178844'); and D_E_L_E_T_=' ';

select * from NJS010 where NJS_CHAVE like '%003413%' and D_E_L_E_T_=' ';
--update NJS010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where R_E_C_N_O_=12235;

select * from sc9010 where c9_filial='0301' and c9_pedido='164167';
select * from DAI010 where DAI_PEDIDO='173890';
select * from dak010 where dak_cod='003967';

update DAI010 set D_E_L_E_T_=' ',R_E_C_D_E_L_=0 where R_E_C_N_O_=6767;


select * from nj5010 where NJ5_NUMPV='173890';