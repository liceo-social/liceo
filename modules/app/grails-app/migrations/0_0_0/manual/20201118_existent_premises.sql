-- ESTE SCRIPT SE DEBE EJECUTAR ANTES DE INSTALAR LA VERSION DE LICEO 0.2.0 EN
-- AQUELLAS INSTALACIONES QUE TENGAN UNA VERSION ANTERIOR YA INSTALADA Y CON
-- DATOS. SE DEBEN SEGUIR LOS SIGUIENTES PASOS
--
-- REALIZAR BACKUP DE LA BASE DE DATOS
-- EJECUTAR ESTE SCRIPT CONTRA LA BASE DE DATOS
-- INSTALAR LA NUEVA VERSION DE LICEO 0.2.0


-- a partir de ahora todas las reglas de seguridad estan en la base de datos. Necesitamos
-- eliminar todas las que habia y cargarlas todas desde la migracion
DELETE FROM public.requestmap;

-- En las instalaciones existentes necesitamos establecer a partir de que migracion se va
-- a modificar la base de datos por lo que necesitamos crear las tablas de migraciones y
-- establecer a partir de que migracion esta la base de datos preparada
CREATE TABLE public.databasechangelog (
	id varchar(255) NOT NULL,
	author varchar(255) NOT NULL,
	filename varchar(255) NOT NULL,
	dateexecuted timestamp NOT NULL,
	orderexecuted int4 NOT NULL,
	exectype varchar(10) NOT NULL,
	md5sum varchar(35) NULL,
	description varchar(255) NULL,
	"comments" varchar(255) NULL,
	tag varchar(255) NULL,
	liquibase varchar(20) NULL,
	contexts varchar(255) NULL,
	labels varchar(255) NULL,
	deployment_id varchar(10) NULL
);

CREATE TABLE public.databasechangeloglock (
	id int4 NOT NULL,
	"locked" bool NOT NULL,
	lockgranted timestamp NULL,
	lockedby varchar(255) NULL,
	CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id)
);

-- Estimamos que las instalaciones de Masi y Aventura estan en este punto de las migraciones
INSERT INTO public.databasechangelog (id,author,filename,dateexecuted,orderexecuted,exectype,md5sum,description,"comments",tag,liquibase,contexts,labels,deployment_id) VALUES
('20201118_01','mario (generated)','0_0_0/20201118_01_initial_schema.groovy','2020-11-19 10:58:13.660',1,'EXECUTED','8:df5f14e4156fb0922bd97750f517fc15','createSequence sequenceName=hibernate_sequence; createTable tableName=app_user; createTable tableName=attachment; createTable tableName=authority; createTable tableName=came_from; createTable tableName=country; createTable tableName=document_type;...','adds initial schema',NULL,'3.6.3',NULL,NULL,'5779893456')
,('20201118_02_A','Mario Garcia','0_0_0/20201118_02_master_data.groovy','2020-11-19 10:58:14.801',2,'EXECUTED','8:01bb264dd31114111d21e071cbfc57e9','grailsChange dataSourceName=dataSource','loads master data',NULL,'3.6.3',NULL,NULL,'5779893456')
;
