CREATE OR ALTER TRIGGER trg_gerar_fatura
ON contratos
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO faturas (
        contrato_id,
        valor,
        data_vencimento,
        status
    )
    SELECT
        id,
        valor_total,
        CAST(
            COALESCE(data_fim, DATEADD(DAY, 30, data_inicio))
            AS DATE
        ),
        'ABERTA'
    FROM inserted
    WHERE status_contrato = 'ATIVO'
      AND valor_total > 0;
END;
GO
