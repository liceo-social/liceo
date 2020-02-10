# Que es Masiaventura

TODO

# Docker

```shell
docker run -p 9000:8080 masiaventura-docker-public.bintray.io/manager:0.1.0
```

Despues abre tu navegador en http://localhost:9000

Esto ejecutara la aplicacion con una base de datos en memoria por defecto y los ficheros creados se guardaran en `/tmp/kk`. Puedes configurar `Masiaventura` para correr contra una base de datos PostgreSQL o MariaDB y tambien configurar el directorio en donde se guardaran los ficheros. Para cambiar estos datos debes pasar una serie de variables de entorno a la ejecucion de Docker.

| Variable        | Descripcion                                  | valor por defecto|
| --------------- |:--------------------------------------------:| ----------------:|
| ADMIN_NAME      | Nombre del administrador                     | admin            |
| ADMIN_USERNAME  | Nombre con el que el administrador se loga   | admin            |
| ADMIN_PASSWORD  | Password inicial del administrador           | admin            |
| DATABASE_URL    | URL de la base de datos (JDBC)               | jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE}|
| DATABASE_USERNAME | Username de la base de datos               | masiaventura     |
| DATABASE_PASSWORD | Password de la base de datos               | masiaventura     |
| STORAGE_PATH      | Directorio donde guardar los ficheros      | /tmp/kk          |

Un ejemplo de ejecucion podria ser:

```shell
docker run \
    -p 9000:8080 \
    -v /storage/masi:/tmp/kk\    
    -e ADMIN_NAME=Pedro\
    -e ADMIN_USERNAME=admin@admin.com\
    -e ADMIN_PASSWORD=password\
    -e DATABASE_URL=jdbc:postgresql://db:5432/masiaventura\
    -e DATABASE_USERNAME=masi\
    -e DATABASE_PASSWORD=masi\
    masiaventura-docker-public.bintray.io/manager:0.1.0
```

En este ejemplo estamos arrancando Docker diciendo que:

- Queremos arrancar nuestra aplicacion en el puerto `9000`
- Queremos que los ficheros que se crean por defecto dentro del contenedor en `/tmp/kk` se guarden en realidad en nuestra maquina en el directorio `/storage/masi`. 
- Usamos unas credenciales diferentes para el administrador `ADMIN_NAME`, `ADMIN_USERNAME`, y `ADMIN_PASSWORD`.
- Usamos una base de datos diferente `DATABASE_URL`. Hay que tener el cuenta que el contenedor de docker debe poder resolver el nombre del servidor de la base de datos por su nombre. No usar localhost, ya que el localhost para el contenedor de Docker donde corre nuestra aplicacion no es el mismo que el nuestro.
- Usamos unas credenciales diferentes para la base de datos `DATABASE_USERNAME`, y `DATABASE_PASSWORD`.

**IMPORTANTE**. No olvides crear la base de datos y dar de alta el usuario que vas a utilizar para la conexion en tu base de datos antes de arrancar la aplicacion.
