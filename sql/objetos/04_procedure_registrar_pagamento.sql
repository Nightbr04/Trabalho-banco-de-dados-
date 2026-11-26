CREATE OR ALTER PROCEDURE sp_registrar_pagamento
    @fatura_id INT,
    @forma_pagamento VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    IF @forma_pagamento IS NULL
       OR @forma_pagamento NOT IN (
            'PIX',
            'BOLETO',
            'CARTAO',
            'TRANSFERENCIA',
            'DINHEIRO'
       )
    BEGIN
        THROW 50001, 'Forma de pagamento invalida.', 1;
    END;

    UPDATE faturas
    SET status = 'PAGA',
        forma_pagamento = @forma_pagamento
    WHERE id = @fatura_id
      AND status IN ('ABERTA', 'VENCIDA');

    IF @@ROWCOUNT = 0
    BEGIN
        THROW 50002,
            'Fatura inexistente, ja paga ou cancelada.', 1
    END
    PRINT 'Pagamento registrado com sucesso.'
END
GO