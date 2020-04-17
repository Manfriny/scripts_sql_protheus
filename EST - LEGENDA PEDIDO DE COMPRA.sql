/*LINK =>  http://consultadvpl.blogspot.com/2016/05/com-legendas-pc.html    */

--442929

select C7_QTDACLA,C7_RESIDUO,C7_CONTRA,C7_CONAPRO,a.* from sc7010 a where c7_filial='0301' and c7_num='443446';

select d_e_l_e_t_,d1_doc,d1_pedido,d1_tes,d1_fornece,a.* from sd1010 a where d1_pedido='443446';
select r_e_c_n_o_,d_e_l_e_t_,f1_status,F1_FILIAL, F1_DOC, F1_SERIE, F1_FORNECE, F1_LOJA, F1_FORMUL, R_E_C_D_E_L_,a.* from sf1010 a where f1_filial='0301' and f1_doc='000117348' and f1_fornece='37630118' ;and d_e_l_e_t_=' ';
select r_e_c_n_o_,d_e_l_e_t_,d1_Tes,d1_FILIAL, d1_DOC, d1_SERIE, d1_FORNECE, d1_LOJA, d1_FORMUL, R_E_C_D_E_L_,a.* from sd1010 a where d1_filial='0301' and d1_doc='000117348' and d1_fornece='37630118' ;and d_e_l_e_t_=' ';
update sf1010 set f1_status='A' where r_e_c_n_o_=153792;

--===== Pedido legenda VERDE - pendente =====
select C7_QUJE,C7_QTDACLA,C7_RESIDUO,C7_CONTRA,C7_CONAPRO,a.* from sc7010 a where c7_filial='0301' and c7_num='443446';
/* C7_QUJE==0 .And. C7_QTDACLA==0.And.Empty(C7_RESIDUO).AND.Empty(C7_CONTRA).AND. C7_CONAPRO<>"B" */
update sc7010 set C7_QUJE=0,C7_QTDACLA=0,C7_RESIDUO=' ' ,C7_CONTRA=' ' where c7_filial='0301' and c7_num='443446';

--===== Pedido legenda AMARELO - parcialmente atendido =====
/* C7_QUJE<>0.And.C7_QUJE<C7_QUANT.AND. Empty(C7_RESIDUO).AND.Empty(C7_CONTRA).AND. C7_CONAPRO<>"B" */

--===== Pedido legenda VERMELHO - total atendido =====
select C7_QTDACLA,C7_RESIDUO,C7_CONTRA,C7_CONAPRO,a.* from sc7010 a where c7_filial='0301' and c7_num='442929';
/* C7_QUJE>=C7_QUANT.AND. Empty(C7_RESIDUO).AND.Empty(C7_CONTRA).AND. C7_CONAPRO<>"B" */
update sc7010 set c7_qtdacla=c7_quant where c7_filial='0301' and c7_num='442929';

--===== Pedido legenda LARANJA - em pre nota =====
select C7_QUJE,C7_QTDACLA,C7_RESIDUO,C7_CONTRA,C7_CONAPRO,a.* from sc7010 a where c7_filial='0301' and c7_num='443024';
/* C7_QTDACLA >0.And.Empty(C7_RESIDUO).AND.Empty(C7_CONTRA).AND. C7_CONAPRO<>"B" */

--===== Pedido legenda AZUL/MARROM/X - Bloqueado/Devolvido/Reprovado =====
/* C7_ACCPROC<>"1" .And.  C7_CONAPRO=="B".And.C7_QUJE < C7_QUANT.AND. Empty(C7_RESIDUO) */

--===== Pedido legenda BRANCO - gerado do GCT =====
/* !Empty(C7_CONTRA).And.Empty(C7_RESIDUO) */

--===== Pedido legenda CINZA - residuo eliminado =====
/* !Empty(C7_RESIDUO) */


select d_e_l_e_t_,f1_doc,a.* from sf1010 a where f1_filial='0301' and f1_doc='000023204';
select d_e_l_e_t_,d1_doc,d1_pedido,a.* from sd1010 a where d1_filial='0301' and d1_doc='000023204';


