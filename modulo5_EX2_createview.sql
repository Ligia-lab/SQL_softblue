USE cursos_softblue;

SELECT * FROM cursos;
SELECT * FROM tipos;
SELECT * FROM instrutor;
SELECT * FROM alunos;
SELECT * FROM compra;
SELECT * FROM detalhe_compra;


-- Crie uma visão que traga o título e preço somente dos cursos de programação da Softblue;
CREATE VIEW programação AS
SELECT curso, preco FROM cursos WHERE tipo_id = 2;

SELECT * FROM programação;

-- Crie uma visão que traga os títulos dos cursos, tipo do curso e nome do instrutor;
CREATE VIEW curso_t_instrutor AS
SELECT curso, t.tipo, i.nome FROM cursos
INNER JOIN tipos t ON t.id = cursos.tipo_id
INNER JOIN instrutor i ON cursos.instrutor_id = i.id;

SELECT * FROM curso_t_instrutor;


-- Crie uma visão que exiba os pedidos realizados, informando o nome do aluno, data e código do pedido;
CREATE VIEW nome_pedido AS
SELECT a.nome, c.data_hora, c.id FROM alunos a
INNER JOIN compra c ON a.id = c.aluno_id;

SELECT * FROM nome_pedido;