--NOTAS
select * from nota nt where nt.CODI_EMP=1 and nt.SERI_NOT='3' and nt.NOTA_NOT=65998; -- NOTA DA EMPRESA (emitidas: entrada ou saida
SELECT * FROM NFENTRA NE WHERE NE.CODI_EMP=1 AND NE.NUME_NFE=65998 AND NE.SERI_NFE='3' AND NE.CODI_TRA=/*CODIGO DO FORNECEDOR*/;--NOTA LANÇADAS NO COMPRAS (nota de terceiros)
-- Nota de entrada ou saida pelo TIPO OPERACAO
select * from TIPOOPER t where t.CODI_TOP=11000168;

--Vinculo financeiro:  descobrir entrada/saida
select * from notacrc a where a.NDOC_NOC=65998 and a.SDOC_NOC='3' and a.CODI_EMP=1; --VINCULO RECEBER
select * from notacpg p where p.NDOC_NCP=65998 and p.SDOC_NCP='3' and p.CODI_EMP=1; --vinculo pagar

-- Encontrar o documento financeiro vinculado
select c.TDRL_CBR,c.SITU_CBR,c.* from cabrec c where c.CTRL_CBR=66061522;--CABEÇALHO DOC REC.
select * from receber r where r.CTRL_CBR=66061522;--parcelas do documento a receber
select pa.TDRL_CPG,pa.* from CABPAGAR pa where pa.CTRL_CPG=100039766;--CABEÇALHO A PAGAR
select * from pagar pg where pg.CTRL_CPG=100039766;--PARCELA A PAGAR

--DELETES' -- fazer backup do vinculo...
delete from notacrc a where a.ctrl_cbr=66061522; --DELETA VINCULO DA NOTA COM DOCUMENTO A RECEBER
delete from notacpg b where b.ctrl_cpg=100039766; --DELETA VINCULO DA NOTA COM DOCUMENTO A PAGAR

--UPDATES
--alterar a condição de venda na NOTA
update nota nt set nt.COND_CON=11000105 where nt.CODI_EMP=1 and nt.SERI_NOT='3' and nt.NOTA_NOT=65998; -- TROCA CONDIÇãO DE PAGAMENTO DA NOTA PARA 11000105 - campo controle da nota: NPRE_NOT
--mudar a origem do campo "RELACIONA-SE COM:" do que tiver, para "NENHUM no titulo errado.
update cabrec c set c.TDRL_CBR='NN' where c.CTRL_CBR=66061522;
update cabpagar d set d.TDRL_CPG='NN' where d.CTRL_CPG=100039766;
-- NN = Nenhum
-- NE = Nota Empresa - emissao propria
-- NT = Nota de Terceiro

--APOS AJUSTES, ABRIR O SIAGRI, CANCELAR OS DOCUMENTOS FINANCEIROS, NA FINAN2011 (REC) E FINAN2021 (PAG) -- PESQUISAR PELOS CAMPOS: 
--TIPO DE DOC - CODI_TDO
--FORNECEDOR - CODI_TRA
--NUM DOCUMENTO -  DOCU_CPG OU NUME_CBR+SERI_CBR  (GERALMENTE O NUMERO DA NOTA)

-- ENTRAR NA NOTA FISCAL (FATU2032) SE FOR "NE", CLICAR EM ALTERAR E DEPOIS EM GRAVAR, PARA GERAR O TITULO CORRETAMENTE












