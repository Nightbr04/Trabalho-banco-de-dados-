CREATE OR ALTER FUNCTION fn_saldo_devedor_cliente (
    @cliente_id INT
)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @saldo DECIMAL(18,2)

    SELECT @saldo = COALESCE(SUM(f.valor), 0)
    FROM faturas f
    INNER JOIN contratos c
        ON f.contrato_id = c.id
    WHERE c.cliente_id = @cliente_id
      AND f.status IN ('ABERTA', 'VENCIDA')

    RETURN @saldo
END
GO