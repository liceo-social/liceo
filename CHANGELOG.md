# Changelog
Todos los cambios importantes en el proyecto se intentara que tengan reflejo en este fichero. Este fichero esta basado en el formato [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),

## [0.5.3] - 26/11/2022
### Added
- Usuarios no admin puede solicitar la baja con una fecha concreta

## [0.5.2] - 08/11/2022

### Fixed

- Error 500 cuando seleccionas Exportar CSV desde el listado de personas sin ningún filtro
- Cuando hay un campo de texto con una cadena que tiene una coma al mostrar el CSV se desplazan las columnas

### Changed

- Cuando exportas un listado de personas sin indicar ningún campo extra no aparece DNI, esto se puede solucionar marcando “Situación administrativa” aunque yo creo que el DNI debería salir siempre

## [0.5.1] - 26/02/2022

### Fixed

- No se pueden aprobar bajas por restriccion en la base de datos [#61](https://github.com/liceo-social/liceo/issues/61)

## [0.5.0] - 16/11/2021

### Added

- Solicitud de bajas por parte de un usuario no administrador [#58](https://github.com/liceo-social/liceo/issues/58)
- Exportacion CSV: Se puede elegir que campos se van a exportar [#59](https://github.com/liceo-social/liceo/issues/59)

### Changed

- Cambio en la estructura del proyecto en modulos Gradle. [#60](https://github.com/liceo-social/liceo/issues/60)

### Fixed 

- Exportacion CSV: El excel a veces sale descuadrado. Se cambia "," por "|" como caracter de campo [#56](https://github.com/liceo-social/liceo/issues/56)
- Falta la columna "tiene expediente en atencion primaria" (hasPrimaryAttentionFile) [#57](https://github.com/liceo-social/liceo/issues/57)

## [0.4.3] - 17/04/2021

### Fixed

- Error al pulsar sobre el listado de procesos [#51](https://github.com/liceo-social/liceo/issues/51)

### Added

- Agregados mensajes de error en el login [#54](https://github.com/liceo-social/liceo/issues/54)

### Changed

- Cambiados textos que daban lugar a error "Volver al listado" ahora es "Ir al listado"
- Despliegue de la imagen de docker en https://hub.docker.com [#53](https://github.com/liceo-social/liceo/issues/53)

## [0.4.2] - 14/03/2021

### Fixed

- Error en creación de grupos [#48](https://github.com/liceo-social/liceo/issues/48)

## [0.4.1] - 16/02/2021

### Added

- Se puede configurar el directorio de ficheros con la variable de entorno `LICEO_FILES`

### Fixed

- Descripción de alertas no se ve completa [#44](https://github.com/liceo-social/liceo/issues/44)
- Proyectos en Ficha persona [#42](https://github.com/liceo-social/liceo/issues/42)
- Dashboard: ultimas alertas [#43](https://github.com/liceo-social/liceo/issues/43)

## [0.4.0] - 12/02/2021

### Added

- Propuestas de dashboard [#38](https://github.com/liceo-social/liceo/issues/38)
- Funcionalidad Informe/Estadisticas [#39](https://github.com/liceo-social/liceo/issues/39)
- Alertas por personas [#22](https://github.com/liceo-social/liceo/issues/22)
- Mejoras en UI (Creacion de persona y busqueda por ID en barra superior)

## [0.3.1] - 28/01/2021

### Fixes

- Falla filtro edad [#34](https://github.com/liceo-social/liceo/issues/34)
- Error al exportar [#35](https://github.com/liceo-social/liceo/issues/35)

## [0.3.0] - 18/01/2021

### Added

- Calendario de citas [#21](https://github.com/liceo-social/liceo/issues/21)

### Fixed

- Posibles procesos huerfanos [#32](https://github.com/liceo-social/liceo/issues/32)
- Paginacion en lista procesos/documentacion [#31](https://github.com/liceo-social/liceo/issues/31)
- Cambio en campos de servicios sociales [#9](https://github.com/liceo-social/liceo/issues/9)

### Changed

- Mejoras en UI

## [0.2.0] - 11/12/2020
### Added

- Primer buscador de personas con exportacion a csv [#12](https://github.com/liceo-social/liceo/issues/12)
- Posibilidad de dar de baja a una persona [#8](https://github.com/liceo-social/liceo/issues/8)
- Agregadas migraciones de base de datos [#20](https://github.com/liceo-social/liceo/issues/20)
- Tabla para establecer el sexo de las personas ademas de su genero [#20](https://github.com/liceo-social/liceo/issues/20)
- Visualizar version en ejecución en el Login [#24](https://github.com/liceo-social/liceo/issues/24)
- Integración continua con Github workflows [#25](https://github.com/liceo-social/liceo/issues/25)

### Fixed

- Permisos de visibilidad (admin vs creador) [#18](https://github.com/liceo-social/liceo/issues/18)
- Cambio en los datos de servicios sociales [#9](https://github.com/liceo-social/liceo/issues/9)
- Mostrar edad de persona en el detalle [#7](https://github.com/liceo-social/liceo/issues/7)
- Mostrar el autor de un proceso [#16](https://github.com/liceo-social/liceo/issues/16)
- Mostrar lunes como primer dia de la semana [#27](https://github.com/liceo-social/liceo/issues/27)

### Changed

- Actualizar Grails 4.0.1 -> 4.0.5 [#26](https://github.com/liceo-social/liceo/issues/26)
- Cambios en UX [#28](https://github.com/liceo-social/liceo/issues/28)

## [0.1.2] - 11/03/2020
### Fixed

- Arreglados algunos errores en literales [#2](https://github.com/liceo-social/liceo/issues/6)
- Fallo al salvar nuevos procesos y autorizaciones [#6](https://github.com/liceo-social/liceo/issues/6)
