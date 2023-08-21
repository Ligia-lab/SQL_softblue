USE cursos_softblue;

SELECT * FROM alunos;
SELECT * FROM compra;
SELECT * FROM detalhe_compra;
SELECT * FROM cursos;
SELECT * FROM instrutor;
SELECT * FROM tipos;

-- Utilizando subquery, exiba uma lista com os nomes dos cursos disponibilizados pela Softblue informando para cada curso qual o seu menor valor de venda já praticado;
SELECT curso, 
(SELECT MIN(valor) FROM detalhe_compra WHERE detalhe_compra.curso_id = cursos.id) 
AS menor_valor FROM cursos;


-- Utilizando subquery e o parâmetro IN, exiba os nomes dos cursos disponibilizados pela Softblue cujo tipo de curso seja 'Programação';
SELECT curso FROM cursos WHERE tipo_id IN 
(SELECT id FROM tipos WHERE tipo = 'Programação');


-- Utilizando subquery e o parâmetro EXISTS, exiba novamente os nomes dos cursos disponibilizados pela Softblue cujo tipo de curso seja 'Programação';
SELECT curso FROM cursos WHERE EXISTS
(SELECT tipo FROM tipos WHERE tipos.id = cursos.tipo_id AND tipos.tipo = 'Programação');


-- Exiba uma lista com os nomes dos instrutores da Softblue e ao lado o total acumulado das vendas referente aos cursos pelo qual o instrutor é responsável;
SELECT nome, 
(SELECT SUM(detalhe_compra.valor) FROM detalhe_compra
INNER JOIN cursos ON detalhe_compra.curso_id = cursos.id
WHERE cursos.instrutor_id = instrutor.id)
AS total_vendas FROM instrutor; 



-- Crie uma visão que exiba os nomes dos alunos e quanto cada um já comprou em cursos;
CREATE VIEW valor_alunos AS
SELECT nome,
(SELECT SUM(detalhe_compra.valor) FROM detalhe_compra
INNER JOIN compra ON compra.id = detalhe_compra.id_compra
WHERE compra.aluno_id = alunos.id)
AS valor_total FROM alunos;

SELECT * FROM valor_alunos;

