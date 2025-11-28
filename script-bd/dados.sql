INSERT INTO intervalos (horario, turno_intervalo) VALUES
('08:20', 1),
('09:30', 1),
('10:40', 1),
('11:50', 1);

INSERT INTO mips (codmip, nome_mip, desc_mip, nivel_mip) VALUES 
(1, 'MIP-01', 'Arburg', 2), 
(2, 'MIP-02', 'Arburg', 1), 
(3, 'MIP-03', 'Arburg', 1), 
(4, 'MIP-04', 'Arburg', 1), 
(5, 'MIP-05', 'Arburg', 1), 
(6, 'MIP-06', 'Arburg', 1), 
(7, 'MIP-07', 'Arburg', 1), 
(8, 'MIP-08', 'Arburg', 1), 
(9, 'MIP-09', 'Arburg', 1), 
(10, 'MIP-10', 'Arburg', 1),
(11, 'MIP-11', 'Haitian', 1), 
(12, 'MIP-12', 'Haitian', 1), 
(13, 'MIP-13', 'Haitian', 1), 
(14, 'MIP-14', 'Haitian', 1), 
(15, 'MIP-15', 'Haitian', 1),
(16, 'MIP-16', 'Haitian', 2), 
(17, 'MIP-17', 'Haitian', 1), 
(18, 'MIP-18', 'Haitian', 2), 
(19, 'MIP-19', 'Haitian', 2), 
(20, 'MIP-20', 'Haitian', 2),
(21, 'MIP-21', 'Haitian', 1), 
(22, 'MIP-22', 'Haitian', 2), 
(23, 'MIP-23', 'Haitian', 1), 
(24, 'MIP-24', 'Haitian', 1), 
(25, 'MIP-25', 'Haitian', 1);

INSERT INTO operadores (codop, nome_op, intervalo, turno, nivel_op) VALUES
-- Grupo 08:20 (ID 1)
(1, 'Jussara', 1, 1, 1),
(2, 'Cauana', 1, 1, 1),
(3, 'Janaina', 1, 1, 1),
(4, 'Solgelys', 1, 1, 1),
(5, 'Isabel', 1, 1, 1),
(31, 'Brayan', 1, 1, 1),
(33, 'Josué', 1, 1, 1),
(34, 'Roberto', 1, 1, 1),
(35, 'Jesus', 1, 1, 1),

-- Grupo 09:30 (ID 2)
(6, 'Ana Flávia', 2, 1, 2),
(7, 'Heidermar', 2, 1, 2),
(8, 'Victoria', 2, 1, 1),
(9, 'Simone', 2, 1, 1),
(10, 'Ilenir', 2, 1, 2),
(32, 'Salete', 2, 1, 2),
(37, 'Larissa', 2, 1, 1),
(38, 'Danyelis', 2, 1, 1),
(39, 'Marcia B', 2, 1, 2),
(40, 'Gabriel', 2, 1, 1),

-- Grupo 10:40 (ID 3)
(11, 'Ana Garcia', 3, 1, 1),
(12, 'Jenifer', 3, 1, 2),
(13, 'Mariangel', 3, 1, 1),
(14, 'Jean C', 3, 1, 2),
(15, 'Emelis', 3, 1, 1),
(41, 'Kidia', 3, 1, 1),
(42, 'Marcia T', 3, 1, 2),
(43, 'Jean Pierre', 3, 1, 1),

-- Grupo 11:50 (ID 4)
(16, 'Freddy', 4, 1, 1),
(17, 'Sandra', 4, 1, 2),
(18, 'Diana', 4, 1, 1),
(19, 'Gregorio', 4, 1, 1),
(20, 'Augusto', 4, 1, 1),
(36, 'Freidimar', 4, 1, 1);


INSERT INTO sit_mips (codmip, situacao_mip)
SELECT codmip, 1
FROM mips
ON CONFLICT (codmip) DO UPDATE SET situacao_mip = 1; 

INSERT INTO sit_operadores (codop, situacao_op)
SELECT codop, 1
FROM operadores
ON CONFLICT (codop) DO UPDATE SET situacao_op = 1; 