DECLARE @fatura_id INT;

SELECT TOP 1 @fatura_id = f.id
FROM faturas f
INNER JOIN contratos c ON c.id = f.contrato_id
WHERE c.cliente_id = 2
  AND f.status = 'ABERTA' OR f.status = 'VENCIDA'
ORDER BY f.id DESC;

EXEC dbo.sp_registrar_pagamento
    @fatura_id = @fatura_id,
    @forma_pagamento = 'PIX';

SELECT *
FROM faturas
WHERE id = @fatura_id;
GO

-- Verificação do saldo após o pagamento
SELECT
    id,
    nome,
    dbo.fn_saldo_devedor_cliente(id) AS saldo_devedor
FROM clientes
WHERE id = 2;
GO