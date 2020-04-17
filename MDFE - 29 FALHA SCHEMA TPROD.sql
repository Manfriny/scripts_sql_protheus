--Cadastro do Veículo
SELECT
    da3.da3_cod           as "cInt",
    da3.da3_tipvei        as "Tipo",
    da3.da3_motori        as "Motorista*",
    trim(da4.da4_nome)    as "Nome",    
    da3.da3_renava        as "Renavan",
    da3.da3_placa         as "Placa*",
    da3.da3_tara          as "Tara*",
    da3.da3_capacm        as "capKG",
    dut.dut_tiprod        as "TpRod*",
    trim(sx5mu.x5_descri) as "Descri_TpRod",
    dut.dut_tipcar        as "TpCar*",
    trim(sx5mv.x5_descri) as "Desc_TpCar",
    da3.da3_estpla        as "UF*"
FROM
    da3010 da3
    inner join da4010 da4 on da4.da4_cod = da3.da3_motori 
    inner join dut010 dut on dut.dut_tipvei = da3.da3_tipvei
    inner join sx5010 sx5mu on sx5mu.x5_tabela = 'MU' and dut.dut_tiprod = sx5mu.x5_chave
    inner join sx5010 sx5mv on sx5mv.x5_tabela = 'MV' and dut.dut_tipcar = sx5mv.x5_chave
WHERE
    da3_cod = 'PQK9744';


--=====================================================================================================================
--Cadastro de Veículo
select * from da3010 where da3_cod='PQK9744';
--Cadastro do Tipo de Veículo = TpRod e TpCar
select * from DUT010 where dut_tipvei='09';
--Cadastro do Motorista
select * from da4010 where da4_cod='002867';
--Cadastro de Tipo Rodade
select * from sx5010 where X5_TABELA='MU';
--Cadastro de Tipo Carroceria
select * from sx5010 where X5_TABELA='MV';