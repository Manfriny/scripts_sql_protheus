--Cabeçalho da nota fiscal de Entrada
select 
trim(TOTVSLG_USER(sf1.F1_USERLGI)) usu_inclusao,
trim(TOTVSLG_DATA(sf1.F1_USERLGI)) dat_inclusao,
trim(TOTVSLG_USER(sf1.F1_USERLGA)) usu_alteracao,
trim(TOTVSLG_DATA(sf1.F1_USERLGA)) dat_alteracao,
sf1.F1_DOC,sf1.*  from SF1010 sf1 where F1_FILIAL in ('0301','0401','0402') and F1_DOC in ('065467','065470')
order by sf1.F1_DOC,sf1.F1_FILIAL;

-- Cadastro de TES
select 
trim(TOTVSLG_USER(sf4.f4_USERLGI)) usu_inclusao,
trim(TOTVSLG_DATA(sf4.f4_USERLGI)) dat_inclusao,
trim(TOTVSLG_USER(sf4.f4_USERLGA)) usu_alteracao,
trim(TOTVSLG_DATA(sf4.f4_USERLGA)) dat_alteracao,
sf4.*  from Sf4010 sf4 where f4_FILIAL in ('0301','0302') and f4_codigo in ('943')
order by sf4.f4_CODIGO,sf4.f4_FILIAL;