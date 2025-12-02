/* esquema-fisico: */

CREATE TABLE Jogo (
    horario_inicio TIME NOT NULL,
    local VARCHAR(250) NOT NULL,
    id_jogo INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY UNIQUE,
    horario_termino TIME NOT NULL,
    qtd_max_jogador TINYINT UNSIGNED NOT NULL,
    qtd_min_jogador TINYINT UNSIGNED NOT NULL,
    status ENUM('confirmado', 'encerrado', 'aberto' ) NOT NULL,
    data_jogo DATE NOT NULL,
    valor_total  DECIMAL(5,2) UNSIGNED NOT NULL,
    data_abertura_confirmacao DATE NOT NULL,
    data_encerramento_confirmacao DATE NOT NULL
);

CREATE TABLE Partida (
    pontuacao_total_2 TINYINT UNSIGNED NOT NULL,
    pontuacao_total_1 TINYINT UNSIGNED NOT NULL,
    resultado ENUM('time1','time2', 'empate') NOT NULL,
    id_partida INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY UNIQUE,
    id_jogo INTEGER UNSIGNED NOT NULL
);

CREATE TABLE Jogador (
    email_jogador VARCHAR(200) NOT NULL,
    pontuacao TINYINT UNSIGNED NOT NULL,
    assistencias TINYINT UNSIGNED NOT NULL,
    rebotes TINYINT UNSIGNED NOT NULL,
    roubos TINYINT UNSIGNED NOT NULL,
    bloqueios TINYINT UNSIGNED NOT NULL,
    telefone_jogador VARCHAR(150) NOT NULL,
    nome_jogador VARCHAR(100) NOT NULL,
    id_jogador INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY UNIQUE,
    posicao_preferida ENUM('armador', 'ala-armador', 'ala', 'ala-pivo', 'pivo') NOT NULL,
    qtd_partidas SMALLINT UNSIGNED NOT NULL
);

CREATE TABLE Time (
    nome_time VARCHAR(100) NOT NULL,
    id_time INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY UNIQUE
);

CREATE TABLE Estatistica (
    id_jogador INTEGER UNSIGNED NOT NULL,
    id_time INTEGER UNSIGNED NOT NULL,
    id_partida INTEGER UNSIGNED NOT NULL,
    pontuacao TINYINT UNSIGNED NOT NULL,
    assistencia TINYINT UNSIGNED NOT NULL,
    rebotes TINYINT UNSIGNED NOT NULL,
    roubos TINYINT UNSIGNED NOT NULL,
    bloqueios TINYINT UNSIGNED NOT NULL
);

CREATE TABLE Participacao (
    id_jogador INTEGER UNSIGNED NOT NULL,
    id_jogo INTEGER UNSIGNED NOT NULL,
    data_confirmacao DATE NOT NULL
);

CREATE TABLE Formacao_Time (
    id_time INTEGER UNSIGNED NOT NULL,
    id_jogo INTEGER UNSIGNED NOT NULL,
    id_jogador INTEGER UNSIGNED NOT NULL
);

CREATE TABLE Time_Partida (
    id_time INTEGER UNSIGNED NOT NULL,
    id_partida INTEGER UNSIGNED NOT NULL,
    resultado ENUM('vitoria','derrota','empate') NOT NULL,
    pontuacao_total SMALLINT UNSIGNED NOT NULL
);

CREATE TABLE Paga (
    id_jogador INTEGER UNSIGNED NOT NULL,
    id_jogo INTEGER UNSIGNED NOT NULL,
    data_pagamento DATE NOT NULL,
    valor_pago DECIMAL(5,2) UNSIGNED NOT NULL
);
 
ALTER TABLE Partida ADD CONSTRAINT FK_Partida_2
    FOREIGN KEY (id_jogo)
    REFERENCES Jogo (id_jogo)
    ON DELETE CASCADE;
 
ALTER TABLE Estatistica ADD CONSTRAINT FK_Estatistica_1
    FOREIGN KEY (id_jogador)
    REFERENCES Jogador (id_jogador)
    ON DELETE NO ACTION;
 
ALTER TABLE Estatistica ADD CONSTRAINT FK_Estatistica_2
    FOREIGN KEY (id_time)
    REFERENCES Time (id_time)
    ON DELETE RESTRICT;
 
ALTER TABLE Estatistica ADD CONSTRAINT FK_Estatistica_3
    FOREIGN KEY (id_partida)
    REFERENCES Partida (id_partida)
    ON DELETE NO ACTION;
 
ALTER TABLE Participacao ADD CONSTRAINT FK_Participacao_1
    FOREIGN KEY (id_jogador)
    REFERENCES Jogador (id_jogador)
    ON DELETE RESTRICT;
 
ALTER TABLE Participacao ADD CONSTRAINT FK_Participacao_2
    FOREIGN KEY (id_jogo)
    REFERENCES Jogo (id_jogo)
    ON DELETE RESTRICT;
 
ALTER TABLE Formacao_Time ADD CONSTRAINT FK_Formacao_Time_1
    FOREIGN KEY (id_time)
    REFERENCES Time (id_time)
    ON DELETE RESTRICT;
 
ALTER TABLE Formacao_Time ADD CONSTRAINT FK_Formacao_Time_2
    FOREIGN KEY (id_jogo)
    REFERENCES Jogo (id_jogo)
    ON DELETE NO ACTION;
 
ALTER TABLE Formacao_Time ADD CONSTRAINT FK_Formacao_Time_3
    FOREIGN KEY (id_jogador)
    REFERENCES Jogador (id_jogador)
    ON DELETE NO ACTION;
 
ALTER TABLE Time_Partida ADD CONSTRAINT FK_Time_Partida_1
    FOREIGN KEY (id_time)
    REFERENCES Time (id_time)
    ON DELETE RESTRICT;
 
ALTER TABLE Time_Partida ADD CONSTRAINT FK_Time_Partida_2
    FOREIGN KEY (id_partida)
    REFERENCES Partida (id_partida)
    ON DELETE RESTRICT;
 
ALTER TABLE Paga ADD CONSTRAINT FK_Paga_1
    FOREIGN KEY (id_jogador)
    REFERENCES Jogador (id_jogador)
    ON DELETE RESTRICT;
 
ALTER TABLE Paga ADD CONSTRAINT FK_Paga_2
    FOREIGN KEY (id_jogo)
    REFERENCES Jogo (id_jogo)
    ON DELETE RESTRICT;