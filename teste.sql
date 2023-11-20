CREATE OR REPLACE PROCEDURE EX2
(
@HOSP_COD INT
)
AS
BEGIN
    DECLARE @HOSP_DATA_ENTRADA DATE, @HOSP_DATA_SAIDA DATE, @HOSP_QTD_DIARIAS INT, @CAT_VALOR_DIARIA FLOAT, @valorConsumo FLOAT, @valorTotal FLOAT, @qtdConsumo INT

    SELECT @dataEntrada = DataEntrada, @valorDiaria = ValorDiaria, Categoria FROM Hospedagens WHERE CodHospedagem = @codHospedagem
    
    SELECT @dataSaida = HOSP_DATA_SAIDA()

    SELECT @qtdDiarias = DATEDIFF(DAY, @dataEntrada, @dataSaida) + 1 FROM Hospedagens WHERE CodHospedagem = @codHospedagem
    
    SELECT @qtdConsumo = SUM(Quantidade) FROM Consumos WHERE CodHospedagem = @codHospedagem
    
    SELECT @valorConsumo = SUM(Quantidade * Valor) FROM Consumos WHERE CodHospedagem = @codHospedagem
    
    SELECT @valorTotal = (@qtdDiarias * @valorDiaria) + @valorConsumo

    UPDATE Hospedagens SET DataSaida = @dataSaida, QtdDiarias = @qtdDiarias, ValorTotal = @valorTotal WHERE CodHospedagem = @codHospedagem
END