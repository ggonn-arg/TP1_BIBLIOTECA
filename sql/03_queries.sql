USE BIBLIOTECA_DB;

-- 1. Título y año de todos los libros ordenados del más antiguo al más nuevo
SELECT TITULO, AGNO 
FROM LIBROS 
ORDER BY AGNO ASC;

-- 2. Nombre, apellido y edad de estudiantes mayores de 25 años
SELECT NOMBRES, APELLIDOS, EDAD 
FROM ESTUDIANTES 
WHERE EDAD > 25;

-- 3. Título y año de los libros de la editorial con ID_EDIT = 3
SELECT TITULO, AGNO 
FROM LIBROS 
WHERE ID_EDIT = 3;

-- 4. Todos los datos de autores cuyo apellido comience con "M"
SELECT * 
FROM AUTORES 
WHERE APELLIDOS LIKE 'M%';

-- 5. Nombre y apellido de funcionarios con salud distinta a "Buena"
SELECT NOMBRES, APELLIDOS 
FROM FUNCIONARIOS 
WHERE SALUD <> 'Buena';

-- 6. Título del libro junto con el nombre y apellido de su autor
SELECT l.TITULO, a.NOMBRES, a.APELLIDOS
FROM LIBROS l
INNER JOIN AUTORES a ON l.RUT_AUTOR = a.RUT_AUTOR;

-- 7. Préstamo: Fecha_P, Nombre Estudiante, Título Libro y Nombre Funcionario
SELECT 
    p.FECHA_P,
    CONCAT(e.NOMBRES, ' ', e.APELLIDOS) AS Estudiante,
    l.TITULO AS Libro,
    CONCAT(f.NOMBRES, ' ', f.APELLIDOS) AS Funcionario
FROM PRESTAMO p
INNER JOIN ESTUDIANTES e ON p.RUT_EST = e.RUT_EST
INNER JOIN LIBROS l ON p.COD_LIBRO = l.COD_LIBRO
INNER JOIN FUNCIONARIOS f ON p.RUT_FUNC = f.RUT_FUNC;

-- 8. Nombre del estudiante, carrera y ciudad donde estudia
SELECT 
    CONCAT(e.NOMBRES, ' ', e.APELLIDOS) AS Estudiante,
    car.NOMBRE AS Carrera,
    ciu.NOMBRE AS Ciudad
FROM ESTUDIANTES e
INNER JOIN CARRERAS car ON e.ID_CARRERA = car.ID_CARRERA
INNER JOIN CAMPUS cam ON car.ID_CAMPUS = cam.ID_CAMPUS
INNER JOIN CIUDAD ciu ON cam.ID_CIUDAD = ciu.ID_CIUDAD;

-- 9. Título del libro, editorial y país de origen
SELECT l.TITULO, ed.NOMBRE AS Editorial, ed.PAIS
FROM LIBROS l
INNER JOIN EDITORIALES ed ON l.ID_EDIT = ed.ID_EDIT;

-- 10. Título del libro y biblioteca donde se encuentra físicamente
SELECT l.TITULO, b.BIBLIOTECA
FROM LIBROS l
INNER JOIN BIBLIOTECA b ON l.ID_BIBLIO = b.ID_BIBLIO;

-- 11. Cantidad de libros registrados por cada tipo
SELECT t.TIPO_P, COUNT(l.COD_LIBRO) AS CantidadLibros
FROM TIPO t
LEFT JOIN LIBROS l ON t.ID_TIPO = l.ID_TIPO
GROUP BY t.ID_TIPO, t.TIPO_P;

-- 12. Edad promedio de los estudiantes por carrera
SELECT car.NOMBRE AS Carrera, AVG(e.EDAD) AS EdadPromedio
FROM ESTUDIANTES e
INNER JOIN CARRERAS car ON e.ID_CARRERA = car.ID_CARRERA
GROUP BY car.ID_CARRERA, car.NOMBRE;

-- 13. Funcionario y cantidad total de préstamos realizados (mayor a menor)
SELECT 
    CONCAT(f.NOMBRES, ' ', f.APELLIDOS) AS Funcionario,
    COUNT(p.COD_LIBRO) AS TotalPrestamos
FROM FUNCIONARIOS f
LEFT JOIN PRESTAMO p ON f.RUT_FUNC = p.RUT_FUNC
GROUP BY f.RUT_FUNC, f.NOMBRES, f.APELLIDOS
ORDER BY TotalPrestamos DESC;

-- 14. Autores con más de 1 libro registrado
SELECT a.NOMBRES, a.APELLIDOS, COUNT(l.COD_LIBRO) AS TotalLibros
FROM AUTORES a
INNER JOIN LIBROS l ON a.RUT_AUTOR = l.RUT_AUTOR
GROUP BY a.RUT_AUTOR, a.NOMBRES, a.APELLIDOS
HAVING COUNT(l.COD_LIBRO) > 1;

-- 15. Nombre de la ciudad y cantidad de estudiantes que estudian allí
SELECT ciu.NOMBRE AS Ciudad, COUNT(e.RUT_EST) AS CantidadEstudiantes
FROM CIUDAD ciu
INNER JOIN CAMPUS cam ON ciu.ID_CIUDAD = cam.ID_CIUDAD
INNER JOIN CARRERAS car ON cam.ID_CAMPUS = car.ID_CAMPUS
INNER JOIN ESTUDIANTES e ON car.ID_CARRERA = e.ID_CARRERA
GROUP BY ciu.ID_CIUDAD, ciu.NOMBRE;

-- 16. Título y año del libro más antiguo de la biblioteca (Subconsulta)
SELECT TITULO, AGNO 
FROM LIBROS 
WHERE AGNO = (SELECT MIN(AGNO) FROM LIBROS);

-- 17. Estudiantes que nunca han pedido un libro prestado (Subconsulta NOT IN)
SELECT RUT_EST, NOMBRES, APELLIDOS 
FROM ESTUDIANTES 
WHERE RUT_EST NOT IN (SELECT DISTINCT RUT_EST FROM PRESTAMO);

-- 18. Libros nunca prestados
SELECT COD_LIBRO, TITULO 
FROM LIBROS 
WHERE COD_LIBRO NOT IN (SELECT DISTINCT COD_LIBRO FROM PRESTAMO);

-- 19. Préstamos realizados el mes anterior
SELECT * 
FROM PRESTAMO 
WHERE MONTH(FECHA_P) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH)
  AND YEAR(FECHA_P) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH);

-- 20. Los 3 libros más prestados
SELECT l.TITULO, COUNT(p.COD_LIBRO) AS VecesPrestado
FROM LIBROS l
INNER JOIN PRESTAMO p ON l.COD_LIBRO = p.COD_LIBRO
GROUP BY l.COD_LIBRO, l.TITULO
ORDER BY VecesPrestado DESC
LIMIT 3;