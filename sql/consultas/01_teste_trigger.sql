INSERT INTO contratos (
    cliente_id,
    equipamento_id,
    tipo_cobranca,
    data_inicio,
    data_fim,
    valor_total,
    status_contrato
)
VALUES (
    2, 2, 'MENSAL',
    '20261201', '20270101',
    450.00, 'ATIVO'
);
GO
-- Verifica o contrato cadastrado
SELECT TOP 1 *
FROM contratos
ORDER BY id DESC;

-- Verifica a fatura gerada automaticamente
SELECT TOP 1 *
FROM faturas
ORDER BY id DESC;
GO