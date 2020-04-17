--NOTA--
select f1.F1_DOC,f1.F1_FORNECE,f1.F1_CLIORI,f1.F1_CLIDEST,f1.* from SF1010 f1 where F1_FILIAL='0401' and F1_DOC='000219357';
select D1_DOC,D1_TES,d1.D1_PEDIDO,d1.* from SD1010 d1 where D1_FILIAL='0401' and D1_DOC ='000219357';
select * from SF3010 where F3_FILIAL='0401' and F3_NFISCAL='000219357';
select * from SFT010 where FT_FILIAL='0401' and FT_NFISCAL='000219357';
select e2.E2_NATUREZ,e2.* from SE2010 e2 where E2_FILIAL='0401' and E2_NUM='000219357' and e2.E2_TIPO='NF';
--=============================================================================================================================
--NATUREZA
select 
    decode(ED_CALCPIS,'S','SIM','N','NAO','nulo') as Calcula_PIS,
    ED_PERCPIS as Percentual_PIS,
    decode(ED_CALCCOF,'S','SIM','N','NAO','nulo') as Calcula_COFINS,
    ED_PERCCOF as Percentual_COFINS,
    decode(ED_CALCCSL,'S','SIM','N','NAO','nulo') as Calcula_CSLL,
    ED_PERCCSL as Percentual_CSLL,
    ed.* from SED010 ed where ED_CODIGO='241301';
--ED_CALCPIS -> Calcula PIS (S/N)?        -> S=Sim;N=Nao
--ED_PERCPIS -> Porcentual PIS            -> 
--ED_CALCCOF -> Calcula COFINS (S/N)?     -> S=Sim;N=Nao
--ED_PERCCOF -> Porcentual COFINS         -> 
--ED_CALCCSL -> Calcula CSLL (S/N)?       -> S=Sim;N=Nao
--ED_PERCCSL -> Porcentual CSLL           -> 
--=============================================================================================================================
--TES 
select 
    decode(F4_PISCOF,'1','PIS','2','COFINS','3','Ambos','4','Nao Considera','Nao Preenchido')                             as Gera_PIS_COFINS,
    decode(F4_PISCRED,'1','Credita','2','Debita','3','Nao Calcula','4','Calcula','5','Exclusao de Base','Nao Preenchido') as Credita_PIS_COFINS,
    decode(F4_DUPLIC,'S','Sim','N','Nao','Nao Preenchido')                                                                as Gerar_Duplicata, 
    f4.* 
from SF4010 f4 where F4_FILIAL='0401' and F4_CODIGO='110';
--F4_PISCOF  -> Define se gera PIS/COFINS -> 1=PIS;2=COFINS;3=Ambos;4=Nao Considera
--F4_PISCRED -> Credita PIS/COFINS        -> 1=Credita;2=Debita;3=Nao Calcula;4=Calcula;5=Exclusao de Base
--F4_DUPLIC  -> Gerar Duplicata           -> S=Sim;N=Nao
--=============================================================================================================================
--PRODUTO
select 
    decode(B1_PIS,'1','Sim','2','Nao','Nao Preenchido') as Efetua_Retencao_PIS,
    decode(B1_COFINS,'1','Sim','2','Nao','Nao Preenchido') as Efetua_Retencao_COFINS,
    decode(B1_CSLL,'1','Sim','2','Nao','Nao Preenchido') as Efetua_Retencao_CSLL,
    decode(B1_RETOPER,'1','Sim','2','Nao','Nao Preenchido') as Retem_PIS_COFINS_Operacao,
    b1.* 
from SB1010 b1 where B1_COD in ('940200445','940200472','940200473');
--B1_PIS     -> Efetua a retencao-PIS     -> 1=Sim;2=Nao
--B1_COFINS  -> Efetua a retencao-COFINS  -> 1=Sim;2=Nao
--B1_CSLL    -> Efetua a Retencao-CSLL    -> 1=Sim;2=Nao
--B1_RETOPER -> Retem PIS/COFINS operacao -> 1=Sim;2=Nao
--=============================================================================================================================
--FORNECEDOR
select 
    decode(A2_RECPIS,'1','Sim','2','Nao','Nao Preenchido')  as Recolhimento_PIS,
    decode(A2_RECCOFI,'1','Sim','2','Nao','Nao Preenchido') as Recolhimento_COFINS,
    decode(A2_RECCSLL,'1','Sim','2','Nao','Nao Preenchido') as Recolhimento_CSLL,
    a2.* 
from SA2010 a2 where A2_COD='00289348';
--A2_RECPIS  -> Recolhimento do PIS       -> 1=Sim;2=Nao                                                                                                                     
--A2_RECCOFI -> Recolhimento do COFINS    -> 1=Sim;2=Nao                                                                                                                     
--A2_RECCSLL -> Recolhimento do CSLL      -> 1=Sim;2=Nao                                                                                                                     
--=============================================================================================================================
--CLIENTE
select 
    decode(A1_RECPIS,'1','Sim','2','Nao','Nao Preenchido') as Recolhe_PIS,
    decode(A1_RECCOFI,'1','Sim','2','Nao','Nao Preenchido') as Recolhe_COFINS,
    decode(A1_RECCSLL,'1','Sim','2','Nao','Nao Preenchido') as Recolhe_CSLL,
    decode(A1_ABATIMP,'1','Calculo do Sistema','2','Efetua Retencao','3','Nao Efetua Retencao','Nao Preenchido') as Modo_Abatim_Imposto,
    a1.*
from SA1010 a1 where A1_COD='11096304';
--A1_RECPIS  -> Recolhe PIS?              -> S=Sim;N=Nao;P=Empresa Publica
--A1_RECCOFI -> Recolhe COFINS?           -> S=Sim;N=Nao;P=Empresa Publica
--A1_RECCSLL -> Recolhe CSLL?             -> S=Sim;N=Nao;P=Empresa Publica
--A1_ABATIMP -> Modo Abatim. Imposto      -> 1=Calculo do Sistema;2=Efetua Retencao;3=Nao efetua retencao

--=============================================================================================================================
/*Par�metros referentes � reten��o PIS/COFINS/CSLL - Lei 10.925 
MV_RF10925: Data de refer�ncia inicial, para que os novos procedimentos quanto � reten��o de PIS/COFINS/CSLL sejam aplicados) = 26/07/04
MV_VL10925: Valor m�ximo de pagamentos no per�odo para dispensa da reten��o de PIS/COFINS/CSLL = 5000
MV_RT10925: Modo padr�o de opera��o do Sistema quanto � reten��o de PIS/COFINS/CSLL. (1=Calculado p/sistema, 2=Efetua Reten��o sempre - 3=N�o efetua reten��o) = 1
MV_AC10925: Controle de permiss�o para que o usu�rio altere o modo de reten��o na janela c�lculo de reten��o - 1=Permite altera��o - 2= N�o permite altera��o = 1
MV_AB10925: Modo de reten��o do PIS,COFINS e CSLL p/ C.Receber 1=Verif.reten��o pelo valor da nota emitida - 2=Verif.reten��o p/soma notas emitidas no per�odo = 2
MV_MT10925: Verifica base de reten��o pelo total ou apenas pelos t�tulos que retiveram impostos.1=Todos 2=Somente os que retiveram PIS etc = 1
MV_BX10925 (Entrada): Define o momento do tratamento da reten��o dos impostos PIS COFINS e CSLL. 1= Na Baixa ou 2 = Na Emiss�o
MV_BR10925 (Sa�da): Define o momento do tratamento da reten��o dos impostos PIS COFINS e CSLL. 1= Na Baixa ou 2 = Na Emiss�o
MV_BS10925: Indica se o c�lculo da reten��o ser� sobre a base do PIS/COFINS/CSLL ou pelo valor total da duplicata. 1=Valor da base; 2=Valor total = 2
MV_LJ10925: Considerar para verifica��o de valores de reten��o os valores de todas as lojas do cliente. Op��es: 1 = Loja atual ou 2 = Todas as lojas = 2
MV_VRETPIS: Valor m�nimo para dispensa de reten��o de PIS = 0.00
MV_VRETCOF: Valor m�nimo para dispensa de reten��o de COFINS = 0.00
MV_VRETCSL: Valor m�nimo para dispensa de reten��o de CSLL = 0.00
MV_RATPIS: Rateio do imposto na entrada - T. (Default) para ratear os impostos e .F. para N�O ratear.
MV_RATCOF: Rateio do imposto na entrada - .T. (Default) para ratear os impostos e .F. para N�O ratear.
MV_RATCSLL: Rateio do imposto na entrada - .T. (Default) para ratear os impostos e .F. para N�O ratear.
MV_PISNAT: Natureza para titulos referentes ao PIS : "PIS"
MV_COFINS: Natureza para titulos referentes a COFINS : "COFINS"
MV_CSLL: Natureza de Titulos de Pagamento de CSLL : "CSLL"
MV_AG10925: Indica se os impostos do PCC serao aglutinados em um titulo apenas quando ocorrerem os tres impostos num mesmo titulo. 1=Aglutina ou 2=Nao Aglutina 2

OBS:  Os par�metros referente � Lei 10.925 devem permanecer conforme sugerido acima.

--=============================================================================================================================
Par�metros referentes � reten��o PIS/COFINS/CSLL - Lei 13.137
Adequa��o do Protheus para atender as altera��es de regras de c�lculo do Pis, Cofins e Csll de acordo com a Lei 13137/15 | Lei n� 13.137, de 19 de junho de 2015 vigente a partir do dia 22/06/2015.

MV_VL13137: Define o valor m�nimo para reten��o do Pis/Cofins/Csll de acordo com a Lei 13.137 = 10.00
MV_VCPCCP: Qual a data que sera considerada para a cumulatividade do PCC na Emissao. 1=Emissao, 2=Venc.Real, 3=Dt Contab.
MV_VCPCCR: Qual a data que sera considerada para a cumulatividade do PCC na Emissao. 1=Emissao, 2=Venc.Real, 3=Dt Contab.























