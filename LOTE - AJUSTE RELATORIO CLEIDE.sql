--Endereços de Lotes
select * from NP9010 where NP9_LOTE='DF1211457518'; and D_E_L_E_T_= ' ';


-- Movimentos Internos - Transferencias
select * from SD3010 where D3_LOTECTL='DF1211457518' and ((D3_LOCAL='25' and D3_NUMSEQ='847312' and D_E_L_E_T_=' ') OR (D3_LOCAL='43' and D3_NUMSEQ='851026' and D_E_L_E_T_=' '));
update SD3010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where D3_LOTECTL='DF1211457518' and ((D3_LOCAL='25' and D3_NUMSEQ='847312' and D_E_L_E_T_=' ') OR (D3_LOCAL='43' and D3_NUMSEQ='851026' and D_E_L_E_T_=' '));

-- Verificar Saldo por Lote
select * from SBF010 where BF_LOTECTL='DF1211457518' and D_E_L_E_T_=' ';
update SBF010 set D_E_L_E_T_='*',R_E_C_D_E_L_=R_E_C_N_O_ where BF_LOTECTL='DF1211457518' and D_E_L_E_T_=' ';

-- Movimento Interno por ENDERECO
select * from SDB010 where DB_FILIAL='0301' and DB_PRODUTO='010300063' and DB_LOTECTL='DF1211457518' and ((DB_LOCAL='25' and DB_NUMSEQ='847312' and D_E_L_E_T_=' ') OR (DB_LOCAL='43' and DB_NUMSEQ='851026' and D_E_L_E_T_=' '));
update SDB010 set D_E_L_E_T_='*' where DB_FILIAL='0301' and DB_PRODUTO='010300063' and DB_LOTECTL='DF1211457518' and ((DB_LOCAL='25' and DB_NUMSEQ='847312' and D_E_L_E_T_=' ') OR (DB_LOCAL='43' and DB_NUMSEQ='851026' and D_E_L_E_T_=' '));

update SDB010 set D_E_L_E_T_=' ' where DB_FILIAL='0301' and DB_PRODUTO='010300063' and DB_LOTECTL='DF1211457518' and ((DB_LOCAL='25' and DB_NUMSEQ='847312' and D_E_L_E_T_=' ') OR (DB_LOCAL='43' and DB_NUMSEQ='851026' and D_E_L_E_T_=' '));

--- Movimento Interno por Lote
select * from SD5010 where D5_FILIAL='0301' and D5_PRODUTO='010300063' and D5_LOTECTL='DF1211457518' and ((D5_LOCAL='25' and D5_NUMSEQ='847312' and D_E_L_E_T_=' ') OR (D5_LOCAL='43' and D5_NUMSEQ='851026' and D_E_L_E_T_=' '));
update SD5010 set D_E_L_E_T_='*' where D5_FILIAL='0301' and D5_PRODUTO='010300063' and D5_LOTECTL='DF1211457518' and ((D5_LOCAL='25' and D5_NUMSEQ='847312' and D_E_L_E_T_=' ') OR (D5_LOCAL='43' and D5_NUMSEQ='851026' and D_E_L_E_T_=' '));