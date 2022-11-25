CREATE DATABASE Glacies
GO
USE Glacies
-- ------------------------------------------ -

CREATE TABLE Empresa(
	idEmpresa INT PRIMARY KEY IDENTITY(1,1),
	nomeFantasia VARCHAR(45) NOT NULL,
	cnpj VARCHAR(20) NOT NULL,
	telefone VARCHAR(20),
	responsavel VARCHAR(45)
)

CREATE TABLE Usuario(
	idUsuario INT IDENTITY(1,1),
	nomeUsuario VARCHAR(45) NOT NULL,
	email VARCHAR(50) NOT NULL,
	senha VARCHAR(16) NOT NULL,
	fkEmpresa INT,
	FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
    PRIMARY KEY (idUsuario, fkEmpresa)
)

CREATE TABLE Alerta(
	idAlerta INT PRIMARY KEY IDENTITY(1,1),
	tipo VARCHAR(45), 
	CONSTRAINT chkTipo CHECK (tipo = 'critico' or tipo = 'alerta')
)

CREATE TABLE Freezer(
	idFreezer INT IDENTITY(1,1),
	identificacao VARCHAR(45) NOT NULL,
	fkEmpresa INT,
	FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa),
	PRIMARY KEY (idFreezer, fkEmpresa)
)

CREATE TABLE Sensor(
	idSensor INT IDENTITY(1,1),
	numeroSerie VARCHAR(10) NOT NULL,
	fkFreezer INT, 
    fkEmpFreezer INT,
    FOREIGN KEY (fkFreezer, fkEmpFreezer)
        REFERENCES Freezer(idFreezer, fkEmpresa),
	PRIMARY KEY (idSensor, fkFreezer)
)

CREATE TABLE dadoSensor(
	idDadoSensor INT IDENTITY(1,1),
	temperatura DECIMAL (10,2),
	dataHora DATETIME DEFAULT CURRENT_TIMESTAMP,
	fkSensor INT,
    fkSenFreezer INT,
	FOREIGN KEY (fkSensor, fkSenFreezer) 
        REFERENCES Sensor(idSensor, fkFreezer),
	PRIMARY KEY (idDadoSensor, fkSensor)
)

CREATE TABLE alertaSensor(
	idAlertaSensor INT IDENTITY(1,1),
	fkDadoSensor INT,
	fkAlerta INT,
	FOREIGN KEY (fkAlerta) REFERENCES alertaSensor(idAlertaSensor),
	FOREIGN KEY (fkDadoSensor) REFERENCES dadoSensor(idDadoSensor),
	PRIMARY KEY (idAlertaSensor,fkDadoSensor,fkAlerta),
	dtAlerta DATETIME DEFAULT CURRENT_TIMESTAMP,
    temperatura DECIMAL(10,2)
)

INSERT INTO Empresa (nomeFantasia, cnpj, telefone, responsavel) VALUES
	('Kibon', '17261628000171', '5511949617385', 'kleber' ),
	('Ice Gurt', '77524742000176', '5511972694166', 'Gabriel'),
	('Oggi', '86279941000154', '5511999758432', 'Marlene');

INSERT INTO Usuario (nomeUsuario, email, senha, fkEmpresa) VALUES
	('Roberta', 'roberta@icegurt.com', 'R@bert4', 2),
    ('Giovana', 'gi@oggi.com', '#2002Giovana', 3),
    ('Marcos', 'marcos@oggi.com', 'marcola123', 3),
    ('Matheus', 'matheus@kibon.com', 'mathppp90', 1);

INSERT INTO Freezer (identificacao, fkEmpresa) VALUES
	('Freezer Alpha',1),
    ('Freezer xpto', 1),
    ('Freezer leste', 2),
    ('Freezer central', 2),
    ('Freezer sul', 2),
    ('Freezer terreo', 3),
    ('Freezer primeiro andar', 3);

INSERT INTO Sensor (numeroSerie, fkFreezer) VALUES
	('JEJ82U19M0', 1),
    ('8SK20D8J38', 2),
    ('J92B9JJ27A', 3),
    ('JW999A12M0', 4),
    ('OO92NAB4Y7', 5),
    ('9SN3KSM45H', 6),
    ('2JC830KSU2', 7);

INSERT INTO dadoSensor (temperatura, fkSensor) VALUES
	(-25.2, 1),
    (-25.5, 2),
    (-26.1, 3),
    (-25.8, 4),
    (-26.2, 5),
    (-25.0, 6),
    (-24.9, 7);
    
    INSERT INTO alerta (tipo) VALUES
	('critico'),
    ('alerta');
    
    select * from alerta;
    
    select * from alertaSensor;
    
    select * from sensor;
    
    select * from dadoSensor;