-- =====================================================================
-- BLOCO 0: Usa o banco do projeto
-- =====================================================================
USE aluguel_equipamentos_medicos;
GO
SET DATEFORMAT ymd;
GO

-- =====================================================================
-- BLOCO 1: CLIENTES (20 pessoas físicas)
-- =====================================================================
INSERT INTO clientes (nome, cpf, whatsapp, endereco) VALUES
('Maria Oliveira Santos', '12345678901', '48999110001', 'Rua das Flores, 100 - Criciúma/SC'),
('João Pedro Almeida', '23456789012', '48999110002', 'Av. Centenário, 250 - Criciúma/SC'),
('Ana Clara Ferreira', '34567890123', '48999110003', 'Rua Esperança, 45 - Içara/SC'),
('Carlos Eduardo Lima', '45678901234', '48999110004', 'Rua XV de Novembro, 800 - Forquilhinha/SC'),
('Fernanda Souza Rocha', '56789012345', '48999110005', 'Rua Padre Anchieta, 12 - Criciúma/SC'),
('Ricardo Mendes Costa', '67890123456', '48999110006', 'Rua Hercílio Luz, 300 - Araranguá/SC'),
('Juliana Ribeiro Pires', '78901234567', '48999110007', 'Rua Principal, 77 - Morro da Fumaça/SC'),
('Marcos Vinícius Dias', '89012345678', '48999110008', 'Rua Santos Dumont, 9 - Criciúma/SC'),
('Patrícia Gomes Nunes', '90123456789', '48999110009', 'Rua Dona Francisca, 55 - Jaguaruna/SC'),
('Rafael Teixeira Melo', '01234567890', '48999110010', 'Av. Universitária, 1200 - Criciúma/SC'),
('Luciana Martins Prado', '11122233344', '48999110011', 'Rua Central, 500 - Criciúma/SC'),
('Roberto Carlos Andrade', '22233344455', '48999110012', 'Av. Santos Dumont, 1500 - Criciúma/SC'),
('Tatiane Borges Vieira', '33344455566', '48999110013', 'Rua Engenheiro Jorge, 88 - Criciúma/SC'),
('Sérgio Luiz Monteiro', '44455566677', '48999110014', 'Rua Getúlio Vargas, 320 - Içara/SC'),
('Débora Cristina Farias', '55566677788', '48999110015', 'Av. Nereu Ramos, 410 - Araranguá/SC'),
('Alexandre Duarte Neto', '66677788899', '48999110016', 'Rua Lauro Müller, 65 - Criciúma/SC'),
('Simone Aparecida Lopes', '77788899900', '48999110017', 'Rua Coronel Pedro Benedet, 14 - Criciúma/SC'),
('Paulo Henrique Brandão', '88899900011', '48999110018', 'Rua Ernesto Stodieck, 230 - Criciúma/SC'),
('Cláudia Regina Matos', '99900011122', '48999110019', 'Av. Índio Tibiriçá, 700 - Criciúma/SC'),
('Marcelo Augusto Pacheco', '10111213141', '48999110020', 'Rua Pinheiro Machado, 41 - Criciúma/SC');
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
(11, 'TELEFONE', 'Renovação',        'Cliente quer renovar a locação do ultrassom.',       '2026-02-15 10:05:00'),
(12, 'EMAIL',    'Reclamação',       'Raio-X apresentou falha no primeiro dia de uso.',    '2026-02-18 17:30:00'),
(13, 'WHATSAPP', 'Orçamento',        'Cliente pediu orçamento de laser para 2 unidades.',  '2026-02-20 11:50:00'),
(14, 'SITE',     'Dúvida técnica',   'Consultou o manual de uso da fototerapia.',          '2026-02-25 14:00:00'),
(15, 'TELEFONE', 'Coleta',           'Solicitou coleta após fim da locação.',              '2026-03-02 08:45:00'),
(16, 'WHATSAPP', 'Orçamento',        'Pediu cotação de colchão pneumático.',               '2026-03-05 16:20:00'),
(17, 'EMAIL',    'Renovação',        'Cliente quer manter a incubadora por mais 6 meses.', '2026-03-10 10:00:00'),
(18, 'SITE',     'Orçamento',        'Solicitou orçamento de esterilizador de uso pessoal.','2026-03-12 13:35:00'),
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