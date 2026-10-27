USE BIBLIOTECA_DB;

INSERT INTO CIUDAD (NOMBRE) VALUES 
('Santiago'), 
('Valparaíso'), 
('Concepción');

INSERT INTO AUTORES (RUT_AUTOR, NOMBRES, APELLIDOS) VALUES 
('11.111.111-1', 'Gabriel', 'García Márquez'),
('22.222.222-2', 'Jorge Luis', 'Borges'),
('33.333.333-3', 'Mario', 'Mendoza'),
('44.444.444-4', 'Isabel', 'Allende');

INSERT INTO EDITORIALES (NOMBRE, PAIS) VALUES 
('Sudamericana', 'Argentina'),
('Debolsillo', 'España'),
('Planeta', 'Chile'); -- ID_EDIT = 3

INSERT INTO TIPO (TIPO_P) VALUES 
('Novela'), 
('Poesía'), 
('Ensayo'), 
('Científico');

INSERT INTO BIBLIOTECA (BIBLIOTECA) VALUES 
('Biblioteca Central'), 
('Biblioteca Campus Norte');

INSERT INTO CAMPUS (NOMBRE, ID_CIUDAD) VALUES 
('Campus San Joaquín', 1),
('Campus Casa Central', 1),
('Campus Elqui', 2);

INSERT INTO CARRERAS (NOMBRE, ID_CAMPUS) VALUES 
('Ingeniería en Informática', 1),
('Derecho', 2),
('Medicina', 3);

INSERT INTO FUNCIONARIOS (RUT_FUNC, NOMBRES, APELLIDOS, EDAD, DIRECCION, SALUD, ID_CAMPUS) VALUES 
('10.000.001-K', 'Carlos', 'Gómez', 52, 'Av. Siempre Viva 123', 'Regular', 1),
('10.000.002-K', 'Ana', 'Rojas', 34, 'Calle Prat 456', 'Buena', 1),
('10.000.003-K', 'Luis', 'Morales', 58, 'Pasaje Los Olivos 789', 'Mala', 2);

INSERT INTO ESTUDIANTES (RUT_EST, NOMBRES, APELLIDOS, EDAD, FONO, DIRECCION, ID_CARRERA) VALUES 
('20.111.222-1', 'Juan', 'Pérez', 26, '912345678', 'Av. Libertador 100', 1),
('20.222.333-2', 'María', 'López', 22, '923456789', 'Calle San Martín 200', 1),
('20.333.444-3', 'Lucas', 'Silva', 28, '934567890', 'Calle O Higgins 300', 2),
('20.444.555-4', 'Sofía', 'Castro', 20, '945678901', 'Av. Brasil 400', 3);

INSERT INTO LIBROS (TITULO, AGNO, ID_BIBLIO, ID_TIPO, RUT_AUTOR, ID_EDIT) VALUES 
('Cien Años de Soledad', 1967, 1, 1, '11.111.111-1', 1),
('Ficciones', 1944, 1, 3, '22.222.222-2', 2),
('Satanás', 2002, 2, 1, '33.333.333-3', 3), -- ID_EDIT = 3 y Autor con M
('Scorpio City', 2000, 2, 1, '33.333.333-3', 3), -- Segundo libro de Mario Mendoza
('La Casa de los Espíritus', 1982, 1, 1, '44.444.444-4', 1);

-- Préstamos: Sofía Castro y el libro 5 nunca se prestan para probar subconsultas
INSERT INTO PRESTAMO (RUT_EST, RUT_FUNC, COD_LIBRO, FECHA_P, FECHA_E) VALUES 
('20.111.222-1', '10.000.001-K', 1, DATE_SUB(CURDATE(), INTERVAL 1 MONTH), DATE_ADD(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), INTERVAL 7 DAY)),
('20.111.222-1', '10.000.001-K', 2, CURDATE(), NULL),
('20.222.333-2', '10.000.002-K', 1, CURDATE(), NULL),
('20.333.444-3', '10.000.001-K', 3, CURDATE(), NULL);