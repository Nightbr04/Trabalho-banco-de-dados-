-- =====================================================================
-- BLOCO 0: Usa o banco do projeto
-- =====================================================================
USE aluguel_equipamentos_medicos;
GO
SET DATEFORMAT ymd;
GO

-- =====================================================================
-- BLOCO 1: CLIENTES (10 pessoas físicas e 10 jurídicas)
-- =====================================================================
INSERT INTO clientes (nome, tipo, cpf_cnpj, whatsapp, endereco) VALUES
('Maria Oliveira Santos', 'PF', '12345678901', '48999110001', 'Rua das Flores, 100 - Criciúma/SC'),
('João Pedro Almeida', 'PF', '23456789012', '48999110002', 'Av. Centenário, 250 - Criciúma/SC'),
('Ana Clara Ferreira', 'PF', '34567890123', '48999110003', 'Rua Esperança, 45 - Içara/SC'),
('Carlos Eduardo Lima', 'PF', '45678901234', '48999110004', 'Rua XV de Novembro, 800 - Forquilhinha/SC'),
('Fernanda Souza Rocha', 'PF', '56789012345', '48999110005', 'Rua Padre Anchieta, 12 - Criciúma/SC'),
('Ricardo Mendes Costa', 'PF', '67890123456', '48999110006', 'Rua Hercílio Luz, 300 - Araranguá/SC'),
('Juliana Ribeiro Pires', 'PF', '78901234567', '48999110007', 'Rua Principal, 77 - Morro da Fumaça/SC'),
('Marcos Vinícius Dias', 'PF', '89012345678', '48999110008', 'Rua Santos Dumont, 9 - Criciúma/SC'),
('Patrícia Gomes Nunes', 'PF', '90123456789', '48999110009', 'Rua Dona Francisca, 55 - Jaguaruna/SC'),
('Rafael Teixeira Melo', 'PF', '01234567890', '48999110010', 'Av. Universitária, 1200 - Criciúma/SC'),
('Clínica Vida Saudável Ltda', 'PJ', '11222333000144', '48333100001', 'Rua Central, 500 - Criciúma/SC'),
('Hospital São Lucas', 'PJ', '22333444000155', '48333100002', 'Av. Santos Dumont, 1500 - Criciúma/SC'),
('Centro Estético Beleza Pura', 'PJ', '33444555000166', '48333100003', 'Rua Engenheiro Jorge, 88 - Criciúma/SC'),
('Laboratório Diagnóstico Norte', 'PJ', '44555666000177', '48333100004', 'Rua Getúlio Vargas, 320 - Içara/SC'),
('Clínica Ortopédica Sul', 'PJ', '55666777000188', '48333100005', 'Av. Nereu Ramos, 410 - Araranguá/SC'),
('Home Care Cuidar Bem', 'PJ', '66777888000199', '48333100006', 'Rua Lauro Müller, 65 - Criciúma/SC'),
('Pronto Atendimento Central', 'PJ', '77888999000100', '48333100007', 'Rua Coronel Pedro Benedet, 14 - Criciúma/SC'),
('Instituto Renascer', 'PJ', '88999000000111', '48333100008', 'Rua Ernesto Stodieck, 230 - Criciúma/SC'),
('Fisioterapia Movimento', 'PJ', '99000111000122', '48333100009', 'Av. Índio Tibiriçá, 700 - Criciúma/SC'),
('Clínica Odonto Sorriso', 'PJ', '10111213000133', '48333100010', 'Rua Pinheiro Machado, 41 - Criciúma/SC');
GO

-- =====================================================================
-- BLOCO 2: CATEGORIAS (20 tipos de equipamento)
-- =====================================================================
INSERT INTO categorias (nome, descricao) VALUES
('Ventilação', 'Aparelhos de suporte respiratório'),
('Monitoramento', 'Monitores de sinais vitais'),
('Infusão', 'Bombas para medicação e soro'),
('Emergência', 'Equipamentos de reanimação'),
('Mobiliário hospitalar', 'Camas e mobiliário para internação'),
('Cirúrgico', 'Equipamentos de apoio a cirurgias'),
('Oximetria', 'Medição de saturação de oxigênio'),
('Diagnóstico cardíaco', 'Exames de eletrocardiografia'),
('Inalação', 'Equipamentos para nebulização'),
('Esterilização', 'Equipamentos de esterilização de materiais'),
('Diagnóstico por imagem', 'Equipamentos de ultrassonografia'),
('Radiologia', 'Equipamentos de raio-X'),
('Estética', 'Equipamentos para procedimentos estéticos'),
('Fototerapia', 'Equipamentos de luz terapêutica'),
('Mobilidade', 'Cadeiras e equipamentos de locomoção'),
('Conforto', 'Colchões e superfícies especiais'),
('Neonatal', 'Incubadoras para recém-nascidos'),
('Esterilização de ambientes', 'Equipamentos de higienização'),
('Fisioterapia', 'Equipamentos de eletroterapia'),
('Oxigenoterapia', 'Geração de oxigênio para uso domiciliar');
GO

-- =====================================================================
-- BLOCO 3: FUNCIONARIOS (equipe de manutenção, logística e atendimento)
-- =====================================================================
INSERT INTO funcionarios (nome, cargo, telefone) VALUES
('Lucas Martins', 'Técnico de manutenção', '48999200001'),
('Gabriela Costa', 'Técnica de manutenção', '48999200002'),
('Thiago Ramos', 'Motorista', '48999200003'),
('Larissa Pereira', 'Atendente', '48999200004'),
('Bruno Carvalho', 'Motorista', '48999200005'),
('Camila Duarte', 'Engenheira biomédica', '48999200006'),
('Eduardo Freitas', 'Técnico de manutenção', '48999200007'),
('Beatriz Lopes', 'Atendente', '48999200008'),
('Felipe Moura', 'Motorista', '48999200009'),
('Amanda Castro', 'Técnica de manutenção', '48999200010'),
('Gustavo Nascimento', 'Coordenador de logística', '48999200011'),
('Renata Barbosa', 'Atendente', '48999200012'),
('Diego Azevedo', 'Técnico de manutenção', '48999200013'),
('Juliana Pinto', 'Engenheira biomédica', '48999200014'),
('Rodrigo Batista', 'Motorista', '48999200015'),
('Vanessa Moreira', 'Atendente', '48999200016'),
('Henrique Araújo', 'Técnico de manutenção', '48999200017'),
('Patrícia Vieira', 'Coordenadora de atendimento', '48999200018'),
('Leonardo Silva', 'Motorista', '48999200019'),
('Carolina Lima', 'Técnica de manutenção', '48999200020');
GO

-- =====================================================================
-- BLOCO 4: EQUIPAMENTOS (1 equipamento por categoria, com status variados)
-- =====================================================================
INSERT INTO equipamentos (categoria_id, nome, numero_serie, lote, registro_anvisa, valor_locacao, status) VALUES
(1,  'Ventilador Pulmonar VP-500',       'SN-000001', 'L2026-01', '80100000001', 1800.00, 'LOCADO'),
(2,  'Monitor Multiparamétrico MP-7',    'SN-000002', 'L2026-01', '80100000002',  450.00, 'DISPONIVEL'),
(3,  'Bomba de Infusão BI-200',          'SN-000003', 'L2026-02', '80100000003',  320.00, 'LOCADO'),
(4,  'Desfibrilador DF-9',               'SN-000004', 'L2026-02', '80100000004',  900.00, 'DISPONIVEL'),
(5,  'Cama Hospitalar CH-3',             'SN-000005', 'L2026-03', '80100000005',  600.00, 'LOCADO'),
(6,  'Aspirador Cirúrgico AC-1',         'SN-000006', 'L2026-03', '80100000006',  380.00, 'MANUTENCAO'),
(7,  'Oxímetro de Pulso OX-2',           'SN-000007', 'L2026-04', '80100000007',   80.00, 'DISPONIVEL'),
(8,  'Eletrocardiógrafo EC-12',          'SN-000008', 'L2026-04', '80100000008',  700.00, 'LOCADO'),
(9,  'Nebulizador NB-5',                 'SN-000009', 'L2026-05', '80100000009',   90.00, 'DISPONIVEL'),
(10, 'Autoclave AU-30',                  'SN-000010', 'L2026-05', '80100000010', 1100.00, 'DISPONIVEL'),
(11, 'Ultrassom US-Pro',                 'SN-000011', 'L2026-06', '80100000011', 1500.00, 'LOCADO'),
(12, 'Raio-X Portátil RX-P',             'SN-000012', 'L2026-06', '80100000012', 2500.00, 'MANUTENCAO'),
(13, 'Laser Estético LE-Max',            'SN-000013', 'L2026-07', '80100000013', 1200.00, 'LOCADO'),
(14, 'Fototerapia FT-Neo',               'SN-000014', 'L2026-07', '80100000014',  650.00, 'DISPONIVEL'),
(15, 'Cadeira de Rodas Motorizada CRM-1', 'SN-000015', 'L2026-08', '80100000015',  500.00, 'LOCADO'),
(16, 'Colchão Pneumático CP-Anti',       'SN-000016', 'L2026-08', '80100000016',  250.00, 'DISPONIVEL'),
(17, 'Incubadora Neonatal IN-4',         'SN-000017', 'L2026-09', '80100000017', 2000.00, 'LOCADO'),
(18, 'Esterilizador ES-Plus',            'SN-000018', 'L2026-09', '80100000018', 1000.00, 'DISPONIVEL'),
(19, 'Eletroterapia ET-Fisio',           'SN-000019', 'L2026-10', '80100000019',  400.00, 'LOCADO'),
(20, 'Concentrador de Oxigênio CO-5',    'SN-000020', 'L2026-10', '80100000020',  700.00, 'BAIXADO');
GO

-- =====================================================================
-- BLOCO 5: ATENDIMENTOS_CRM (histórico de contatos com cada cliente)
-- =====================================================================
INSERT INTO atendimentos_crm (cliente_id, canal, assunto, mensagem, criado_em) VALUES
(1,  'WHATSAPP', 'Orçamento',        'Cliente pediu orçamento de ventilador por 30 dias.', '2026-01-05 09:10:00'),
(2,  'TELEFONE', 'Renovação',        'Contrato vence em breve, cliente quer renovar.',     '2026-01-07 14:20:00'),
(3,  'EMAIL',    'Reclamação',       'Equipamento chegou com atraso de 1 dia.',            '2026-01-12 11:00:00'),
(4,  'WHATSAPP', 'Dúvida técnica',   'Cliente quer saber sobre a bateria do aparelho.',    '2026-01-15 16:45:00'),
(5,  'SITE',     'Orçamento',        'Solicitou cotação para cama hospitalar.',            '2026-01-20 10:30:00'),
(6,  'WHATSAPP', 'Coleta',           'Pediu agendamento de coleta do equipamento.',        '2026-01-22 08:15:00'),
(7,  'TELEFONE', 'Renovação',        'Quer estender locação por mais 3 meses.',            '2026-02-01 13:00:00'),
(8,  'EMAIL',    'Nota fiscal',      'Solicitou segunda via da nota fiscal.',              '2026-02-03 09:40:00'),
(9,  'WHATSAPP', 'Orçamento',        'Cotação de monitor multiparamétrico.',               '2026-02-08 15:25:00'),
(10, 'SITE',     'Dúvida',           'Perguntou sobre prazo mínimo de locação.',           '2026-02-10 12:10:00'),
(11, 'TELEFONE', 'Renovação',        'Clínica quer renovar contrato do ultrassom.',        '2026-02-15 10:05:00'),
(12, 'EMAIL',    'Reclamação',       'Raio-X apresentou falha no primeiro dia de uso.',    '2026-02-18 17:30:00'),
(13, 'WHATSAPP', 'Orçamento',        'Estética pediu orçamento de laser para 2 unidades.', '2026-02-20 11:50:00'),
(14, 'SITE',     'Dúvida técnica',   'Consultou o manual de uso da fototerapia.',          '2026-02-25 14:00:00'),
(15, 'TELEFONE', 'Coleta',           'Solicitou coleta após fim da locação.',              '2026-03-02 08:45:00'),
(16, 'WHATSAPP', 'Orçamento',        'Pediu cotação de colchão pneumático.',               '2026-03-05 16:20:00'),
(17, 'EMAIL',    'Renovação',        'Hospital quer manter a incubadora por mais 6 meses.','2026-03-10 10:00:00'),
(18, 'SITE',     'Orçamento',        'Solicitou orçamento de esterilizador para centro.',  '2026-03-12 13:35:00'),
(19, 'WHATSAPP', 'Dúvida',           'Perguntou sobre sessões do aparelho de eletroterapia.','2026-03-15 09:15:00'),
(20, 'TELEFONE', 'Reclamação',       'Concentrador apresentou ruído, cliente solicitou troca.','2026-03-18 18:00:00');
GO

-- =====================================================================
-- BLOCO 6: MANUTENCOES (histórico de manutenção de cada equipamento)
-- =====================================================================
INSERT INTO manutencoes (equipamento_id, funcionario_id, tipo, descricao, data_manutencao, status) VALUES
(1,  1,  'PREVENTIVA', 'Troca de filtro e calibração do ventilador.',         '2026-01-10 08:00:00', 'CONCLUIDA'),
(2,  2,  'PREVENTIVA', 'Verificação de sensores do monitor.',                  '2026-01-11 09:00:00', 'CONCLUIDA'),
(3,  3,  'CORRETIVA',  'Bateria da bomba de infusão com defeito.',             '2026-01-14 10:30:00', 'CONCLUIDA'),
(4,  4,  'PREVENTIVA', 'Teste de carga da bateria do desfibrilador.',          '2026-01-18 11:00:00', 'CONCLUIDA'),
(5,  5,  'CORRETIVA',  'Motor de elevação da cama com ruído.',                 '2026-01-21 14:00:00', 'CONCLUIDA'),
(6,  6,  'CORRETIVA',  'Bomba de vácuo do aspirador sem pressão.',             '2026-01-25 15:20:00', 'ABERTA'),
(7,  7,  'PREVENTIVA', 'Troca do sensor do oxímetro.',                         '2026-02-02 08:30:00', 'CONCLUIDA'),
(8,  8,  'PREVENTIVA', 'Limpeza e verificação de eletrodos.',                  '2026-02-04 09:45:00', 'CONCLUIDA'),
(9,  9,  'CORRETIVA',  'Compressor do nebulizador travado.',                   '2026-02-09 13:10:00', 'CONCLUIDA'),
(10, 10, 'PREVENTIVA', 'Teste de esterilização e troca de vedação.',          '2026-02-11 10:00:00', 'CONCLUIDA'),
(11, 11, 'PREVENTIVA', 'Calibração do transdutor do ultrassom.',               '2026-02-16 11:20:00', 'CONCLUIDA'),
(12, 12, 'CORRETIVA',  'Tubo de raio-X com falha na emissão.',                 '2026-02-19 16:00:00', 'ABERTA'),
(13, 13, 'PREVENTIVA', 'Limpeza das lentes e verificação de potência.',       '2026-02-21 12:40:00', 'CONCLUIDA'),
(14, 14, 'PREVENTIVA', 'Teste das lâmpadas de fototerapia.',                   '2026-02-26 09:30:00', 'CONCLUIDA'),
(15, 15, 'CORRETIVA',  'Controle da cadeira de rodas com defeito.',            '2026-03-03 14:15:00', 'CONCLUIDA'),
(16, 16, 'PREVENTIVA', 'Verificação de vazamento do colchão.',                 '2026-03-06 10:50:00', 'CONCLUIDA'),
(17, 17, 'PREVENTIVA', 'Verificação de temperatura e alarmes da incubadora.',  '2026-03-11 08:20:00', 'CONCLUIDA'),
(18, 18, 'PREVENTIVA', 'Troca de resistência do esterilizador.',               '2026-03-13 15:00:00', 'CONCLUIDA'),
(19, 19, 'CORRETIVA',  'Eletrodo do aparelho de eletroterapia solto.',         '2026-03-16 11:30:00', 'CONCLUIDA'),
(20, 20, 'CORRETIVA',  'Ruído no compressor do concentrador de oxigênio.',     '2026-03-19 09:00:00', 'ABERTA');
GO

-- =====================================================================
-- BLOCO 7: PECAS_MANUTENCAO (peças usadas em cada manutenção)
-- =====================================================================
INSERT INTO pecas_manutencao (manutencao_id, nome_peca, quantidade, custo) VALUES
(1,  'Filtro bacteriano',         2,  85.00),
(2,  'Sensor de SpO2',            1, 120.00),
(3,  'Bateria recarregável',      1, 210.00),
(4,  'Bateria do desfibrilador',  1, 480.00),
(5,  'Motor de elevação',         1, 350.00),
(6,  'Bomba de vácuo',            1, 290.00),
(7,  'Sensor de oxímetro',        1,  95.00),
(8,  'Eletrodos descartáveis',   10,  60.00),
(9,  'Compressor de ar',          1, 150.00),
(10, 'Vedação de autoclave',      2,  75.00),
(11, 'Transdutor de ultrassom',   1, 430.00),
(12, 'Tubo de raio-X',            1, 980.00),
(13, 'Lente de laser',            1, 260.00),
(14, 'Lâmpada de fototerapia',    4, 110.00),
(15, 'Controlador de joystick',   1, 190.00),
(16, 'Válvula de ar',             2,  45.00),
(17, 'Sensor de temperatura',     1, 135.00),
(18, 'Resistência de aquecimento',1, 220.00),
(19, 'Eletrodo de aplicação',     2,  70.00),
(20, 'Compressor de oxigênio',    1, 540.00);
GO

-- =====================================================================
-- BLOCO 8: CONTRATOS (20 contratos variados: ativos, encerrados e cancelados)
-- =====================================================================
INSERT INTO contratos (cliente_id, equipamento_id, tipo_cobranca, data_inicio, data_fim, valor_total, status_contrato) VALUES
(1,  1,  'MENSAL',  '2026-01-06 09:00:00', '2026-04-06 09:00:00', 5400.00, 'ATIVO'),
(2,  2,  'DIARIA',  '2026-01-08 10:00:00', '2026-01-18 10:00:00',  450.00, 'ENCERRADO'),
(3,  3,  'MENSAL',  '2026-01-13 08:30:00', '2026-07-13 08:30:00', 1920.00, 'ATIVO'),
(4,  4,  'DIARIA',  '2026-01-16 14:00:00', '2026-01-26 14:00:00',  900.00, 'ENCERRADO'),
(5,  5,  'MENSAL',  '2026-01-21 11:00:00', NULL,                  1800.00, 'ATIVO'),
(6,  6,  'MENSAL',  '2026-01-23 09:00:00', '2026-02-23 09:00:00',  380.00, 'ENCERRADO'),
(7,  7,  'DIARIA',  '2026-02-02 10:00:00', '2026-02-12 10:00:00',   80.00, 'ENCERRADO'),
(8,  8,  'MENSAL',  '2026-02-04 13:00:00', '2026-08-04 13:00:00', 4200.00, 'ATIVO'),
(9,  9,  'DIARIA',  '2026-02-09 15:00:00', '2026-02-14 15:00:00',   90.00, 'CANCELADO'),
(10, 10, 'MENSAL',  '2026-02-11 08:00:00', '2026-03-11 08:00:00', 1100.00, 'ENCERRADO'),
(11, 11, 'MENSAL',  '2026-02-16 09:30:00', '2026-08-16 09:30:00', 9000.00, 'ATIVO'),
(12, 12, 'MEDICAO', '2026-02-19 10:00:00', '2026-03-19 10:00:00', 2500.00, 'CANCELADO'),
(13, 13, 'MEDICAO', '2026-02-21 11:00:00', '2026-05-21 11:00:00', 3600.00, 'ATIVO'),
(14, 14, 'MENSAL',  '2026-02-26 14:00:00', '2026-03-26 14:00:00',  650.00, 'ENCERRADO'),
(15, 15, 'MENSAL',  '2026-03-03 09:00:00', '2026-06-03 09:00:00', 1500.00, 'ATIVO'),
(16, 16, 'DIARIA',  '2026-03-06 16:00:00', '2026-03-20 16:00:00',  250.00, 'ENCERRADO'),
(17, 17, 'MENSAL',  '2026-03-11 08:00:00', '2026-09-11 08:00:00',12000.00, 'ATIVO'),
(18, 18, 'MENSAL',  '2026-03-13 13:00:00', '2026-04-13 13:00:00', 1000.00, 'ENCERRADO'),
(19, 19, 'MEDICAO', '2026-03-16 10:00:00', NULL,                  1200.00, 'ATIVO'),
(20, 20, 'MENSAL',  '2026-03-19 11:30:00', '2026-04-19 11:30:00',  700.00, 'CANCELADO');
GO

-- =====================================================================
-- BLOCO 9: FATURAS (20 cobranças vinculadas aos contratos)
-- =====================================================================
INSERT INTO faturas (contrato_id, valor, data_vencimento, forma_pagamento, nota_fiscal, status) VALUES
(1,  1800.00, '2026-02-06', 'BOLETO',        'NF-2026-0001', 'PAGA'),
(2,   450.00, '2026-01-20', 'PIX',           'NF-2026-0002', 'PAGA'),
(3,   320.00, '2026-02-13', 'BOLETO',        'NF-2026-0003', 'PAGA'),
(4,   900.00, '2026-01-28', 'CARTAO',        'NF-2026-0004', 'PAGA'),
(5,   600.00, '2026-02-21', 'PIX',           'NF-2026-0005', 'PAGA'),
(6,   380.00, '2026-02-25', 'BOLETO',        'NF-2026-0006', 'VENCIDA'),
(7,    80.00, '2026-02-15', 'PIX',           'NF-2026-0007', 'PAGA'),
(8,   700.00, '2026-03-04', 'BOLETO',        'NF-2026-0008', 'PAGA'),
(9,    90.00, '2026-02-16', 'PIX',           NULL,           'CANCELADA'),
(10, 1100.00, '2026-03-12', 'TRANSFERENCIA', 'NF-2026-0009', 'PAGA'),
(11, 1500.00, '2026-03-16', 'BOLETO',        'NF-2026-0010', 'PAGA'),
(12, 2500.00, '2026-03-20', 'BOLETO',        NULL,           'CANCELADA'),
(13, 1200.00, '2026-03-21', 'CARTAO',        'NF-2026-0011', 'PAGA'),
(14,  650.00, '2026-03-28', 'PIX',           'NF-2026-0012', 'VENCIDA'),
(15,  500.00, '2026-04-03', 'BOLETO',        'NF-2026-0013', 'ABERTA'),
(16,  250.00, '2026-03-22', 'PIX',           'NF-2026-0014', 'PAGA'),
(17, 2000.00, '2026-04-11', 'TRANSFERENCIA', 'NF-2026-0015', 'ABERTA'),
(18, 1000.00, '2026-04-15', 'BOLETO',        'NF-2026-0016', 'ABERTA'),
(19,  400.00, '2026-04-16', 'PIX',           'NF-2026-0017', 'ABERTA'),
(20,  700.00, '2026-04-20', 'BOLETO',        NULL,           'CANCELADA');
GO

-- =====================================================================
-- BLOCO 10: LOGISTICA (20 agendamentos de entrega e coleta)
-- =====================================================================
INSERT INTO logistica (contrato_id, funcionario_id, tipo, data_agendada, rota, status) VALUES
(1,  3,  'ENTREGA', '2026-01-06 08:00:00', 'Rota Centro - Criciúma',        'CONCLUIDA'),
(2,  5,  'ENTREGA', '2026-01-08 09:00:00', 'Rota Av. Centenário - Criciúma','CONCLUIDA'),
(2,  5,  'COLETA',  '2026-01-18 14:00:00', 'Rota Av. Centenário - Criciúma','CONCLUIDA'),
(3,  9,  'ENTREGA', '2026-01-13 08:00:00', 'Rota Içara - Centro',           'CONCLUIDA'),
(4,  15, 'ENTREGA', '2026-01-16 13:00:00', 'Rota Forquilhinha',             'CONCLUIDA'),
(4,  15, 'COLETA',  '2026-01-26 15:00:00', 'Rota Forquilhinha',             'CONCLUIDA'),
(5,  19, 'ENTREGA', '2026-01-21 10:00:00', 'Rota Centro - Criciúma',        'CONCLUIDA'),
(6,  3,  'ENTREGA', '2026-01-23 08:30:00', 'Rota Araranguá - Sul',          'CONCLUIDA'),
(6,  3,  'COLETA',  '2026-02-23 16:00:00', 'Rota Araranguá - Sul',          'CONCLUIDA'),
(7,  5,  'ENTREGA', '2026-02-02 09:30:00', 'Rota Morro da Fumaça',          'CONCLUIDA'),
(8,  9,  'ENTREGA', '2026-02-04 11:00:00', 'Rota Santos Dumont - Criciúma', 'CONCLUIDA'),
(9,  11, 'ENTREGA', '2026-02-09 14:00:00', 'Rota Jaguaruna',                'CANCELADA'),
(10, 15, 'ENTREGA', '2026-02-11 08:00:00', 'Rota Universitária - Criciúma', 'CONCLUIDA'),
(11, 19, 'ENTREGA', '2026-02-16 09:00:00', 'Rota Clínicas - Criciúma',      'CONCLUIDA'),
(12, 3,  'ENTREGA', '2026-02-19 09:30:00', 'Rota Hospitalar - Criciúma',    'CANCELADA'),
(13, 5,  'ENTREGA', '2026-02-21 10:30:00', 'Rota Centro - Criciúma',        'CONCLUIDA'),
(15, 9,  'ENTREGA', '2026-03-03 08:30:00', 'Rota Araranguá - Centro',       'EM_ROTA'),
(17, 15, 'ENTREGA', '2026-03-11 07:30:00', 'Rota Hospitalar - Criciúma',    'AGENDADA'),
(18, 19, 'COLETA',  '2026-04-13 14:00:00', 'Rota Centro - Criciúma',        'AGENDADA'),
(19, 11, 'ENTREGA', '2026-03-16 09:00:00', 'Rota Av. Índio Tibiriçá',       'AGENDADA');
GO
