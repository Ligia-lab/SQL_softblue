USE cursos_softblue;

SELECT * FROM cursos;
SELECT * FROM tipos;
SELECT * FROM instrutor;
SELECT * FROM alunos;
SELECT * FROM compra;
SELECT * FROM detalhe_compra;

-- Exiba uma lista com os títulos dos cursos da Softblue e o tipo de curso ao lado;
SELECT c.curso, t.tipo FROM cursos c INNER JOIN tipos t ON c.tipo_id = t.id;


-- Exiba uma lista com os títulos dos cursos da Softblue, tipo do curso, nome do instrutor responsável pelo mesmo e telefone;
SELECT c.curso, t.tipo, i.nome, i.telefone FROM cursos c 
INNER JOIN tipos t ON c.tipo_id = t.id
INNER JOIN instrutor i ON i.id = c.instrutor_id;


-- Exiba uma lista com o código e data e hora dos pedidos e os códigos dos cursos de cada pedido;
SELECT c.id, c.data_hora, d.curso_id FROM compra c INNER JOIN detalhe_compra d ON d.id_compra = c.id;


-- Exiba uma lista com o código e data e hora dos pedidos e os títulos dos cursos de cada pedido;
SELECT c.id, c.data_hora, cursos.curso FROM compra c 
INNER JOIN detalhe_compra d ON d.id_compra = c.id
INNER JOIN cursos ON d.curso_id = cursos.id;


-- Exiba uma lista com o código e data e hora dos pedidos, nome do aluno e os títulos dos cursos de cada pedido;
SELECT c.id, c.data_hora, a.nome, cursos.curso FROM compra c 
INNER JOIN detalhe_compra d ON d.id_compra = c.id
INNER JOIN alunos a ON a.id = c.aluno_id
INNER JOIN cursos ON d.curso_id = cursos.id;

