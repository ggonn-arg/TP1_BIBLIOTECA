-- 1. Crear usuario bibliotecario
CREATE USER IF NOT EXISTS 'bibliotecario_user'@'localhost' IDENTIFIED BY 'BiblioPass2026!';

-- 2. Permisos de solo lectura sobre LIBROS, AUTORES y EDITORIALES
GRANT SELECT ON BIBLIOTECA_DB.LIBROS TO 'bibliotecario_user'@'localhost';
GRANT SELECT ON BIBLIOTECA_DB.AUTORES TO 'bibliotecario_user'@'localhost';
GRANT SELECT ON BIBLIOTECA_DB.EDITORIALES TO 'bibliotecario_user'@'localhost';

-- 3. Permisos de lectura y escritura en PRESTAMO
GRANT SELECT, INSERT, UPDATE, DELETE ON BIBLIOTECA_DB.PRESTAMO TO 'bibliotecario_user'@'localhost';

-- 4. Crear admin con todos los privilegios
CREATE USER IF NOT EXISTS 'admin_user'@'localhost' IDENTIFIED BY 'AdminRoot2026!';
GRANT ALL PRIVILEGES ON BIBLIOTECA_DB.* TO 'admin_user'@'localhost' WITH GRANT OPTION;

-- 5. Revocar DELETE en PRESTAMO al bibliotecario
REVOKE DELETE ON BIBLIOTECA_DB.PRESTAMO FROM 'bibliotecario_user'@'localhost';

FLUSH PRIVILEGES;