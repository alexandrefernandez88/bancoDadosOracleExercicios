--trigger s� pode etsar ligada a ma tabela com no m�ximo 12 gatilhos ocorre em uma tabela como isert, uptade e delete
--primeira verifica se tem trigger em uma tabela

1 TRIGGER
    
    
            [ INSERT     [ FOR EACH ROW
[BEFORE     [ UPTADE     [ FOR STAIMENT
[AFTER      [ DELETE





CREATE OR REPLACE TRIGGER TG_CPF
BEFORE INSERT OR UPDATE ON XCLIENTE
FOR EACH ROW
BEGIN
    IF V_CPF (:NEW.CLI_CPF) = 'N' THEN
        RAISE_APPLICATION_ERROR(-20100,'CPF INFV�LIDO...');
    END IF;
END;
--DECLARE S� USA SE USAR VARI�VEL

--PROIBIDO USAR INSER UPDATE DELETE SELECT* NA PROPRIA TABELA DO TRIGGER
INSERT INTO XCLIENTE VALUES (222,1,'TESTE TRIGGER','22222222222',0,0);

UPDATE XCLIENTE
SET CLI_NOME = 'TESTE TRIGGER'
WHERE CLI_COD=10