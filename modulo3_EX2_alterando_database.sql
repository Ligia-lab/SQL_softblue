USE cursos_softblue;

ALTER TABLE alunos ADD COLUMN data_nascimento varchar(10);
ALTER TABLE alunos CHANGE COLUMN data_nascimento nascimento date;

SHOW TABLES;

CREATE INDEX aluno ON alunos(nome);

ALTER TABLE instrutor ADD COLUMN email varchar(100);

CREATE INDEX curso_instrutor ON cursos (instrutor_id);

ALTER TABLE instrutor DROP COLUMN email;