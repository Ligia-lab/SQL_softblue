USE cursos_softblue;

SELECT * FROM alunos;
SELECT * FROM compra;
SELECT * FROM detalhe_compra;
SELECT * FROM cursos;
SELECT * FROM instrutor;
SELECT * FROM tipos;
SELECT DISTINCT(aluno_id) FROM compra;

-- Selecione os nomes de todos os alunos que já fizeram alguma matrícula na Softblue, sem repetição;
SELECT DISTINCT(nome) FROM alunos INNER JOIN compra ON alunos.id = compra.aluno_id;


-- Exiba o nome do aluno mais antigo da Softblue;
SELECT nome FROM alunos INNER JOIN compra ON alunos.id = compra.aluno_id ORDER BY data_hora LIMIT 1;


-- Exiba o nome do aluno mais recente da Softblue;
SELECT nome FROM alunos INNER JOIN compra ON alunos.id = compra.aluno_id ORDER BY data_hora DESC LIMIT 1;


-- Exiba o nome do terceiro aluno mais antigo da Softblue;
SELECT DISTINCT(compra.aluno_id) FROM compra INNER JOIN alunos ON alunos.id = compra.aluno_id ORDER BY data_hora ASC LIMIT 1 OFFSET 2;
SELECT DISTINCT(ALUNO.ALUNO) FROM PEDIDO INNER JOIN ALUNO ON PEDIDO.ALUNO = ALUNO.CODIGO ORDER BY DATAHORA ASC LIMIT 1 OFFSET 2;
SELECT * from alunos INNER JOIN compra ON alunos.id = compra.aluno_id;
SELECT DISTINCT(compra.aluno_id) from alunos INNER JOIN compra ON alunos.id = compra.aluno_id;
SELECT DISTINCT(compra.aluno_id), compra.data_hora, alunos.nome from compra INNER JOIN alunos ON alunos.id = compra.aluno_id ORDER BY compra.data_hora ASC LIMIT 1 OFFSET 2;
SELECT DISTINCT(compra.id), alunos.nome  FROM alunos INNER JOIN compra ON alunos.id = compra.aluno_id ORDER BY data_hora LIMIT 1 OFFSET 3;




-- Exiba a quantidade de cursos que já foram vendidos pela Softblue;
SELECT COUNT(*) FROM detalhe_compra;



-- Exiba o valor total já arrecadado pelos cursos vendidos pela Softblue;
SELECT SUM(valor) FROM detalhe_compra;


-- Exiba o valor médio cobrado por curso para o pedido cujo CODIGO é 2;
SELECT AVG(valor) FROM detalhe_compra WHERE id_compra = 2;


-- Exiba o valor do curso mais caro da Softblue;
SELECT MAX(preco) FROM cursos;


-- Exiba o valor do curso mais barato da Softblue;
SELECT MIN(preco) FROM cursos;


-- Exiba o valor total de cada pedido realizado na Softblue;
SELECT SUM(valor) from detalhe_compra GROUP BY id_compra;


-- Exiba os nomes dos instrutores da Softblue e a quantidade de cursos que cada um tem sob sua responsabilidade;
SELECT instrutor.nome, COUNT(cursos.curso) FROM instrutor INNER JOIN cursos ON instrutor.id = cursos.instrutor_id GROUP BY instrutor.nome;


-- Exiba o número do pedido, nome do aluno e valor para todos os pedidos realizados na Softblue cujo valor total sejam maiores que 500;
SELECT detalhe_compra.id_compra, alunos.nome, SUM(detalhe_compra.valor) AS 'total' FROM detalhe_compra 
INNER JOIN compra ON detalhe_compra.id_compra = compra.id
INNER JOIN alunos ON compra.aluno_id = alunos.id
GROUP BY detalhe_compra.id_compra
HAVING total > 500;

SELECT * FROM alunos;
SELECT * FROM compra;
SELECT * FROM detalhe_compra;
SELECT * FROM cursos;
SELECT * FROM instrutor;
SELECT * FROM tipos;
SELECT DISTINCT(aluno_id) FROM compra;

-- Exiba o número do pedido, nome do aluno e quantos cursos foram comprados no pedido para todos os pedidos realizados na Softblue que compraram dois ou mais cursos;
SELECT compra.id, alunos.nome, detalhe_compra.id_compra FROM compra 
INNER JOIN alunos ON alunos.id = compra.aluno_id
INNER JOIN detalhe_compra ON detalhe_compra.id_compra = compra.id
GROUP BY detalhe_compra.id_compra HAVING COUNT(*) > 1;

SELECT id_compra, alunos.nome, COUNT(*) FROM detalhe_compra
INNER JOIN compra ON detalhe_compra.id_compra = compra.id
INNER JOIN alunos ON compra.aluno_id = alunos.id
GROUP BY id_compra HAVING COUNT(*) > 1;


-- Exiba o nome e endereço de todos os alunos que morem em Avenidas (Av.);
SELECT nome, endereco FROM alunos WHERE endereco LIKE 'Av%';



-- Exiba os nomes dos cursos de Java da Softblue;
SELECT curso FROM cursos WHERE curso LIKE '%java%';
