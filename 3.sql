CREATE OR REPLACE FUNCTION FN_TOTAL_VENDAS(
    P_DATA_INICIAL MAT_NOTAS.NOT_DATA%TYPE,
    P_DATA_FINAL   MAT_NOTAS.NOT_DATA%TYPE,
    P_COD_PRODUTO  MAT_PRODUTOS.PRO_COD%TYPE
)
RETURN NUMBER
IS
    TOTAL_VENDAS NUMBER(15,2);
BEGIN
    SELECT SUM(ITEM.IT_PRVENDA * ITEM.IT_QUANT) AS TOTAL_VENDAS
    FROM MAT_NOTAS NOTAS
    INNER JOIN MAT_ITENSNOTAS ITEM ON ITEM.NOT_NUM = NOTAS.NOT_NUM
    WHERE NOTAS.NOT_DATA BETWEEN P_DATA_INICIAL AND P_DATA_FINAL
    AND ITEM.PRO_COD = P_COD_PRODUTO;
    
    RETURN TOTAL_VENDAS;
END;