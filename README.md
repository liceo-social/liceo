# Que es Masiaventura

TODO

# Arrancar la aplicacion

Para poder ejecutar la aplicacion en desarrollo, tienes que tener instalada la JDK de Java version 11+ y ejecutar:

```shell
./gradlew bootRun
```

Esto arrancara `masiaventura` en modo desarrollo con una base de datos en memoria. Una vez arranque estara disponible en http://localhost:8080

# Evaluar la aplicacion con Docker

Para evaluar la aplicacion usando Docker simplemente puedes ejecutar:

```shell
docker run -p 9000:8080 masiaventura-docker-public.bintray.io/manager:0.1.1
```

Despues abre tu navegador en http://localhost:9000

Para ejecutar `masiaventura` con **docker-compose puedes** echar un vistazo al repositorio https://github.com/masiaventura/masiaventura-docker-compose

# Crear nueva imagen de Docker y pushearla a Bintray

El comando para crear una imagen nueva de Docker

```shell
./gradlew buildImage
```

Despues para poder subir la imagen al repositorio de Bintray debes hacer login:

```
docker login -u <USERNAME> masiaventura-docker-public.bintray.io
```

Entonces hay que tagear la imagen:

```shell
docker tag <ID> masiaventura-docker-public.bintray.io/manager:<VERSION>
```

Y por ultimo subirla al repositorio remoto:

```shell
docker push masiaventura-docker-public.bintray.io/manager:<VERSION>
```
