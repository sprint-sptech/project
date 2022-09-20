CREATE DATABASE smartIce;

USE smartIce;

-- criação das tabelas

CREATE TABLE Empresa(
idEmpresa int primary key auto_increment,
nomeFantasia varchar(45) not null,
cnpj char(14) not null,
telefone varchar(13),
responsavel varchar(45)
);

CREATE TABLE Usuario(
idUsuario int primary key auto_increment,
nomeUsuario varchar(45) not null,
email varchar(50) not null,
senha varchar(16) not null,
fkEmpresa int,
Foreign key (fkEmpresa) references Empresa(idEmpresa)
)auto_increment=100;

CREATE TABLE Freezer(
idFreezer int primary key auto_increment,
identificacao varchar(45) not null,
fkEmpresa int,
foreign key (fkEmpresa) references Empresa(idEmpresa)
)auto_increment=500;

CREATE TABLE Sensores(
idSensores int primary key auto_increment,
numeroSerie varchar(10) not null,
fkFreezer int, 
foreign key (fkFreezer) references Freezer(idFreezer)
)auto_increment=1000;

CREATE TABLE dadosSensor(
idDadosSensor int primary key auto_increment,
temperatura float,
dataHora datetime default current_timestamp,
fkSensores int,
foreign key (fkSensores) references Sensores(idSensores)
)auto_increment=1000;

-- inserção de dados na tabela

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

INSERT INTO Sensores (numeroSerie, fkFreezer) VALUES
	('JEJ82U19M0', 500),
    ('8SK20D8J38', 501),
    ('J92B9JJ27A', 502),
    ('JW999A12M0', 503),
    ('OO92NAB4Y7', 504),
    ('9SN3KSM45H', 505),
    ('2JC830KSU2', 506);
    
INSERT INTO dadosSensor (temperatura, fkSensores) VALUES
	(-25.2, 1000),
    (-25.5, 1001),
    (-26.1, 1002),
    (-25.8, 1003),
    (-26.2, 1004),
    (-25.0, 1005),
    (-24.9, 1006);
   
-- Mostrar a temperatura e a data/hora dos respectivos freezers
SELECT f.identificacao AS 'Identificação',  ds.temperatura AS 'Temperatura', ds.dataHora AS 'Data e hora' FROM Freezer f
	JOIN Sensores s ON fkFreezer = idfreezer
	JOIN dadosSensor ds ON ds.fkSensores = s.idSensores;
    
-- Nome da empresa e seu respectivo responsável
SELECT nomeFantasia, responsavel FROM empresa;

-- Identificação dos freezers e seus respectivos sensores
SELECT f.identificacao AS 'Identificação', s.numeroSerie AS 'Número de série' FROM freezer f
	JOIN sensores s ON fkFreezer = idFreezer;

