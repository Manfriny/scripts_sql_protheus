--Remover vinculo da NFT do Romaneio.
select d_e_l_e_t_,a.* from nk2010 a where nk2_codent='001363071' and nk2_placa='DRC2600' and NK2_NUMNFT='006809';
update nk2010 set d_e_l_e_t_='*',r_e_c_d_e_l_=r_e_c_n_o_ where nk2_codent='001363071' and nk2_placa='DRC2600' and NK2_NUMNFT='006809';


--Cabeçalho Romaneio
select njj.njj_docnum,njj.njj_docser,njj.njj_nfpnum,njj.njj_nfpser,njj.* from njj010 njj where njj.njj_filial='0401' and njj.njj_codrom='0000032091';
--Alterar numero da nota fiscal do romaneio
update njj010 njj set njj.njj_docnum='090514' where njj.njj_filial='0401' and njj.njj_codrom='0000032091';

--Itens Romaneio
select njm.njm_docnum,njm.njm_docser,njm.njm_pedido,njm.njm_nfpnum,njm.njm_nfpser,njm.* from njm010 njm where njm.njm_filial='0401' and njm.njm_codrom='0000032091';
--Alterar numero da nota fiscal do romaneio
update njm010 njm set njm.njm_docnum='090514' where njm.njm_filial='0401' and njm.njm_codrom='0000032091';
