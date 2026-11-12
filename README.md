Desafío SOAtest

Aquí dejaré las instrucciones de conexión a la BD, elegí PostgreSQL.

El driver JDBC lo dejé en la carpeta parasoft/drivers y lo descargué desde acá:

https://jdbc.postgresql.org/download/

Versión: 42.7.14

Agregar a SOAtest:

Window -> Preferences -> Parasoft -> JDBC Drivers -> New

Seleccionar el .jar y reiniciar SOAtest.

En el Environment (Local) quedó la configuración de la conexión a la BD, la cual
hay que ajustar a la máquina en la que se revisará el desafío. Enmascaré mi contraseña.

Dejé la query de la BD en la carpeta sql, en schema.sql. La base de datos se llama
pokemonDB.
