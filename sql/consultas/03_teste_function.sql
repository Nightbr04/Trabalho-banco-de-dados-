SELECT
    id,
    nome,
    dbo.fn_saldo_devedor_cliente(id) AS saldo_devedor
FROM clientes
WHERE id = 2;
GO

