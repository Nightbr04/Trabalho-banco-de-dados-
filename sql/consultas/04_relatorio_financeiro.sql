SELECT
    id,
    nome,
    dbo.fn_saldo_devedor_cliente(id) AS saldo_devedor
FROM clientes
ORDER BY saldo_devedor DESC;
GO