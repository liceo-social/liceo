## Migración manual en instalaciones existentes

Aunque en principio solo conocemos la existencia de instalaciones en Masi y Aventura este guion
podría servir para cualquier instalación anterior a la version 0.2.0 de Liceo. A partir de esta
version se han incluido migraciones automáticas de base de datos. Como anteriormente no existian
migraciones automáticas hay ciertos pasos manuales que se deben seguir para acomodar las instalaciones
anteriores a la version 0.2.0 a esta version y posteriores.

Hay que seguir los siguientes pasos:

- Hacer un backup de la base de datos actual
- Ejecutar la migración manual (fichero 20201118_existent_premises.sql)
- Arrancar la version 0.2.0 de Liceo

### Hacer un backup

Para realizar un backup de PostgreSQL se puede ejecutar el comando **pg_dump**.

    pg_dump -d liceo -U liceo -f /tmp/liceo.sql
    
Si se estaba ejecutando el backup dentro de Docker, después se puede ejecutar desde fuera del contenedor de docker el siguiente comando 
para recuperar el fichero de backup generado:

    docker cp nombrecontenedor:/ruta/dentro/del/contenedor/liceo.sql /ruta/local
    
### Ejecutar migracion manual

Ejecutar a traves de una consola SQL o IDE SQL ([DBeaver](https://dbeaver.io/download/) es una buena opcion libre) 
el fichero 20201118_existent_premises.sql

### Ejecutar la version 0.2.0 de Liceo

Una vez se ha ejecutado el fichero de migración manual, la base de datos debería estar en un estado
en el que se puedan ejecutar las migraciones automáticas sin ningún problema. Este proceso solo se 
debe ejecutar una vez. A partir de ese momento cualquier instalación debería funcionar perfectamente
sin ningún tipo de intervención manual. 

