USE BIBLIOTECA_DB;

-- 1. Índice para acelerar búsquedas de estudiantes por carrera
CREATE INDEX idx_estudiantes_carrera 
ON ESTUDIANTES(ID_CARRERA);

-- 2. Índice para optimizar filtros y ordenamientos de libros por año
CREATE INDEX idx_libros_agno 
ON LIBROS(AGNO);

-- 3. Índice para acelerar los JOINs entre libros y autores
CREATE INDEX idx_libros_autor 
ON LIBROS(RUT_AUTOR);

-- 4. Índice para optimizar consultas de libros por editorial
CREATE INDEX idx_libros_editorial 
ON LIBROS(ID_EDIT);

-- 5. Índice para acelerar filtros de préstamos por fecha de préstamo
CREATE INDEX idx_prestamo_fecha_p 
ON PRESTAMO(FECHA_P);

-- 6. Índice para búsquedas de autores por apellido (ej: apellidos que empiezan con 'M')
CREATE INDEX idx_autores_apellidos 
ON AUTORES(APELLIDOS);