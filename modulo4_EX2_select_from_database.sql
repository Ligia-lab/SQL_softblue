SHOW DATABASES;

USE cursos_softblue;

SELECT * FROM alunos;

SELECT curso FROM cursos;

SELECT curso, preco FROM cursos WHERE preco > 200;

SELECT curso, preco FROM cursos WHERE preco > 200 AND preco < 300;

SELECT * FROM compra;
SELECT * FROM compra WHERE data_hora BETWEEN '2010-04-15' AND '2010-04-19';

SELECT * FROM compra WHERE data_hora LIKE '2010-04-15%';