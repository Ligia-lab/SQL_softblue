CREATE DATABASE cursos_softblue;

USE cursos_softblue;

CREATE TABLE alunos
(
	id int unsigned not null auto_increment,
    nome varchar(30) not null,
    endereco varchar(45) not null,
    email varchar(45) not null,
    PRIMARY KEY (id)
);

CREATE TABLE instrutor
(
	id int unsigned not null auto_increment,
    nome varchar(30) not null,
    telefone varchar(10) not null,
    PRIMARY KEY (id)
);

CREATE TABLE cursos
(
	id int unsigned not null auto_increment,
    curso varchar(30) not null,
    tipo_id int unsigned not null,
    instrutor_id int unsigned not null,
    preco double default '0',
    PRIMARY KEY (id),
    CONSTRAINT fk_instrutor_id FOREIGN KEY (instrutor_id) REFERENCES instrutor (id),
    CONSTRAINT fk_tipo_id FOREIGN KEY (tipo_id) REFERENCES tipos (id)
);

CREATE TABLE tipos
(
	id int unsigned not null auto_increment,
    tipo varchar(30),
    PRIMARY KEY (id)
);

CREATE TABLE compra
(
	id int unsigned not null auto_increment,
    aluno_id int unsigned not null,
    data_compra date,
    hora_compra time,
    PRIMARY KEY (id),
    CONSTRAINT fk_aluno_id FOREIGN KEY (aluno_id) REFERENCES alunos (id)    
);

CREATE TABLE detalhe_compra
(
	compra_id int unsigned not null,
    curso_id int unsigned not null,
    valor double default '0',
    PRIMARY KEY (compra_id, curso_id),
    CONSTRAINT fk_compra_id FOREIGN KEY (compra_id) REFERENCES compra (id),
    CONSTRAINT fk_curso_id FOREIGN KEY (curso_id) REFERENCES cursos (id)
);










