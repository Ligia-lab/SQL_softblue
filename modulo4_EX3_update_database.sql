USE cursos_softblue;


SELECT * FROM alunos;

UPDATE alunos SET endereco = 'Av. Brasil 778' WHERE nome = 'José';
UPDATE alunos SET email = 'cristiano@softblue.com.br' WHERE nome = 'Cris';

SELECT * FROM cursos;

SET SQL_SAFE_UPDATES = 0;
UPDATE cursos SET preco = preco + (preco * 0.1) WHERE  preco < 300;

UPDATE cursos SET curso = 'Php Fundamentos' WHERE curso = 'Php Básico';