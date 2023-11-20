CREATE OR REPLACE PROCEDURE EX2 (p_hosp_cod IN NUMBER)
IS
  v_qtd_diarias NUMBER(3);
  v_valor_diaria NUMBER(12,2);
  v_valor_consumo NUMBER(15,2);
  v_valor_total NUMBER(15,2);
BEGIN
  -- Calcula a quantidade de diárias
  SELECT TRUNC(hosp_data_saida) - TRUNC(hosp_data_entrada) + 1
  INTO v_qtd_diarias
  FROM hospedagem
  WHERE hosp_cod = p_hosp_cod;
  
  -- Calcula o valor da diária da categoria
  SELECT cat_valor_diaria
  INTO v_valor_diaria
  FROM quarto
  INNER JOIN categoria ON quarto.cat_cod = categoria.cat_cod
  INNER JOIN hospedagem ON quarto.qua_cod = hospedagem.qua_cod
  WHERE hospedagem.hosp_cod = p_hosp_cod;
  
  -- Calcula o valor do consumo
  SELECT SUM(it_quant * it_valor_unit)
  INTO v_valor_consumo
  FROM consumo_item
  WHERE con_cod IN (
    SELECT con_cod
    FROM consumo
    WHERE hosp_cod = p_hosp_cod
  );
  
  -- Calcula o valor total da hospedagem
  v_valor_total := v_qtd_diarias * v_valor_diaria + v_valor_consumo;
  
  -- Atualiza os dados da hospedagem
  UPDATE hospedagem
  SET hosp_data_saida = SYSDATE,
      hosp_qtd_diarias = v_qtd_diarias,
      hosp_valor_total = v_valor_total
  WHERE hosp_cod = p_hosp_cod;
  
  COMMIT;
  
  DBMS_OUTPUT.PUT_LINE('Hospedagem ' || p_hosp_cod || ' fechada com sucesso!');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erro ao fechar hospedagem ' || p_hosp_cod || ': ' || SQLERRM);
END;
