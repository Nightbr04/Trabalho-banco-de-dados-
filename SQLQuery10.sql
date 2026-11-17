USE aluguel_equipamentos_medicos;
SELECT 'clientes' AS tabela, COUNT(*) AS linhas FROM clientes
UNION ALL SELECT 'categorias', COUNT(*) FROM categorias
UNION ALL SELECT 'funcionarios', COUNT(*) FROM funcionarios
UNION ALL SELECT 'equipamentos', COUNT(*) FROM equipamentos
UNION ALL SELECT 'atendimentos_crm', COUNT(*) FROM atendimentos_crm
UNION ALL SELECT 'manutencoes', COUNT(*) FROM manutencoes
UNION ALL SELECT 'pecas_manutencao', COUNT(*) FROM pecas_manutencao;