USE BIBLIOTECA_DB;

-- 1. Insertar nuevo estudiante
INSERT INTO ESTUDIANTES (RUT_EST, NOMBRES, APELLIDOS, EDAD, FONO, DIRECCION, ID_CARRERA) 
VALUES ('20.999.888-9', 'Rodrigo', 'Paz', 21, '988887777', 'Pasaje Las Lilas 12', 1);

-- 2. Actualizar salud a "Excelente" para funcionarios con más de 50 años
UPDATE FUNCIONARIOS 
SET SALUD = 'Excelente' 
WHERE EDAD > 50;

-- 3. Borrar libro que no tenga préstamos asociados
DELETE FROM LIBROS 
WHERE COD_LIBRO = 5;

-- 4. Actualizar el ID_EDIT de un libro específico
UPDATE LIBROS 
SET ID_EDIT = 2 
WHERE COD_LIBRO = 3;