-- USE sys;
-- DROP DATABASE Oficina;

CREATE DATABASE Oficina;
USE Oficina;

-- Cliente
CREATE TABLE Cliente (
	idCliente INT auto_increment PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL
);

-- Equipe
CREATE TABLE Equipe(
	idEquipe INT auto_increment PRIMARY KEY,
	Descricao VARCHAR(45) NOT NULL
);

-- Veículo
CREATE TABLE Veiculo(
	idVeiculo INT auto_increment PRIMARY KEY,
	idCliente INT NOT NULL,
    Marca VARCHAR(45) NOT NULL,
    Modelo VARCHAR(45) NOT NULL,
    AnoModelo SMALLINT NOT NULL,
    idEquipe INT NOT NULL,
    CONSTRAINT fk_veiculo_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    CONSTRAINT fk_veiculo_equipe FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe)
);


--  Serviço
CREATE TABLE Servico(
	idServico INT auto_increment PRIMARY KEY,
	Descricao VARCHAR(45) NOT NULL,
    Valor FLOAT DEFAULT 0
);

-- Peça
CREATE TABLE Peca(
	idPeca INT auto_increment PRIMARY KEY,
	Descricao VARCHAR(45) NOT NULL,
    Valor FLOAT DEFAULT 0
);

CREATE TABLE Os(
	idOS INT auto_increment PRIMARY KEY,
    DataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    Valor FLOAT,
    Situacao VARCHAR(45),
    DataConclusao DATETIME,
    DataEntrega DATETIME,
    Autorizacao VARCHAR(45),
    idVeiculo INT NOT NULL,
    CONSTRAINT fk_os_veiculo FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo)
);

CREATE TABLE OsPeca(
	idOs INT NOT NULL,
    idPeca INT NOT NULL,
    Quantidade FLOAT NOT NULL DEFAULT 1.00,
    CONSTRAINT fk_ospeca_os FOREIGN KEY (idOs) REFERENCES Os(idOs),
    CONSTRAINT fk_ospeca_peca FOREIGN KEY (idPeca) REFERENCES Peca(idPeca)
);

CREATE TABLE OsServico(
	idOs INT NOT NULL,
    idServico INT NOT NULL,
    Quantidade FLOAT NOT NULL DEFAULT 1.00,
    CONSTRAINT fk_osservico_os FOREIGN KEY (idOs) REFERENCES Os(idOs),
    CONSTRAINT fk_osservico_servico FOREIGN KEY (idServico) REFERENCES Servico(idServico)
);
