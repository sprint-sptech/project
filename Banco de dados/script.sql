create database smartIce;

use smartIce;

-- criação das tabelas

create table empresa(
idEmpresa int primary key auto_increment,
nomeFantasia varchar(45) not null,
cnpj char(14) not null,
telefone varchar(13),
responsavel varchar(45)
);

create table usuario(
idUsuario int primary key auto_increment,
nomeUsuario varchar(45) not null,
email varchar(50) not null,
senha varchar(16) not null,
fkEmpresa int,
Foreign key (fkEmpresa) references empresa(idEmpresa)
)auto_increment=100;

create table freezer(
idFreezer int primary key auto_increment,
identificação varchar(45) not null,
fkEmpresa int,
foreign key (fkEmpresa) references empresa(idEmpresa)
)auto_increment=500;

create table sensores(
idSensor int primary key auto_increment,
numeroSerie varchar(10) not null,
fkFreezer int, 
foreign key (fkFreezer) references freezer(idFreezer)
)auto_increment=1000;

create table dadosSensor(
idDado int primary key auto_increment,
temperatura float,
dataHora datetime default current_timestamp,
fkSensor int,
foreign key (fkSensor) references sensores(idSensor)
)auto_increment=1000;

-- inserção de dados na tabela

insert into empresa (nomeFantasia, cnpj, telefone, responsavel) values
	('Kibon', '17261628000171', '5511949617385', 'kleber' ),
	('Ice Gurt', '77524742000176', '5511972694166', 'Gabriel'),
	('Oggi', '86279941000154', '5511999758432', 'Marlene');

insert into usuario (nomeUsuario, email, senha, fkEmpresa) values
	('Roberta', 'roberta@icegurt.com', 'R@bert4', 2),
    ('Giovana', 'gi@oggi.com', '#2002Giovana', 3),
    ('Marcos', 'marcos@oggi.com', 'marcola123', 3),
    ('Matheus', 'matheus@kibon.com', 'mathppp90', 1);
    
insert into freezer (identificação, fkEmpresa) values
	('Freezer Alpha',1),
    ('Freezer xpto', 1),
    ('Freezer leste', 2),
    ('Freezer central', 2),
    ('Freezer sul', 2),
    ('Freezer terreo', 3),
    ('Freezer primeiro andar', 3);

insert into sensores (numeroSerie, fkFreezer) values
	('JEJ82U19M0', 500),
    ('8SK20D8J38', 501),
    ('J92B9JJ27A', 502),
    ('JW999A12M0', 503),
    ('OO92NAB4Y7', 504),
    ('9SN3KSM45H', 505),
    ('2JC830KSU2', 506);
    
insert into dadosSensor (temperatura, fkSensor) values
	(-25.2, 1000),
    (-25.5, 1001),
    (-26.1, 1002),
    (-25.8, 1003),
    (-26.2, 1004),
    (-25.0, 1005),
    (-24.9, 1006);
    

