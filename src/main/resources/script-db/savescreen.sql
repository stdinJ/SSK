-- CRIAR BANCO DE DADOS
CREATE DATABASE savescreen;

-- Conectar ao banco criado antes de executar o restante

-- Criação de tabelas
CREATE TABLE responsavel (
  id_responsavel SERIAL PRIMARY KEY,
  username VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  telefone VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL
);

CREATE TABLE usuario (
  id_usuario SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  senha VARCHAR(100) NOT NULL,
  telefone VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE crianca (
  id_crianca SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  data_nascimento DATE,
  id_responsavel INT NOT NULL,
  FOREIGN KEY (id_responsavel) REFERENCES responsavel(id_responsavel)
);

CREATE TABLE restricao_uso (
  id_restricao SERIAL PRIMARY KEY,
  descricao VARCHAR(255) NOT NULL,
  tempo_lim_min INT NOT NULL,
  id_responsavel INT NOT NULL,
  FOREIGN KEY (id_responsavel) REFERENCES responsavel(id_responsavel)
);

CREATE TABLE uso_tela (
  id_uso SERIAL PRIMARY KEY,
  data DATE NOT NULL,
  hora_inicio TIME NOT NULL,
  hora_fim TIME NOT NULL,
  id_crianca INT NOT NULL,
  id_restricao INT NOT NULL,
  FOREIGN KEY (id_crianca) REFERENCES crianca(id_crianca),
  FOREIGN KEY (id_restricao) REFERENCES restricao_uso(id_restricao)
);

CREATE TABLE postagem (
  id_postagem SERIAL PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  descricao TEXT NOT NULL,
  id_responsavel INT NOT NULL,
  FOREIGN KEY (id_responsavel) REFERENCES responsavel(id_responsavel)
);

CREATE TABLE assinatura (
  id_assinatura SERIAL PRIMARY KEY,
  data_inicio DATE NOT NULL,
  ativo BOOLEAN DEFAULT TRUE,
  id_responsavel INT NOT NULL,
  FOREIGN KEY (id_responsavel) REFERENCES responsavel(id_responsavel)
);

CREATE TABLE rotina (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  descricao TEXT NOT NULL,
  horario TIME NOT NULL,
  id_responsavel INT NOT NULL,
  FOREIGN KEY (id_responsavel) REFERENCES responsavel(id_responsavel)
);

-- Inserção de dados

INSERT INTO responsavel (username, email, telefone, password) VALUES
  ('daniella', 'daniella.emily@savescreen.com', '31999990001', 'senhaDani123'),
  ('eduardo',  'eduardo.aniceto@savescreen.com','31999990002', 'senhaEdu123'),
  ('izabel',   'izabel.chaves@savescreen.com',  '31999990003', 'senhaIza123'),
  ('joao',     'joao.pedro@savescreen.com',     '31999990004', 'senhaJP123');

INSERT INTO usuario (nome, email, senha, telefone) VALUES
  ('Daniella Emily',   'daniella.emily@savescreen.com',  'senhaDani123',  '31999990001'),
  ('Eduardo Aniceto',  'eduardo.aniceto@savescreen.com','senhaEdu123',   '31999990002'),
  ('Izabel Chaves',    'izabel.chaves@savescreen.com',  'senhaIza123',   '31999990003'),
  ('Joao Pedro',       'joao.pedro@savescreen.com',     'senhaJP123',    '31999990004');

INSERT INTO crianca (nome, data_nascimento, id_responsavel) VALUES
  ('Lucas Silva',   '2015-03-12', 1),
  ('Mariana Costa', '2014-07-23', 1),
  ('Elói Ribeiro',  '2025-08-19', 2),
  ('Pedro Souza',   '2016-01-05', 3),
  ('Laura Lima',    '2015-11-30', 4),
  ('Rafael Reis',   '2013-09-18', 4);

INSERT INTO restricao_uso (descricao, tempo_lim_min, id_responsavel) VALUES
  ('Máximo 60 minutos por dia',      60, 1),
  ('Apenas 30 minutos após as 18h',  30, 2),
  ('20 minutos antes de dormir',     20, 3),
  ('45 minutos em finais de semana', 45, 4),
  ('Restrição completa em dias de prova', 0, 4);

INSERT INTO uso_tela (data, hora_inicio, hora_fim, id_crianca, id_restricao) VALUES
  ('2025-05-10', '14:00:00', '15:00:00', 1, 1),
  ('2025-05-11', '18:30:00', '19:00:00', 2, 2),
  ('2025-05-12', '20:00:00', '20:20:00', 3, 3),
  ('2025-05-09', '10:00:00', '10:45:00', 4, 4);

INSERT INTO postagem (titulo, descricao, id_responsavel) VALUES
  ('Dicas para limitar tempo de tela', 'Confira estratégias eficazes para reduzir o uso excessivo de dispositivos.', 1),
  ('Apps educativos recomendados',      'Selecionamos aplicativos que combinam diversão e aprendizado.',     2),
  ('Como criar rotina saudável',        'Estabeleça horários fixos para estudo, lazer e descanso.',        3),
  ('Importância do sono infantil',      'Saiba como o uso de telas afeta a qualidade do sono.',          4),
  ('Atividades ao ar livre',            'Sugestões de brincadeiras ao ar livre para crianças.',          4);

INSERT INTO assinatura (data_inicio, ativo, id_responsavel) VALUES
  ('2025-01-01', TRUE,  1),
  ('2025-02-15', FALSE, 2),
  ('2025-03-10', TRUE,  3),
  ('2025-04-05', TRUE,  4);

INSERT INTO rotina (nome, descricao, horario, id_responsavel) VALUES
  ('Estudos', 'Hora de fazer lição de casa e revisar conteúdo escolar.', '17:00:00', 1),
  ('Jantar', 'Refeição em família sem uso de eletrônicos.', '19:30:00', 2),
  ('Leitura', 'Momento de leitura de histórias ou gibis.', '20:30:00', 3),
  ('Dormir', 'Hora de dormir, sem telas.', '21:00:00', 4);
