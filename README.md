# Que es Masiaventura

TODO

# Arrancar la aplicacion

Para poder ejecutar la aplicacion en desarrollo, tienes que tener instalada la JDK de Java version 11+ y ejecutar:

```shell
./gradlew bootRun
```

Esto arrancara `masiaventura` en modo desarrollo con una base de datos en memoria. Una vez arranque estara disponible en http://localhost:8080

# Docker

Para evaluar la aplicacion usando Docker simplemente puedes ejecutar:

```shell
docker run -p 9000:8080 masiaventura-docker-public.bintray.io/manager:0.1.1
```

Despues abre tu navegador en http://localhost:9000

Para ejecutar `masiaventura` con **docker-compose puedes** echar un vistazo al repositorio https://github.com/masiaventura/masiaventura-docker-compose
