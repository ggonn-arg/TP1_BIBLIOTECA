¿Por qué la tabla PRESTAMO tiene una clave primaria compuesta (PK, FK1, FK2, FK3)? ¿Qué pasaría si un estudiante quisiera pedir el mismo libro dos veces? ¿Cómo se maneja en la vida real vs. en este modelo?  

 Respuesta: Es compuesta porque la combinación de estudiante, funcionario y libro identifica la transacción. En el modelo estricto donde solo se toman esos 3 campos como PK, si el estudiante quisiera pedir el mismo libro en otra fecha, el motor arrojaría un error de clave duplicada (Duplicate entry). En la vida real esto se soluciona agregando FECHA_P a la clave compuesta (como hicimos en el script de creación) o usando un identificador subrogado simple (ID_PRESTAMO AUTO_INCREMENT).  
 
  Si intentamos borrar una CARRERA que tiene estudiantes asociados, ¿qué debería hacer la base de datos? ¿Por qué?   Respuesta: La base de datos debe rechazar la eliminación arrojando un error de integridad referencial (RESTRICT o NO ACTION). De lo contrario, los estudiantes quedarían huérfanos sin carrera asignada. Si se quisiera eliminar, primero se debe reasignar a los alumnos o darles de baja.  
  
   Observando la tabla LIBROS, ¿por qué el autor está en una tabla separada (AUTORES) y no directamente en la tabla de libros? 

    Respuesta: Para cumplir con la normalización (2FN y 3FN) y evitar la redundancia de datos. Si estuviera en la tabla LIBROS, cada vez que un autor publica una obra nueva habría que repetir su nombre y apellido, generando inconsistencias ante errores de tipeo y dificultando actualizaciones globales.
    
       ¿Qué tipo de relación existe entre CAMPUS y CIUDAD? Justifica.   
       
       Respuesta: Es una relación Uno a Muchos (1:N). Una ciudad puede albergar uno o varios campus universitarios, pero cada campus pertenece físicamente a una única ciudad.   