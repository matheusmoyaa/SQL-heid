CREATE DATABASE JucaCursosMatheusMoya;

USE JucaCursosMatheusMoya;

CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    data_cadastro DATETIME 
);
/*2--------------------------------------------------------*/

CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(150) NOT NULL,
    carga_horaria INT NOT NULL CHECK (carga_horaria > 0),
    valor DECIMAL(8,2) NOT NULL CHECK (valor > 0)
);
/*3--------------------------------------------------------*/

INSERT INTO alunos (nome, email, data_nascimento)
VALUES 
('Ana Souza', 'ana@gmail.com', '2005-03-10'),
('Bruno Lima', 'bruno@gmail.com', '2000-07-21'),
('Carla Mendes', 'carla@gmail.com', '2003-11-05'),
('Daniel Rocha', 'daniel@gmail.com', '1997-01-18'),
('Amanda Silva', 'amanda@gmail.com', '2006-09-30');

/*4--------------------------------------------------------*/

INSERT INTO cursos (nome_curso, carga_horaria, valor)
VALUES 
('SQL Básico – Uma linguagem para banco de dados', 40, 299.90),
('Java Fundamentos', 60, 399.90),
('C# para Iniciantes', 50, 349.90),
('Banco de Dados Avançado', 80, 499.90),
('Lógica de Programação', 30, 199.90);

/*5--------------------------------------------------------*/

SELECT * FROM alunos;
SELECT * FROM cursos;

/*6------------------------*/

SELECT nome FROM alunos
WHERE data_nascimento < '2004-03-11';

/*7---------------------------*/

SELECT * FROM cursos
WHERE valor < 400;

/*8-------------------------*/

SELECT * FROM alunos
WHERE nome LIKE 'A%';

/*9----------------------------*/

SELECT nome_curso, valor FROM cursos
WHERE nome_curso LIKE '%Banco%';

/*10--------------------------*/

SELECT * FROM alunos
ORDER BY nome ASC;

/*11---------------------------*/

SELECT * FROM cursos
ORDER BY valor DESC;

/*12--------------------------*/

UPDATE alunos
SET email = 'ana@gmail.com.br'
WHERE nome = 'Ana Souza';

/*13---------------------------*/

UPDATE cursos
SET valor = 390.99
WHERE nome_curso LIKE 'C#%';

/*14----------------------------*/

DELETE FROM alunos
WHERE nome = 'Daniel Rocha';


/*Desafio--------------------------?*/

/* 1 */

SELECT 
    id_aluno,
    nome,
    email,
    data_nascimento,
    TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
FROM alunos
ORDER BY idade DESC;
