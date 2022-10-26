-- DROP DATABASE TPI_2ENTREGA
CREATE DATABASE TPI_2ENTREGA
GO
USE TPI_2ENTREGA
GO
SET DATEFORMAT DMY
GO

create table NACIONALIDADES
(
	id_nacionalidad int,
	nacion varchar(80) not null
	constraint pk_nacionalidad primary key (id_nacionalidad)
)

create table PROVINCIAS
(
	id_provincia int,
	provincia varchar(80) not null
	constraint pk_provincia primary key (id_provincia)
)

create table LOCALIDADES
(
	id_localidad int,
	localidad varchar(80) not null,
	id_provincia int,
	constraint pk_localidades primary key (id_localidad),
	constraint fk_localidad_prov foreign key (id_provincia) references PROVINCIAS(id_provincia)
)

create table BARRIOS
(
	id_barrio int,
	barrio varchar(50) not null,
	id_localidad int,
	constraint pk_barrios primary key (id_barrio),
	constraint fk_localidades_barrios foreign key (id_localidad) references localidades(id_localidad)
)

create table SITUACION_HABIT
(
	id_situacion_habit int,
	situacion_habit varchar(50) not null
	constraint pk_situacion_habit primary key (id_situacion_habit)
)

create table ESTADOS_CIVILES
(
	id_estado_civil int,
	estado_civil varchar(30) not null
	constraint pk_estados_civil primary key (id_estado_civil)
)

create table ESTADOS_LABORALES
(
	id_estado_lab int,
	estado_lab varchar(70) not null
	constraint pk_estados_lab primary key (id_estado_lab)
)

create table TIPOS_DOCUMENTOS
(
 id_tipo_documento int,
 tipo_documento varchar(50),
 constraint pk_tipos_documentos primary key (id_tipo_documento)
)

create table ESTUDIANTES
(
	legajo_est int identity(1,1),
	ape_est varchar(50) not null,
	nom_est varchar(50) not null,
	id_tipo_documento int,
	nro_documento int not null,
	fecha_nac datetime,
	email varchar(50),
	telefono varchar(20),
	id_nacionalidad int, 
	id_barrio int, 
	calle varchar(80),
	nro_calle int,
	fecha_ingreso datetime,
	id_situacion_habit int,
	id_estado_civil int,
	id_estado_lab int,
	condicion bit, 
	constraint PK_ESTUDIANTES					primary key (legajo_est),
	constraint FK_ESTUDIANTES_TIPOS_DOCUMENTOS	foreign key (id_tipo_documento)	references TIPOS_DOCUMENTOS (id_tipo_documento),
	constraint FK_ESTUDIANTES_NACIONALIDADES	foreign key(id_nacionalidad)	references NACIONALIDADES (id_nacionalidad),
	constraint FK_ESTUDIANTES_BARRIOS			foreign key (id_barrio)			references BARRIOS (id_barrio),
	constraint FK_ESTUDIANTES_SITUACION_HAB		foreign key(id_situacion_habit) references SITUACION_HABIT (id_situacion_habit),
	constraint FK_ESTUDIANTES_ESTADO_CIVIL		foreign key(id_estado_civil)	references ESTADOS_CIVILES (id_estado_civil),
	constraint FK_ESTUDIANTES_ESTADO_LABORAL	foreign key (id_estado_lab)		references ESTADOS_LABORALES (id_estado_lab),
)

create table DOCENTES
(
	legajo_doc int identity(1,1),
	ape_doc varchar(50) not null,
	nom_doc varchar(50) not null,
	id_tipo_documento int,
	nro_documento int not null,
	fecha_nac datetime,
	email varchar(80),
	telefono varchar(20),
	id_nacionalidad int,
	id_barrio int,
	calle varchar(70),
	nro_calle int,
	id_estado_civil int	
	constraint PK_DOCENTES					primary key (legajo_doc),
	constraint FK_DOCENTES_TIPOS_DOCUMENTOS	foreign key (id_tipo_documento) references TIPOS_DOCUMENTOS (id_tipo_documento),
	constraint FK_DOCENTES_NACIONALIDADES	foreign key (id_nacionalidad)	references NACIONALIDADES (id_nacionalidad),
	constraint FK_DOCENTES_BARRIOS          foreign key (id_barrio)         references BARRIOS (id_barrio),
	constraint FK_DONCENTES_ESTADOS_CIVILES foreign key (id_estado_civil)	references ESTADOS_CIVILES (id_estado_civil)	
)

create table CURSOS
(
	id_curso int,
	curso varchar(80) not null
	constraint pk_cursos primary key (id_curso)
)

create table MATERIAS
(
	id_materia int identity(1,1),
	materia varchar(150) not null
	constraint PK_MATERIAS primary key(id_materia)
)

CREATE TABLE DOCENTES_MATERIAS
(
	id_detalle_doc_mat int,
	id_materia int,
	id_curso int,
	legajo_doc int
	constraint PK_DOCENTES_MATERIAS				primary key (id_detalle_doc_mat),
	constraint FK_DOCENTES_MATERIAS_MATERIAS	foreign key(id_materia) references MATERIAS (id_materia),
	constraint FK_DOCENTES_MATERIAS_DOCENTES	foreign key(legajo_doc) references DOCENTES (legajo_doc),
	constraint FK_DOCENTES_MATERIAS_CURSOS	    foreign key(id_curso) references CURSOS (id_curso)
)

create table TECNICATURAS
(
	id_tecnicatura int identity(1,1),
	tecnicatura varchar(150) not null,
	titulo varchar(150) not null,
	constraint PK_TECNICATURAS PRIMARY KEY(id_tecnicatura)
)

create table TECNICATURAS_MATERIAS
(
	id_tecnicatura_materia int,
	id_tecnicatura int,
	id_materia int,
	constraint PK_TECNICATURAS_MATERIAS					primary key (id_tecnicatura_materia),
	constraint FK_TECNICATURAS_MATERIAS_TECNICATURAS	foreign key(id_tecnicatura) references TECNICATURAS (id_tecnicatura),
	constraint FK_TECNICATURAS_MATERIAS_MATERIAS		foreign key(id_materia)		references MATERIAS (id_materia)
)

create table CUATRIMESTRES
(
	id_cuatrimestre int,
	cuatrimestre varchar(50) not null
	constraint pk_cuatrimestres primary key (id_cuatrimestre)
)

create table ESTADOS_ACADEMICOS
(
	id_estado_acad int,
	estado_academico varchar(50) not null
	constraint pk_estados_academicos primary key (id_estado_acad)
)

create table ESTUDIANTES_MATERIAS
(
	id_detalle_est_mat int identity(1,1),
	id_materia int, 
	legajo_est int,
	id_curso int,
	id_cuatrimestre int, 
	id_estado_acad int
	constraint PK_ESTUDIANTES_MATERIAS_CURSO			primary key (id_detalle_est_mat),
	constraint FK_ESTUDIANTES_MATERIAS_MATERIAS			foreign key (id_materia)		references MATERIAS (id_materia),
	constraint FK_ESTUDIANTES_MATERIAS_LEGAJO			foreign key (legajo_est)		references ESTUDIANTES (legajo_est),
	constraint FK_ESTUDIANTES_MATERIAS_CURSOS			foreign key (id_curso)			references CURSOS (id_curso),
	constraint FK_ESTUDIANTES_MATERIAS_CUATRIMESTRE		foreign key (id_cuatrimestre)	references CUATRIMESTRES (id_cuatrimestre),
	constraint FK_ESTUDIANTES_MATERIAS_ESTADO_ACADEMICO foreign key (id_estado_acad)	references ESTADOS_ACADEMICOS (id_estado_acad)
)

create table EXAMENES
(
	id_examen int,
	descripcion_examen varchar(150) not null,
	fecha_examen datetime,
	constraint PK_EXAMENES PRIMARY KEY(id_examen)
)


create table EXAMEN_MATERIAS
(
	id_examen_materia int identity(1,1),
	calificacion decimal (4,2) not null,
	id_examen int,
	id_materia int,
	legajo_est int,
	constraint PK_EXAMEN_MATERIAS					primary key(id_examen_materia),
	constraint FK_EXAMEN_MATERIAS_EXAMEN			foreign key (id_examen)		references EXAMENES (id_examen),
	constraint FK_EXAMEN_MATERIAS_MATERIA			foreign key (id_materia)	references MATERIAS (id_materia),
	constraint fk_EXAMEN_MATERIAS_ESTUDIANTE		foreign key (legajo_est)	references ESTUDIANTES (legajo_est)
)



-- NACIONALIDADES
INSERT INTO NACIONALIDADES (id_nacionalidad,nacion) VALUES (1,'Argentino');
INSERT INTO NACIONALIDADES (id_nacionalidad,nacion) VALUES (2,'Chileno');
INSERT INTO NACIONALIDADES (id_nacionalidad,nacion) VALUES (3,'Colombiano');
INSERT INTO NACIONALIDADES (id_nacionalidad,nacion) VALUES (4,'Peruano');
INSERT INTO NACIONALIDADES (id_nacionalidad,nacion) VALUES (5,'Venezolano');
INSERT INTO NACIONALIDADES (id_nacionalidad,nacion) VALUES (6,'Panameño');
INSERT INTO NACIONALIDADES (id_nacionalidad,nacion) VALUES (7,'Mexicano');
INSERT INTO NACIONALIDADES (id_nacionalidad,nacion) VALUES (8,'Estaunidence');
INSERT INTO NACIONALIDADES (id_nacionalidad,nacion) VALUES (9,'Aleman');
INSERT INTO NACIONALIDADES (id_nacionalidad,nacion) VALUES (10,'Español');
INSERT INTO NACIONALIDADES (id_nacionalidad,nacion) VALUES (11,'Paraguayo');
INSERT INTO NACIONALIDADES (id_nacionalidad,nacion) VALUES (12,'Brasilero');
INSERT INTO NACIONALIDADES (id_nacionalidad,nacion) VALUES (13,'Uruguayo');
INSERT INTO NACIONALIDADES (id_nacionalidad,nacion) VALUES (14,'Boliviano');

--PROVINCIAS
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(1,'CORDOBA')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(2,'BUENOS AIRES')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(3,'CATAMARCA')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(4,'CHACO')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(5,'CHUBUT')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(6,'JUJUY')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(7,'CORRIENTES')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(8,'ENTRE RIOS')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(9,'FORMOSA')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(10,'LA PAMPA')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(11,'LA RIOJA')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(12,'MENDOZA')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(13,'MISIONES')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(14,'NEUQUEN')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(15,'RIO NEGRO')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(16,'SALTA')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(17,'SAN JUAN')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(18,'SAN LUIS')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(19,'SANTA CRUZ')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(20,'SANTA FE')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(21,'SANTIAGO DEL ESTERO')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(22,'TIERRA DEL FUEGO')
INSERT INTO PROVINCIAS (ID_PROVINCIA, PROVINCIA) VALUES(23,'TUCUMAN')

--LOCALIDADES 
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(001,'CORDOBA',001)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(002,'CARLOS PAZ',001)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(003,'ADELIA MARIA',001)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(004,'ALTA GRACIA',001)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(005,'AGUA DE ORO',001)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(018,'BARRIO DEAN FUNES',002)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(019,'BARRIO LA FERIA',002)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(020,'BO FLORES GUARNICION AEREA',002)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(021,'CAJON DEL RIO',002)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(022,'CALASUYA',002)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(023,'CAMPO BANDILLO',002)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(024,'CAMPO LOS ZORROS',002)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(025,'CANDELARIA SUR',002)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(026,'CAPILLA DE SITON',003)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(027,'CAPILLA LA ESPERANZA',003)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(028,'CASAS VEJAS',003)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(029,'CASEROS ESTE',003)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(030,'CAÑADA DE CUEVAS',004)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(031,'CAÑADA DEL TALA',004)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(032,'CAÑADA VERDE',005)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(033,'CERRO PELADO',005)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(034,'CHARACATO',005)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(035,'CHAÑARIACO',006)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(036,'CHIPITIN',006)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(037,'CHUA',006)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(038,'CHURQUI CAÑADA',007)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(039,'COLAZO',007)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(040,'ACHIRAS',007)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(041,'AMBOY',008)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(042,'ANISACATE',008)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA)  VALUES(043,'BALLESTEROS',008)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(044,'BELL VILLE',009)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(045,'BERROTARAN',009)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(046,'BUCHARDO',009)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(047,'CAÑADA DE RIO PINTO',0010)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(048,'CANALS',11)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(049,'CASA GRANDE',12)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(050,'CHAÑAR VIEJO',12)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(051,'CHARRAS',13)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(052,'COLONIA BREMEN',13)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(053,'COLONIA LAS PICHANAS',15)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(054,'COLONIA MARINA',16)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(055,'COSQUIN',16)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(056,'CRUZ ALTA',16)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(057,'CRUZ DEL EJE',17)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(058,'CRUZ DE CAÑA',17)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(059,'DIQUE CHICO',17)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(060,'EL FORTIN',18)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(061,'EL MANZANO',19)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(062,'LA CALERA',21)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(063,'HERNANDO',22)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(064,'GUTEMBERG',22)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(065,'LA CARLOTA',22)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(066,'LA CUMBRE',23)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(067,'LA PAZ',12)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(068,'LA RINCONADA',12)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(069,'LABOULAYE',5)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(070,'LAS PALMAS',7)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(071,'ARROYO DE LOS PATOS',8)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(072,'ESTACION JUAREZ CELMAN',9)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(006,'AGUA DEL TALA',12)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(007,'AGUA PINTADA',15)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(008,'ALEJANDRO ROCA',17)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(009,'ARIAS',18)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(010,'ARROYO CABRAL',19)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(011,'ARROYO LA HIGUERA',20)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(012,'ASCOCHINGA',023)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(013,'BAJO DE FERNANDEZ',21)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(014,'BAJO DEL CARMEN',12)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(015,'BAJO GRANDE',1)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(016,'BAJO HONDO',5)
INSERT INTO LOCALIDADES (ID_LOCALIDAD, LOCALIDAD,ID_PROVINCIA) VALUES(017,'BAJO LINDO',9)

--BARRIOS 
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (001,'CENTRO',1)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (002,'ALTO ALBERDI',2)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (003,'OBSERVATORIO',3)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (004,'JARDIN',4)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (005,'GENERAL PAZ',5)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (006,'PUEYRREDON',8)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (007,'PARQUE HORIZONTE',10)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (008,'SAN MARTIN',15)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (009,'SAN VICENTE',17)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (010,'JUNIOR',14)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (011,'MAIPU',18)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (012,'PANAMERICANO',21)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (013,'ALTAMIRA',24)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (014,'JUNIORS',26)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (015,'COFICO',28)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (016,'YOFRE NORTE',023)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (017,'GENERAL BUSTOS',30)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (018,'ALTOS SAN MARTIN',36)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (019,'AMEGHINO NORTE',37)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (020,'AMEGHINO SUR',32)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (021,'AMPLIACION ALTAMRIA',34)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (022,'AMPLIACION PALMAR',41)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (023,'ARGUELLO',44)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (024,'ARTURO CAPDEVILA',46)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (025,'BAJO GENERAL PAZ',47)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (026,'BELLA VISTA',48)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (027,'BIALET MASSE',51)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (028,'CACERES',52)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (029,'CENTRO AMERICA',55)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (030,'COFICO',56)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (031,'COLINAS DEL CERRO',58)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (032,'ESCOBAR',60)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (033,'ESTACION FLORES',61)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (034,'GENERAL BELGRANO',62)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (035,'GRANJA DE FUNES',64)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (036,'GUINAZU SUD',65)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (037,'INDEPENDENCIA',72)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (038,'JARDIN DEL PILAR',10)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (039,'JOCKEY CLUB',12)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (040,'LA CAROLINA',15)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (041,'LAS DELICIAS',16)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (042,'LOS CEIBOS',18)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (043,'LOS NARANJOS',12)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (044,'MARQUES DE SOBREMONTE',20)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (045,'NUEVA ITALIA',21)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (046,'PALMAR',25)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (047,'PARQUE FUTURA',36)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (048,'PARQUE LOS MOLINOS',38)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (049,'PATRICIOS',41)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (050,'PATRIA',52)
INSERT INTO BARRIOS(ID_BARRIO, BARRIO,ID_LOCALIDAD) VALUES (051,'ARGUELLO NORTE',63)

--ESTADOS CIVILES
INSERT INTO ESTADOS_CIVILES (id_estado_civil,estado_civil) VALUES(1,'Casado');
INSERT INTO ESTADOS_CIVILES (id_estado_civil,estado_civil) VALUES(2,'Soltero');
INSERT INTO ESTADOS_CIVILES (id_estado_civil,estado_civil) VALUES(3,'Viudo');
INSERT INTO ESTADOS_CIVILES (id_estado_civil,estado_civil) VALUES(4,'Divorciado');
INSERT INTO ESTADOS_CIVILES (id_estado_civil,estado_civil) VALUES(5,'Concuvino');

-- SITUACION HABITACIONAL
INSERT INTO SITUACION_HABIT (id_situacion_habit,situacion_habit) VALUES (1,'Inquilino');
INSERT INTO SITUACION_HABIT (id_situacion_habit,situacion_habit) VALUES (2,'Propietario de vivienda');
INSERT INTO SITUACION_HABIT (id_situacion_habit,situacion_habit) VALUES (3,'Ocupante de hecho');

-- TIPOS DE DOCUMENTOS
INSERT INTO TIPOS_DOCUMENTOS (id_tipo_documento,tipo_documento) VALUES (1,'DNI');
INSERT INTO TIPOS_DOCUMENTOS (id_tipo_documento,tipo_documento) VALUES (2,'Pasaporte');
INSERT INTO TIPOS_DOCUMENTOS (id_tipo_documento,tipo_documento) VALUES (3,'Libreta de enrolamiento');
INSERT INTO TIPOS_DOCUMENTOS (id_tipo_documento,tipo_documento) VALUES (4,'Libreta civica');

-- ESTADOS LABORALES
INSERT INTO ESTADOS_LABORALES (id_estado_lab,estado_lab) VALUES (1,'Independiente');
INSERT INTO ESTADOS_LABORALES (id_estado_lab,estado_lab) VALUES (2,'Relacion de dependencia');
INSERT INTO ESTADOS_LABORALES (id_estado_lab,estado_lab) VALUES (3,'Jubilado');
INSERT INTO ESTADOS_LABORALES (id_estado_lab,estado_lab) VALUES (4,'Monotributista');
INSERT INTO ESTADOS_LABORALES (id_estado_lab,estado_lab) VALUES (5,'Desempleado, busca trabajo');
INSERT INTO ESTADOS_LABORALES (id_estado_lab,estado_lab) VALUES (6,'Desempleado, no busca trabajo');


-- CURSOS
INSERT INTO CURSOS (id_curso,curso) VALUES (1,'0W3'); --NIVELACION
INSERT INTO CURSOS (id_curso,curso) VALUES (2,'0W4');
INSERT INTO CURSOS (id_curso,curso) VALUES (3,'1W3'); --1 AÑO
INSERT INTO CURSOS (id_curso,curso) VALUES (4,'1W4');
INSERT INTO CURSOS (id_curso,curso) VALUES (5,'2W3'); --2 AÑO
INSERT INTO CURSOS (id_curso,curso) VALUES (6,'2W4');
INSERT INTO CURSOS (id_curso,curso) VALUES (7,'3W3'); --3 AÑO
INSERT INTO CURSOS (id_curso,curso) VALUES (8,'3W4');

-- CUATRIMESTRES
INSERT INTO CUATRIMESTRES (id_cuatrimestre,cuatrimestre) VALUES (1,'1er Cuatrimestre');
INSERT INTO CUATRIMESTRES (id_cuatrimestre,cuatrimestre) VALUES (2,'2do Cuatrimestre');
INSERT INTO CUATRIMESTRES (id_cuatrimestre,cuatrimestre) VALUES (3,'3er Cuatrimestre');
INSERT INTO CUATRIMESTRES (id_cuatrimestre,cuatrimestre) VALUES (4,'4to Cuatrimestre');
INSERT INTO CUATRIMESTRES (id_cuatrimestre,cuatrimestre) VALUES (5,'5to Cuatrimestre');
INSERT INTO CUATRIMESTRES (id_cuatrimestre,cuatrimestre) VALUES (6,'6to Cuatrimestre');
INSERT INTO CUATRIMESTRES (id_cuatrimestre,cuatrimestre) VALUES (7,'Nivelacion');

-- ESTADOS ACADEMICOS
INSERT INTO ESTADOS_ACADEMICOS (id_estado_acad,estado_academico) VALUES (1,'Promocion');
INSERT INTO ESTADOS_ACADEMICOS (id_estado_acad,estado_academico) VALUES (2,'Regular');
INSERT INTO ESTADOS_ACADEMICOS (id_estado_acad,estado_academico) VALUES (3,'Libre');


-- TECNICATURAS
INSERT INTO TECNICATURAS (tecnicatura,titulo) 
VALUES ('Tecnicatura Universitaria en Programacion','Tecnico Universitario en Programacion');
INSERT INTO TECNICATURAS (tecnicatura,titulo) 
VALUES ('Tecnicatura Universitaria en Moldes Matrices y Dispositivos','Tecnico Universitaro en Moldes Matrices y Dispositivos');
INSERT INTO TECNICATURAS (tecnicatura,titulo) 
VALUES ('Tecnicatura Universitaria en Mecatrónica','Tecnico en Mecatronica');
INSERT INTO TECNICATURAS (tecnicatura,titulo) 
VALUES ('Tecnicatura Universitaria en Industrias Alimentarias','Tecnico Universitario en Industrias Alimentarias')
INSERT INTO TECNICATURAS (tecnicatura,titulo) 
VALUES ('Tecnicatura Universitaria en Mantenimiento Industrial','Tecnico Universitario en Mantenimiento Industrial');
INSERT INTO TECNICATURAS (tecnicatura,titulo) 
VALUES ('Tecnicatura Universitaria en Telecomunicaciones','Tecnico Universitario en Telecomunicaciones');

-- MATERIAS -- TECNICATURA EN PROGRAMACION --  DE 1 AL 11
INSERT INTO MATERIAS (materia) VALUES ('Programacion I'); --1
INSERT INTO MATERIAS (materia) VALUES ('Sitema de Procesamiento de Datos');--1
INSERT INTO MATERIAS (materia) VALUES ('Laboratorio de Computacion I');--1
INSERT INTO MATERIAS (materia) VALUES ('Laboratorio de Computacion II');--2
INSERT INTO MATERIAS (materia) VALUES ('Laboratorio de Computacion III');--3
INSERT INTO MATERIAS (materia) VALUES ('Laboratorio de Computacion IV');--4
INSERT INTO MATERIAS (materia) VALUES ('Programacion III'); --3
INSERT INTO MATERIAS (materia) VALUES ('Programacion II'); --2
INSERT INTO MATERIAS (materia) VALUES ('Arquitectura y Sistemas Operativos'); --2
INSERT INTO MATERIAS (materia) VALUES ('Metodologia de Sistemas I'); --4
INSERT INTO MATERIAS (materia) VALUES ('Diseño y Administracion de Bases de Datos'); --4

-- MATERIAS -- INDUSTRIAS ALIMENTARIAS --  DE 12 AL 20
INSERT INTO MATERIAS (materia) VALUES ('Industrias Alimentarias I'); --1,2
INSERT INTO MATERIAS (materia) VALUES ('Biologia General'); --1
INSERT INTO MATERIAS (materia) VALUES ('Quimica General'); --1
INSERT INTO MATERIAS (materia) VALUES ('Quimica Analitica') --2
INSERT INTO MATERIAS (materia) VALUES ('Quimica Inorganica'); --2
INSERT INTO MATERIAS (materia) VALUES ('Industrias Alimentarias II'); --3,4
INSERT INTO MATERIAS (materia) VALUES ('MicroBiologia de los Alimentos'); --3,4
INSERT INTO MATERIAS (materia) VALUES ('Quimica Organica'); --3
INSERT INTO MATERIAS (materia) VALUES ('Bromatologia'); --4

-- MATERIAS -- MOLDES MATRICES Y DISPOSITIVOS --  DE 21 AL 30
INSERT INTO MATERIAS (materia) VALUES ('Tecnologias en Medio de Produccion I'); --1
INSERT INTO MATERIAS (materia) VALUES ('Dispositivos y Utilajes'); --1
INSERT INTO MATERIAS (materia) VALUES ('Relaciones Industriales'); --1
INSERT INTO MATERIAS (materia) VALUES ('Conocimiento de Materiales'); --1
INSERT INTO MATERIAS (materia) VALUES ('Tecnologias en Medios de Produccion II'); --2
INSERT INTO MATERIAS (materia) VALUES ('Mantenimiento'); --2
INSERT INTO MATERIAS (materia) VALUES ('Mecanica I'); --1
INSERT INTO MATERIAS (materia) VALUES ('Mecanica II'); --2
INSERT INTO MATERIAS (materia) VALUES ('Tecnologia del Estampado'); --2
INSERT INTO MATERIAS (materia) VALUES ('Inyeccion y Fundicion'); --2

-- MATERIAS -- TELECOMUNICACIONES --  DE 31 AL 53
INSERT INTO MATERIAS (MATERIA) VALUES ('Analisis Matematico'); --1
INSERT INTO MATERIAS (MATERIA) VALUES ('Algebra Lineal'); --1
INSERT INTO MATERIAS (MATERIA) VALUES ('Probabilidad y Estadistica'); --1
INSERT INTO MATERIAS (MATERIA) VALUES ('Tecnicas Digitales y Arquitectura de Computadoras'); --1
INSERT INTO MATERIAS (MATERIA) VALUES ('Electronica Analogica'); --1
--INSERT INTO MATERIAS (MATERIA) VALUES ('Ingles I'); --1
--INSERT INTO MATERIAS (MATERIA) VALUES ('Fisica'); --2
--INSERT INTO MATERIAS (MATERIA) VALUES ('Ingles II'); --2
INSERT INTO MATERIAS (MATERIA) VALUES ('Protocolos de Redes de Datos'); --2
INSERT INTO MATERIAS (MATERIA) VALUES ('Programacion'); --2
INSERT INTO MATERIAS (MATERIA) VALUES ('Redes de Acceso Fijas'); --2
INSERT INTO MATERIAS (MATERIA) VALUES ('Medios de Transmición Cableados'); --2
INSERT INTO MATERIAS (MATERIA) VALUES ('Comunicacion Efectiva, Negociacion y Gestion'); --3
INSERT INTO MATERIAS (MATERIA) VALUES ('Redes de Transporte y Agregacion'); --3
INSERT INTO MATERIAS (MATERIA) VALUES ('Satelites y Mcriohondas'); --3
INSERT INTO MATERIAS (MATERIA) VALUES ('Redes de Acceso Moviles'); --3
INSERT INTO MATERIAS (MATERIA) VALUES ('Telefonia y su Evolución a Multiservicio'); --3
INSERT INTO MATERIAS (MATERIA) VALUES ('Laboratorio de Medicion I'); --3
INSERT INTO MATERIAS (MATERIA) VALUES ('Laboratorio de Planta Interna'); --4
INSERT INTO MATERIAS (MATERIA) VALUES ('Proyectos e Instalacion'); --4
INSERT INTO MATERIAS (MATERIA) VALUES ('Centro de Computos e Informacion'); --4
INSERT INTO MATERIAS (MATERIA) VALUES ('Laboratorio de Planta Externa'); --4
INSERT INTO MATERIAS (MATERIA) VALUES ('Redes de Conmutacion, Datos y Centros de Computo de Informacion'); --4
INSERT INTO MATERIAS (MATERIA) VALUES ('Sistemas de Energias'); --5
INSERT INTO MATERIAS (MATERIA) VALUES ('Laboratorio de Medicion II'); --5
INSERT INTO MATERIAS (MATERIA) VALUES ('Practica Profesional Supervisada'); --5

-- MATERIAS -- MANTENIMIENTO INDUSTRIAL --  DE 54 AL 76
INSERT INTO MATERIAS (MATERIA) VALUES ('Mantenimiento Industrial I'); --1
INSERT INTO MATERIAS (MATERIA) VALUES ('Electrotecnia I'); --1
--INSERT INTO MATERIAS (MATERIA) VALUES ('Matematica'); --1
--INSERT INTO MATERIAS (MATERIA) VALUES ('Quimica'); --1
INSERT INTO MATERIAS (MATERIA) VALUES ('Relaciones Industriales'); --1
INSERT INTO MATERIAS (MATERIA) VALUES ('Informatica I'); --1
INSERT INTO MATERIAS (MATERIA) VALUES ('Mantenimiento Industrial I'); --2
INSERT INTO MATERIAS (MATERIA) VALUES ('Electrotecnia II'); --2
--INSERT INTO MATERIAS (MATERIA) VALUES ('Mecanica'); --2
INSERT INTO MATERIAS (MATERIA) VALUES ('Sistemas de Representacion'); --2
INSERT INTO MATERIAS (MATERIA) VALUES ('Conocimiento de los Materiales'); --2
INSERT INTO MATERIAS (MATERIA) VALUES ('Neumatica e Hidraulica'); --2
INSERT INTO MATERIAS (MATERIA) VALUES ('Mantenimiento Industrial II'); --3
INSERT INTO MATERIAS (MATERIA) VALUES ('Elementos de Maquinas I'); --3
INSERT INTO MATERIAS (MATERIA) VALUES ('Tecnologia de Frio y Calor'); --3
INSERT INTO MATERIAS (MATERIA) VALUES ('Instalaciones y Maquinas electricas'); --3
INSERT INTO MATERIAS (MATERIA) VALUES ('Informatica II'); --3
INSERT INTO MATERIAS (MATERIA) VALUES ('Seguridad, Higiene y Proteccion Ambiental'); --3
--INSERT INTO MATERIAS (MATERIA) VALUES ('Ingles'); --3
INSERT INTO MATERIAS (MATERIA) VALUES ('Mantenimiento Industrial III'); --4
INSERT INTO MATERIAS (MATERIA) VALUES ('Elementos de Maquinas II'); --4
INSERT INTO MATERIAS (MATERIA) VALUES ('Tecnologia de Frio y Calor II'); --4
INSERT INTO MATERIAS (MATERIA) VALUES ('Instalaciones y Maquinas electricas II'); --4
INSERT INTO MATERIAS (MATERIA) VALUES ('Elementos de Automatizacion'); --4
INSERT INTO MATERIAS (MATERIA) VALUES ('Costos y Control de Gestion'); --4
INSERT INTO MATERIAS (MATERIA) VALUES ('Aseguramiento de la Calidad'); --4
INSERT INTO MATERIAS (MATERIA) VALUES ('Practica Profesional Supervisada'); --4

-- MATERIAS -- MECATRONICA --  DE 77 AL 92
INSERT INTO MATERIAS (MATERIA) VALUES ('Mecatronica I'); --1
--INSERT INTO MATERIAS (MATERIA) VALUES ('Fisica'); --1
--INSERT INTO MATERIAS (MATERIA) VALUES ('Matematica'); --1
--INSERT INTO MATERIAS (MATERIA) VALUES ('Ingles'); --1
INSERT INTO MATERIAS (MATERIA) VALUES ('Herramientas Informaticas'); --1
INSERT INTO MATERIAS (MATERIA) VALUES ('Sistemas Digitales'); --2
INSERT INTO MATERIAS (MATERIA) VALUES ('Materiales'); --2
INSERT INTO MATERIAS (MATERIA) VALUES ('Electrotecnia I'); --2
INSERT INTO MATERIAS (MATERIA) VALUES ('Sistemas de Representacion'); --2
INSERT INTO MATERIAS (MATERIA) VALUES ('Mecatronica II'); --2
INSERT INTO MATERIAS (MATERIA) VALUES ('Electronica'); --3
INSERT INTO MATERIAS (MATERIA) VALUES ('Mecatronica III'); --3
--INSERT INTO MATERIAS (MATERIA) VALUES ('Mecanica I'); --3
INSERT INTO MATERIAS (MATERIA) VALUES ('Mantenimiento Industrial'); --3
INSERT INTO MATERIAS (MATERIA) VALUES ('Electrotecnia II'); --3
INSERT INTO MATERIAS (MATERIA) VALUES ('Mecatronica IIII'); --4
--INSERT INTO MATERIAS (MATERIA) VALUES ('Mecanica II'); --4
INSERT INTO MATERIAS (MATERIA) VALUES ('Tecnologia de la Fabricacion'); --4
INSERT INTO MATERIAS (MATERIA) VALUES ('Gestion de la Calidad y Metrologia'); --4
INSERT INTO MATERIAS (MATERIA) VALUES ('Seminarios'); --4
INSERT INTO MATERIAS (MATERIA) VALUES ('Pasantias'); --4


-- MATERIAS -- MATERIAS EN COMUN
INSERT INTO MATERIAS (materia) --TODAS
VALUES ('Organizacion Contable de la Empresa');
INSERT INTO MATERIAS (materia) --TODAS
VALUES ('Matematica');
INSERT INTO MATERIAS (materia) --TODAS
VALUES ('Ingles I');
INSERT INTO MATERIAS (materia) --TODAS
VALUES ('Ingles II');
INSERT INTO MATERIAS (materia) --TODAS
VALUES ('Ingles III');
INSERT INTO MATERIAS (materia) --TODAS
VALUES ('Estadistica');
INSERT INTO MATERIAS (materia) --TODAS
VALUES ('Metodologia de la Investigacion');
INSERT INTO MATERIAS (materia) --TODAS
VALUES ('Fisica');

--DOCENTES

INSERT INTO DOCENTES (ape_doc, nom_doc, id_tipo_documento, nro_documento, fecha_nac, email, telefono, id_nacionalidad,
id_barrio, calle, nro_calle, id_estado_civil)
VALUES ('Leunda', 'Daniela', 1, 28335678, '25/05/1962', 'danileunda@gmail.com', 3517691545, 1, 1, 'Santa Rosa', 1544, 1 );
INSERT INTO DOCENTES (ape_doc, nom_doc, id_tipo_documento, nro_documento, fecha_nac, email, telefono, id_nacionalidad,
id_barrio, calle, nro_calle, id_estado_civil)
VALUES ('Guzman', 'Ignacio', 1, 27896587, '23/08/1965', 'nachog@gmail.com', 3517556887, 1, 2, 'San Martin', 2211, 2 );
INSERT INTO DOCENTES (ape_doc, nom_doc, id_tipo_documento, nro_documento, fecha_nac, email, telefono, id_nacionalidad,
id_barrio, calle, nro_calle, id_estado_civil)
VALUES ('Molina', 'Nestor', 1, 30667909, '12/05/1968', 'nestormol@gmail.com', 3514567548, 1, 3, 'Hector Paniza', 332, 3 );
INSERT INTO DOCENTES (ape_doc, nom_doc, id_tipo_documento, nro_documento, fecha_nac, email, telefono, id_nacionalidad,
id_barrio, calle, nro_calle, id_estado_civil)
VALUES ('Pedraza', 'Facundo', 1, 27890667, '01/03/1970', 'facupff@gmail.com', 351367848, 1, 4, 'Luis Agote', 4432, 4 );
INSERT INTO DOCENTES (ape_doc, nom_doc, id_tipo_documento, nro_documento, fecha_nac, email, telefono, id_nacionalidad,
id_barrio, calle, nro_calle, id_estado_civil)
VALUES ('Carballo', 'Elena', 1, 28654009, '16/05/1963', 'elenac@gmail.com', 351-7691548, 1, 5, 'Sabatini', 1332, 5 );

INSERT INTO DOCENTES (ape_doc, nom_doc, id_tipo_documento, nro_documento, fecha_nac, email, telefono, id_nacionalidad,
id_barrio, calle, nro_calle, id_estado_civil)
VALUES ('Fernandez','Maria Luz',1,28457812,'05/10/1979','mLuzFernandez@yahoo.com.ar','153124510',6,1,'General Paz',1006,1)
INSERT INTO DOCENTES (ape_doc, nom_doc, id_tipo_documento, nro_documento, fecha_nac, email, telefono, id_nacionalidad,
id_barrio, calle, nro_calle, id_estado_civil)
VALUES('Arceluz','Cecilia',3,30154578,'12/03/1985','licCecilia_Arceluz@yahoo.com.ar',3516457896,1,34,'Paraguay',24,4);
INSERT INTO DOCENTES (ape_doc, nom_doc, id_tipo_documento, nro_documento, fecha_nac, email, telefono, id_nacionalidad,
id_barrio, calle, nro_calle, id_estado_civil)
VALUES('Adach','Rosario',1,34601169,'07/07/1989','Rosario.adach@gmail.com',null,1,13,'Dorrego',1123,3);
INSERT INTO DOCENTES (ape_doc, nom_doc, id_tipo_documento, nro_documento, fecha_nac, email, telefono, id_nacionalidad,
id_barrio, calle, nro_calle, id_estado_civil)
VALUES('Campos','Valeria',1,30124590,'05/10/1985',null,null,8,25,'Asuncion',53,2);
INSERT INTO DOCENTES (ape_doc, nom_doc, id_tipo_documento, nro_documento, fecha_nac, email, telefono, id_nacionalidad,
id_barrio, calle, nro_calle, id_estado_civil)
VALUES ('Santos','Alberto',1,30520141,'12/07/1975','Albertosantos@gmail.com',3516457800,1,5,'General Deheza',105,2);
-- DOCENTES - NICO
INSERT INTO DOCENTES	(ape_doc		, nom_doc		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, id_estado_civil)
			VALUES		('MARTINEZ'		, 'JUAN'		, 1					, 35456987		, '25/05/1962'	, 'jmartinez@gmail.com'		, '351-7691548'	, 1					, 2			, 'Av.Colon'		, 1552		, 2 );
INSERT INTO DOCENTES	(ape_doc		, nom_doc		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, id_estado_civil)
			VALUES		('SANCHEZ'		, 'CARLOS'		, 2					, 14568785		, '14/04/1945'	, 'csanchez27@gmail.com'	, '351-5658634'	, 2					, 3			, 'Moscoso y Peralta', 548		, 1 );
INSERT INTO DOCENTES	(ape_doc		, nom_doc		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, id_estado_civil)
			VALUES		('GOMEZ'		, 'NICOLAS'		, 1					, 11456852		, '23/07/1980'	, 'nicogomez@gmail.com'		, '351-4569874'	, 3					, 4			, 'Av. Siempre Viva', 152		, 3 );
INSERT INTO DOCENTES	(ape_doc		, nom_doc		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, id_estado_civil)
			VALUES		('MAZZAGLIA'	, 'CLARA'		, 1					, 25417985		, '30/08/1921'	, 'mazzaclara@gmail.com'	, '351-6458521'	, 6					, 5			, 'Rodriguez Pedro'	, 15		, 1 );
INSERT INTO DOCENTES	(ape_doc		, nom_doc		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, id_estado_civil)
			VALUES		('MESSI'		, 'FRANCISCA'	, 1					, 35962147		, '18/12/1954'	, 'messifranchi@gmail.com'	, '351-6231478'	, 1					, 1			, '27 de Abril'		, 2589		, 2 );

--gaby	
INSERT INTO DOCENTES(ape_doc, nom_doc, id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle	,nro_calle,id_estado_civil)
VALUES('MARTINEZ','Marcelo',1,12146761,'25/05/1963','marcelo_martinez@gmail.com',3517691678,1,012,'Av.Colon',9751,1);
INSERT INTO DOCENTES(ape_doc, nom_doc, id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle	,nro_calle,id_estado_civil)
VALUES('Rodriguez','JUAN',2,9756431,'24/02/1961','Juanrodriguez@gmail.com',3517678134, 4,002 ,'Av.Jesus maria',8454,2);
INSERT INTO DOCENTES(ape_doc, nom_doc, id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle	,nro_calle,id_estado_civil)
VALUES('Lopez','Lucas',1,13247641,'17/04/1966',null,354674344, 1,008,'Peron',467,3);
INSERT INTO DOCENTES(ape_doc, nom_doc, id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle	,nro_calle,id_estado_civil)
VALUES('Estevanez','Matias',2,94654731,'30/09/1972','Matiesteva@gmail.com',3164861971, 3, 006,'Belgrano',9754,1);
INSERT INTO DOCENTES(ape_doc, nom_doc, id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle	,nro_calle,id_estado_civil)
VALUES('Garcia','Pedro',1,16752471,'26/04/1982','garciapedro13@gmail.com',3516798417, 1	, 010,'Juan b Justo',431,2);


--ESTUDIANTES

-- ESTUDIANTES - NICO
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('CARRIZO'		, 'BRUNO'		,1					, 38157895		, '25/10/1989'	, 'carribru@gmai.com'		, '0351-4231184', 1					, 1			, 'Juan del Campo'	, 321		, '03/04/2021'	, 1					, 2					, 1				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('MENENDEZ'		, 'JOSE'		,1					, 35874125		, '25/02/1952'	, 'hola@gmai.com'			, '0299-6851410', 1					, 2			, 'Dean Funes'		, 523		, '04/05/2020'	, 2					, 1					, 1				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('SANCHEZ'		, 'PEDRO'		,1					, 25145623		, '25/05/1965'	, 'pedritolooc@gmai.com'	, '3543-5871258', 1					, 3			, '27 de Septiembre', 7			, '05/06/2021'	, 2					, 2					, 2				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('URRITIA'		, 'YAMILA'		,1					, 26589654		, '25/08/1945'	, 'panzaloca@gmai.com'		, '0299-6485214', 1					, 4			, 'M. M. Mojica'	, 1234		, '09/07/2022'	, 1					, 3					, 3				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('SUAREZ'		, 'CAROLINA'	,1					, 32458965		, '25/07/2000'	, 'carolapiola@gmai.com'	, '0351-6857412', 1					, 5			, 'Corrientes'		, 7541		, '07/08/2022'	, 1					, 2					, 5				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('CANELO'		, 'JENNIFER'	,1					, 24789654		, '25/04/1998'	, 'aguantelamona@gmai.com'	, '0299-6852148', 1					, 1			, 'San Martin'		, 158		, '07/09/2022'	, 3					, 2					, 6				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('SALCEDO'		, 'JAVIER'		,1					, 39547812		, '25/05/1987'	, 'promo2000@gmai.com'		, '0351-6874125', 2					, 2			, 'Celso Barrios'	, 2654		, '02/10/2021'	, 1					, 2					, 5				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('MELONI'		, 'GABRIEL'		,1					, 24715924		, '25/11/1965'	, 'viajas@gmai.com'			, '0351-9685214', 3					, 3			, 'Olmos'			, 6585		, '04/04/2020'	, 2					, 2					, 6				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('DIZARS'		, 'ALEJANDRO'	,1					, 14785236		, '25/03/1985'	, 'mecanicojose@gmai.com'	, '3543-7652314', 2					, 4			, 'Duartes Lirios'	, 154		, '07/05/2019'	, 2					, 4					, 1				, 0 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('PAGLIANO'		, 'NICOLAS'		,1					, 25871234		, '25/08/1997'	, 'exutn@gmai.com'			, '0351-7158932', 4					, 5			, 'Juan Dates'		, 951		, '08/06/2020'	, 1					, 5					, 1				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('CHIAVERANO'	, 'JOSIAS'		,1					, 38157895		, '25/09/1981'	, 'apollo11@gmai.com'		, '0351-5957412', 5					, 1			, 'Marcelo Tinelli'	, 1658		, '09/05/2019'	, 1					, 2					, 1				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('BUGLIOTTI'	, 'SAMUEL'		,1					, 32587412		, '25/06/1996'	, 'massiteamo@gmai.com'		, '0351-9632587', 6					, 2			, 'Mirta Legrand'	, 1230		, '08/03/2017'	, 1					, 1					, 1				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('LIBERTAD'		, 'CELINA'		,1					, 39874125		, '25/05/2000'	, 'quatar2022@gmai.com'		, '0351-6325412', 2					, 3			, 'Independencia'	, 8541		, '02/05/2020'	, 2					, 2					, 6				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('WHASHINGTON'	, 'PAULO'		,1					, 23459745		, '25/07/1997'	, 'aguanteboca@gmai.com'	, '0351-3254125', 3					, 4			, 'Libertad'		, 154		, '01/07/2021'	, 1					, 1					, 5				, 0 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('AMERI'		, 'NATALIA'		,1					, 23124678		, '25/04/1996'	, 'cabteamo@gmai.com'		, '0351-5698521', 2					, 5			, 'La Rioja'		, 852		, '03/02/2020'	, 1					, 3					, 6				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('LIEBAU'		, 'EVANGELINA'	,1					, 24971675		, '25/05/1996'	, 'estamosenlab@gmai.com'	, '0351-8654125', 1					, 1			, 'Tucuman'			, 6254		, '03/05/2021'	, 1					, 4					, 2				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('MARTEAU'		, 'NATIVIDAD'	,1					, 35418293		, '25/02/2001'	, 'faltapoco@gmai.com'		, '0351-9741258', 1					, 2			, 'Humberto Primo'	, 123		, '07/08/2019'	, 1					, 5					, 3				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('FERNANDEZ'	, 'CESAR'		,1					, 32587412		, '25/11/2005'	, 'yani@gmai.com'			, '0351-5321452', 1					, 3			, 'Costanera'		, 652		, '03/07/2018'	, 1					, 2					, 4				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('BERNASCONI'	, 'GABRIEL'		,1					, 28391746		, '25/11/1987'	, 'mela@gmai.com'			, '3543-1234567', 1					, 6			, 'Jose Kempes'		, 856		, '08/01/2021'	, 2					, 5					, 1				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('CASTILLO'		, 'AGUSTIN'		,2					, 96874125		, '25/10/1985'	, 'acuerdo@gmai.com'		, '3543-6549871', 7					, 7			, 'Malanca'			, 453		, '09/02/2021'	, 3					, 1					, 1				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('CARRERA'		, 'JOAQUINA'	,2					, 96587412		, '25/12/1962'	, 'los@gmai.com'			, '0351-1594826', 12				, 8			, 'Aristobulo'		, 12		, '12/04/2021'	, 1					, 2					, 6				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('MINUETT'		, 'MARTINA'		,2					, 96587135		, '25/04/1975'	, 'chanchos@gmai.com'		, '3543-1649785', 13				, 9			, 'La Cordillera'	, 543		, '23/05/2021'	, 1					, 2					, 5				, 0 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('LOPEZ'		, 'PAOLA'		,2					, 93258716		, '25/01/1987'	, 'yankilandia@gmai.com'	, '0351-2569584', 5					, 10		, 'Los Granaderos'	, 12		, '26/07/2021'	, 1					, 3					, 1				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('GOMEZ'		, 'TAMARA'		,2					, 94632175		, '25/02/1941'	, 'tamarita@gmai.com'		, '3543-3254987', 6					, 11		, 'Tedin'			, 542		, '03/09/2021'	, 2					, 2					, 5				, 1 );
INSERT INTO ESTUDIANTES (ape_est		, nom_est		, id_tipo_documento	, nro_documento	, fecha_nac		, email						, telefono		, id_nacionalidad	, id_barrio	, calle				, nro_calle	, fecha_ingreso	, id_situacion_habit, id_estado_civil	, id_estado_lab	, condicion) 
VALUES					('CARRIZO'		, 'JOSEFA'		,2					, 97524796		, '25/03/2005'	, 'joselajefa@gmai.com'		, '0351-1256784', 7					, 12		, 'Calle Publica'	, 654		, '03/10/2021'	, 1					, 4					, 6				, 1 );

--AGUS


INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Gallardo','Agustina',1,34601166,'24/07/1989','agusgallardo@gmail.com','3512290331',1,13,'Pasaje Luis Saenz Peña',4189,'01/03/2020',2,2,1,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Barro','Pilar',1,34204152,'10/09/1997','pilar_barro@gmail.com','513455623',1,10,'Colon',150,'01/08/2021',3,1,2,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Rodiguez','Marco',1,32344523,'01/05/1987','mascos_capo@gmail.com','3515342378',3,1,'Belgrano',41,'01/03/2022',2,1,2,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Torre','Gabriela',1,36342312,'4/02/1989','lagabi_torre@gmail.com','3517524198',5,15,'Gral Belgrano',1032,'01/03/2021',1,1,2,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Kleiner','Jose',1,34457898,'09/09/1989','jose_Kleiner@gmail.com','3515784596',8,1,'Tucuman',59,'01/07/2021',3,2,1,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Arruty','Tomas',2,30154878,'24/07/1980','tomasEduardoArruty@gmail.com','4531012',10,46,'Las palmas',2010,'01/09/2019',3,3,2,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Perez','Augusto',1,40154578,'12/11/1994','augus_2020@gmail.com','35154578',1,25,'Las moras',501,'01/02/2021',1,1,1,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Gallo','Rodrigo',1,40154578,'11/07/1988','rodri_2022@gmail.com','3518451278',1,3,'Laprida',4050,'01/01/2021',1,1,1,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Petenian','Lucia',1,32021245,'02/05/1987','luncha_petenian@gmail.com','3512345478',4,4,'Justiniano Posse',3030,'01/01/2019',2,1,1,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Carreño','Javier',1,30124542,'09/01/1989','el_loco_javi@gmail.com','351896451',1,35,'Granja roja',1100,'01/01/2020',3,2,1,0);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Parente','Juan',1,35198975,'09/11/1985','juanchi_paren@gmail.com',null,8,1,null,null,'01/02/2019',3,2,1,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Fuentes','Lucia',1,45120213,'12/11/1987','lucy_fuentesss@gmail.com','351545770',1,20,'24 de septiembre',1050,'04/02/2022',2,2,1,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Flores','Ramon',1,34659878,'13/01/1985','ramon_Flores2020@gmail.com','3515200213',5,1,'rep.Dominicana',275,'01/03/2019',1,1,2,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Pardo','Julieta',1,40124578,'15/02/1994','july_p98@gmail.com','35140045',9,16,'Estados Unidos',5040,'05/02/2016',1,2,1,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Pascal','Gabriel',1,39451287,'10/04/1990','pascal_lagaby@gmail.com','3515477865',2,33,'Juan jose paso',1764,'10/02/2017',1,1,2,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Vidal','Sofia',1,45120123,'24/07/1990','sofi_vidal@gmail.com',null,5,27,'Rio primero',2010,'01/09/2019',3,3,2,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Vazquez','Claudio',1,335645120,'05/03/1993',null,'345120145',1,03,null,null,'01/02/2021',1,1,1,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Bosch','Stefania',1,32659842,'09/05/1996',null,'011452125',1,07,'AV cruz roja',4050,'01/01/2021',1,1,1,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Janer','Marta',1,395687451,'02/05/1990','marta_janer89@gmail.com','0115489526',1,10,null,3030,'01/01/2021',2,1,2,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Gomez','Diego',1,31200106,'09/01/1995','diegui_gomez01@gmail.com',null,null,12,'Cañada',506,'01/01/2018',3,2,1,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Pugliese','Ianna',2,30251478,null,null,'3513457821',1,23,null,null,'03/02/2019',1,1,1,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Fernandez','Paulo',1,33264587,null,null,'3517849578',3,28,'Salto',120,'05/05/2021',1,2,2,2);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Mansilla','Liliana',1,45124563,null,null,'351645720',1,13,'Copiapo',54,'03/04/2015',1,1,1,2);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Carrizo','Guadalupe',1,35122903,'09/08/1989','guadi_carri@gmail.com','01135449578',1,34,'Rio segundo',1120,'05/02/2020',1,2,1,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Mastreto','Ramon',1,36564901,null,'ramon_mas@gmail.com','0113516720',1,1,'Colon',123,'03/02/2019',1,2,1,1);

--GABY
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Carranza','Mario',1,36654784,'08/09/1993',null,'3516544789',1,002,'Juan B Justo',1547,'28/01/2016',1,2,5,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Kempes','Mario Alberto',1,27057269,'12/04/1997','mario_kempes@gmail.com','3543566072',1,030,'Jeronimo Luis de Cabrera',656,'14/10/2015',2,1,1,0);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Sanchez','Juan',2,94547324,'25/06/1992','juansanchez21@hotmail.com','3516548779',4,006,'San Martin',1356,'03/10/2021',1,2,6,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Castillo','Mariela',1,386487312,'01/02/1980','Mariela22_cba@hotmail.com',null,3,009,'Gongora',4038,'03/03/2016',1,2,2,1 );
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Manzilla','Maria Paula',2,93657607,'24/08/1986',null,null,5,1,'Velez Sarfield',532,'08/03/2014',1,1,2,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Guzman','Patricio',1,350547796,'25/04/1991','guzpatricio@gmail.com',3515477689,1,010,'Levillier',456,'09/03/2018',2,3,1,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Gimenez','Juan Carlos',1,27887963,'30/09/1997','carlos_gimenez@gmail.com',3515477756,1,001,'Estrada',645,'26/03/2020',1,2,1,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Vegetti','Pablo',2,98754723,'03/08/1997',null,3454647856,2,005,'24 de septiembre',788,'12/06/2021',1,1,2,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Oliver','Gaston',1,29785753,'31/12/1997',null,null,1,034,'Jose lopez',3015,'02/02/2016',2,4,4,0);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Garcia','Carla',2,93248791,null,null,null,4,004,'Pasaje corral',135,'01/10/2014',2,1,2,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Juarez','jose',1,31215476,'06/07/1979','jose_juarez@gmail.com',3545763747,1,011,'San jose',2050,'04/07/2018',2,3,3,0);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Paez','Joaquin',2,13465734,'25/11/1996',null,351574637,4,001,'Paraguay',354,'13/05/2017',1,3,1,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Graciani','Juan Pablo',2,9947462,'12/12/1995','Juan_graciani@hotmail.com',null,4,013,'9 de julio',150,'10/03/2021',1,1,2,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Gonzalez','Maria',1,35412347,'04/10/1994',null,351446796,4,012,'Caseros',130,null,2,2,2,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Lopez','Marcelo',2,97543147,'08/08/1993','marcelolopez@gmai.com',3514760046,5,010,'tucuman',48,'20/05/2021',1,1,2,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Castro','Agustina',1,36478741,'11/10/1997','agusmolina13@hotmail.com',null,1,005,'Belgrano',445,'04/06/2018',1,2,2,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Perez','Agustina',1,24879461,'01/09/1994','agusperez@hotmail.com',null,1,004,'Bolivia',4895,'04/06/2022',2,3,1,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Castillo','Paulina',1,40467314,'11/03/1997','pau_castillo@hotmail.com',3547644176,2,012,'Caseros',301,'06/04/2016',1,2,2,0);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Caseros','Agustin',2,37654713,'15/11/1996','agus_cba@hotmail.com',null,3,002,'Gongora',6756,'04/03/2018',1,3,2,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Lopez','Sebastian',1,32457961,'12/02/1988','sebaloez@hotmail.com',3515477641,1,006,'Cruz Roja',448,'25/07/2018',1,2,2,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Coniglio','Gabriel',1,29487433,'16/05/1993',null,3515415354,1,014,'Arturo Orgaz',6547,'04/12/2018',2,1,2,0);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Paz','Madelein',1,26567954,'20/12/1996','made_paz@hotmail.com',null,1,001,'9 de julio',664,'05/07/2019',1,2,2,0);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Tevez','Carlos',2,32454763,'16/07/1996','carlitotevez@hotmail.com',2287654713,3,009,'Independencia',1446,'04/07/2021',2,4,2,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Messi','Lionel',1,37654723,'06/01/1999','Liomessi10@hotmail.com',3517874675,1,010,'antonio machado',24,'04/08/2021',1,2,2,1);
INSERT INTO ESTUDIANTES (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,id_situacion_habit,id_estado_civil,id_estado_lab,condicion)
VALUES ('Longo','Augusto',1,38464761,'30/03/1992','aulongo@hotmail.com',3515676547,4,008,'allen',6796,'04/03/2015',2,3,2,1);

--estudiantes sofi

INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit, id_estado_civil, id_estado_lab, condicion)
VALUES ('Barbiero', 'Sofia', 1, 34990118, '01/02/1990', 'sofibarbiero@gmail.com', '3517553158', 1, 2, 'Mariano Ceballos', 2818, '01/11/2021', 2, 5, 1, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit, id_estado_civil, id_estado_lab, condicion)
VALUES ('Cordova', 'Lucas', 1, 35667448, '11/10/1991', 'lucascva@gmail.com', '3515678934', 1, 2, 'Mariano Ceballos', 2818, '01/10/2022', 2, 5, 1, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit, id_estado_civil, id_estado_lab, condicion)
VALUES ('Arriaga', 'Tomas', 1, 35678293, '26/09/1991', 'toarriaga@gmail.com', '3516578943', 2, 3, 'Av Los Platanos', 2345, '01/07/2018', 1, 2, 4, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit, id_estado_civil, id_estado_lab, condicion)
VALUES ('Frassa', 'Matias', 1, 30890789, '13/09/1986', 'matielloco@gmail.com', '3515478902', 3, 1, 'Brown', 1223, '01/09/2020', 1, 2, 4, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit, id_estado_civil, id_estado_lab, condicion)
VALUES ('Olmos', 'Consuelo', 1, 33456890, '01/12/1988', 'kikiolmos@gmail.com', '3514789067', 4, 4, 'Espora', 345, '01/08/2017', 2, 5, 1, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit, id_estado_civil, id_estado_lab, condicion)
VALUES ('Soriano', 'Emilia', 1, 36789564, '15/12/1993', 'emisoriano@gmail.com', '3516555909', 10, 5, 'Pedro Goyena', 1001, '01/03/2019', 3, 2, 2, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit, id_estado_civil, id_estado_lab, condicion)
VALUES ('Bigon', 'Nayla', 1, 34340347, '08/06/1990', 'naybigon@gmail.com', '3513456234', 5, 1, 'Ocaña', 1890, '01/02/2020', 1, 1, 1, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit, id_estado_civil, id_estado_lab, condicion)
VALUES ('Sillero', 'Jose', 1, 3890444, '12/01/1984', 'nanosillero@gmail.com', '3512347982', 8, 2, 'Julian Aguirre', 3560, '01/10/2016', 3, 2, 2, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit, id_estado_civil, id_estado_lab, condicion)
VALUES ('Calvimonte', 'Fernanda', 2, 34678900, '30/07/1989', 'fercalvimonte@gmail.com', '3515445667', 1, 2, 'Haedo', 1500, '01/09/2018', 3, 2, 1, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit, id_estado_civil, id_estado_lab, condicion)
VALUES ('Bertos', 'Carolina', 2, 32456778, '06/03/1986', 'carob@gmail.com', '3514555678', 1, 3, 'Leon Pinelo', 2110, '01/07/2022', 2, 5, 2, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit, id_estado_civil, id_estado_lab, condicion)
VALUES ('Martinez', 'Victoria', 1, 38555789, '19/05/1994', 'vicumar@gmail.com', '3513454445', 1, 4, 'Bv San Juan', 858, '01/02/2021', 1, 2, 1, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit, id_estado_civil, id_estado_lab, condicion)
VALUES ('Peiro', 'Alejandro', 1, 33657888, '23/12/1988', 'alepeiro@gmail.com', '3516557886', 12, 5, 'Lagunilla', 2345, '01/10/2022', 1, 4, 2, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit, id_estado_civil, id_estado_lab, condicion)
VALUES ('Rios', 'Federico', 2, 34555657, '16/08/1989', 'federios@gmail.com', '3514544321', 13, 1, 'Maestro Vidal', 2210, '01/03/2020', 1, 2, 3, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit, id_estado_civil, id_estado_lab, condicion)
VALUES ('Castillo', 'Juan', 1, 32457090, '15/04/1986', 'castilloj@gmail.com', '3513223445', 1, 2, 'Vieytes', 3532, '01/11/2017', 1, 5, 1, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit, id_estado_civil, id_estado_lab, condicion)
VALUES ('Allall', 'Maria Emilia', 1, 35467877, '01/03/1990', 'emiallall@gmail.com', '3516557889', 5, 3, 'Felix Paz', 1121, '01/10/2018', 2, 4, 3, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit , id_estado_civil, id_estado_lab, condicion)
VALUES ('Morelli', 'Jorge', 1, 32445664, '08/08/1987', 'joymorelli@gmail.com', '3512345678', 2, 4, 'Tronador', 445, '01/11/2015', 1, 5, 5, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit , id_estado_civil, id_estado_lab, condicion)
VALUES ('Calabrese', 'Alejo', 1, 36778990, '08/12/1994', 'alecal@gmail.com', '3513443223', 1, 5, 'Tupungato', 2233, '01/11/2016', 3, 1, 2, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit , id_estado_civil, id_estado_lab, condicion)
VALUES ('Franco', 'Lucio', 1, 32443332, '08/08/1987', 'jluciofranco@gmail.com', '3512345443', 1, 1, 'Aconcagua', 4456, '01/11/2017', 1, 2, 3, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit , id_estado_civil, id_estado_lab, condicion)
VALUES ('Garcia', 'Ignacio', 1, 34890067, '15/08/1989', 'nacho23@gmail.com', '3512548790', 1, 2, 'Haedo', 3476, '01/09/2014', 2, 3, 4, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit , id_estado_civil, id_estado_lab, condicion)
VALUES ('Orisber', 'Adriel', 2, 31356443, '21/04/1986', 'orisberadri@gmail.com', '3516557098', 1, 3, 'Comechingones', 6680, '01/03/2020', 3, 4, 5, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit , id_estado_civil, id_estado_lab, condicion)
VALUES ('Bellido', 'Natalia', 2, 36009567, '14/11/1991', 'atibellido@gmail.com', '3514564489', 3, 4, 'Echeverria', 1709, '01/02/2021', 1, 5, 6, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit , id_estado_civil, id_estado_lab, condicion)
VALUES ('Fernandez', 'Santiago', 1, 34532124, '03/03/1990', 'santif@gmail.com', '3513778465', 2, 5, 'Blamey Lafore', 332, '01/11/2022', 2, 1, 1, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit , id_estado_civil, id_estado_lab, condicion)
VALUES ('Cordova', 'Laura', 1, 30980446, '24/12/1983', 'cvalau@gmail.com', '3517556887', 10, 1, 'Peredo', 543, '01/10/2015', 3, 2, 3, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit , id_estado_civil, id_estado_lab, condicion)
VALUES ('Melano', 'Laura', 1, 33980987, '30/09/1989', 'laupim@gmail.com', '3514332761', 9, 2, 'Pascual de Rogatis', 210, '01/11/2017', 1, 3, 2, 1)
INSERT INTO ESTUDIANTES (ape_est, nom_est, id_tipo_documento, nro_documento, fecha_nac,
email, telefono, id_nacionalidad, id_barrio, calle, nro_calle, fecha_ingreso, id_situacion_habit , id_estado_civil, id_estado_lab, condicion)
VALUES ('Paraffa', 'Facundo', 1, 36776456, '18/06/1992', 'facuparaf@gmail.com', '3512332121', 8, 3, 'Sol de Mayo', 765, '01/03/2018', 1, 4, 5, 1)



INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(1,1,2,1)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(2,1,3,1)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(3,2,2,2)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(4,2,3,2)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(5,3,2,3)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(6,3,3,3)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(7,4,4,4)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(8,4,5,4)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(9,5,5,5)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(10,5,6,4)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(11,6,7,5)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(12,7,7,6)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(13,8,5,5)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(14,9,3,6)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(15,9,4,6)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(16,10,2,7)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(17,10,3,7)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(18,11,4,8)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(19,12,1,8)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(20,13,1,9)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(21,14,2,9)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(22,15,3,9)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(23,16,4,9)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(24,17,5,10)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(25,18,3,10)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(26,19,3,11)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(27,20,1,11)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(28,21,2,12)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(29,26,1,13)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(30,27,1,14)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(31,28,2,14)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(32,29,2,15)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(33,30,5,15)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(34,31,1,15)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(35,32,2,16)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(36,33,3,16)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(37,34,2,1)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(38,35,3,1)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(39,36,1,1)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(40,37,1,1)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(41,38,4,2)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(42,39,4,3)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(43,40,3,3)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(44,41,2,4)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(45,42,4,4)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(46,43,1,17)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(47,44,4,17)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(48,45,2,17)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(49,46,3,18)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(50,47,5,18)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(51,48,6,18)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(52,48,1,4)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(53,49,3,5)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(54,50,4,6)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(55,51,5,7)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(56,52,6,8)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(57,53,3,9)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(58,54,2,9)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(59,55,3,10)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(60,56,4,11)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(61,57,5,12)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(62,58,6,13)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(63,59,2,10)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(64,60,1,11)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(65,61,1,12)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(66,62,2,13)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(67,63,4,14)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(68,64,5,15)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(69,65,3,9)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(70,66,2,10)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(71,67,1,15)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(72,68,1,16)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(73,69,4,17)
INSERT INTO DOCENTES_MATERIAS (id_detalle_doc_mat,id_materia,id_curso,legajo_doc)
VALUES(74,70,5,18)


--INSERT -- TECNICATURA EN PROGRAMACION
INSERT INTO TECNICATURAS_MATERIAS VALUES (1,1,1)
INSERT INTO TECNICATURAS_MATERIAS VALUES (2,1,2)
INSERT INTO TECNICATURAS_MATERIAS VALUES (3,1,3)
INSERT INTO TECNICATURAS_MATERIAS VALUES (4,1,4)
INSERT INTO TECNICATURAS_MATERIAS VALUES (5,1,5)
INSERT INTO TECNICATURAS_MATERIAS VALUES (6,1,6)
INSERT INTO TECNICATURAS_MATERIAS VALUES (7,1,7)
INSERT INTO TECNICATURAS_MATERIAS VALUES (8,1,8)
INSERT INTO TECNICATURAS_MATERIAS VALUES (9,1,9)
INSERT INTO TECNICATURAS_MATERIAS VALUES (10,1,10)
INSERT INTO TECNICATURAS_MATERIAS VALUES (11,1,11)

-- MATERIAS -- INDUSTRIAS ALIMENTARIAS
INSERT INTO TECNICATURAS_MATERIAS VALUES (12,2,12)
INSERT INTO TECNICATURAS_MATERIAS VALUES (13,2,13)
INSERT INTO TECNICATURAS_MATERIAS VALUES (14,2,14)
INSERT INTO TECNICATURAS_MATERIAS VALUES (15,2,15)
INSERT INTO TECNICATURAS_MATERIAS VALUES (16,2,16)
INSERT INTO TECNICATURAS_MATERIAS VALUES (17,2,17)
INSERT INTO TECNICATURAS_MATERIAS VALUES (18,2,18)
INSERT INTO TECNICATURAS_MATERIAS VALUES (19,2,19)
INSERT INTO TECNICATURAS_MATERIAS VALUES (20,2,20)


-- MATERIAS -- MOLDES MATRICES Y DISPOSITIVOS
INSERT INTO TECNICATURAS_MATERIAS VALUES (21,3,21)
INSERT INTO TECNICATURAS_MATERIAS VALUES (22,3,22)
INSERT INTO TECNICATURAS_MATERIAS VALUES (23,3,23)
INSERT INTO TECNICATURAS_MATERIAS VALUES (24,3,24)
INSERT INTO TECNICATURAS_MATERIAS VALUES (25,3,25)
INSERT INTO TECNICATURAS_MATERIAS VALUES (26,3,26)
INSERT INTO TECNICATURAS_MATERIAS VALUES (27,3,27)
INSERT INTO TECNICATURAS_MATERIAS VALUES (28,3,28)
INSERT INTO TECNICATURAS_MATERIAS VALUES (29,3,29)
INSERT INTO TECNICATURAS_MATERIAS VALUES (30,3,30)


-- MATERIAS -- TELECOMUNICACIONES
INSERT INTO TECNICATURAS_MATERIAS VALUES (31,4,31)
INSERT INTO TECNICATURAS_MATERIAS VALUES (32,4,32)
INSERT INTO TECNICATURAS_MATERIAS VALUES (33,4,33)
INSERT INTO TECNICATURAS_MATERIAS VALUES (34,4,34)
INSERT INTO TECNICATURAS_MATERIAS VALUES (35,4,35)
INSERT INTO TECNICATURAS_MATERIAS VALUES (36,4,36)
INSERT INTO TECNICATURAS_MATERIAS VALUES (37,4,37)
INSERT INTO TECNICATURAS_MATERIAS VALUES (38,4,38)
INSERT INTO TECNICATURAS_MATERIAS VALUES (39,4,39)
INSERT INTO TECNICATURAS_MATERIAS VALUES (40,4,40)
INSERT INTO TECNICATURAS_MATERIAS VALUES (41,4,41)
INSERT INTO TECNICATURAS_MATERIAS VALUES (42,4,42)
INSERT INTO TECNICATURAS_MATERIAS VALUES (43,4,43)
INSERT INTO TECNICATURAS_MATERIAS VALUES (44,4,44)
INSERT INTO TECNICATURAS_MATERIAS VALUES (45,4,45)
INSERT INTO TECNICATURAS_MATERIAS VALUES (46,4,46)
INSERT INTO TECNICATURAS_MATERIAS VALUES (47,4,47)
INSERT INTO TECNICATURAS_MATERIAS VALUES (48,4,48)
INSERT INTO TECNICATURAS_MATERIAS VALUES (49,4,49)
INSERT INTO TECNICATURAS_MATERIAS VALUES (50,4,50)
INSERT INTO TECNICATURAS_MATERIAS VALUES (51,4,51)
INSERT INTO TECNICATURAS_MATERIAS VALUES (52,4,52)
INSERT INTO TECNICATURAS_MATERIAS VALUES (53,4,53)
INSERT INTO TECNICATURAS_MATERIAS VALUES (54,4,95)
INSERT INTO TECNICATURAS_MATERIAS VALUES (55,4,100)
INSERT INTO TECNICATURAS_MATERIAS VALUES (56,4,96)

-- MATERIAS -- MANTENIMIENTO INDUSTRIAL
INSERT INTO TECNICATURAS_MATERIAS VALUES (57,5,54)
INSERT INTO TECNICATURAS_MATERIAS VALUES (58,5,55)
INSERT INTO TECNICATURAS_MATERIAS VALUES (59,5,56)
INSERT INTO TECNICATURAS_MATERIAS VALUES (60,5,57)
INSERT INTO TECNICATURAS_MATERIAS VALUES (61,5,58)
INSERT INTO TECNICATURAS_MATERIAS VALUES (62,5,59)
INSERT INTO TECNICATURAS_MATERIAS VALUES (63,5,60)
INSERT INTO TECNICATURAS_MATERIAS VALUES (64,5,61)
INSERT INTO TECNICATURAS_MATERIAS VALUES (65,5,62)
INSERT INTO TECNICATURAS_MATERIAS VALUES (66,5,63)
INSERT INTO TECNICATURAS_MATERIAS VALUES (67,5,64)
INSERT INTO TECNICATURAS_MATERIAS VALUES (68,5,65)
INSERT INTO TECNICATURAS_MATERIAS VALUES (69,5,66)
INSERT INTO TECNICATURAS_MATERIAS VALUES (70,5,67)
INSERT INTO TECNICATURAS_MATERIAS VALUES (71,5,68)
INSERT INTO TECNICATURAS_MATERIAS VALUES (72,5,69)
INSERT INTO TECNICATURAS_MATERIAS VALUES (73,5,70)
INSERT INTO TECNICATURAS_MATERIAS VALUES (74,5,71)
INSERT INTO TECNICATURAS_MATERIAS VALUES (75,5,72)
INSERT INTO TECNICATURAS_MATERIAS VALUES (76,5,73)
INSERT INTO TECNICATURAS_MATERIAS VALUES (77,5,74)
INSERT INTO TECNICATURAS_MATERIAS VALUES (78,5,75)
INSERT INTO TECNICATURAS_MATERIAS VALUES (79,5,76)
INSERT INTO TECNICATURAS_MATERIAS VALUES (80,5,94)
INSERT INTO TECNICATURAS_MATERIAS VALUES (81,5,14)
INSERT INTO TECNICATURAS_MATERIAS VALUES (82,5,27)
INSERT INTO TECNICATURAS_MATERIAS VALUES (83,5,95)

-- MATERIAS -- MECATRONICA
INSERT INTO TECNICATURAS_MATERIAS VALUES (84,6,77)
INSERT INTO TECNICATURAS_MATERIAS VALUES (85,6,78)
INSERT INTO TECNICATURAS_MATERIAS VALUES (86,6,79)
INSERT INTO TECNICATURAS_MATERIAS VALUES (87,6,80)
INSERT INTO TECNICATURAS_MATERIAS VALUES (88,6,81)
INSERT INTO TECNICATURAS_MATERIAS VALUES (89,6,82)
INSERT INTO TECNICATURAS_MATERIAS VALUES (90,6,83)
INSERT INTO TECNICATURAS_MATERIAS VALUES (91,6,84)
INSERT INTO TECNICATURAS_MATERIAS VALUES (92,6,85)
INSERT INTO TECNICATURAS_MATERIAS VALUES (93,6,86)
INSERT INTO TECNICATURAS_MATERIAS VALUES (94,6,87)
INSERT INTO TECNICATURAS_MATERIAS VALUES (95,6,88)
INSERT INTO TECNICATURAS_MATERIAS VALUES (96,6,89)
INSERT INTO TECNICATURAS_MATERIAS VALUES (97,6,90)
INSERT INTO TECNICATURAS_MATERIAS VALUES (98,6,91)
INSERT INTO TECNICATURAS_MATERIAS VALUES (99,6,92)
INSERT INTO TECNICATURAS_MATERIAS VALUES (100,6,100)
INSERT INTO TECNICATURAS_MATERIAS VALUES (101,6,94)
INSERT INTO TECNICATURAS_MATERIAS VALUES (102,6,95)
INSERT INTO TECNICATURAS_MATERIAS VALUES (103,6,27)
INSERT INTO TECNICATURAS_MATERIAS VALUES (104,6,28)






-- INSERT NICO
-- ESTUDIANTES_MATERIAS -- INSERT NICO
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	12	,	1	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	13	,	1	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	14	,	1	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	15	,	1	,	3	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	16	,	1	,	3	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	17	,	1	,	4	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	18	,	1	,	4	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	19	,	1	,	5	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	31	,	2	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	32	,	2	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	33	,	2	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	34	,	2	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	35	,	2	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	36	,	2	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	37	,	2	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	38	,	2	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	39	,	2	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	40	,	2	,	3	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	41	,	2	,	3	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	42	,	2	,	3	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	43	,	2	,	4	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	44	,	2	,	4	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	45	,	2	,	4	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	46	,	2	,	5	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	47	,	2	,	5	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	48	,	2	,	5	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	49	,	2	,	5	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	50	,	2	,	6	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	51	,	2	,	6	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	52	,	2	,	6	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	53	,	2	,	6	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	54	,	3	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	55	,	3	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	56	,	3	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	57	,	3	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	58	,	3	,	3	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	59	,	3	,	3	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	60	,	3	,	4	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	61	,	3	,	4	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	62	,	3	,	5	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	63	,	3	,	5	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	64	,	3	,	6	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	65	,	3	,	6	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	66	,	3	,	6	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	67	,	3	,	6	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	77	,	4	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	78	,	4	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	79	,	4	,	7	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	80	,	4	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	81	,	4	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	82	,	4	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	83	,	4	,	3	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	84	,	4	,	4	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	85	,	4	,	4	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	86	,	4	,	5	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	87	,	4	,	5	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	12	,	5	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	13	,	5	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	14	,	5	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	15	,	5	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	16	,	5	,	2	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	17	,	5	,	2	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	18	,	5	,	3	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	19	,	5	,	3	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	31	,	6	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	32	,	6	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	33	,	6	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	34	,	6	,	1	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	35	,	6	,	2	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	36	,	6	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	37	,	6	,	3	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	38	,	6	,	3	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	12	,	7	,	7	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	13	,	7	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	14	,	7	,	1	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	15	,	7	,	2	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	16	,	7	,	3	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	17	,	7	,	3	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	77	,	8	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	78	,	8	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	79	,	8	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	80	,	8	,	2	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	81	,	8	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	82	,	8	,	4	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	83	,	8	,	4	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	21	,	9	,	7	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	22	,	9	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	23	,	9	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	24	,	9	,	1	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	25	,	9	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	26	,	9	,	3	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	27	,	9	,	4	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	28	,	9	,	4	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	12	,	10	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	13	,	10	,	7	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	14	,	10	,	1	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	15	,	10	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	16	,	10	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	17	,	10	,	3	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	18	,	10	,	3	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	19	,	10	,	4	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	20	,	10	,	4	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	1	,	11	,	7	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	2	,	11	,	7	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	3	,	11	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	4	,	11	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	5	,	11	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	6	,	11	,	3	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	7	,	11	,	3	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	8	,	11	,	4	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	9	,	11	,	4	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	12	,	12	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	13	,	12	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	14	,	12	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	15	,	12	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	21	,	13	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	22	,	13	,	7	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	23	,	13	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	24	,	13	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	25	,	13	,	3	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	31	,	14	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	32	,	14	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	33	,	14	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	34	,	14	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	35	,	14	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	36	,	14	,	4	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	54	,	15	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	55	,	15	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	56	,	15	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	57	,	15	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	58	,	15	,	3	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	77	,	16	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	78	,	16	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	79	,	16	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	80	,	16	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	81	,	16	,	3	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	82	,	16	,	3	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	54	,	17	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	55	,	17	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	56	,	17	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	57	,	17	,	2	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	58	,	17	,	3	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	1	,	18	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	2	,	18	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	3	,	18	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	4	,	18	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	5	,	18	,	3	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	6	,	18	,	3	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	7	,	18	,	4	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	8	,	18	,	4	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	12	,	19	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	13	,	19	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	14	,	19	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	15	,	19	,	3	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	16	,	19	,	4	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	31	,	20	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	32	,	20	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	33	,	20	,	3	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	34	,	20	,	4	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	35	,	20	,	5	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	21	,	21	,	7	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	22	,	21	,	7	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	23	,	21	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	24	,	21	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	25	,	21	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	1	,	22	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	2	,	22	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	3	,	22	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	4	,	22	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	5	,	22	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	6	,	22	,	3	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	54	,	23	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	55	,	23	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	56	,	23	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	57	,	23	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	58	,	23	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	12	,	24	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	13	,	24	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	14	,	24	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	15	,	24	,	2	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	16	,	24	,	3	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	17	,	24	,	4	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	31	,	25	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	32	,	25	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	33	,	25	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	34	,	25	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	35	,	25	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	36	,	25	,	3	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	37	,	25	,	3	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	38	,	25	,	3	,	1	,	1	)


-- EXAMENES -- INSERT NICO
INSERT INTO EXAMENES VALUES(	501	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	502	,'	1er PARCIAL	','15/5/2021')
INSERT INTO EXAMENES VALUES(	503	,'	1er PARCIAL	','20/5/2021')
INSERT INTO EXAMENES VALUES(	504	,'	1er PARCIAL	','30/6/2021')
INSERT INTO EXAMENES VALUES(	505	,'	1er PARCIAL	','15/7/2021')
INSERT INTO EXAMENES VALUES(	506	,'	1er PARCIAL	','25/7/2021')
INSERT INTO EXAMENES VALUES(	507	,'	1er PARCIAL	','25/7/2021')
INSERT INTO EXAMENES VALUES(	508	,'	1er PARCIAL	','15/8/2021')
INSERT INTO EXAMENES VALUES(	509	,'	1er PARCIAL	','15/3/2020')
INSERT INTO EXAMENES VALUES(	510	,'	1er PARCIAL	','19/3/2020')
INSERT INTO EXAMENES VALUES(	511	,'	1er PARCIAL	','13/4/2020')
INSERT INTO EXAMENES VALUES(	512	,'	1er PARCIAL	','25/4/2020')
INSERT INTO EXAMENES VALUES(	513	,'	1er PARCIAL	','12/4/2020')
INSERT INTO EXAMENES VALUES(	514	,'	1er PARCIAL	','12/8/2020')
INSERT INTO EXAMENES VALUES(	515	,'	1er PARCIAL	','15/8/2020')
INSERT INTO EXAMENES VALUES(	516	,'	1er PARCIAL	','5/8/2020')
INSERT INTO EXAMENES VALUES(	517	,'	1er PARCIAL	','10/9/2020')
INSERT INTO EXAMENES VALUES(	518	,'	1er PARCIAL	','12/10/2020')
INSERT INTO EXAMENES VALUES(	519	,'	1er PARCIAL	','12/12/2020')
INSERT INTO EXAMENES VALUES(	520	,'	1er PARCIAL	','15/12/2020')
INSERT INTO EXAMENES VALUES(	521	,'	1er PARCIAL	','1/3/2021')
INSERT INTO EXAMENES VALUES(	522	,'	1er PARCIAL	','22/2/2021')
INSERT INTO EXAMENES VALUES(	523	,'	1er PARCIAL	','4/4/2021')
INSERT INTO EXAMENES VALUES(	524	,'	1er PARCIAL	','15/5/2021')
INSERT INTO EXAMENES VALUES(	525	,'	1er PARCIAL	','16/5/2021')
INSERT INTO EXAMENES VALUES(	526	,'	1er PARCIAL	','20/6/2021')
INSERT INTO EXAMENES VALUES(	527	,'	1er PARCIAL	','10/8/2021')
INSERT INTO EXAMENES VALUES(	528	,'	1er PARCIAL	','15/5/2021')
INSERT INTO EXAMENES VALUES(	529	,'	1er PARCIAL	','10/10/2021')
INSERT INTO EXAMENES VALUES(	530	,'	1er PARCIAL	','12/12/2021')
INSERT INTO EXAMENES VALUES(	531	,'	1er PARCIAL	','5/5/2022')
INSERT INTO EXAMENES VALUES(	532	,'	1er PARCIAL	','3/3/2021')
INSERT INTO EXAMENES VALUES(	533	,'	1er PARCIAL	','4/4/2021')
INSERT INTO EXAMENES VALUES(	534	,'	1er PARCIAL	','5/5/2021')
INSERT INTO EXAMENES VALUES(	535	,'	1er PARCIAL	','6/6/2021')
INSERT INTO EXAMENES VALUES(	536	,'	1er PARCIAL	','11/7/2021')
INSERT INTO EXAMENES VALUES(	537	,'	1er PARCIAL	','15/8/2021')
INSERT INTO EXAMENES VALUES(	538	,'	1er PARCIAL	','13/9/2021')
INSERT INTO EXAMENES VALUES(	539	,'	1er PARCIAL	','15/9/2021')
INSERT INTO EXAMENES VALUES(	540	,'	1er PARCIAL	','10/10/2021')
INSERT INTO EXAMENES VALUES(	541	,'	1er PARCIAL	','12/12/2021')
INSERT INTO EXAMENES VALUES(	542	,'	1er PARCIAL	','3/4/2022')
INSERT INTO EXAMENES VALUES(	543	,'	1er PARCIAL	','5/6/2022')
INSERT INTO EXAMENES VALUES(	544	,'	1er PARCIAL	','8/7/2022')
INSERT INTO EXAMENES VALUES(	545	,'	1er PARCIAL	','15/9/2022')
INSERT INTO EXAMENES VALUES(	546	,'	1er PARCIAL	','3/3/2022')
INSERT INTO EXAMENES VALUES(	547	,'	1er PARCIAL	','15/4/2022')
INSERT INTO EXAMENES VALUES(	548	,'	1er PARCIAL	','15/5/2022')
INSERT INTO EXAMENES VALUES(	549	,'	1er PARCIAL	','6/6/2022')
INSERT INTO EXAMENES VALUES(	550	,'	1er PARCIAL	','9/7/2022')
INSERT INTO EXAMENES VALUES(	551	,'	1er PARCIAL	','15/8/2022')
INSERT INTO EXAMENES VALUES(	552	,'	1er PARCIAL	','16/8/2022')
INSERT INTO EXAMENES VALUES(	553	,'	1er PARCIAL	','16/9/2022')
INSERT INTO EXAMENES VALUES(	554	,'	1er PARCIAL	','2/10/2022')
INSERT INTO EXAMENES VALUES(	555	,'	1er PARCIAL	','3/10/2022')
INSERT INTO EXAMENES VALUES(	556	,'	1er PARCIAL	','5/10/2022')
INSERT INTO EXAMENES VALUES(	557	,'	1er PARCIAL	','3/3/2022')
INSERT INTO EXAMENES VALUES(	558	,'	1er PARCIAL	','15/4/2022')
INSERT INTO EXAMENES VALUES(	559	,'	1er PARCIAL	','15/5/2022')
INSERT INTO EXAMENES VALUES(	560	,'	1er PARCIAL	','6/6/2022')
INSERT INTO EXAMENES VALUES(	561	,'	1er PARCIAL	','9/7/2022')
INSERT INTO EXAMENES VALUES(	562	,'	1er PARCIAL	','15/8/2022')
INSERT INTO EXAMENES VALUES(	563	,'	1er PARCIAL	','16/8/2022')
INSERT INTO EXAMENES VALUES(	564	,'	1er PARCIAL	','16/9/2022')
INSERT INTO EXAMENES VALUES(	565	,'	1er PARCIAL	','3/3/2022')
INSERT INTO EXAMENES VALUES(	566	,'	1er PARCIAL	','15/4/2022')
INSERT INTO EXAMENES VALUES(	567	,'	1er PARCIAL	','15/5/2022')
INSERT INTO EXAMENES VALUES(	568	,'	1er PARCIAL	','6/6/2022')
INSERT INTO EXAMENES VALUES(	569	,'	1er PARCIAL	','9/7/2022')
INSERT INTO EXAMENES VALUES(	570	,'	1er PARCIAL	','15/8/2022')
INSERT INTO EXAMENES VALUES(	571	,'	1er PARCIAL	','16/8/2022')
INSERT INTO EXAMENES VALUES(	572	,'	1er PARCIAL	','16/9/2022')
INSERT INTO EXAMENES VALUES(	573	,'	1er PARCIAL	','3/3/2021')
INSERT INTO EXAMENES VALUES(	574	,'	1er PARCIAL	','15/4/2021')
INSERT INTO EXAMENES VALUES(	575	,'	1er PARCIAL	','15/5/2021')
INSERT INTO EXAMENES VALUES(	576	,'	1er PARCIAL	','6/6/2021')
INSERT INTO EXAMENES VALUES(	577	,'	1er PARCIAL	','9/7/2021')
INSERT INTO EXAMENES VALUES(	578	,'	1er PARCIAL	','15/8/2021')
INSERT INTO EXAMENES VALUES(	579	,'	1er PARCIAL	','16/8/2020')
INSERT INTO EXAMENES VALUES(	580	,'	1er PARCIAL	','16/9/2020')
INSERT INTO EXAMENES VALUES(	581	,'	1er PARCIAL	','2/10/2020')
INSERT INTO EXAMENES VALUES(	582	,'	1er PARCIAL	','3/10/2020')
INSERT INTO EXAMENES VALUES(	583	,'	1er PARCIAL	','5/10/2020')
INSERT INTO EXAMENES VALUES(	584	,'	1er PARCIAL	','5/6/2021')
INSERT INTO EXAMENES VALUES(	585	,'	1er PARCIAL	','7/9/2021')
INSERT INTO EXAMENES VALUES(	586	,'	1er PARCIAL	','16/6/2019')
INSERT INTO EXAMENES VALUES(	587	,'	1er PARCIAL	','23/8/2019')
INSERT INTO EXAMENES VALUES(	588	,'	1er PARCIAL	','15/3/2020')
INSERT INTO EXAMENES VALUES(	589	,'	1er PARCIAL	','6/5/2020')
INSERT INTO EXAMENES VALUES(	590	,'	1er PARCIAL	','9/10/2020')
INSERT INTO EXAMENES VALUES(	591	,'	1er PARCIAL	','12/11/2020')
INSERT INTO EXAMENES VALUES(	592	,'	1er PARCIAL	','3/5/2021')
INSERT INTO EXAMENES VALUES(	593	,'	1er PARCIAL	','10/6/2022')
INSERT INTO EXAMENES VALUES(	594	,'	1er PARCIAL	','1/5/2020')
INSERT INTO EXAMENES VALUES(	595	,'	1er PARCIAL	','16/8/2020')
INSERT INTO EXAMENES VALUES(	596	,'	1er PARCIAL	','16/9/2020')
INSERT INTO EXAMENES VALUES(	597	,'	1er PARCIAL	','2/10/2020')
INSERT INTO EXAMENES VALUES(	598	,'	1er PARCIAL	','3/10/2020')
INSERT INTO EXAMENES VALUES(	599	,'	1er PARCIAL	','5/10/2020')
INSERT INTO EXAMENES VALUES(	600	,'	1er PARCIAL	','5/6/2021')
INSERT INTO EXAMENES VALUES(	601	,'	1er PARCIAL	','7/9/2021')
INSERT INTO EXAMENES VALUES(	602	,'	1er PARCIAL	','12/6/2022')
INSERT INTO EXAMENES VALUES(	603	,'	1er PARCIAL	','16/6/2019')
INSERT INTO EXAMENES VALUES(	604	,'	1er PARCIAL	','23/8/2019')
INSERT INTO EXAMENES VALUES(	605	,'	1er PARCIAL	','15/3/2020')
INSERT INTO EXAMENES VALUES(	606	,'	1er PARCIAL	','6/5/2020')
INSERT INTO EXAMENES VALUES(	607	,'	1er PARCIAL	','9/10/2020')
INSERT INTO EXAMENES VALUES(	608	,'	1er PARCIAL	','12/11/2020')
INSERT INTO EXAMENES VALUES(	609	,'	1er PARCIAL	','3/5/2021')
INSERT INTO EXAMENES VALUES(	610	,'	1er PARCIAL	','10/6/2022')
INSERT INTO EXAMENES VALUES(	611	,'	1er PARCIAL	','10/6/2022')
INSERT INTO EXAMENES VALUES(	612	,'	1er PARCIAL	','14/5/2017')
INSERT INTO EXAMENES VALUES(	613	,'	1er PARCIAL	','2/8/2017')
INSERT INTO EXAMENES VALUES(	614	,'	1er PARCIAL	','15/9/2018')
INSERT INTO EXAMENES VALUES(	615	,'	1er PARCIAL	','23/4/2018')
INSERT INTO EXAMENES VALUES(	616	,'	1er PARCIAL	','1/5/2020')
INSERT INTO EXAMENES VALUES(	617	,'	1er PARCIAL	','16/8/2020')
INSERT INTO EXAMENES VALUES(	618	,'	1er PARCIAL	','16/9/2020')
INSERT INTO EXAMENES VALUES(	619	,'	1er PARCIAL	','2/10/2020')
INSERT INTO EXAMENES VALUES(	620	,'	1er PARCIAL	','3/10/2020')
INSERT INTO EXAMENES VALUES(	621	,'	1er PARCIAL	','5/6/2021')
INSERT INTO EXAMENES VALUES(	622	,'	1er PARCIAL	','7/9/2021')
INSERT INTO EXAMENES VALUES(	623	,'	1er PARCIAL	','12/6/2022')
INSERT INTO EXAMENES VALUES(	624	,'	1er PARCIAL	','3/3/2021')
INSERT INTO EXAMENES VALUES(	625	,'	1er PARCIAL	','15/4/2021')
INSERT INTO EXAMENES VALUES(	626	,'	1er PARCIAL	','15/5/2021')
INSERT INTO EXAMENES VALUES(	627	,'	1er PARCIAL	','6/6/2020')
INSERT INTO EXAMENES VALUES(	628	,'	1er PARCIAL	','9/7/2020')
INSERT INTO EXAMENES VALUES(	629	,'	1er PARCIAL	','15/8/2020')
INSERT INTO EXAMENES VALUES(	630	,'	1er PARCIAL	','2/9/2020')
INSERT INTO EXAMENES VALUES(	631	,'	1er PARCIAL	','3/9/2020')
INSERT INTO EXAMENES VALUES(	632	,'	1er PARCIAL	','8/10/2021')
INSERT INTO EXAMENES VALUES(	633	,'	1er PARCIAL	','9/10/2021')
INSERT INTO EXAMENES VALUES(	634	,'	1er PARCIAL	','10/10/2021')
INSERT INTO EXAMENES VALUES(	635	,'	1er PARCIAL	','11/10/2021')
INSERT INTO EXAMENES VALUES(	636	,'	1er PARCIAL	','12/10/2021')
INSERT INTO EXAMENES VALUES(	637	,'	1er PARCIAL	','13/10/2021')
INSERT INTO EXAMENES VALUES(	638	,'	1er PARCIAL	','5/11/2019')
INSERT INTO EXAMENES VALUES(	639	,'	1er PARCIAL	','6/11/2019')
INSERT INTO EXAMENES VALUES(	640	,'	1er PARCIAL	','7/11/2019')
INSERT INTO EXAMENES VALUES(	641	,'	1er PARCIAL	','8/11/2019')
INSERT INTO EXAMENES VALUES(	642	,'	1er PARCIAL	','9/11/2019')
INSERT INTO EXAMENES VALUES(	643	,'	1er PARCIAL	','25/11/2018')
INSERT INTO EXAMENES VALUES(	644	,'	1er PARCIAL	','26/11/2018')
INSERT INTO EXAMENES VALUES(	645	,'	1er PARCIAL	','27/11/2018')
INSERT INTO EXAMENES VALUES(	646	,'	1er PARCIAL	','28/11/2018')
INSERT INTO EXAMENES VALUES(	647	,'	1er PARCIAL	','1/6/2019')
INSERT INTO EXAMENES VALUES(	648	,'	1er PARCIAL	','2/6/2019')
INSERT INTO EXAMENES VALUES(	649	,'	1er PARCIAL	','3/6/2019')
INSERT INTO EXAMENES VALUES(	650	,'	1er PARCIAL	','4/6/2019')
INSERT INTO EXAMENES VALUES(	651	,'	1er PARCIAL	','3/5/2021')
INSERT INTO EXAMENES VALUES(	652	,'	1er PARCIAL	','4/5/2021')
INSERT INTO EXAMENES VALUES(	653	,'	1er PARCIAL	','3/5/2021')
INSERT INTO EXAMENES VALUES(	654	,'	1er PARCIAL	','4/5/2021')
INSERT INTO EXAMENES VALUES(	655	,'	1er PARCIAL	','5/5/2021')
INSERT INTO EXAMENES VALUES(	656	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	657	,'	1er PARCIAL	','4/7/2021')
INSERT INTO EXAMENES VALUES(	658	,'	1er PARCIAL	','5/7/2021')
INSERT INTO EXAMENES VALUES(	659	,'	1er PARCIAL	','3/5/2021')
INSERT INTO EXAMENES VALUES(	660	,'	1er PARCIAL	','4/5/2021')
INSERT INTO EXAMENES VALUES(	661	,'	1er PARCIAL	','5/5/2021')
INSERT INTO EXAMENES VALUES(	662	,'	1er PARCIAL	','6/5/2021')
INSERT INTO EXAMENES VALUES(	663	,'	1er PARCIAL	','3/8/2021')
INSERT INTO EXAMENES VALUES(	664	,'	1er PARCIAL	','4/8/2021')
INSERT INTO EXAMENES VALUES(	665	,'	1er PARCIAL	','5/8/2021')
INSERT INTO EXAMENES VALUES(	666	,'	1er PARCIAL	','6/8/2021')
INSERT INTO EXAMENES VALUES(	667	,'	1er PARCIAL	','7/8/2021')
INSERT INTO EXAMENES VALUES(	668	,'	1er PARCIAL	','8/8/2021')
INSERT INTO EXAMENES VALUES(	669	,'	1er PARCIAL	','9/8/2021')
INSERT INTO EXAMENES VALUES(	670	,'	1er PARCIAL	','3/9/2021')
INSERT INTO EXAMENES VALUES(	671	,'	1er PARCIAL	','4/9/2021')
INSERT INTO EXAMENES VALUES(	672	,'	1er PARCIAL	','5/9/2021')
INSERT INTO EXAMENES VALUES(	673	,'	1er PARCIAL	','6/9/2021')
INSERT INTO EXAMENES VALUES(	674	,'	1er PARCIAL	','3/10/2021')
INSERT INTO EXAMENES VALUES(	675	,'	1er PARCIAL	','4/10/2021')
INSERT INTO EXAMENES VALUES(	676	,'	1er PARCIAL	','5/10/2021')
INSERT INTO EXAMENES VALUES(	677	,'	1er PARCIAL	','6/10/2021')
INSERT INTO EXAMENES VALUES(	678	,'	1er PARCIAL	','7/10/2021')
INSERT INTO EXAMENES VALUES(	679	,'	1er PARCIAL	','3/5/2021')
INSERT INTO EXAMENES VALUES(	680	,'	1er PARCIAL	','4/5/2021')
INSERT INTO EXAMENES VALUES(	681	,'	1er PARCIAL	','5/5/2021')
INSERT INTO EXAMENES VALUES(	682	,'	1er PARCIAL	','6/5/2021')
INSERT INTO EXAMENES VALUES(	683	,'	1er PARCIAL	','7/5/2021')
INSERT INTO EXAMENES VALUES(	684	,'	1er PARCIAL	','3/5/2021')
INSERT INTO EXAMENES VALUES(	685	,'	1er PARCIAL	','4/5/2021')
INSERT INTO EXAMENES VALUES(	686	,'	1er PARCIAL	','5/5/2021')
INSERT INTO EXAMENES VALUES(	687	,'	1er PARCIAL	','6/5/2021')
INSERT INTO EXAMENES VALUES(	688	,'	1er PARCIAL	','7/5/2021')
INSERT INTO EXAMENES VALUES(	689	,'	1er PARCIAL	','3/5/2021')
INSERT INTO EXAMENES VALUES(	690	,'	1er PARCIAL	','4/5/2021')

INSERT INTO EXAMENES VALUES(	691	,'	2do PARCIAL	','3/5/2021')
INSERT INTO EXAMENES VALUES(	692	,'	2do PARCIAL	','15/6/2021')
INSERT INTO EXAMENES VALUES(	693	,'	2do PARCIAL	','20/6/2021')
INSERT INTO EXAMENES VALUES(	694	,'	2do PARCIAL	','30/7/2021')
INSERT INTO EXAMENES VALUES(	695	,'	2do PARCIAL	','15/8/2021')
INSERT INTO EXAMENES VALUES(	696	,'	2do PARCIAL	','25/8/2021')
INSERT INTO EXAMENES VALUES(	697	,'	2do PARCIAL	','25/8/2021')
INSERT INTO EXAMENES VALUES(	698	,'	2do PARCIAL	','15/9/2021')
INSERT INTO EXAMENES VALUES(	699	,'	2do PARCIAL	','15/4/2020')
INSERT INTO EXAMENES VALUES(	700	,'	2do PARCIAL	','19/4/2020')
INSERT INTO EXAMENES VALUES(	701	,'	2do PARCIAL	','13/5/2020')
INSERT INTO EXAMENES VALUES(	702	,'	2do PARCIAL	','25/5/2020')
INSERT INTO EXAMENES VALUES(	703	,'	2do PARCIAL	','12/5/2020')
INSERT INTO EXAMENES VALUES(	704	,'	2do PARCIAL	','12/9/2020')
INSERT INTO EXAMENES VALUES(	705	,'	2do PARCIAL	','15/9/2020')
INSERT INTO EXAMENES VALUES(	706	,'	2do PARCIAL	','5/9/2020')
INSERT INTO EXAMENES VALUES(	707	,'	2do PARCIAL	','10/10/2020')
INSERT INTO EXAMENES VALUES(	708	,'	2do PARCIAL	','12/11/2020')
INSERT INTO EXAMENES VALUES(	709	,'	2do PARCIAL	','12/12/2020')
INSERT INTO EXAMENES VALUES(	710	,'	2do PARCIAL	','30/12/2020')
INSERT INTO EXAMENES VALUES(	711	,'	2do PARCIAL	','1/4/2021')
INSERT INTO EXAMENES VALUES(	712	,'	2do PARCIAL	','22/3/2021')
INSERT INTO EXAMENES VALUES(	713	,'	2do PARCIAL	','4/5/2021')
INSERT INTO EXAMENES VALUES(	714	,'	2do PARCIAL	','15/6/2021')
INSERT INTO EXAMENES VALUES(	715	,'	2do PARCIAL	','16/6/2021')
INSERT INTO EXAMENES VALUES(	716	,'	2do PARCIAL	','20/7/2021')
INSERT INTO EXAMENES VALUES(	717	,'	2do PARCIAL	','10/9/2021')
INSERT INTO EXAMENES VALUES(	718	,'	2do PARCIAL	','15/6/2021')
INSERT INTO EXAMENES VALUES(	719	,'	2do PARCIAL	','10/11/2021')
INSERT INTO EXAMENES VALUES(	720	,'	2do PARCIAL	','15/12/2021')
INSERT INTO EXAMENES VALUES(	721	,'	2do PARCIAL	','5/6/2022')
INSERT INTO EXAMENES VALUES(	722	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	723	,'	2do PARCIAL	','4/5/2021')
INSERT INTO EXAMENES VALUES(	724	,'	2do PARCIAL	','5/6/2021')
INSERT INTO EXAMENES VALUES(	725	,'	2do PARCIAL	','6/7/2021')
INSERT INTO EXAMENES VALUES(	726	,'	2do PARCIAL	','11/8/2021')
INSERT INTO EXAMENES VALUES(	727	,'	2do PARCIAL	','15/9/2021')
INSERT INTO EXAMENES VALUES(	728	,'	2do PARCIAL	','13/10/2021')
INSERT INTO EXAMENES VALUES(	729	,'	2do PARCIAL	','15/10/2021')
INSERT INTO EXAMENES VALUES(	730	,'	2do PARCIAL	','10/11/2021')
INSERT INTO EXAMENES VALUES(	731	,'	2do PARCIAL	','16/12/2021')
INSERT INTO EXAMENES VALUES(	732	,'	2do PARCIAL	','3/5/2022')
INSERT INTO EXAMENES VALUES(	733	,'	2do PARCIAL	','5/7/2022')
INSERT INTO EXAMENES VALUES(	734	,'	2do PARCIAL	','8/8/2022')
INSERT INTO EXAMENES VALUES(	735	,'	2do PARCIAL	','15/10/2022')
INSERT INTO EXAMENES VALUES(	736	,'	2do PARCIAL	','3/4/2022')
INSERT INTO EXAMENES VALUES(	737	,'	2do PARCIAL	','15/5/2022')
INSERT INTO EXAMENES VALUES(	738	,'	2do PARCIAL	','15/6/2022')
INSERT INTO EXAMENES VALUES(	739	,'	2do PARCIAL	','6/7/2022')
INSERT INTO EXAMENES VALUES(	740	,'	2do PARCIAL	','9/8/2022')
INSERT INTO EXAMENES VALUES(	741	,'	2do PARCIAL	','15/9/2022')
INSERT INTO EXAMENES VALUES(	742	,'	2do PARCIAL	','16/9/2022')
INSERT INTO EXAMENES VALUES(	743	,'	2do PARCIAL	','16/10/2022')
INSERT INTO EXAMENES VALUES(	744	,'	2do PARCIAL	','2/11/2022')
INSERT INTO EXAMENES VALUES(	745	,'	2do PARCIAL	','3/11/2022')
INSERT INTO EXAMENES VALUES(	746	,'	2do PARCIAL	','5/11/2022')
INSERT INTO EXAMENES VALUES(	747	,'	2do PARCIAL	','3/4/2022')
INSERT INTO EXAMENES VALUES(	748	,'	2do PARCIAL	','15/6/2022')
INSERT INTO EXAMENES VALUES(	749	,'	2do PARCIAL	','15/6/2022')
INSERT INTO EXAMENES VALUES(	750	,'	2do PARCIAL	','6/7/2022')
INSERT INTO EXAMENES VALUES(	751	,'	2do PARCIAL	','9/8/2022')
INSERT INTO EXAMENES VALUES(	752	,'	2do PARCIAL	','15/9/2022')
INSERT INTO EXAMENES VALUES(	753	,'	2do PARCIAL	','16/9/2022')
INSERT INTO EXAMENES VALUES(	754	,'	2do PARCIAL	','16/10/2022')
INSERT INTO EXAMENES VALUES(	755	,'	2do PARCIAL	','3/4/2022')
INSERT INTO EXAMENES VALUES(	756	,'	2do PARCIAL	','15/5/2022')
INSERT INTO EXAMENES VALUES(	757	,'	2do PARCIAL	','15/6/2022')
INSERT INTO EXAMENES VALUES(	758	,'	2do PARCIAL	','6/7/2022')
INSERT INTO EXAMENES VALUES(	759	,'	2do PARCIAL	','9/8/2022')
INSERT INTO EXAMENES VALUES(	760	,'	2do PARCIAL	','15/9/2022')
INSERT INTO EXAMENES VALUES(	761	,'	2do PARCIAL	','16/9/2022')
INSERT INTO EXAMENES VALUES(	762	,'	2do PARCIAL	','16/10/2022')
INSERT INTO EXAMENES VALUES(	763	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	764	,'	2do PARCIAL	','15/5/2021')
INSERT INTO EXAMENES VALUES(	765	,'	2do PARCIAL	','15/6/2021')
INSERT INTO EXAMENES VALUES(	766	,'	2do PARCIAL	','6/7/2021')
INSERT INTO EXAMENES VALUES(	767	,'	2do PARCIAL	','9/8/2021')
INSERT INTO EXAMENES VALUES(	768	,'	2do PARCIAL	','15/9/2021')
INSERT INTO EXAMENES VALUES(	769	,'	2do PARCIAL	','16/9/2020')
INSERT INTO EXAMENES VALUES(	770	,'	2do PARCIAL	','16/10/2020')
INSERT INTO EXAMENES VALUES(	771	,'	2do PARCIAL	','2/11/2020')
INSERT INTO EXAMENES VALUES(	772	,'	2do PARCIAL	','3/11/2020')
INSERT INTO EXAMENES VALUES(	773	,'	2do PARCIAL	','5/11/2020')
INSERT INTO EXAMENES VALUES(	774	,'	2do PARCIAL	','5/7/2021')
INSERT INTO EXAMENES VALUES(	775	,'	2do PARCIAL	','7/10/2021')
INSERT INTO EXAMENES VALUES(	776	,'	2do PARCIAL	','16/7/2019')
INSERT INTO EXAMENES VALUES(	777	,'	2do PARCIAL	','23/9/2019')
INSERT INTO EXAMENES VALUES(	778	,'	2do PARCIAL	','15/4/2020')
INSERT INTO EXAMENES VALUES(	779	,'	2do PARCIAL	','6/6/2020')
INSERT INTO EXAMENES VALUES(	780	,'	2do PARCIAL	','9/11/2020')
INSERT INTO EXAMENES VALUES(	781	,'	2do PARCIAL	','12/12/2020')
INSERT INTO EXAMENES VALUES(	782	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	783	,'	2do PARCIAL	','10/7/2022')
INSERT INTO EXAMENES VALUES(	784	,'	2do PARCIAL	','1/7/2020')
INSERT INTO EXAMENES VALUES(	785	,'	2do PARCIAL	','16/9/2020')
INSERT INTO EXAMENES VALUES(	786	,'	2do PARCIAL	','16/10/2020')
INSERT INTO EXAMENES VALUES(	787	,'	2do PARCIAL	','2/11/2020')
INSERT INTO EXAMENES VALUES(	788	,'	2do PARCIAL	','3/11/2020')
INSERT INTO EXAMENES VALUES(	789	,'	2do PARCIAL	','5/11/2020')
INSERT INTO EXAMENES VALUES(	790	,'	2do PARCIAL	','5/7/2021')
INSERT INTO EXAMENES VALUES(	791	,'	2do PARCIAL	','7/10/2021')
INSERT INTO EXAMENES VALUES(	792	,'	2do PARCIAL	','12/8/2022')
INSERT INTO EXAMENES VALUES(	793	,'	2do PARCIAL	','16/7/2019')
INSERT INTO EXAMENES VALUES(	794	,'	2do PARCIAL	','23/9/2019')
INSERT INTO EXAMENES VALUES(	795	,'	2do PARCIAL	','15/4/2020')
INSERT INTO EXAMENES VALUES(	796	,'	2do PARCIAL	','6/7/2020')
INSERT INTO EXAMENES VALUES(	797	,'	2do PARCIAL	','9/11/2020')
INSERT INTO EXAMENES VALUES(	798	,'	2do PARCIAL	','12/12/2020')
INSERT INTO EXAMENES VALUES(	799	,'	2do PARCIAL	','3/6/2021')
INSERT INTO EXAMENES VALUES(	800	,'	2do PARCIAL	','10/7/2022')
INSERT INTO EXAMENES VALUES(	801	,'	2do PARCIAL	','10/8/2022')
INSERT INTO EXAMENES VALUES(	802	,'	2do PARCIAL	','14/6/2017')
INSERT INTO EXAMENES VALUES(	803	,'	2do PARCIAL	','2/9/2017')
INSERT INTO EXAMENES VALUES(	804	,'	2do PARCIAL	','15/10/2018')
INSERT INTO EXAMENES VALUES(	805	,'	2do PARCIAL	','23/5/2018')
INSERT INTO EXAMENES VALUES(	806	,'	2do PARCIAL	','1/6/2020')
INSERT INTO EXAMENES VALUES(	807	,'	2do PARCIAL	','16/9/2020')
INSERT INTO EXAMENES VALUES(	808	,'	2do PARCIAL	','16/10/2020')
INSERT INTO EXAMENES VALUES(	809	,'	2do PARCIAL	','2/11/2020')
INSERT INTO EXAMENES VALUES(	810	,'	2do PARCIAL	','3/11/2020')
INSERT INTO EXAMENES VALUES(	811	,'	2do PARCIAL	','5/7/2021')
INSERT INTO EXAMENES VALUES(	812	,'	2do PARCIAL	','7/10/2021')
INSERT INTO EXAMENES VALUES(	813	,'	2do PARCIAL	','12/7/2022')
INSERT INTO EXAMENES VALUES(	814	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	815	,'	2do PARCIAL	','15/5/2021')
INSERT INTO EXAMENES VALUES(	816	,'	2do PARCIAL	','15/6/2021')
INSERT INTO EXAMENES VALUES(	817	,'	2do PARCIAL	','6/7/2020')
INSERT INTO EXAMENES VALUES(	818	,'	2do PARCIAL	','9/8/2020')
INSERT INTO EXAMENES VALUES(	819	,'	2do PARCIAL	','15/9/2020')
INSERT INTO EXAMENES VALUES(	820	,'	2do PARCIAL	','2/10/2020')
INSERT INTO EXAMENES VALUES(	821	,'	2do PARCIAL	','3/10/2020')
INSERT INTO EXAMENES VALUES(	822	,'	2do PARCIAL	','8/11/2021')
INSERT INTO EXAMENES VALUES(	823	,'	2do PARCIAL	','9/11/2021')
INSERT INTO EXAMENES VALUES(	824	,'	2do PARCIAL	','10/11/2021')
INSERT INTO EXAMENES VALUES(	825	,'	2do PARCIAL	','11/11/2021')
INSERT INTO EXAMENES VALUES(	826	,'	2do PARCIAL	','12/11/2021')
INSERT INTO EXAMENES VALUES(	827	,'	2do PARCIAL	','13/11/2021')
INSERT INTO EXAMENES VALUES(	828	,'	2do PARCIAL	','5/12/2019')
INSERT INTO EXAMENES VALUES(	829	,'	2do PARCIAL	','6/12/2019')
INSERT INTO EXAMENES VALUES(	830	,'	2do PARCIAL	','7/12/2019')
INSERT INTO EXAMENES VALUES(	831	,'	2do PARCIAL	','8/12/2019')
INSERT INTO EXAMENES VALUES(	832	,'	2do PARCIAL	','9/12/2019')
INSERT INTO EXAMENES VALUES(	833	,'	2do PARCIAL	','25/12/2018')
INSERT INTO EXAMENES VALUES(	834	,'	2do PARCIAL	','26/12/2018')
INSERT INTO EXAMENES VALUES(	835	,'	2do PARCIAL	','27/12/2018')
INSERT INTO EXAMENES VALUES(	836	,'	2do PARCIAL	','28/12/2018')
INSERT INTO EXAMENES VALUES(	837	,'	2do PARCIAL	','1/8/2019')
INSERT INTO EXAMENES VALUES(	838	,'	2do PARCIAL	','2/8/2019')
INSERT INTO EXAMENES VALUES(	839	,'	2do PARCIAL	','3/8/2019')
INSERT INTO EXAMENES VALUES(	840	,'	2do PARCIAL	','4/8/2019')
INSERT INTO EXAMENES VALUES(	841	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	842	,'	2do PARCIAL	','4/7/2021')
INSERT INTO EXAMENES VALUES(	843	,'	2do PARCIAL	','5/7/2021')
INSERT INTO EXAMENES VALUES(	844	,'	2do PARCIAL	','6/7/2021')
INSERT INTO EXAMENES VALUES(	845	,'	2do PARCIAL	','7/7/2021')
INSERT INTO EXAMENES VALUES(	846	,'	2do PARCIAL	','3/8/2021')
INSERT INTO EXAMENES VALUES(	847	,'	2do PARCIAL	','4/8/2021')
INSERT INTO EXAMENES VALUES(	848	,'	2do PARCIAL	','5/8/2021')
INSERT INTO EXAMENES VALUES(	849	,'	2do PARCIAL	','3/6/2021')
INSERT INTO EXAMENES VALUES(	850	,'	2do PARCIAL	','4/6/2021')
INSERT INTO EXAMENES VALUES(	851	,'	2do PARCIAL	','5/6/2021')
INSERT INTO EXAMENES VALUES(	852	,'	2do PARCIAL	','6/6/2021')
INSERT INTO EXAMENES VALUES(	853	,'	2do PARCIAL	','3/9/2021')
INSERT INTO EXAMENES VALUES(	854	,'	2do PARCIAL	','4/9/2021')
INSERT INTO EXAMENES VALUES(	855	,'	2do PARCIAL	','5/9/2021')
INSERT INTO EXAMENES VALUES(	856	,'	2do PARCIAL	','6/9/2021')
INSERT INTO EXAMENES VALUES(	857	,'	2do PARCIAL	','7/9/2021')
INSERT INTO EXAMENES VALUES(	858	,'	2do PARCIAL	','8/9/2021')
INSERT INTO EXAMENES VALUES(	859	,'	2do PARCIAL	','9/9/2021')
INSERT INTO EXAMENES VALUES(	860	,'	2do PARCIAL	','3/10/2021')
INSERT INTO EXAMENES VALUES(	861	,'	2do PARCIAL	','4/10/2021')
INSERT INTO EXAMENES VALUES(	862	,'	2do PARCIAL	','5/10/2021')
INSERT INTO EXAMENES VALUES(	863	,'	2do PARCIAL	','6/10/2021')
INSERT INTO EXAMENES VALUES(	864	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	865	,'	2do PARCIAL	','4/11/2021')
INSERT INTO EXAMENES VALUES(	866	,'	2do PARCIAL	','5/11/2021')
INSERT INTO EXAMENES VALUES(	867	,'	2do PARCIAL	','6/11/2021')
INSERT INTO EXAMENES VALUES(	868	,'	2do PARCIAL	','7/11/2021')
INSERT INTO EXAMENES VALUES(	869	,'	2do PARCIAL	','3/6/2021')
INSERT INTO EXAMENES VALUES(	870	,'	2do PARCIAL	','4/6/2021')
INSERT INTO EXAMENES VALUES(	871	,'	2do PARCIAL	','5/6/2021')
INSERT INTO EXAMENES VALUES(	872	,'	2do PARCIAL	','6/6/2021')
INSERT INTO EXAMENES VALUES(	873	,'	2do PARCIAL	','7/6/2021')
INSERT INTO EXAMENES VALUES(	874	,'	2do PARCIAL	','8/6/2021')
INSERT INTO EXAMENES VALUES(	875	,'	2do PARCIAL	','9/6/2021')
INSERT INTO EXAMENES VALUES(	876	,'	2do PARCIAL	','10/6/2021')
INSERT INTO EXAMENES VALUES(	877	,'	2do PARCIAL	','11/6/2021')
INSERT INTO EXAMENES VALUES(	878	,'	2do PARCIAL	','12/6/2021')
INSERT INTO EXAMENES VALUES(	879	,'	2do PARCIAL	','13/6/2021')
INSERT INTO EXAMENES VALUES(	880	,'	2do PARCIAL	','14/6/2021')

-- EXAMEN_MATERIAS -- INSERT NICO
INSERT INTO EXAMEN_MATERIAS VALUES(10,	501	,	12	,	1	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	502	,	13	,	1	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	503	,	14	,	1	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	504	,	15	,	1	)
INSERT INTO EXAMEN_MATERIAS VALUES(2,	505	,	16	,	1	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	506	,	17	,	1	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	507	,	18	,	1	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	508	,	19	,	1	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	509	,	31	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(3,	510	,	32	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	511	,	33	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	512	,	34	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	513	,	35	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	514	,	36	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(3,	515	,	37	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	516	,	38	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	517	,	39	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	518	,	40	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	519	,	41	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	520	,	42	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	521	,	43	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(3,	522	,	44	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	523	,	45	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	524	,	46	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	525	,	47	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	526	,	48	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(1,	527	,	49	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	528	,	50	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	529	,	51	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	530	,	52	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	531	,	53	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	532	,	54	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(1,	533	,	55	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	534	,	56	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	535	,	57	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	536	,	58	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	537	,	59	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	538	,	60	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	539	,	61	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	540	,	62	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	541	,	63	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	542	,	64	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	543	,	65	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	544	,	66	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	545	,	67	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	546	,	77	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	547	,	78	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	548	,	79	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	549	,	80	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	550	,	81	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	551	,	82	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	552	,	83	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	553	,	84	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	554	,	85	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	555	,	86	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	556	,	87	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(2,	557	,	12	,	5	)
INSERT INTO EXAMEN_MATERIAS VALUES(3,	558	,	13	,	5	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	559	,	14	,	5	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	560	,	15	,	5	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	561	,	16	,	5	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	562	,	17	,	5	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	563	,	18	,	5	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	564	,	19	,	5	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	565	,	31	,	6	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	566	,	32	,	6	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	567	,	33	,	6	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	568	,	34	,	6	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	569	,	35	,	6	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	570	,	36	,	6	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	571	,	37	,	6	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	572	,	38	,	6	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	573	,	12	,	7	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	574	,	13	,	7	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	575	,	14	,	7	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	576	,	15	,	7	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	577	,	16	,	7	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	578	,	17	,	7	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	579	,	77	,	8	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	580	,	78	,	8	)
INSERT INTO EXAMEN_MATERIAS VALUES(2,	581	,	79	,	8	)
INSERT INTO EXAMEN_MATERIAS VALUES(3,	582	,	80	,	8	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	583	,	81	,	8	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	584	,	82	,	8	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	585	,	83	,	8	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	586	,	21	,	9	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	587	,	22	,	9	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	588	,	23	,	9	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	589	,	24	,	9	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	590	,	25	,	9	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	591	,	26	,	9	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	592	,	27	,	9	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	593	,	28	,	9	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	594	,	12	,	10	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	595	,	13	,	10	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	596	,	14	,	10	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	597	,	15	,	10	)
INSERT INTO EXAMEN_MATERIAS VALUES(2,	598	,	16	,	10	)
INSERT INTO EXAMEN_MATERIAS VALUES(3,	599	,	17	,	10	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	600	,	18	,	10	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	601	,	19	,	10	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	602	,	20	,	10	)
INSERT INTO EXAMEN_MATERIAS VALUES(2,	603	,	1	,	11	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	604	,	2	,	11	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	605	,	3	,	11	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	606	,	4	,	11	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	607	,	5	,	11	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	608	,	6	,	11	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	609	,	7	,	11	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	610	,	8	,	11	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	611	,	9	,	11	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	612	,	12	,	12	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	613	,	13	,	12	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	614	,	14	,	12	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	615	,	15	,	12	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	616	,	21	,	13	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	617	,	22	,	13	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	618	,	23	,	13	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	619	,	24	,	13	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	620	,	25	,	13	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	621	,	31	,	14	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	622	,	32	,	14	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	623	,	33	,	14	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	624	,	34	,	14	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	625	,	35	,	14	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	626	,	36	,	14	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	627	,	54	,	15	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	628	,	55	,	15	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	629	,	56	,	15	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	630	,	57	,	15	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	631	,	58	,	15	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	632	,	77	,	16	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	633	,	78	,	16	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	634	,	79	,	16	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	635	,	80	,	16	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	636	,	81	,	16	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	637	,	82	,	16	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	638	,	54	,	17	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	639	,	55	,	17	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	640	,	56	,	17	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	641	,	57	,	17	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	642	,	58	,	17	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	643	,	1	,	18	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	644	,	2	,	18	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	645	,	3	,	18	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	646	,	4	,	18	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	647	,	5	,	18	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	648	,	6	,	18	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	649	,	7	,	18	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	650	,	8	,	18	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	651	,	12	,	19	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	652	,	13	,	19	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	653	,	14	,	19	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	654	,	15	,	19	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	655	,	16	,	19	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	656	,	31	,	20	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	657	,	32	,	20	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	658	,	33	,	20	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	659	,	34	,	20	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	660	,	35	,	20	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	661	,	21	,	21	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	662	,	22	,	21	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	663	,	23	,	21	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	664	,	24	,	21	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	665	,	25	,	21	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	666	,	1	,	22	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	667	,	2	,	22	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	668	,	3	,	22	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	669	,	4	,	22	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	670	,	5	,	22	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	671	,	6	,	22	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	672	,	54	,	23	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	673	,	55	,	23	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	674	,	56	,	23	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	675	,	57	,	23	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	676	,	58	,	23	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	677	,	12	,	24	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	678	,	13	,	24	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	679	,	14	,	24	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	680	,	15	,	24	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	681	,	16	,	24	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	682	,	17	,	24	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	683	,	31	,	25	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	684	,	32	,	25	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	685	,	33	,	25	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	686	,	34	,	25	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	687	,	35	,	25	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	688	,	36	,	25	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	689	,	37	,	25	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	690	,	38	,	25	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	691	,	12	,	1	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	692	,	13	,	1	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	693	,	14	,	1	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	694	,	15	,	1	)
INSERT INTO EXAMEN_MATERIAS VALUES(3,	695	,	16	,	1	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	696	,	17	,	1	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	697	,	18	,	1	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	698	,	19	,	1	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	699	,	31	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	700	,	32	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	701	,	33	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(3,	702	,	34	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	703	,	35	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	704	,	36	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	705	,	37	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(2,	706	,	38	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	707	,	39	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	708	,	40	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	709	,	41	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	710	,	42	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(3,	711	,	43	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	712	,	44	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	713	,	45	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	714	,	46	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	715	,	47	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(3,	716	,	48	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	717	,	49	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	718	,	50	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	719	,	51	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	720	,	52	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	721	,	53	,	2	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	722	,	54	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(3,	723	,	55	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	724	,	56	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	725	,	57	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	726	,	58	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	727	,	59	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	728	,	60	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	729	,	61	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	730	,	62	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(2,	731	,	63	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(3,	732	,	64	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	733	,	65	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	734	,	66	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	735	,	67	,	3	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	736	,	77	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	737	,	78	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	738	,	79	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	739	,	80	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	740	,	81	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	741	,	82	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	742	,	83	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	743	,	84	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	744	,	85	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	745	,	86	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	746	,	87	,	4	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	747	,	12	,	5	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	748	,	13	,	5	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	749	,	14	,	5	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	750	,	15	,	5	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	751	,	16	,	5	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	752	,	17	,	5	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	753	,	18	,	5	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	754	,	19	,	5	)
INSERT INTO EXAMEN_MATERIAS VALUES(2,	755	,	31	,	6	)
INSERT INTO EXAMEN_MATERIAS VALUES(3,	756	,	32	,	6	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	757	,	33	,	6	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	758	,	34	,	6	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	759	,	35	,	6	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	760	,	36	,	6	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	761	,	37	,	6	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	762	,	38	,	6	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	763	,	12	,	7	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	764	,	13	,	7	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	765	,	14	,	7	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	766	,	15	,	7	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	767	,	16	,	7	)
INSERT INTO EXAMEN_MATERIAS VALUES(2,	768	,	17	,	7	)
INSERT INTO EXAMEN_MATERIAS VALUES(3,	769	,	77	,	8	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	770	,	78	,	8	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	771	,	79	,	8	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	772	,	80	,	8	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	773	,	81	,	8	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	774	,	82	,	8	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	775	,	83	,	8	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	776	,	21	,	9	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	777	,	22	,	9	)
INSERT INTO EXAMEN_MATERIAS VALUES(2,	778	,	23	,	9	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	779	,	24	,	9	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	780	,	25	,	9	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	781	,	26	,	9	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	782	,	27	,	9	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	783	,	28	,	9	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	784	,	12	,	10	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	785	,	13	,	10	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	786	,	14	,	10	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	787	,	15	,	10	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	788	,	16	,	10	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	789	,	17	,	10	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	790	,	18	,	10	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	791	,	19	,	10	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	792	,	20	,	10	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	793	,	1	,	11	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	794	,	2	,	11	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	795	,	3	,	11	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	796	,	4	,	11	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	797	,	5	,	11	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	798	,	6	,	11	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	799	,	7	,	11	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	800	,	8	,	11	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	801	,	9	,	11	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	802	,	12	,	12	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	803	,	13	,	12	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	804	,	14	,	12	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	805	,	15	,	12	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	806	,	21	,	13	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	807	,	22	,	13	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	808	,	23	,	13	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	809	,	24	,	13	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	810	,	25	,	13	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	811	,	31	,	14	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	812	,	32	,	14	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	813	,	33	,	14	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	814	,	34	,	14	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	815	,	35	,	14	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	816	,	36	,	14	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	817	,	54	,	15	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	818	,	55	,	15	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	819	,	56	,	15	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	820	,	57	,	15	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	821	,	58	,	15	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	822	,	77	,	16	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	823	,	78	,	16	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	824	,	79	,	16	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	825	,	80	,	16	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	826	,	81	,	16	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	827	,	82	,	16	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	828	,	54	,	17	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	829	,	55	,	17	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	830	,	56	,	17	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	831	,	57	,	17	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	832	,	58	,	17	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	833	,	1	,	18	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	834	,	2	,	18	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	835	,	3	,	18	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	836	,	4	,	18	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	837	,	5	,	18	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	838	,	6	,	18	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	839	,	7	,	18	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	840	,	8	,	18	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	841	,	12	,	19	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	842	,	13	,	19	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	843	,	14	,	19	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	844	,	15	,	19	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	845	,	16	,	19	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	846	,	31	,	20	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	847	,	32	,	20	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	848	,	33	,	20	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	849	,	34	,	20	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	850	,	35	,	20	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	851	,	21	,	21	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	852	,	22	,	21	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	853	,	23	,	21	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	854	,	24	,	21	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	855	,	25	,	21	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	856	,	1	,	22	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	857	,	2	,	22	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	858	,	3	,	22	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	859	,	4	,	22	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	860	,	5	,	22	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	861	,	6	,	22	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	862	,	54	,	23	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	863	,	55	,	23	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	864	,	56	,	23	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	865	,	57	,	23	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	866	,	58	,	23	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	867	,	12	,	24	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	868	,	13	,	24	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	869	,	14	,	24	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	870	,	15	,	24	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	871	,	16	,	24	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	872	,	17	,	24	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	873	,	31	,	25	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	874	,	32	,	25	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	875	,	33	,	25	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	876	,	34	,	25	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	877	,	35	,	25	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	878	,	36	,	25	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	879	,	37	,	25	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	880	,	38	,	25	)


-- INSERT AGUS
-- ESTUDIANTES_MATERIAS -- INSERT AGUS
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	1	,	26	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	2	,	26	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	3	,	26	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	4	,	26	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	5	,	26	,	3	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	6	,	26	,	3	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	7	,	26	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	8	,	26	,	4	,	4	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	12	,	27	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	13	,	27	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	14	,	27	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	15	,	27	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	16	,	27	,	3	,	3	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	17	,	27	,	3	,	3	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	21	,	28	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	22	,	28	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	23	,	28	,	1	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	24	,	28	,	1	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	25	,	28	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	26	,	28	,	2	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	27	,	28	,	2	,	3	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	28	,	28	,	2	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	31	,	29	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	32	,	29	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	33	,	29	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	34	,	29	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	35	,	29	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	36	,	29	,	2	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	37	,	29	,	2	,	3	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	38	,	29	,	3	,	3	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	54	,	30	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	55	,	30	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	56	,	30	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	57	,	30	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	58	,	30	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	59	,	30	,	2	,	3	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	60	,	30	,	3	,	3	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	61	,	30	,	3	,	3	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	77	,	31	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	78	,	31	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	79	,	31	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	80	,	31	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	81	,	31	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	82	,	31	,	3	,	2	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	83	,	31	,	3	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	84	,	31	,	3	,	3	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	1	,	32	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	2	,	32	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	3	,	32	,	1	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	4	,	32	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	5	,	32	,	2	,	2	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	6	,	32	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	7	,	32	,	2	,	3	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	8	,	32	,	3	,	3	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	12	,	33	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	13	,	33	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	14	,	33	,	2	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	15	,	33	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	16	,	33	,	1	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	17	,	33	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	18	,	33	,	2	,	3	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	19	,	33	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	20	,	33	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	21	,	34	,	1	,	3	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	22	,	34	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	23	,	34	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	24	,	34	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	25	,	34	,	3	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	26	,	34	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	31	,	35	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	32	,	35	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	33	,	35	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	34	,	35	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	35	,	35	,	1	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	36	,	35	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	37	,	35	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	54	,	36	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	55	,	36	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	56	,	36	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	57	,	36	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	58	,	36	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	77	,	37	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	78	,	37	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	79	,	37	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	80	,	37	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	81	,	37	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	82	,	37	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	1	,	38	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	2	,	38	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	3	,	38	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	4	,	38	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	5	,	38	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	6	,	39	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	7	,	39	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	8	,	39	,	3	,	3	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	9	,	39	,	3	,	3	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	10	,	39	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	12	,	40	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	13	,	40	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	14	,	40	,	1	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	15	,	40	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	16	,	40	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	21	,	41	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	22	,	41	,	1	,	1	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	23	,	41	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	24	,	41	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	25	,	41	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	31	,	42	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	32	,	42	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	33	,	42	,	2	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	34	,	42	,	2	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	35	,	42	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	36	,	42	,	3	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	54	,	43	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	55	,	43	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	56	,	43	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	57	,	43	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	58	,	43	,	3	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	77	,	44	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	78	,	44	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	79	,	44	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	80	,	44	,	2	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	81	,	44	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	1	,	45	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	2	,	45	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	3	,	45	,	2	,	1	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	4	,	45	,	2	,	2	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	5	,	45	,	3	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	6	,	45	,	3	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	12	,	46	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	13	,	46	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	14	,	46	,	1	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	15	,	46	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	16	,	46	,	2	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	31	,	47	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	32	,	47	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	33	,	47	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	34	,	47	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	54	,	48	,	1	,	1	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	55	,	48	,	1	,	1	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	56	,	48	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	57	,	48	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	58	,	48	,	3	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	77	,	49	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	78	,	49	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	79	,	49	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	80	,	49	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	81	,	49	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	1	,	50	,	1	,	1	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	2	,	50	,	1	,	1	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	3	,	50	,	2	,	1	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	4	,	50	,	2	,	2	,	3	)

-- EXAMENES -- INSERT AGUS
INSERT INTO EXAMENES VALUES(	1	,'1er PARCIAL	','3/7/2022')
INSERT INTO EXAMENES VALUES(	2	,'1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	3	,'1er PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	4	,'1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	5	,'1er PARCIAL	','2/11/2021')
INSERT INTO EXAMENES VALUES(	6	,'1er PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	7	,'1er PARCIAL	','2/3/2022')
INSERT INTO EXAMENES VALUES(	8	,'1er PARCIAL	','3/2/2022')
INSERT INTO EXAMENES VALUES(	9	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	10	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	11	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	12	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	13	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	14	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	15	,'	1er PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	16	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	17	,'	1er PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	18	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	19	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	20	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	21	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	22	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	23	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	24	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	25	,'	1er PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	26	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	27	,'	1er PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	28	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	29	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	30	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	31	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	32	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	33	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	34	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	35	,'	1er PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	36	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	37	,'	1er PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	38	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	39	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	40	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	41	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	42	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	43	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	44	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	45	,'	1er PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	46	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	47	,'	1er PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	48	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	49	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	50	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	51	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	52	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	53	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	54	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	55	,'	1er PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	56	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	57	,'	1er PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	58	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	59	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	60	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	61	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	62	,'	1er PARCIAL	','2/8/2022')
INSERT INTO EXAMENES VALUES(	63	,'	1er PARCIAL	','3/9/2021')
INSERT INTO EXAMENES VALUES(	64	,'	1er PARCIAL	','2/10/2022')
INSERT INTO EXAMENES VALUES(	65	,'	1er PARCIAL	','2/11/2021')
INSERT INTO EXAMENES VALUES(	66	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	67	,'	1er PARCIAL	','2/9/2021')
INSERT INTO EXAMENES VALUES(	68	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	69	,'	1er PARCIAL	','3/6/2021')
INSERT INTO EXAMENES VALUES(	70	,'	1er PARCIAL	','3/6/2021')
INSERT INTO EXAMENES VALUES(	71	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	72	,'	1er PARCIAL	','2/4/2022')
INSERT INTO EXAMENES VALUES(	73	,'	1er PARCIAL	','3/3/2021')
INSERT INTO EXAMENES VALUES(	74	,'	1er PARCIAL	','2/3/2022')
INSERT INTO EXAMENES VALUES(	75	,'	1er PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	76	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	77	,'	1er PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	78	,'	1er PARCIAL	','3/3/2021')
INSERT INTO EXAMENES VALUES(	79	,'	1er PARCIAL	','13/3/2021')
INSERT INTO EXAMENES VALUES(	80	,'	1er PARCIAL	','1/4/2021')
INSERT INTO EXAMENES VALUES(	81	,'	1er PARCIAL	','3/7/2022')
INSERT INTO EXAMENES VALUES(	82	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	83	,'	1er PARCIAL	','3/11/2022')
INSERT INTO EXAMENES VALUES(	84	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	85	,'	1er PARCIAL	','2/11/2021')
INSERT INTO EXAMENES VALUES(	86	,'	1er PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	87	,'	1er PARCIAL	','2/3/2022')
INSERT INTO EXAMENES VALUES(	88	,'	1er PARCIAL	','3/2/2022')
INSERT INTO EXAMENES VALUES(	89	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	90	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	91	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	92	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	93	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	94	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	95	,'	1er PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	96	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	97	,'	1er PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	98	,'	1er PARCIAL	','3/7/2022')
INSERT INTO EXAMENES VALUES(	99	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	100	,'	1er PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	101	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	102	,'	1er PARCIAL	','2/11/2021')
INSERT INTO EXAMENES VALUES(	103	,'	1er PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	104	,'	1er PARCIAL	','2/3/2022')
INSERT INTO EXAMENES VALUES(	105	,'	1er PARCIAL	','3/2/2022')
INSERT INTO EXAMENES VALUES(	106	,'	1er PARCIAL	','13/4/2021')
INSERT INTO EXAMENES VALUES(	107	,'	1er PARCIAL	','13/4/2021')
INSERT INTO EXAMENES VALUES(	108	,'	1er PARCIAL	','13/7/2021')
INSERT INTO EXAMENES VALUES(	109	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	110	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	111	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	112	,'	1er PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	113	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	114	,'	1er PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	115	,'	1er PARCIAL	','3/7/2022')
INSERT INTO EXAMENES VALUES(	116	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	117	,'	1er PARCIAL	','3/11/2022')
INSERT INTO EXAMENES VALUES(	118	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	119	,'	1er PARCIAL	','2/11/2021')
INSERT INTO EXAMENES VALUES(	120	,'	1er PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	121	,'	1er PARCIAL	','2/3/2022')
INSERT INTO EXAMENES VALUES(	122	,'	1er PARCIAL	','3/2/2022')
INSERT INTO EXAMENES VALUES(	123	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	124	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	125	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	126	,'	1er PARCIAL	','2/2/2022')
INSERT INTO EXAMENES VALUES(	127	,'	1er PARCIAL	','3/2/2021')
INSERT INTO EXAMENES VALUES(	128	,'	1er PARCIAL	','12/4/2022')
INSERT INTO EXAMENES VALUES(	129	,'	1er PARCIAL	','12/5/2021')
INSERT INTO EXAMENES VALUES(	130	,'	1er PARCIAL	','13/4/2021')
INSERT INTO EXAMENES VALUES(	131	,'	1er PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	132	,'	1er PARCIAL	','13/7/2022')
INSERT INTO EXAMENES VALUES(	133	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	134	,'	1er PARCIAL	','13/11/2022')
INSERT INTO EXAMENES VALUES(	135	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	136	,'	1er PARCIAL	','2/11/2021')
INSERT INTO EXAMENES VALUES(	137	,'	1er PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	138	,'	1er PARCIAL	','2/3/2022')
INSERT INTO EXAMENES VALUES(	139	,'	1er PARCIAL	','3/2/2022')
INSERT INTO EXAMENES VALUES(	140	,'	1er PARCIAL	','13/4/2021')
INSERT INTO EXAMENES VALUES(	141	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	142	,'	1er PARCIAL	','13/7/2021')
INSERT INTO EXAMENES VALUES(	143	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	144	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	145	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	146	,'	1er PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	147	,'	1er PARCIAL	','10/4/2021')
INSERT INTO EXAMENES VALUES(	148	,'	1er PARCIAL	','12/4/2021')
INSERT INTO EXAMENES VALUES(	149	,'	1er PARCIAL	','13/8/2022')
INSERT INTO EXAMENES VALUES(	150	,'	1er PARCIAL	','12/9/2022')
INSERT INTO EXAMENES VALUES(	151	,'	1er PARCIAL	','10/9/2022')
INSERT INTO EXAMENES VALUES(	152	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2000	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	2001	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2002	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	2003	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2004	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2005	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2006	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2007	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2008	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2009	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2010	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2011	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2012	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2013	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2014	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2015	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2016	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2017	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2018	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2019	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2020	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2021	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2022	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2023	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2024	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2025	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2026	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2027	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2028	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2029	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2030	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2031	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2032	,'	2do PARCIAL	','1/2/2020')
INSERT INTO EXAMENES VALUES(	2033	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2034	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2035	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2036	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2037	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2038	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2039	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	2040	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	2041	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	2042	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	2043	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	2044	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	2045	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	2046	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	2047	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	2048	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	2049	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	2050	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	2051	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	2052	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	2053	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2054	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2055	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2056	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2057	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2058	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2059	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2060	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2061	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2062	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2063	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2064	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2065	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2066	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2067	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2068	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2069	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2070	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2071	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2072	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2073	,'	2do PARCIAL	','3/11/2022')
INSERT INTO EXAMENES VALUES(	2074	,'	2do PARCIAL	','3/11/2022')
INSERT INTO EXAMENES VALUES(	2075	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	2076	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	2077	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	2078	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	2079	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	2080	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	2081	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	2082	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	2083	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	2084	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	2085	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	2086	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2087	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2088	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2089	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2090	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2091	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2092	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2093	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2094	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2095	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2096	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2097	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2098	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2099	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2100	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2101	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2102	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2103	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2104	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2105	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	2106	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	2107	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	2108	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	2109	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	2110	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	2111	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	2112	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	2113	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	2114	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	2115	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	2116	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	2117	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	2118	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2119	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2120	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2121	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2122	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2123	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2124	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2125	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2126	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2127	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2128	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2129	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	2130	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2131	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2132	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2133	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2134	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2135	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2136	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	2137	,'	2do PARCIAL	','3/11/2022')
INSERT INTO EXAMENES VALUES(	2138	,'	2do PARCIAL	','3/11/2022')
INSERT INTO EXAMENES VALUES(	2139	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	2140	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	2141	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	2142	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	2143	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	2144	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	2145	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	2146	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	2147	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	2148	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	2149	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	2150	,'	2do PARCIAL	','3/11/2022')
INSERT INTO EXAMENES VALUES(	2151	,'	2do PARCIAL	','2/4/2021')

-- EXAMEN_MATERIAS -- INSERT AGUS
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1	,	1	,	26	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2	,	2	,	26	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	3	,	3	,	26	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	4	,	4	,	26	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	5	,	5	,	26	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	6	,	6	,	26	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	7	,	7	,	26	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	8	,	8	,	26	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	9	,	12	,	27	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	10	,	13	,	27	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	11	,	14	,	27	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	12	,	15	,	27	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	13	,	16	,	27	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	14	,	17	,	27	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	15	,	21	,	28	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	16	,	22	,	28	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	17	,	23	,	28	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	18	,	24	,	28	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	19	,	25	,	28	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	20	,	26	,	28	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	21	,	27	,	28	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	22	,	28	,	28	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	23	,	31	,	29	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	24	,	32	,	29	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	25	,	33	,	29	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	26	,	34	,	29	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	27	,	35	,	29	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	28	,	36	,	29	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	29	,	37	,	29	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	30	,	38	,	29	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	31	,	54	,	30	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	32	,	55	,	30	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	33	,	56	,	30	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	34	,	57	,	30	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	35	,	58	,	30	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	36	,	59	,	30	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	37	,	60	,	30	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	38	,	61	,	30	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	39	,	77	,	31	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	40	,	78	,	31	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	41	,	79	,	31	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	42	,	80	,	31	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	43	,	81	,	31	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	44	,	82	,	31	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	45	,	83	,	31	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	46	,	84	,	31	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	47	,	1	,	32	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	48	,	2	,	32	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	49	,	3	,	32	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	50	,	4	,	32	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	51	,	5	,	32	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	52	,	6	,	32	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	53	,	7	,	32	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	54	,	8	,	32	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	55	,	12	,	33	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	56	,	13	,	33	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	57	,	14	,	33	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	58	,	15	,	33	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	59	,	16	,	33	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	60	,	17	,	33	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	61	,	18	,	33	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	62	,	19	,	33	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	63	,	20	,	33	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	64	,	21	,	34	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	65	,	22	,	34	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	66	,	23	,	34	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	67	,	24	,	34	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	68	,	25	,	34	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	69	,	26	,	34	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	70	,	31	,	35	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	71	,	32	,	35	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	72	,	33	,	35	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	73	,	34	,	35	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	74	,	35	,	35	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	75	,	36	,	35	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	76	,	37	,	35	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	77	,	54	,	36	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	78	,	55	,	36	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	79	,	56	,	36	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	80	,	57	,	36	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	81	,	58	,	36	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	82	,	77	,	37	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	83	,	78	,	37	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	84	,	79	,	37	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	85	,	80	,	37	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	86	,	81	,	37	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	87	,	82	,	37	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	88	,	1	,	38	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	89	,	2	,	38	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	90	,	3	,	38	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	91	,	4	,	38	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	92	,	5	,	38	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	93	,	6	,	39	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	94	,	7	,	39	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	95	,	8	,	39	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	96	,	9	,	39	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	97	,	10	,	39	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	98	,	12	,	40	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	99	,	13	,	40	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	98	,	14	,	40	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	101	,	15	,	40	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	102	,	16	,	40	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	103	,	21	,	41	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	104	,	22	,	41	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	105	,	23	,	41	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	106	,	24	,	41	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	107	,	25	,	41	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	108	,	31	,	42	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	109	,	32	,	42	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	110	,	33	,	42	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	111	,	34	,	42	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	112	,	35	,	42	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	113	,	36	,	42	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	114	,	54	,	43	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	115	,	55	,	43	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	116	,	56	,	43	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	117	,	57	,	43	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	118	,	58	,	43	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	119	,	77	,	44	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	120	,	78	,	44	)
INSERT INTO EXAMEN_MATERIAS VALUES(2,	121	,	79	,	44	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	122	,	80	,	44	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	123	,	81	,	44	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	124	,	1	,	45	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	125	,	2	,	45	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	126	,	3	,	45	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	127	,	4	,	45	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	128	,	5	,	45	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	129	,	6	,	45	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	130	,	12	,	46	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	131	,	13	,	46	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	132	,	14	,	46	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	133	,	15	,	46	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	134	,	16	,	46	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	135	,	31	,	47	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	136	,	32	,	47	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	137	,	33	,	47	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	138	,	34	,	47	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	139	,	54	,	48	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	140	,	55	,	48	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	141	,	56	,	48	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	142	,	57	,	48	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	143	,	58	,	48	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	144	,	77	,	49	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	145	,	78	,	49	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	146	,	79	,	49	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	147	,	80	,	49	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	148	,	81	,	49	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	149	,	1	,	50	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	150	,	2	,	50	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	151	,	3	,	50	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	152	,	4	,	50	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2000	,	1	,	26	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2001	,	2	,	26	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2002	,	3	,	26	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2003	,	4	,	26	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2004	,	5	,	26	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2005	,	6	,	26	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	2006	,	7	,	26	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	2007	,	8	,	26	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	2008	,	12	,	27	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2009	,	13	,	27	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2010	,	14	,	27	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2011	,	15	,	27	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2012	,	16	,	27	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2013	,	17	,	27	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2014	,	21	,	28	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2015	,	22	,	28	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2016	,	23	,	28	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2017	,	24	,	28	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2018	,	25	,	28	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2019	,	26	,	28	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2020	,	27	,	28	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2021	,	28	,	28	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2022	,	31	,	29	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2023	,	32	,	29	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2024	,	33	,	29	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2025	,	34	,	29	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2026	,	35	,	29	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2027	,	36	,	29	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2028	,	37	,	29	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2029	,	38	,	29	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2030	,	54	,	30	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2031	,	55	,	30	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2032	,	56	,	30	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2033	,	57	,	30	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2034	,	58	,	30	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2035	,	59	,	30	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2036	,	60	,	30	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2037	,	61	,	30	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2038	,	77	,	31	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2039	,	78	,	31	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2040	,	79	,	31	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2041	,	80	,	31	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2042	,	81	,	31	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2043	,	82	,	31	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2044	,	83	,	31	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2045	,	84	,	31	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2046	,	1	,	32	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2047	,	2	,	32	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2048	,	3	,	32	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2049	,	4	,	32	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2050	,	5	,	32	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2051	,	6	,	32	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2052	,	7	,	32	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2053	,	8	,	32	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2054	,	12	,	33	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2055	,	13	,	33	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2056	,	14	,	33	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2057	,	15	,	33	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2058	,	16	,	33	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2059	,	17	,	33	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2060	,	18	,	33	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2061	,	19	,	33	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2062	,	20	,	33	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2063	,	21	,	34	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2064	,	22	,	34	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2065	,	23	,	34	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2066	,	24	,	34	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2067	,	25	,	34	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2068	,	26	,	34	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2069	,	31	,	35	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2070	,	32	,	35	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2071	,	33	,	35	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2072	,	34	,	35	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2073	,	35	,	35	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2074	,	36	,	35	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2075	,	37	,	35	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2076	,	54	,	36	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2077	,	55	,	36	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2078	,	56	,	36	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2079	,	57	,	36	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2080	,	58	,	36	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2081	,	77	,	37	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2082	,	78	,	37	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2083	,	79	,	37	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2084	,	80	,	37	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2085	,	81	,	37	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2086	,	82	,	37	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2087	,	1	,	38	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2088	,	2	,	38	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2089	,	3	,	38	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2090	,	4	,	38	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2091	,	5	,	38	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2092	,	6	,	39	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2093	,	7	,	39	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2094	,	8	,	39	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2095	,	9	,	39	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2096	,	10	,	39	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2097	,	12	,	40	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2098	,	13	,	40	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2099	,	14	,	40	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2100	,	15	,	40	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2101	,	16	,	40	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2102	,	21	,	41	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2103	,	22	,	41	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2104	,	23	,	41	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2105	,	24	,	41	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2106	,	25	,	41	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2107	,	31	,	42	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2108	,	32	,	42	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2109	,	33	,	42	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2110	,	34	,	42	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	2111	,	35	,	42	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	2112	,	36	,	42	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2113	,	54	,	43	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2114	,	55	,	43	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2115	,	56	,	43	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	2116	,	57	,	43	)
INSERT INTO EXAMEN_MATERIAS VALUES(4,	2117	,	58	,	43	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	2118	,	77	,	44	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	2119	,	78	,	44	)
INSERT INTO EXAMEN_MATERIAS VALUES(2,	2120	,	79	,	44	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2121	,	80	,	44	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2122	,	81	,	44	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2123	,	1	,	45	)
INSERT INTO EXAMEN_MATERIAS VALUES(5,	2124	,	2	,	45	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2125	,	3	,	45	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2126	,	4	,	45	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2127	,	5	,	45	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2128	,	6	,	45	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2129	,	12	,	46	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2130	,	13	,	46	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2131	,	14	,	46	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2132	,	15	,	46	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2133	,	16	,	46	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2134	,	31	,	47	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2135	,	32	,	47	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2136	,	33	,	47	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2137	,	34	,	47	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2138	,	54	,	48	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2139	,	55	,	48	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2140	,	56	,	48	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2141	,	57	,	48	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2142	,	58	,	48	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2143	,	77	,	49	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2144	,	78	,	49	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2145	,	79	,	49	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2146	,	80	,	49	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2147	,	81	,	49	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2148	,	1	,	50	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2149	,	2	,	50	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2150	,	3	,	50	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2151	,	4	,	50	)

-- INSERT SOFI
-- ESTUDIANTES_MATERIAS -- INSERT SOFI

INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	1	,	76	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	2	,	76	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	3	,	76	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	4	,	76	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	5	,	76	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	6	,	76	,	3	,	3	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	7	,	77	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	8	,	77	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	9	,	77	,	4	,	4	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	10	,	77	,	4	,	4	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	12	,	78	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	13	,	78	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	14	,	78	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	15	,	78	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	16	,	78	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	17	,	79	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	18	,	79	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	19	,	79	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	20	,	79	,	4	,	4	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	100	,	79	,	4	,	4	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	21	,	80	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	22	,	80	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	23	,	80	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	24	,	80	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	25	,	81	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	26	,	81	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	27	,	81	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	28	,	81	,	3	,	3	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	29	,	82	,	3	,	3	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	30	,	82	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	21	,	82	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	22	,	82	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	23	,	82	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	31	,	83	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	32	,	83	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	33	,	83	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	34	,	83	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	35	,	84	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	36	,	84	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	37	,	84	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	38	,	84	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	39	,	84	,	4	,	4	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	40	,	85	,	4	,	4	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	41	,	85	,	4	,	4	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	42	,	85	,	5	,	5	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	43	,	85	,	5	,	5	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	44	,	86	,	5	,	5	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	45	,	86	,	5	,	5	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	46	,	86	,	5	,	5	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	47	,	86	,	5	,	5	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	48	,	87	,	6	,	6	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	49	,	87	,	6	,	6	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	50	,	87	,	6	,	6	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	51	,	87	,	6	,	6	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	54	,	88	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	55	,	88	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	56	,	88	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	57	,	88	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	58	,	89	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	59	,	89	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	60	,	89	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	61	,	89	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	62	,	89	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	63	,	90	,	3	,	3	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	64	,	90	,	3	,	3	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	65	,	90	,	3	,	3	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	66	,	90	,	3	,	3	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	67	,	91	,	3	,	3	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	68	,	91	,	4	,	4	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	69	,	91	,	4	,	4	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	70	,	91	,	4	,	4	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	71	,	92	,	4	,	4	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	72	,	92	,	4	,	4	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	73	,	92	,	4	,	4	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	74	,	92	,	4	,	4	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	77	,	93	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	78	,	93	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	79	,	93	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	80	,	93	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	81	,	93	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	82	,	94	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	83	,	94	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	84	,	94	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	85	,	94	,	2	,	2	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	86	,	95	,	2	,	2	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	87	,	95	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	88	,	95	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	89	,	95	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	90	,	96	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	91	,	96	,	3	,	3	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	92	,	96	,	4	,	4	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	79	,	96	,	4	,	4	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	80	,	96	,	4	,	4	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	1	,	97	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	2	,	97	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	3	,	97	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	4	,	97	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	5	,	98	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	6	,	98	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	7	,	98	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	8	,	98	,	2	,	2	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	9	,	99	,	3	,	3	,	3	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	10	,	99	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	11	,	99	,	3	,	3	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	1	,	99	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	2	,	99	,	1	,	1	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	3	,	100	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	4	,	100	,	1	,	1	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	5	,	100	,	2	,	2	,	2	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	6	,	100	,	2	,	2	,	1	)
INSERT INTO ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre,id_estado_acad)  VALUES	(	7	,	100	,	2	,	2	,	1	)


-- EXAMENES -- INSERT SOFI
INSERT INTO EXAMENES VALUES(	1100	,'	1er PARCIAL	','3/7/2022')
INSERT INTO EXAMENES VALUES(	1101	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1102	,'	1er PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	1103	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1104	,'	1er PARCIAL	','2/11/2021')
INSERT INTO EXAMENES VALUES(	1105	,'	1er PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	1106	,'	1er PARCIAL	','3/3/2022')
INSERT INTO EXAMENES VALUES(	1107	,'	1er PARCIAL	','3/2/2022')
INSERT INTO EXAMENES VALUES(	1108	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1109	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1110	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1111	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1112	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1113	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1114	,'	1er PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	1115	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1116	,'	1er PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	1117	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1118	,'	1er PARCIAL	','4/4/2021')
INSERT INTO EXAMENES VALUES(	1119	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1120	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1121	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1122	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1123	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1124	,'	1er PARCIAL	','2/8/2021')
INSERT INTO EXAMENES VALUES(	1125	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1126	,'	1er PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	1127	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1128	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1129	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1130	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1131	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1132	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1133	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1134	,'	1er PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	1135	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1136	,'	1er PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	1137	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1138	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1139	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1140	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1141	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1142	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1143	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1144	,'	1er PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	1145	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1146	,'	1er PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	1147	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1148	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1149	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1150	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1151	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1152	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1153	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1154	,'	1er PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	1155	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1156	,'	1er PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	1157	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1158	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1159	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1160	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1161	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1162	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1163	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1164	,'	1er PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	1165	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1166	,'	1er PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	1167	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1168	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1169	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1170	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1171	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1172	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1173	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1174	,'	1er PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	1175	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1176	,'	1er PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	1177	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1178	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1179	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1180	,'	1er PARCIAL	','3/7/2022')
INSERT INTO EXAMENES VALUES(	1181	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1182	,'	1er PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	1183	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1184	,'	1er PARCIAL	','2/11/2021')
INSERT INTO EXAMENES VALUES(	1185	,'	1er PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	1186	,'	1er PARCIAL	','2/3/2022')
INSERT INTO EXAMENES VALUES(	1187	,'	1er PARCIAL	','3/2/2022')
INSERT INTO EXAMENES VALUES(	1188	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1189	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1190	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1191	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1192	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1193	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1194	,'	1er PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	1195	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1196	,'	1er PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	1197	,'	1er PARCIAL	','3/7/2022')
INSERT INTO EXAMENES VALUES(	1198	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1199	,'	1er PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	1200	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1201	,'	1er PARCIAL	','2/11/2021')
INSERT INTO EXAMENES VALUES(	1202	,'	1er PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	1203	,'	1er PARCIAL	','2/3/2022')
INSERT INTO EXAMENES VALUES(	1204	,'	1er PARCIAL	','3/2/2022')
INSERT INTO EXAMENES VALUES(	1205	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1206	,'	1er PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1207	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1208	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1209	,'	1er PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1210	,'	1er PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1211	,'	2do PARCIAL	','3/7/2022')
INSERT INTO EXAMENES VALUES(	1212	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1213	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	1214	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1215	,'	2do PARCIAL	','2/11/2021')
INSERT INTO EXAMENES VALUES(	1216	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	1217	,'	2do PARCIAL	','2/3/2022')
INSERT INTO EXAMENES VALUES(	1218	,'	2do PARCIAL	','3/2/2022')
INSERT INTO EXAMENES VALUES(	1219	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1220	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1221	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1222	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1223	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1224	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1225	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	1226	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1227	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	1228	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1229	,'	2do PARCIAL	','4/4/2021')
INSERT INTO EXAMENES VALUES(	1230	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1231	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1232	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1233	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1234	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1235	,'	2do PARCIAL	','2/8/2021')
INSERT INTO EXAMENES VALUES(	1236	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1237	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	1238	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1239	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1240	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1241	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1242	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1243	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1244	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1245	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	1246	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1247	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	1248	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1249	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1250	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1251	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1252	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1253	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1254	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1255	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	1256	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1257	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	1258	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1259	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1260	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1261	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1262	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1263	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1264	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1265	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	1266	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1267	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	1268	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1269	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1270	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1271	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1272	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1273	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1274	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1275	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	1276	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1277	,'	2do PARCIAL	','4/4/2021')
INSERT INTO EXAMENES VALUES(	1278	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1279	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1280	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1281	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1282	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1283	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1284	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1285	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	1286	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1287	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	1288	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1289	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1290	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1291	,'	2do PARCIAL	','3/7/2022')
INSERT INTO EXAMENES VALUES(	1292	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1293	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	1294	,'	2do PARCIAL	','3/7/2022')
INSERT INTO EXAMENES VALUES(	1295	,'	2do PARCIAL	','2/11/2021')
INSERT INTO EXAMENES VALUES(	1296	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	1297	,'	2do PARCIAL	','2/3/2022')
INSERT INTO EXAMENES VALUES(	1298	,'	2do PARCIAL	','3/2/2022')
INSERT INTO EXAMENES VALUES(	1299	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1300	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1301	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1302	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1303	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1304	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1305	,'	2do PARCIAL	','2/5/2021')
INSERT INTO EXAMENES VALUES(	1306	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1307	,'	2do PARCIAL	','2/4/2021')
INSERT INTO EXAMENES VALUES(	1308	,'	2do PARCIAL	','3/7/2022')
INSERT INTO EXAMENES VALUES(	1309	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1310	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	1311	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1312	,'	2do PARCIAL	','2/11/2021')
INSERT INTO EXAMENES VALUES(	1313	,'	2do PARCIAL	','3/11/2021')
INSERT INTO EXAMENES VALUES(	1314	,'	2do PARCIAL	','2/3/2022')
INSERT INTO EXAMENES VALUES(	1315	,'	2do PARCIAL	','3/2/2022')
INSERT INTO EXAMENES VALUES(	1316	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1317	,'	2do PARCIAL	','3/4/2021')
INSERT INTO EXAMENES VALUES(	1318	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1319	,'	2do PARCIAL	','2/7/2022')
INSERT INTO EXAMENES VALUES(	1320	,'	2do PARCIAL	','3/7/2021')
INSERT INTO EXAMENES VALUES(	1321	,'	2do PARCIAL	','2/7/2022')

-- EXAMEN_MATERIAS -- INSERT SOFI
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1100	,	1	,	76	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1101	,	2	,	76	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1102	,	3	,	76	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1103	,	4	,	76	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1104	,	5	,	76	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1105	,	6	,	76	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1106	,	7	,	77	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1107	,	8	,	77	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1108	,	9	,	77	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1109	,	10	,	77	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1110	,	12	,	78	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1111	,	13	,	78	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1112	,	14	,	78	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1113	,	15	,	78	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1114	,	16	,	78	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1115	,	17	,	79	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1116	,	18	,	79	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1117	,	19	,	79	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1118	,	20	,	79	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1119	,	100	,	79	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1120	,	21	,	80	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1121	,	22	,	80	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1122	,	23	,	80	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1123	,	24	,	80	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1124	,	25	,	81	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1125	,	26	,	81	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1126	,	27	,	81	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1127	,	28	,	81	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1128	,	29	,	82	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1129	,	30	,	82	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1130	,	21	,	82	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1131	,	22	,	82	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1132	,	23	,	82	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1133	,	31	,	83	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1134	,	32	,	83	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1135	,	33	,	83	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1136	,	34	,	83	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1137	,	35	,	84	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1138	,	36	,	84	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1139	,	37	,	84	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1140	,	38	,	84	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1141	,	39	,	84	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1142	,	40	,	85	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1143	,	41	,	85	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1144	,	42	,	85	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1145	,	43	,	85	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1146	,	44	,	86	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1147	,	45	,	86	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1148	,	46	,	86	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1149	,	47	,	86	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1150	,	48	,	87	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1151	,	49	,	87	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1152	,	50	,	87	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1153	,	51	,	87	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1154	,	54	,	88	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1155	,	55	,	88	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1156	,	56	,	88	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1157	,	57	,	88	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1158	,	58	,	89	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1159	,	59	,	89	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1160	,	60	,	89	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1161	,	61	,	89	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1162	,	62	,	89	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1163	,	63	,	90	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1164	,	64	,	90	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1165	,	65	,	90	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1166	,	66	,	90	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1167	,	67	,	91	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1168	,	68	,	91	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1169	,	69	,	91	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1170	,	70	,	91	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1171	,	71	,	92	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1172	,	72	,	92	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1173	,	73	,	92	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1174	,	74	,	92	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1175	,	77	,	93	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1176	,	78	,	93	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1177	,	79	,	93	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1178	,	80	,	93	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1179	,	81	,	93	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1180	,	82	,	94	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1181	,	83	,	94	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1182	,	84	,	94	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1183	,	85	,	94	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1184	,	86	,	95	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1185	,	87	,	95	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1186	,	88	,	95	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1187	,	89	,	95	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1188	,	90	,	96	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1189	,	91	,	96	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1190	,	92	,	96	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1191	,	79	,	96	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1192	,	80	,	96	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1193	,	1	,	97	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1194	,	2	,	97	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1195	,	3	,	97	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1196	,	4	,	97	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1197	,	5	,	98	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1198	,	6	,	98	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1199	,	7	,	98	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1200	,	8	,	98	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1201	,	9	,	99	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1202	,	10	,	99	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1203	,	11	,	99	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1204	,	1	,	99	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1205	,	2	,	99	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1206	,	3	,	100	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1207	,	4	,	100	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1208	,	5	,	100	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1209	,	6	,	100	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1210	,	7	,	100	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1211	,	1	,	76	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1212	,	2	,	76	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1213	,	3	,	76	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1214	,	4	,	76	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1215	,	5	,	76	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1216	,	6	,	76	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1217	,	7	,	77	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1218	,	8	,	77	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1219	,	9	,	77	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1220	,	10	,	77	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1221	,	12	,	78	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1222	,	13	,	78	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1223	,	14	,	78	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1224	,	15	,	78	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1225	,	16	,	78	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1226	,	17	,	79	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1227	,	18	,	79	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1228	,	19	,	79	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1229	,	20	,	79	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1230	,	100	,	79	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1231	,	21	,	80	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1232	,	22	,	80	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1233	,	23	,	80	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1234	,	24	,	80	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1235	,	25	,	81	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1236	,	26	,	81	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1237	,	27	,	81	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1238	,	28	,	81	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1239	,	29	,	82	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1240	,	30	,	82	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1241	,	21	,	82	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1242	,	22	,	82	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1243	,	23	,	82	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1244	,	31	,	83	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1245	,	32	,	83	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1246	,	33	,	83	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1247	,	34	,	83	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1248	,	35	,	84	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1249	,	36	,	84	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1250	,	37	,	84	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1251	,	38	,	84	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1252	,	39	,	84	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1253	,	40	,	85	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1254	,	41	,	85	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1255	,	42	,	85	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1256	,	43	,	85	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1257	,	44	,	86	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1258	,	45	,	86	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1259	,	46	,	86	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1260	,	47	,	86	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1261	,	48	,	87	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1262	,	49	,	87	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1263	,	50	,	87	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1264	,	51	,	87	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1265	,	54	,	88	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1266	,	55	,	88	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1267	,	56	,	88	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1268	,	57	,	88	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1269	,	58	,	89	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1270	,	59	,	89	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1271	,	60	,	89	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1272	,	61	,	89	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1273	,	62	,	89	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1274	,	63	,	90	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1275	,	64	,	90	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1276	,	65	,	90	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1277	,	66	,	90	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1278	,	67	,	91	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1279	,	68	,	91	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1280	,	69	,	91	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1281	,	70	,	91	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1282	,	71	,	92	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1283	,	72	,	92	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1284	,	73	,	92	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1285	,	74	,	92	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1286	,	77	,	93	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1287	,	78	,	93	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1288	,	79	,	93	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1289	,	80	,	93	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1290	,	81	,	93	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1291	,	82	,	94	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1292	,	83	,	94	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1293	,	84	,	94	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1294	,	85	,	94	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1295	,	86	,	95	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1296	,	87	,	95	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1297	,	88	,	95	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1298	,	89	,	95	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1299	,	90	,	96	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1300	,	91	,	96	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1301	,	92	,	96	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1302	,	79	,	96	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1303	,	80	,	96	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1304	,	1	,	97	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1305	,	2	,	97	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1306	,	3	,	97	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1307	,	4	,	97	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1308	,	5	,	98	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1309	,	6	,	98	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	1310	,	7	,	98	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1311	,	8	,	98	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1312	,	9	,	99	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1313	,	10	,	99	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1314	,	11	,	99	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1315	,	1	,	99	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	1316	,	2	,	99	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1317	,	3	,	100	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1318	,	4	,	100	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	1319	,	5	,	100	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1320	,	6	,	100	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	1321	,	7	,	100	)


-- INSERT GABI
-- ESTUDIANTES_MATERIAS -- INSERT GABI
INSERT INTO ESTUDIANTES_MATERIAS VALUES (51,1,3,1,1)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (51,2,3,1,1)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (51,3,3,1,2)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (51,4,3,2,2)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (52,	12	,	4	,	1	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (52	,	13	,	4	,	1	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (52	,	14	,	4	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (52	,	15	,	6	,	3	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (52	,	16	,	6	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (53	,	21	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (53	,	22	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (53	,	23	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (53	,	24	,	5	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (53	,	25	,	5	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (54	,	42	,	3	,	1	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (54	,	43	,	3	,	1	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (54	,	44	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (54	,	45	,	5	,	3	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (54	,	46	,	5	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (54	,	47	,	7	,	5	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (55	,	55	,	4	,	2	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (55	,	56	,	4	,	2	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (55	,	57	,	4	,	2	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (55	,	58	,	5	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (55	,	59	,	5	,	2	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (56	,	1	,	3	,	1	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (56	,	2	,	5	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	56	,	3	,	5	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	56	,	4	,	5	,	3	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	57	,	5	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	57	,	6	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	57	,	7	,	3	,	1	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	58	,	13	,	3	,	1	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	58	,	14	,	4	,	2	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	58	,	15	,	4	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	58	,	16	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	58	,	17	,	3	,	2	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	59	,	25	,	4	,	1	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	59	,	26	,	4	,	1	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	59	,	27	,	5	,	3	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	59	,	28	,	5	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	59	,	29	,	6	,	5	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	59	,	30	,	6	,	5	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	60	,	32	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	60	,	33	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	60	,	34	,	5	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	60	,	35	,	5	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	60	,	36	,	7	,	5	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	61	,	81	,	3	,	1	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	61	,	82	,	3	,	1	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	61	,	83	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	61	,	84	,	3	,	2	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	61	,	85	,	3	,	2	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	62	,	81	,	4	,	1	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	62	,	82	,	6	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	62	,	83	,	6	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	62	,	84	,	8	,	5	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	62	,	85	,	8	,	5	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	63	,	1	,	4	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	63	,	2	,	4	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	63	,	3	,	6	,	3	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	63	,	4	,	6	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	63	,	5	,	6	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	64	,	1	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	64	,	2	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	64	,	3	,	5	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	64	,	4	,	5	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	64	,	5	,	5	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	64	,	6	,	5	,	4	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	65	,	12	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	65	,	13	,	3	,	1	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	65	,	14	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	65	,	15	,	5	,	4	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	65	,	16	,	5	,	4	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	66	,	21	,	5	,	4	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	66	,	22	,	5	,	4	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	66	,	23	,	5	,	4	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	66	,	24	,	7	,	5	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	66	,	25	,	7	,	5	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	67	,	12	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	67	,	13	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	67	,	14	,	3	,	2	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	67	,	15	,	3	,	2	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	67	,	16	,	3	,	2	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	68	,	21	,	1	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	68	,	22	,	1	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	68	,	23	,	1	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	68	,	24	,	1	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	68	,	25	,	5	,	3	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	69	,	31	,	5	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	69	,	32	,	5	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	69	,	33	,	5	,	3	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	69	,	34	,	5	,	3	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	69	,	35	,	7	,	5	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	69	,	36	,	7	,	5	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	70	,	54	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	70	,	55	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	70	,	56	,	3	,	1	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	70	,	57	,	5	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	70	,	58	,	5	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	71	,	31	,	4	,	1	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	71	,	32	,	4	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	71	,	33	,	4	,	2	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	71	,	34	,	4	,	2	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	71	,	35	,	6	,	3	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	72	,	54	,	6	,	3	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	72	,	55	,	6	,	3	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	72	,	56	,	6	,	4	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	72	,	57	,	6	,	4	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	73	,	58	,	1	,	1	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	73	,	59	,	1	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	74	,	77	,	3	,	1	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	74	,	78	,	3	,	1	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	74	,	79	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	74	,	80	,	3	,	2	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	74	,	81	,	3	,	2	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	75	,	77	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	75	,	78	,	3	,	1	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	75	,	79	,	3	,	1	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	75	,	80	,	3	,	2	,	2	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	75	,	81	,	3	,	2	,	1	)	
INSERT INTO ESTUDIANTES_MATERIAS VALUES (	75	,	82	,	3	,	2	,	1	)	

-- EXAMENES -- INSERT GABI
INSERT INTO EXAMENES VALUES(	301	,'1er PARCIAL','3/4/2016')
INSERT INTO EXAMENES VALUES(	302	,'1er PARCIAL','15/5/2016')
INSERT INTO EXAMENES VALUES(	303	,'1er PARCIAL','20/5/2016')
INSERT INTO EXAMENES VALUES(	304	,'1er PARCIAL','30/9/2016')
INSERT INTO EXAMENES VALUES(	305	,'1er PARCIAL','15/7/2015')
INSERT INTO EXAMENES VALUES(	306	,'1er PARCIAL','25/7/2015')
INSERT INTO EXAMENES VALUES(	307	,'1er PARCIAL','20/7/2015')
INSERT INTO EXAMENES VALUES(	308	,'1er PARCIAL','15/10/2015')
INSERT INTO EXAMENES VALUES(	309	,'1er PARCIAL','15/10/2015')
INSERT INTO EXAMENES VALUES(	310	,'1er PARCIAL','19/3/2021')
INSERT INTO EXAMENES VALUES(	311	,'1er PARCIAL','13/4/2021')
INSERT INTO EXAMENES VALUES(	312	,'1er PARCIAL','25/4/2021')
INSERT INTO EXAMENES VALUES(	313	,'1er PARCIAL','12/4/2022')
INSERT INTO EXAMENES VALUES(	314	,'1er PARCIAL','12/7/2022')
INSERT INTO EXAMENES VALUES(	315	,'1er PARCIAL','15/7/2016')
INSERT INTO EXAMENES VALUES(	316	,'1er PARCIAL','5/7/2016')
INSERT INTO EXAMENES VALUES(	317	,'1er PARCIAL','16/7/2016')
INSERT INTO EXAMENES VALUES(	318	,'1er PARCIAL','10/10/2017')
INSERT INTO EXAMENES VALUES(	319	,'1er PARCIAL','15/10/2017')
INSERT INTO EXAMENES VALUES(	320	,'1er PARCIAL','16/4/2018')
INSERT INTO EXAMENES VALUES(	321	,'1er PARCIAL','12/3/2014')
INSERT INTO EXAMENES VALUES(	322	,'1er PARCIAL','16/3/2014')
INSERT INTO EXAMENES VALUES(	323	,'1er PARCIAL','14/4/2014')
INSERT INTO EXAMENES VALUES(	324	,'1er PARCIAL','16/9/2015')
INSERT INTO EXAMENES VALUES(	325	,'1er PARCIAL','15/4/2015')
INSERT INTO EXAMENES VALUES(	326	,'1er PARCIAL','20/3/2018')
INSERT INTO EXAMENES VALUES(	327	,'1er PARCIAL','10/9/2019')
INSERT INTO EXAMENES VALUES(	328	,'1er PARCIAL','14/9/2019')
INSERT INTO EXAMENES VALUES(	329	,'1er PARCIAL','21/9/2019')
INSERT INTO EXAMENES VALUES(	330	,'1er PARCIAL','20/5/2020')
INSERT INTO EXAMENES VALUES(	331	,'1er PARCIAL','27/5/2020')
INSERT INTO EXAMENES VALUES(	332	,'1er PARCIAL','29/5/2020')
INSERT INTO EXAMENES VALUES(	333	,'1er PARCIAL','24/4/2021')
INSERT INTO EXAMENES VALUES(	334	,'1er PARCIAL','26/5/2021')
INSERT INTO EXAMENES VALUES(	335	,'1er PARCIAL','23/5/2021')
INSERT INTO EXAMENES VALUES(	336	,'1er PARCIAL','24/4/2021')
INSERT INTO EXAMENES VALUES(	337	,'1er PARCIAL','24/10/2021')
INSERT INTO EXAMENES VALUES(	338	,'1er PARCIAL','17/5/2016')
INSERT INTO EXAMENES VALUES(	339	,'1er PARCIAL','13/5/2016')
INSERT INTO EXAMENES VALUES(	340	,'1er PARCIAL','17/4/2017')
INSERT INTO EXAMENES VALUES(	341	,'1er PARCIAL','13/6/2017')
INSERT INTO EXAMENES VALUES(	342	,'1er PARCIAL','10/10/2018')
INSERT INTO EXAMENES VALUES(	343	,'1er PARCIAL','18/10/2018')
INSERT INTO EXAMENES VALUES(	344	,'1er PARCIAL','26/6/2014')
INSERT INTO EXAMENES VALUES(	345	,'1er PARCIAL','20/6/2014')
INSERT INTO EXAMENES VALUES(	346	,'1er PARCIAL','26/5/2015')
INSERT INTO EXAMENES VALUES(	347	,'1er PARCIAL','26/6/2015')
INSERT INTO EXAMENES VALUES(	348	,'1er PARCIAL','21/3/2016')
INSERT INTO EXAMENES VALUES(	349	,'1er PARCIAL','15/4/2018')
INSERT INTO EXAMENES VALUES(	350	,'1er PARCIAL','19/4/2018')
INSERT INTO EXAMENES VALUES(	351	,'1er PARCIAL','27/4/2018')
INSERT INTO EXAMENES VALUES(	352	,'1er PARCIAL','27/4/2022')
INSERT INTO EXAMENES VALUES(	353	,'1er PARCIAL','27/10/2018')
INSERT INTO EXAMENES VALUES(	354	,'1er PARCIAL','20/6/2017')
INSERT INTO EXAMENES VALUES(	355	,'1er PARCIAL','21/3/2018')
INSERT INTO EXAMENES VALUES(	356	,'1er PARCIAL','27/4/2018')
INSERT INTO EXAMENES VALUES(	357	,'1er PARCIAL','20/5/2019')
INSERT INTO EXAMENES VALUES(	358	,'1er PARCIAL','23/5/2019')
INSERT INTO EXAMENES VALUES(	359	,'1er PARCIAL','30/4/2018')
INSERT INTO EXAMENES VALUES(	360	,'1er PARCIAL','25/4/2019')
INSERT INTO EXAMENES VALUES(	361	,'1er PARCIAL','26/4/2019')
INSERT INTO EXAMENES VALUES(	362	,'1er PARCIAL','27/4/2019')
INSERT INTO EXAMENES VALUES(	363	,'1er PARCIAL','26/4/2019')
INSERT INTO EXAMENES VALUES(	364	,'1er PARCIAL','30/5/2021')
INSERT INTO EXAMENES VALUES(	365	,'1er PARCIAL','26/4/2021')
INSERT INTO EXAMENES VALUES(	366	,'1er PARCIAL','26/7/2022')
INSERT INTO EXAMENES VALUES(	367	,'1er PARCIAL','26/7/2022')
INSERT INTO EXAMENES VALUES(	368	,'1er PARCIAL','28/8/2022')
INSERT INTO EXAMENES VALUES(	369	,'1er PARCIAL','12/9/2022')
INSERT INTO EXAMENES VALUES(	370	,'1er PARCIAL','14/4/2021')
INSERT INTO EXAMENES VALUES(	371	,'1er PARCIAL','15/6/2021')
INSERT INTO EXAMENES VALUES(	372	,'1er PARCIAL','9/5/2021')
INSERT INTO EXAMENES VALUES(	373	,'1er PARCIAL','11/9/2022')
INSERT INTO EXAMENES VALUES(	374	,'1er PARCIAL','10/9/2022')
INSERT INTO EXAMENES VALUES(	375	,'1er PARCIAL','10/11/2019')
INSERT INTO EXAMENES VALUES(	376	,'1er PARCIAL','12/11/2019')
INSERT INTO EXAMENES VALUES(	377	,'1er PARCIAL','11/9/2019')
INSERT INTO EXAMENES VALUES(	378	,'1er PARCIAL','21/3/2020')
INSERT INTO EXAMENES VALUES(	379	,'1er PARCIAL','2/4/2020')
INSERT INTO EXAMENES VALUES(	380	,'1er PARCIAL','15/4/2022')
INSERT INTO EXAMENES VALUES(	381	,'1er PARCIAL','15/5/2022')
INSERT INTO EXAMENES VALUES(	382	,'1er PARCIAL','10/9/2022')
INSERT INTO EXAMENES VALUES(	383	,'1er PARCIAL','11/9/2022')
INSERT INTO EXAMENES VALUES(	384	,'1er PARCIAL','22/9/2022')
INSERT INTO EXAMENES VALUES(	385	,'1er PARCIAL','26/6/2016')
INSERT INTO EXAMENES VALUES(	386	,'1er PARCIAL','23/6/2016')
INSERT INTO EXAMENES VALUES(	387	,'1er PARCIAL','27/7/2016')
INSERT INTO EXAMENES VALUES(	388	,'1er PARCIAL','30/5/2016')
INSERT INTO EXAMENES VALUES(	389	,'1er PARCIAL','22/3/2017')
INSERT INTO EXAMENES VALUES(	390	,'1er PARCIAL','25/6/2017')
INSERT INTO EXAMENES VALUES(	391	,'1er PARCIAL','12/5/2017')
INSERT INTO EXAMENES VALUES(	392	,'1er PARCIAL','26/6/2017')
INSERT INTO EXAMENES VALUES(	393	,'1er PARCIAL','21/7/2017')
INSERT INTO EXAMENES VALUES(	394	,'1er PARCIAL','26/4/2018')
INSERT INTO EXAMENES VALUES(	395	,'1er PARCIAL','27/5/2018')
INSERT INTO EXAMENES VALUES(	396	,'1er PARCIAL','16/4/2018')
INSERT INTO EXAMENES VALUES(	397	,'1er PARCIAL','16/5/2018')
INSERT INTO EXAMENES VALUES(	398	,'1er PARCIAL','16/4/2018')
INSERT INTO EXAMENES VALUES(	399	,'1er PARCIAL','22/3/2019')
INSERT INTO EXAMENES VALUES(	400	,'1er PARCIAL','1/4/2019')
INSERT INTO EXAMENES VALUES(	401	,'1er PARCIAL','16/6/2018')
INSERT INTO EXAMENES VALUES(	402	,'1er PARCIAL','15/5/2018')
INSERT INTO EXAMENES VALUES(	403	,'1er PARCIAL','10/9/2018')
INSERT INTO EXAMENES VALUES(	404	,'1er PARCIAL','11/11/2018')
INSERT INTO EXAMENES VALUES(	405	,'1er PARCIAL','22/3/2019')
INSERT INTO EXAMENES VALUES(	406	,'1er PARCIAL','27/3/2019')
INSERT INTO EXAMENES VALUES(	407	,'1er PARCIAL','13/5/2019')
INSERT INTO EXAMENES VALUES(	408	,'1er PARCIAL','11/9/2019')
INSERT INTO EXAMENES VALUES(	409	,'1er PARCIAL','16/9/2019')
INSERT INTO EXAMENES VALUES(	410	,'1er PARCIAL','3/5/2019')
INSERT INTO EXAMENES VALUES(	411	,'1er PARCIAL','6/5/2019')
INSERT INTO EXAMENES VALUES(	412	,'1er PARCIAL','21/5/2021')
INSERT INTO EXAMENES VALUES(	413	,'1er PARCIAL','26/6/2021')
INSERT INTO EXAMENES VALUES(	414	,'1er PARCIAL','27/7/2021')
INSERT INTO EXAMENES VALUES(	415	,'1er PARCIAL','10/10/2021')
INSERT INTO EXAMENES VALUES(	416	,'1er PARCIAL','11/9/2021')
INSERT INTO EXAMENES VALUES(	417	,'1er PARCIAL','11/5/2015')
INSERT INTO EXAMENES VALUES(	418	,'1er PARCIAL','21/5/2015')
INSERT INTO EXAMENES VALUES(	419	,'1er PARCIAL','11/6/2015')
INSERT INTO EXAMENES VALUES(	420	,'1er PARCIAL','5/9/2015')
INSERT INTO EXAMENES VALUES(	421	,'1er PARCIAL','11/9/2015')
INSERT INTO EXAMENES VALUES(	422	,'1er PARCIAL','11/10/2015')

INSERT INTO EXAMENES VALUES(	423	,'2do PARCIAL','3/5/2016')
INSERT INTO EXAMENES VALUES(	424	,'2do PARCIAL','15/6/2016')
INSERT INTO EXAMENES VALUES(	425	,'2do PARCIAL','20/6/2016')
INSERT INTO EXAMENES VALUES(	426	,'2do PARCIAL','30/10/2016')
INSERT INTO EXAMENES VALUES(	427	,'2do PARCIAL','15/8/2015')
INSERT INTO EXAMENES VALUES(	428	,'2do PARCIAL','25/8/2015')
INSERT INTO EXAMENES VALUES(	429	,'2do PARCIAL','20/8/2015')
INSERT INTO EXAMENES VALUES(	430	,'2do PARCIAL','15/11/2015')
INSERT INTO EXAMENES VALUES(	431	,'2do PARCIAL','15/11/2015')
INSERT INTO EXAMENES VALUES(	432	,'2do PARCIAL','19/4/2021')
INSERT INTO EXAMENES VALUES(	433	,'2do PARCIAL','13/5/2021')
INSERT INTO EXAMENES VALUES(	434	,'2do PARCIAL','25/6/2021')
INSERT INTO EXAMENES VALUES(	435	,'2do PARCIAL','12/5/2022')
INSERT INTO EXAMENES VALUES(	436	,'2do PARCIAL','12/6/2022')
INSERT INTO EXAMENES VALUES(	437	,'2do PARCIAL','15/8/2016')
INSERT INTO EXAMENES VALUES(	438	,'2do PARCIAL','5/8/2016')
INSERT INTO EXAMENES VALUES(	439	,'2do PARCIAL','16/8/2016')
INSERT INTO EXAMENES VALUES(	440	,'2do PARCIAL','10/11/2017')
INSERT INTO EXAMENES VALUES(	441	,'2do PARCIAL','15/11/2017')
INSERT INTO EXAMENES VALUES(	442	,'2do PARCIAL','16/5/2018')
INSERT INTO EXAMENES VALUES(	443	,'2do PARCIAL','12/4/2014')
INSERT INTO EXAMENES VALUES(	444	,'2do PARCIAL','16/4/2014')
INSERT INTO EXAMENES VALUES(	445	,'2do PARCIAL','14/5/2014')
INSERT INTO EXAMENES VALUES(	446	,'2do PARCIAL','16/10/2015')
INSERT INTO EXAMENES VALUES(	447	,'2do PARCIAL','15/5/2015')
INSERT INTO EXAMENES VALUES(	448	,'2do PARCIAL','20/4/2018')
INSERT INTO EXAMENES VALUES(	449	,'2do PARCIAL','10/10/2019')
INSERT INTO EXAMENES VALUES(	450	,'2do PARCIAL','14/10/2019')
INSERT INTO EXAMENES VALUES(	451	,'2do PARCIAL','21/10/2019')
INSERT INTO EXAMENES VALUES(	452	,'2do PARCIAL','20/6/2020')
INSERT INTO EXAMENES VALUES(	453	,'2do PARCIAL','27/6/2020')
INSERT INTO EXAMENES VALUES(	454	,'2do PARCIAL','29/6/2020')
INSERT INTO EXAMENES VALUES(	455	,'2do PARCIAL','24/5/2021')
INSERT INTO EXAMENES VALUES(	456	,'2do PARCIAL','26/6/2021')
INSERT INTO EXAMENES VALUES(	457	,'2do PARCIAL','23/6/2021')
INSERT INTO EXAMENES VALUES(	458	,'2do PARCIAL','24/5/2021')
INSERT INTO EXAMENES VALUES(	459	,'2do PARCIAL','24/11/2021')
INSERT INTO EXAMENES VALUES(	460	,'2do PARCIAL','17/6/2016')
INSERT INTO EXAMENES VALUES(	461	,'2do PARCIAL','13/6/2016')
INSERT INTO EXAMENES VALUES(	462	,'2do PARCIAL','17/5/2017')
INSERT INTO EXAMENES VALUES(	463	,'2do PARCIAL','13/7/2017')
INSERT INTO EXAMENES VALUES(	464	,'2do PARCIAL','10/11/2018')
INSERT INTO EXAMENES VALUES(	465	,'2do PARCIAL','18/11/2018')
INSERT INTO EXAMENES VALUES(	466	,'2do PARCIAL','26/7/2014')
INSERT INTO EXAMENES VALUES(	467	,'2do PARCIAL','20/7/2014')
INSERT INTO EXAMENES VALUES(	468	,'2do PARCIAL','26/6/2015')
INSERT INTO EXAMENES VALUES(	469	,'2do PARCIAL','26/7/2015')
INSERT INTO EXAMENES VALUES(	470	,'2do PARCIAL','21/4/2016')
INSERT INTO EXAMENES VALUES(	471	,'2do PARCIAL','15/5/2018')
INSERT INTO EXAMENES VALUES(	472	,'2do PARCIAL','19/5/2018')
INSERT INTO EXAMENES VALUES(	473	,'2do PARCIAL','27/5/2018')
INSERT INTO EXAMENES VALUES(	474	,'2do PARCIAL','27/10/2018')
INSERT INTO EXAMENES VALUES(	475	,'2do PARCIAL','27/11/2018')
INSERT INTO EXAMENES VALUES(	476	,'2do PARCIAL','20/7/2017')
INSERT INTO EXAMENES VALUES(	477	,'2do PARCIAL','21/4/2018')
INSERT INTO EXAMENES VALUES(	478	,'2do PARCIAL','27/5/2018')
INSERT INTO EXAMENES VALUES(	479	,'2do PARCIAL','20/6/2019')
INSERT INTO EXAMENES VALUES(	480	,'2do PARCIAL','23/6/2019')
INSERT INTO EXAMENES VALUES(	481	,'2do PARCIAL','30/5/2018')
INSERT INTO EXAMENES VALUES(	482	,'2do PARCIAL','25/5/2019')
INSERT INTO EXAMENES VALUES(	483	,'2do PARCIAL','26/5/2019')
INSERT INTO EXAMENES VALUES(	484	,'2do PARCIAL','27/5/2019')
INSERT INTO EXAMENES VALUES(	485	,'2do PARCIAL','26/5/2019')
INSERT INTO EXAMENES VALUES(	486	,'2do PARCIAL','30/6/2021')
INSERT INTO EXAMENES VALUES(	487	,'2do PARCIAL','26/5/2021')
INSERT INTO EXAMENES VALUES(	488	,'2do PARCIAL','26/8/2022')
INSERT INTO EXAMENES VALUES(	489	,'2do PARCIAL','26/8/2022')
INSERT INTO EXAMENES VALUES(	490	,'2do PARCIAL','28/9/2022')
INSERT INTO EXAMENES VALUES(	491	,'2do PARCIAL','12/10/2022')
INSERT INTO EXAMENES VALUES(	492	,'2do PARCIAL','14/5/2021')
INSERT INTO EXAMENES VALUES(	493	,'2do PARCIAL','15/7/2021')
INSERT INTO EXAMENES VALUES(	494	,'2do PARCIAL','9/6/2021')
INSERT INTO EXAMENES VALUES(	495	,'2do PARCIAL','5/10/2022')
INSERT INTO EXAMENES VALUES(	496	,'2do PARCIAL','28/9/2022')
INSERT INTO EXAMENES VALUES(	497	,'2do PARCIAL','10/12/2019')
INSERT INTO EXAMENES VALUES(	498	,'2do PARCIAL','12/12/2019')
INSERT INTO EXAMENES VALUES(	499	,'2do PARCIAL','11/10/2019')
INSERT INTO EXAMENES VALUES(	500	,'2do PARCIAL','21/4/2020')
INSERT INTO EXAMENES VALUES(	2501	,'2do PARCIAL','2/5/2020')
INSERT INTO EXAMENES VALUES(	2502	,'2do PARCIAL','15/5/2022')
INSERT INTO EXAMENES VALUES(	2503	,'2do PARCIAL','15/6/2022')
INSERT INTO EXAMENES VALUES(	2504	,'2do PARCIAL','5/10/2022')
INSERT INTO EXAMENES VALUES(	2505	,'2do PARCIAL','4/10/2022')
INSERT INTO EXAMENES VALUES(	2506	,'2do PARCIAL','3/10/2022')
INSERT INTO EXAMENES VALUES(	2507	,'2do PARCIAL','26/7/2016')
INSERT INTO EXAMENES VALUES(	2508	,'2do PARCIAL','23/8/2016')
INSERT INTO EXAMENES VALUES(	2509	,'2do PARCIAL','27/8/2016')
INSERT INTO EXAMENES VALUES(	2510	,'2do PARCIAL','30/6/2016')
INSERT INTO EXAMENES VALUES(	2511	,'2do PARCIAL','22/4/2017')
INSERT INTO EXAMENES VALUES(	2512	,'2do PARCIAL','25/7/2017')
INSERT INTO EXAMENES VALUES(	2513	,'2do PARCIAL','12/6/2017')
INSERT INTO EXAMENES VALUES(	2514	,'2do PARCIAL','26/7/2017')
INSERT INTO EXAMENES VALUES(	2515	,'2do PARCIAL','21/8/2017')
INSERT INTO EXAMENES VALUES(	2516	,'2do PARCIAL','26/5/2018')
INSERT INTO EXAMENES VALUES(	2517	,'2do PARCIAL','27/6/2018')
INSERT INTO EXAMENES VALUES(	2518	,'2do PARCIAL','16/5/2018')
INSERT INTO EXAMENES VALUES(	2519	,'2do PARCIAL','16/6/2018')
INSERT INTO EXAMENES VALUES(	2520	,'2do PARCIAL','16/5/2018')
INSERT INTO EXAMENES VALUES(	2521	,'2do PARCIAL','22/4/2019')
INSERT INTO EXAMENES VALUES(	2522	,'2do PARCIAL','1/5/2019')
INSERT INTO EXAMENES VALUES(	2523	,'2do PARCIAL','16/7/2018')
INSERT INTO EXAMENES VALUES(	2524	,'2do PARCIAL','15/6/2018')
INSERT INTO EXAMENES VALUES(	2525	,'2do PARCIAL','10/10/2018')
INSERT INTO EXAMENES VALUES(	2526	,'2do PARCIAL','11/12/2018')
INSERT INTO EXAMENES VALUES(	2527	,'2do PARCIAL','22/4/2019')
INSERT INTO EXAMENES VALUES(	2528	,'2do PARCIAL','27/5/2019')
INSERT INTO EXAMENES VALUES(	2529	,'2do PARCIAL','13/6/2019')
INSERT INTO EXAMENES VALUES(	2530	,'2do PARCIAL','11/10/2019')
INSERT INTO EXAMENES VALUES(	2531	,'2do PARCIAL','16/10/2019')
INSERT INTO EXAMENES VALUES(	2532	,'2do PARCIAL','3/6/2019')
INSERT INTO EXAMENES VALUES(	2533	,'2do PARCIAL','6/6/2019')
INSERT INTO EXAMENES VALUES(	2534	,'2do PARCIAL','21/6/2021')
INSERT INTO EXAMENES VALUES(	2535	,'2do PARCIAL','26/7/2021')
INSERT INTO EXAMENES VALUES(	2536	,'2do PARCIAL','27/8/2021')
INSERT INTO EXAMENES VALUES(	2537	,'2do PARCIAL','10/11/2021')
INSERT INTO EXAMENES VALUES(	2538	,'2do PARCIAL','11/10/2021')
INSERT INTO EXAMENES VALUES(	2539	,'2do PARCIAL','11/6/2015')
INSERT INTO EXAMENES VALUES(	2540	,'2do PARCIAL','21/7/2015')
INSERT INTO EXAMENES VALUES(	2541	,'2do PARCIAL','11/7/2015')
INSERT INTO EXAMENES VALUES(	2542	,'2do PARCIAL','5/10/2015')
INSERT INTO EXAMENES VALUES(	2543	,'2do PARCIAL','11/10/2015')
INSERT INTO EXAMENES VALUES(	2544	,'2do PARCIAL','11/11/2015')


-- EXAMEN_MATERIAS -- INSERT GABI						
INSERT INTO EXAMEN_MATERIAS VALUES(10,	301	,	1	,	51	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	302	,	2	,	51	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	303	,	3	,	51	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	304	,	4	,	51	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	305	,	12	,	52	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	306	,	13	,	52	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	307	,	14	,	52	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	308	,	15	,	52	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	309	,	16	,	52	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	310	,	21	,	53	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	311	,	22	,	53	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	312	,	23	,	53	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	313	,	24	,	53	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	314	,	25	,	53	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	315	,	42	,	54	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	316	,	43	,	54	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	317	,	44	,	54	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	318	,	45	,	54	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	319	,	46	,	54	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	320	,	47	,	54	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	321	,	55	,	55	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	322	,	56	,	55	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	323	,	57	,	55	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	324	,	58	,	55	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	325	,	59	,	55	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	326	,	1	,	56	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	327	,	2	,	56	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	328	,	3	,	56	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	329	,	4	,	56	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	330	,	5	,	57	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	331	,	6	,	57	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	332	,	7	,	57	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	333	,	13	,	58	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	334	,	14	,	58	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	335	,	15	,	58	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	336	,	16	,	58	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	337	,	17	,	58	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	338	,	25	,	59	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	339	,	26	,	59	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	340	,	27	,	59	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	341	,	28	,	59	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	342	,	29	,	59	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	343	,	30	,	59	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	344	,	32	,	60	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	345	,	33	,	60	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	346	,	34	,	60	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	347	,	35	,	60	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	348	,	36	,	60	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	349	,	81	,	61	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	350	,	82	,	61	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	351	,	83	,	61	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	352	,	84	,	61	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	353	,	85	,	61	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	354	,	81	,	62	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	355	,	82	,	62	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	356	,	83	,	62	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	357	,	84	,	62	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	358	,	85	,	62	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	359	,	1	,	63	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	360	,	2	,	63	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	361	,	3	,	63	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	362	,	4	,	63	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	363	,	5	,	63	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	364	,	1	,	64	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	365	,	2	,	64	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	366	,	3	,	64	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	367	,	4	,	64	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	368	,	5	,	64	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	369	,	6	,	64	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	370	,	12	,	65	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	371	,	13	,	65	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	372	,	14	,	65	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	373	,	15	,	65	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	374	,	16	,	65	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	375	,	21	,	66	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	376	,	22	,	66	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	377	,	23	,	66	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	378	,	24	,	66	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	379	,	25	,	66	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	380	,	12	,	67	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	381	,	13	,	67	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	382	,	14	,	67	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	383	,	15	,	67	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	384	,	16	,	67	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	385	,	21	,	68	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	386	,	22	,	68	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	387	,	23	,	68	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	388	,	24	,	68	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	389	,	25	,	68	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	390	,	31	,	69	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	391	,	32	,	69	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	392	,	33	,	69	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	393	,	34	,	69	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	394	,	35	,	69	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	395	,	36	,	69	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	396	,	54	,	70	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	397	,	55	,	70	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	398	,	56	,	70	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	399	,	57	,	70	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	400	,	58	,	70	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	401	,	31	,	71	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	402	,	32	,	71	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	403	,	33	,	71	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	404	,	34	,	71	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	405	,	35	,	71	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	406	,	54	,	72	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	407	,	55	,	72	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	408	,	56	,	72	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	409	,	57	,	72	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	410	,	58	,	73	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	411	,	59	,	73	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	412	,	77	,	74	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	413	,	78	,	74	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	414	,	79	,	74	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	415	,	80	,	74	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	416	,	81	,	74	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	417	,	77	,	75	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	418	,	78	,	75	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	419	,	79	,	75	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	420	,	80	,	75	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	421	,	81	,	75	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	422	,	82	,	75	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	423	,	1	,	51	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	424	,	2	,	51	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	425	,	3	,	51	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	426	,	4	,	51	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	427	,	12	,	52	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	428	,	13	,	52	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	429	,	14	,	52	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	430	,	15	,	52	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	431	,	16	,	52	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	432	,	21	,	53	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	433	,	22	,	53	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	434	,	23	,	53	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	435	,	24	,	53	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	436	,	25	,	53	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	437	,	42	,	54	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	438	,	43	,	54	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	439	,	44	,	54	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	440	,	45	,	54	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	441	,	46	,	54	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	442	,	47	,	54	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	443	,	55	,	55	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	444	,	56	,	55	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	445	,	57	,	55	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	446	,	58	,	55	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	447	,	59	,	55	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	448	,	1	,	56	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	449	,	2	,	56	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	450	,	3	,	56	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	451	,	4	,	56	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	452	,	5	,	57	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	453	,	6	,	57	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	454	,	7	,	57	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	455	,	13	,	58	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	456	,	14	,	58	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	457	,	15	,	58	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	458	,	16	,	58	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	459	,	17	,	58	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	460	,	25	,	59	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	461	,	26	,	59	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	462	,	27	,	59	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	463	,	28	,	59	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	464	,	29	,	59	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	465	,	30	,	59	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	466	,	32	,	60	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	467	,	33	,	60	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	468	,	34	,	60	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	469	,	35	,	60	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	470	,	36	,	60	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	471	,	81	,	61	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	472	,	82	,	61	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	473	,	83	,	61	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	474	,	84	,	61	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	475	,	85	,	61	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	476	,	81	,	62	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	477	,	82	,	62	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	478	,	83	,	62	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	479	,	84	,	62	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	480	,	85	,	62	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	481	,	1	,	63	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	482	,	2	,	63	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	483	,	3	,	63	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	484	,	4	,	63	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	485	,	5	,	63	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	486	,	1	,	64	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	487	,	2	,	64	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	488	,	3	,	64	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	489	,	4	,	64	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	490	,	5	,	64	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	491	,	6	,	64	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	492	,	12	,	65	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	493	,	13	,	65	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	494	,	14	,	65	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	495	,	15	,	65	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	496	,	16	,	65	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	497	,	21	,	66	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	498	,	22	,	66	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	499	,	23	,	66	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	500	,	24	,	66	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	2501	,	25	,	66	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2502	,	12	,	67	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2503	,	13	,	67	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2504	,	14	,	67	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2505	,	15	,	67	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	2506	,	16	,	67	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2507	,	21	,	68	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2508	,	22	,	68	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2509	,	23	,	68	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2510	,	24	,	68	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2511	,	25	,	68	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2512	,	31	,	69	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2513	,	32	,	69	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2514	,	33	,	69	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2515	,	34	,	69	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2516	,	35	,	69	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2517	,	36	,	69	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2518	,	54	,	70	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2519	,	55	,	70	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2520	,	56	,	70	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2521	,	57	,	70	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	2522	,	58	,	70	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2523	,	31	,	71	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2524	,	32	,	71	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2525	,	33	,	71	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2526	,	34	,	71	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2527	,	35	,	71	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2528	,	54	,	72	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2529	,	55	,	72	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2530	,	56	,	72	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2531	,	57	,	72	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	2532	,	58	,	73	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2533	,	59	,	73	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2534	,	77	,	74	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	2535	,	78	,	74	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2536	,	79	,	74	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2537	,	80	,	74	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2538	,	81	,	74	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2539	,	77	,	75	)
INSERT INTO EXAMEN_MATERIAS VALUES(10,	2540	,	78	,	75	)
INSERT INTO EXAMEN_MATERIAS VALUES(7,	2541	,	79	,	75	)
INSERT INTO EXAMEN_MATERIAS VALUES(6,	2542	,	80	,	75	)
INSERT INTO EXAMEN_MATERIAS VALUES(9,	2543	,	81	,	75	)
INSERT INTO EXAMEN_MATERIAS VALUES(8,	2544	,	82	,	75	)
	
--Para saber cuales son los estudiantes extranjeros que estuvieron más activos en 2021,
--la UTN necesita generar un reporte con los estudiantes que rindieron más de 10 veces el año pasado.
--En el reporte incluir su promedio de calificaciones, estado academico y estado laboral

select e.legajo_est 'Legajo', nom_est+SPACE(1)+ape_est 'Estudiante', e.nro_documento 'DNI',
n.nacion 'Nacionalidad', count(distinct emt.legajo_est)'Cantidad de materias rendidas', AVG(calificacion) 'Promedio',
el.estado_lab 'Estado Laboral'
from ESTUDIANTES e join ESTUDIANTES_MATERIAS em on e.legajo_est = em.legajo_est
join NACIONALIDADES n on e.id_nacionalidad = n.id_nacionalidad
join MATERIAS m on em.id_materia = m.id_materia
join TECNICATURAS_MATERIAS tm on m.id_materia = tm.id_materia
join EXAMEN_MATERIAS emt on m.id_materia = emt.id_materia
join EXAMENES ex on emt.id_examen = ex.id_examen
join ESTADOS_LABORALES el on e.id_estado_lab = el.id_estado_lab
where e.id_nacionalidad NOT IN (1)
and e.legajo_est in (select legajo_est
					 from EXAMEN_MATERIAS em2 join EXAMENES ex2 on em2.id_examen = ex2.id_examen
					 where YEAR(fecha_examen) = YEAR(GETDATE())-1
					 group by legajo_est
					 having count(em2.id_materia)>10)
group by e.legajo_est, nom_est+SPACE(1)+ape_est, e.nro_documento,n.nacion, el.estado_lab
order by 2



--Para un torneo de Industria se quiere sacar un listado de los estudiantes promocionados
--de la Tecnicatura Universitaria en Industrias Alimentarias con un promedio mayor o igual a 9,
--pero que ademas todas sus notas sean superior a 7.
--Por último, que hayan rendido examen en los ultimos dos años y que no tengan
--trabajo actualmente (para tener disponibilidad de viajar)

select e.legajo_est 'Legajo', nom_est+SPACE(1)+ape_est 'Estudiante', t.tecnicatura 'Tecnicatura',
avg(calificacion) 'Promedio'
from ESTUDIANTES e join ESTUDIANTES_MATERIAS em on e.legajo_est = em.legajo_est
join MATERIAS m on em.id_materia = m.id_materia
join TECNICATURAS_MATERIAS tm on m.id_materia = tm.id_materia
join TECNICATURAS t on tm.id_tecnicatura = t.id_tecnicatura
join EXAMEN_MATERIAS emt on m.id_materia = emt.id_materia
join EXAMENES ex on emt.id_examen = ex.id_examen
join ESTADOS_LABORALES el on e.id_estado_lab = el.id_estado_lab
where e.id_estado_lab in (5,6)
and YEAR(ex.fecha_examen) between 2021 and 2022
and t.id_tecnicatura = 4
and 7 < ALL (select calificacion
			 from EXAMEN_MATERIAS emt2
			 where emt.id_examen_materia = emt2.id_examen_materia)
group by e.legajo_est, nom_est+SPACE(1)+ape_est, t.tecnicatura
having AVG(calificacion) >= 9	
order by 1,2




-- Una empresa busca programadores para una pasantia laboral: requieren alumnos con las sig.caracteristicas
-- Cursando a partir del  3er cuatrimestre
-- con un promedio general superior al  promedio del año pasado
-- que esten activos
-- que esten trabajando actualmente (si estan desempleados que esten en busca de trabajo).-
-- Necesita saber el legajo, nombre completo, e-mail, nro de telefono,fecha de nacimiento direccion completa y dni
 
 select e.legajo_est 'Legajo', 
		e.nom_est + space(1) + e.ape_est 'Nombre Completo Estudiantes',
		e.email 'E-mail', e.telefono 'Nro Telefono',
		e.calle + 'Nro ' + trim(str(e.nro_calle)) +' Barrio '+ b.barrio 'Direccion',
		e.nro_documento 'DNI',
		e.fecha_nac 'Fecha de Nacimiento',
		avg(calificacion)'Promedio'  ,
		estado_lab 'Estado Laboral',
		esta.estado_academico 'Estado Academico' 		
 from ESTUDIANTES e  join ESTUDIANTES_MATERIAS em on e.legajo_est=em.legajo_est
	 join MATERIAS m on m.id_materia=em.id_materia
	 join ESTADOS_ACADEMICOS est on est.id_estado_acad=em.id_estado_acad
	 join EXAMEN_MATERIAS exm on exm.id_materia=m.id_materia
	 join CURSOS c on c.id_curso=em.id_curso
	 join CUATRIMESTRES cuatri on cuatri.id_cuatrimestre=em.id_cuatrimestre
	 join ESTADOS_ACADEMICOS esta on esta.id_estado_acad=em.id_estado_acad
	 join ESTADOS_LABORALES lab on lab.id_estado_lab=e.id_estado_lab
	 join BARRIOS b on b.id_barrio=e.id_barrio
	 join TECNICATURAS_MATERIAS tec on tec.id_materia=m.id_materia
 where tec.id_tecnicatura = 1 
	and e.condicion = 1 
	and  em.id_estado_acad	 = 1
	and e.id_estado_lab in (1,2,3,5)
	and em.id_cuatrimestre not in (1,2,7) 
 group by e.legajo_est,e.nom_est + space(1) + e.ape_est ,e.email,
	e.telefono,e.calle + 'Nro ' +trim(str(e.nro_calle)) + ' Barrio '+ b.barrio,e.nro_documento,
	e.fecha_nac,estado_lab ,esta.estado_academico,fecha_ingreso
having avg(calificacion) > (select avg(calificacion)
							from EXAMEN_MATERIAS exm 
							where DATEDIFF(year,e.fecha_ingreso,getdate())=0
							and e.legajo_est=exm.legajo_est)
							order by 1,2


--La Utn solicita un listado de los alumnos extranjeros que ingresaron a la tecnicatura de programacion en los ultimos 3 años,
--mostrando legajo, nombre completo, nacionalidad, cantidad de materias cursadas para los alumnos que sean activos con un promedio
--de aprobacion mayor a 7 y que hayan cursado 2 o mas materias.-

select est.legajo_est 'Legajo', est.nom_est+','+est.ape_est 'Nombre Completo',
		na.nacion 'Nacionalidad', count(distinct ma.id_materia) 'Cantidad de Materias', tec.tecnicatura 'Tecnicatura',
		est.fecha_ingreso 'Fecha de ingreso'
	from ESTUDIANTES est
	join NACIONALIDADES na on na.id_nacionalidad=est.id_nacionalidad
	join ESTUDIANTES_MATERIAS em on em.legajo_est=est.legajo_est
	join MATERIAS ma on ma.id_materia=em.id_materia
	join EXAMEN_MATERIAS exam on exam.id_materia=ma.id_materia
	join TECNICATURAS_MATERIAS tm on tm.id_materia=ma.id_materia
	join TECNICATURAS tec on tec.id_tecnicatura=tm.id_tecnicatura
	where na.id_nacionalidad !=1
	and tec.tecnicatura like '%programacion'
	and est.legajo_est in (		select est.legajo_est
								from ESTUDIANTES est							
								where datediff(year,est.fecha_ingreso,GETDATE())<=3
								group by est.legajo_est
								)
	and est.condicion=1
	group by est.legajo_est,est.nom_est+','+est.ape_est ,
		na.nacion , tec.tecnicatura,est.fecha_ingreso
	having avg(exam.calificacion) > 7 and count (distinct ma.id_materia) >= 2
	order by 1

-- La UTN necesita tener registros de los docentes de la tecnicaturas en telecomunicaciones, Industria alimentaria y mecatronica
-- indicando la cantidad de cursos que tiene a cargo cada uno,los datos personales de cada docente (con email conocido) y sean de la generacion del 60,
-- siempre que la cantidad de cursos en donde trabaje sea superior a 2

select d.legajo_doc 'LEGAJOS',
	 t.tecnicatura 'Tecnicaturas',
	COUNT(c.id_curso) 'TOTAL CURSOS',
	d.ape_doc + space(2) + nom_doc 'Nombre completo', d.nro_documento 'DNI',
	d.email 'email',d.telefono 'Telefono',
	d.fecha_nac 'Fecha Nacimmiento'
from DOCENTES D 
	join DOCENTES_MATERIAS DM on d.legajo_doc=dm.legajo_doc	
	join MATERIAS m on dm.id_materia=m.id_materia
	join CURSOS C on C.id_curso=dm.id_curso	
	join TECNICATURAS_MATERIAS tm on tm.id_materia=m.id_materia
	join TECNICATURAS t on t.id_tecnicatura=tm.id_tecnicatura
where t.id_tecnicatura in (6,3,4)
	and D.email is not null 
	and year(d.fecha_nac) between 1960 and 1969
group by d.ape_doc + space(2) + nom_doc , d.nro_documento ,
	d.email ,d.telefono ,d.legajo_doc,t.tecnicatura , d.fecha_nac
having COUNT(C.id_curso)>2
	order by 1

-- El gobierno de la provincia de Cordoba necesita para fines 
-- estadisticos conocer: la cantidad total de Estudiantes de las tecnicaturas de la UTN,
-- que comenzaron a estudiar durante la PANDEMIA, Con una edad superior a 30 años,
-- que su situacion laboral sea asalariado o desempleado y que no sean propietarios de viviendas   
-- y que ademas nunca fueron aplazados.-
 
select COUNT(e.legajo_est)'Cantidad de estudiantes'        
from ESTUDIANTES e 
	join NACIONALIDADES n on e.id_nacionalidad=n.id_nacionalidad
	join ESTUDIANTES_MATERIAS em on em.legajo_est=e.legajo_est
	join MATERIAS m on m.id_materia=em.id_materia
	join TECNICATURAS_MATERIAS tecm on tecm.id_materia=m.id_materia
	join TECNICATURAS t on t.id_tecnicatura=tecm.id_tecnicatura
where e.id_nacionalidad = 1
  and fecha_ingreso between '11/3/2020' and '1/1/2022'
  and year(fecha_nac) < 1989
  and id_estado_lab in (1,5,6)
  and id_situacion_habit not like 2
  and exists (select emt.legajo_est
				from EXAMEN_MATERIAS emt 
				where emt.calificacion >= 6
				and emt.legajo_est = e.legajo_est)
				order by 1
				
-- SE DESEA CONSULTAR DATOS SOBRE LOS ESTUDIANTES QUE RINDIERON EXÁMENES DURANTE EL 2020 Y 2021 
-- CORRESPONDIENTES A LAS MATERIAS "Programacion I", "Programacion II" Y "Programacion III"  DE LA TECNICATURA "Tecnicatura Universitaria en Programacion",
-- QUE OBTUVIERON UN PROMEDIO SUPERIOR AL PROMEDIO GENERAL.
-- SE DESEA SABER LA NOTA MAYOR Y LA MENOR OBTENIDA POR DICHOS ESTUDIANTES

SELECT	E.ape_est+' '+ E.nom_est 'Estudiante',
		STR(AVG(EM1.calificacion),4,2) 'Calificacion Promedio',
		MAX(em1.calificacion) 'Nota mayor',
		MIN(em1.calificacion) 'Nota menor'
FROM ESTUDIANTES E
JOIN ESTUDIANTES_MATERIAS EM ON EM.legajo_est = E.legajo_est
JOIN MATERIAS M1 ON M1.id_materia = EM.id_materia
JOIN EXAMEN_MATERIAS EM1 ON EM1.id_materia = M1.id_materia
JOIN TECNICATURAS_MATERIAS TM ON TM.id_materia = M1.id_materia
JOIN TECNICATURAS T ON T.id_tecnicatura = TM.id_tecnicatura
JOIN EXAMENES EX ON EX.id_examen=EM1.id_examen
WHERE T.id_tecnicatura = 1
AND M1.id_materia in (1,7,8)
AND YEAR(ex.fecha_examen) between 2020 and 2021
GROUP BY E.ape_est+' '+ E.nom_est,e.legajo_est
HAVING AVG(EM1.calificacion)>( SELECT AVG(exm.calificacion)
								FROM EXAMEN_MATERIAS exm)
								ORDER BY 1

--Se desea obtener un listado de docentes que tengan a cargo más de 4 materias
--y que el promedio de examenes tomados por cada profesor en los ultimos 3 años sea superior al promedio de examenes de la facultad.
--Mostrar la calificación promedio de los exámenes tomados por cada profesor según la Tecnicatura 

SELECT	D.ape_doc+' '+D.nom_doc 'Docente',
		N.nacion 'Nacionalidad',
		EC.estado_civil 'Estado Civil',		
		AVG(EM.calificacion) 'Calificación Promedio'
FROM DOCENTES D
JOIN NACIONALIDADES N ON N.id_nacionalidad = D.id_nacionalidad
JOIN ESTADOS_CIVILES EC ON EC.id_estado_civil = D.id_estado_civil
JOIN DOCENTES_MATERIAS DM ON DM.legajo_doc = D.legajo_doc
JOIN MATERIAS M ON M.id_materia = DM.id_materia
JOIN EXAMEN_MATERIAS EM ON EM.id_materia = M.id_materia
JOIN EXAMEN_MATERIAS EM2 ON EM2.id_materia = M.id_materia
JOIN EXAMENES E ON E.id_examen = EM.id_examen
JOIN TECNICATURAS_MATERIAS TM ON TM.id_materia = M.id_materia
JOIN TECNICATURAS T ON T.id_tecnicatura = TM.id_tecnicatura
WHERE DATEDIFF(YEAR, E.fecha_examen, GETDATE()) < 4
GROUP BY D.ape_doc+' '+D.nom_doc,
		 N.nacion,
		 EC.estado_civil,
		 D.legajo_doc,
		 DM.legajo_doc
HAVING 4 < (SELECT COUNT(*) FROM DOCENTES_MATERIAS DM2 WHERE DM2.legajo_doc = DM.legajo_doc)
AND AVG(EM.calificacion) > (SELECT AVG(EM3.calificacion) FROM EXAMEN_MATERIAS EM3)															
ORDER BY D.legajo_doc

select * from estudiantes


--SP_INSERT_ALUMNOS
create procedure SP_INSERT_ALUMNOS
@ape_est varchar(50),
@nom_est varchar(50),
@id_tipo_documento int,
@nro_doc int,
@fecha_nac datetime,
@email varchar(50),
@telefono varchar(20),
@id_nacionalidad int,
@id_barrio int,
@calle varchar(80),
@nro_calle int,
@fecha_ingreso datetime,
@id_situacion_habit int,
@id_estado_civil int,
@id_estado_lab int,
@legajo int output
as
begin
insert into estudiantes (ape_est,nom_est,id_tipo_documento,nro_documento,fecha_nac,email,
						telefono,id_nacionalidad,id_barrio,calle,nro_calle,fecha_ingreso,
						id_situacion_habit,id_estado_civil,id_estado_lab)
VALUES(@nom_est,@ape_est,@id_tipo_documento,@nro_doc,@fecha_nac,@email,@telefono,@id_nacionalidad,@id_barrio,
@calle,@nro_calle,@fecha_ingreso,@id_situacion_habit,@id_estado_civil,@id_estado_lab)

set @legajo = SCOPE_IDENTITY();
end

declare @legaj int 
execute SP_INSERT_ALUMNOS 'Castro','Pedro',1,34563423,'5/05/1989','pepeGon@gmail.com',null, 3,3,null,null,'12/2/2022',1,1,1, @legaj output
select @legaj legajo


-- disparador insert estudiantes (no corrido)
create trigger dis_insert_estudiantes
on estudiantes
for update
as
begin
if update (legajo_est)
raiserror ('No se puede modificar el legajo',10,1)
rollback transaction
end


--COMBO BARRIOS
create procedure sp_listar_barrios
as
select b.id_barrio, upper(left (b.barrio,1))+lower(substring (b.barrio,2,len(b.barrio)))'barrio', l.id_localidad,upper(left (l.localidad,1))+lower(substring ( l.localidad,2,len( l.localidad)))'localidad', p.id_provincia,upper(left (p.provincia,1))+lower(substring (p.provincia,2,len(p.provincia))) 'provincia'
from BARRIOS b join LOCALIDADES l on b.id_localidad = l.id_localidad
join PROVINCIAS p on l.id_provincia = p.id_provincia

execute sp_listar_barrios

--COMBO NACIONALIDADES
create procedure sp_listar_nacionalidad
as
select *
from NACIONALIDADES

--COMBO ESTADOS_CIVILES
create procedure sp_listar_estado_civil
as
select *
from ESTADOS_CIVILES

--COMBO ESTADOS_LABORALES
create procedure sp_listar_estado_laboral
as
select *
from ESTADOS_LABORALES
exec sp_listar_estado_laboral

--COMBO SITUACION_HABIT
create procedure sp_listar_sit_hab
as
select *
from SITUACION_HABIT

--COMBO TIPOS_DOCUMENTOS
create procedure sp_listar_tipo_doc
as
select *
from TIPOS_DOCUMENTOS

--COMBO TECNICATURAS
CREATE procedure [dbo].[sp_tecnicatura]
as
begin
select id_tecnicatura,tecnicatura 
from TECNICATURAS
end

--COMBO MATERIAS
CREATE proc [dbo].[sp_carreras_materia]
@codigo int
as
begin
select ma.id_materia, ma.materia
from TECNICATURAS_MATERIAS tecma
inner join MATERIAS ma on ma.id_materia= tecma.id_materia
where id_tecnicatura=@codigo
end

--COMBO CUATRIMESTRE
CREATE procedure [dbo].[sp_cuatrimestre]
as
begin
select*
from CUATRIMESTRES
end

--COMBO CURSOS
CREATE procedure [dbo].[sp_curso]
as
begin
select*
from CURSOS
end

--insert tecnicaturas
create procedure sp_estudiantes_materias
@id_materia int,
@legajo_est int,
@id_curso int,
@id_cuatrimestre int
as
begin
insert into ESTUDIANTES_MATERIAS (id_materia,legajo_est,id_curso,id_cuatrimestre) 
values(@id_materia,@legajo_est,@id_curso,@id_cuatrimestre)
end

--reporte 1
create proc sp_estudiante_datos
@legajo_est int
as
begin 
select  est.legajo_est 'Legajo',ape_est + ', ' + nom_est 'Nombre', 
		nro_documento 'Documento', fecha_nac 'FechaNacimiento',
		email 'Email',telefono 'Telefono', nac.nacion 'Nacionalidad',
		est.calle + 'Nro ' + trim(str(est.nro_calle)) +' Barrio '+ b.barrio 'Direccion',
		fecha_ingreso 'FechaIngreso',sitHa.situacion_habit 'SituacionHabitacional',
		estCi.estado_civil 'EstadoCivil', estaLab.estado_lab 'EstadoLaboral'    	
from ESTUDIANTES est 
	  join nacionalidades nac on nac.id_nacionalidad=est.id_nacionalidad
      join barrios b on b.id_barrio= est.id_barrio
	  join SITUACION_HABIT sitHa on sitHa.id_situacion_habit=est.id_situacion_habit
	  join ESTADOS_CIVILES estCi on estCi.id_estado_civil=est.id_estado_civil
	  join ESTADOS_LABORALES estaLab on estaLab.id_estado_lab=est.id_estado_lab
 
where est.legajo_est = @legajo_est     
end

--reporte 2
--SE DESEA CONSULTAR DATOS SOBRE LOS ESTUDIANTES QUE RINDIERON EXÁMENES DURANTE EL 2020 Y 2021 
-- CORRESPONDIENTES A LAS MATERIAS "Programacion I", "Programacion II" Y "Programacion III"  DE LA TECNICATURA "Tecnicatura Universitaria en Programacion",
-- QUE OBTUVIERON UN PROMEDIO SUPERIOR AL PROMEDIO GENERAL.
-- SE DESEA SABER LA NOTA MAYOR Y LA MENOR OBTENIDA POR DICHOS ESTUDIANTES
execute sp_calificaciones_promedio2020_2021_prog


create procedure sp_calificaciones_promedio2020_2021_prog
@DesdeAño int,
@HastaAño int
as
begin
SELECT	E.ape_est+' '+ E.nom_est 'Estudiante',
		STR(AVG(EM1.calificacion),4,2) 'Calificacion',
		MAX(em1.calificacion) 'NotaM',
		MIN(em1.calificacion) 'Notam'
FROM ESTUDIANTES E
JOIN ESTUDIANTES_MATERIAS EM ON EM.legajo_est = E.legajo_est
JOIN MATERIAS M1 ON M1.id_materia = EM.id_materia
JOIN EXAMEN_MATERIAS EM1 ON EM1.id_materia = M1.id_materia
JOIN TECNICATURAS_MATERIAS TM ON TM.id_materia = M1.id_materia
JOIN TECNICATURAS T ON T.id_tecnicatura = TM.id_tecnicatura
JOIN EXAMENES EX ON EX.id_examen=EM1.id_examen
WHERE T.id_tecnicatura = 1
AND M1.id_materia in (1,7,8)
AND YEAR(ex.fecha_examen) between @DesdeAño and @HastaAño
GROUP BY E.ape_est+' '+ E.nom_est,e.legajo_est
HAVING AVG(EM1.calificacion)>( SELECT AVG(exm.calificacion)
								FROM EXAMEN_MATERIAS exm)
ORDER BY 1
end

exec sp_calificaciones_promedio2020_2021_prog 2020,2021

-- reporte 3
-- Una empresa busca programadores para una pasantia laboral: requieren alumnos con las sig.caracteristicas
-- Cursando a partir del  3er cuatrimestre
-- con un promedio general superior al  promedio del año pasado
-- que esten activos
-- que esten trabajando actualmente (si estan desempleados que esten en busca de trabajo).-
-- Necesita saber el legajo, nombre completo, e-mail, nro de telefono,fecha de nacimiento direccion completa y dni
 
create procedure [dbo].[sp_busqueda_programadores]
 as
 begin
 select e.legajo_est 'Legajo', 
		e.nom_est + space(1) + e.ape_est 'Estudiantes',
		e.email 'Email', e.telefono 'Telefono',
		e.calle + 'Nro ' + trim(str(e.nro_calle)) +' Barrio '+ b.barrio 'Direccion',
		e.nro_documento 'DNI',
		e.fecha_nac 'FechaNacimiento',
		avg(calificacion)'Promedio'  ,
		estado_lab 'EstadoLaboral',
		esta.estado_academico 'EstadoAcademico' 		
 from ESTUDIANTES e  join ESTUDIANTES_MATERIAS em on e.legajo_est=em.legajo_est
	 join MATERIAS m on m.id_materia=em.id_materia
	 join ESTADOS_ACADEMICOS est on est.id_estado_acad=em.id_estado_acad
	 join EXAMEN_MATERIAS exm on exm.id_materia=m.id_materia
	 join CURSOS c on c.id_curso=em.id_curso
	 join CUATRIMESTRES cuatri on cuatri.id_cuatrimestre=em.id_cuatrimestre
	 join ESTADOS_ACADEMICOS esta on esta.id_estado_acad=em.id_estado_acad
	 join ESTADOS_LABORALES lab on lab.id_estado_lab=e.id_estado_lab
	 join BARRIOS b on b.id_barrio=e.id_barrio
	 join TECNICATURAS_MATERIAS tec on tec.id_materia=m.id_materia
 where tec.id_tecnicatura = 1 
	and e.condicion = 1 
	and  em.id_estado_acad	 = 1
	and e.id_estado_lab in (1,2,3,5)
	and em.id_cuatrimestre not in (1,2,7) 
 group by e.legajo_est,e.nom_est + space(1) + e.ape_est ,e.email,
	e.telefono,e.calle + 'Nro ' +trim(str(e.nro_calle)) + ' Barrio '+ b.barrio,e.nro_documento,
	e.fecha_nac,estado_lab ,esta.estado_academico,fecha_ingreso
having avg(calificacion) > (select avg(calificacion)
							from EXAMEN_MATERIAS exm 
							where DATEDIFF(year,e.fecha_ingreso,getdate())=0
							and e.legajo_est=exm.legajo_est)
				order by 1,2
						end


--reporte 4

--Para saber cuales son los estudiantes extranjeros que estuvieron más activos en 2021,
--la UTN necesita generar un reporte con los estudiantes que rindieron más de 10 veces el año pasado.
--En el reporte incluir su promedio de calificaciones, estado academico y estado laboral


create view vis_Estudiantes_Extranjeros_Activos
as
select e.legajo_est 'Legajo', nom_est+SPACE(1)+ape_est 'Estudiante', e.nro_documento 'DNI',
n.nacion 'Nacionalidad', count(distinct emt.legajo_est)'CantidadMateriasRendidas',
AVG(calificacion) 'Promedio',el.estado_lab 'EstadoLaboral'
from ESTUDIANTES e join ESTUDIANTES_MATERIAS em on e.legajo_est = em.legajo_est
join NACIONALIDADES n on e.id_nacionalidad = n.id_nacionalidad
join MATERIAS m on em.id_materia = m.id_materia
join TECNICATURAS_MATERIAS tm on m.id_materia = tm.id_materia
join EXAMEN_MATERIAS emt on m.id_materia = emt.id_materia
join EXAMENES ex on emt.id_examen = ex.id_examen
join ESTADOS_LABORALES el on e.id_estado_lab = el.id_estado_lab
where e.id_nacionalidad NOT IN (1)
and e.legajo_est in (select legajo_est
					 from EXAMEN_MATERIAS em2 join EXAMENES ex2 on em2.id_examen = ex2.id_examen
					 where YEAR(fecha_examen) = YEAR(GETDATE())-1
					 group by legajo_est
					 having count(em2.id_materia)>10)
group by e.legajo_est, nom_est+SPACE(1)+ape_est, e.nro_documento,n.nacion, el.estado_lab
--order by 2

create procedure sp_Estudiantes_Extranjeros_Activos
as
begin
select * from vis_Estudiantes_Extranjeros_Activos
order by 2
end

--reporte 5

--Para un torneo de Industria se quiere sacar un listado de los estudiantes promocionados
--de la Tecnicatura Universitaria en Industrias Alimentarias con un promedio mayor o igual AL NUMERO PASADO POR PARAMETRO
--pero que ademas todas sus notas sean superior a 7.
--Por último, que hayan rendido examen en los ultimos dos años y que no tengan
--trabajo actualmente (para tener disponibilidad de viajar)

create procedure sp_Torneo_Industria
@promedio int
as
begin
 select e.legajo_est 'Legajo', nom_est+SPACE(1)+ape_est 'Estudiante', t.tecnicatura 'Tecnicatura',
avg(calificacion) 'Promedio'
from ESTUDIANTES e join ESTUDIANTES_MATERIAS em on e.legajo_est = em.legajo_est
join MATERIAS m on em.id_materia = m.id_materia
join TECNICATURAS_MATERIAS tm on m.id_materia = tm.id_materia
join TECNICATURAS t on tm.id_tecnicatura = t.id_tecnicatura
join EXAMEN_MATERIAS emt on m.id_materia = emt.id_materia
join EXAMENES ex on emt.id_examen = ex.id_examen
join ESTADOS_LABORALES el on e.id_estado_lab = el.id_estado_lab
where e.id_estado_lab in (5,6)
and YEAR(ex.fecha_examen) between 2021 and 2022
and t.id_tecnicatura = 4
and 7 < ALL (select calificacion
			 from EXAMEN_MATERIAS emt2
			 where emt.id_examen_materia = emt2.id_examen_materia)
group by e.legajo_est, nom_est+SPACE(1)+ape_est, t.tecnicatura
having AVG(calificacion) >= @promedio
order by 1,2
end

--report 6

-- El gobierno de la provincia de Cordoba necesita para fines 
-- estadisticos conocer: la cantidad total de Estudiantes de las tecnicaturas de la UTN,
-- que comenzaron a estudiar durante la PANDEMIA, Con una edad superior a 30 años,
-- que su situacion laboral sea asalariado o desempleado   
-- y que ademas nunca fueron aplazados.-
 
create procedure [dbo].[sp_GobCba_Est_Pandemia]
@fechaDesde datetime,
@fechaHasta datetime
as begin
select COUNT(e.legajo_est)'CantidadEstudiantes'      
from ESTUDIANTES e 
	join NACIONALIDADES n on e.id_nacionalidad=n.id_nacionalidad
	join ESTUDIANTES_MATERIAS em on em.legajo_est=e.legajo_est
	join MATERIAS m on m.id_materia=em.id_materia
	join TECNICATURAS_MATERIAS tecm on tecm.id_materia=m.id_materia
	join TECNICATURAS t on t.id_tecnicatura=tecm.id_tecnicatura
where e.id_nacionalidad = 1  
  and year(fecha_nac) < 1989
  and id_estado_lab in (1,5,6)
  and id_situacion_habit not like 2
  and exists (select emt.legajo_est
				from EXAMEN_MATERIAS emt 
				where emt.calificacion >= 6
				and emt.legajo_est = e.legajo_est)
and fecha_ingreso between @fechaDesde and @fechaHasta
order by 1
end

				
--Reporte 7
-- La UTN necesita tener registros de los docentes de la tecnicaturas en telecomunicaciones, Industria alimentaria y mecatronica
-- indicando la cantidad de cursos que tiene a cargo cada uno,los datos personales de cada docente (con email conocido) y sean de la generacion del 60,
-- siempre que la cantidad de cursos en donde trabaje sea superior a 2

create view vis_Docentes_cursosCargo
as
select d.legajo_doc 'LEGAJOS',
	 t.tecnicatura 'Tecnicaturas',
	COUNT(c.id_curso) 'TOTALcursos',
	d.ape_doc + space(2) + nom_doc 'Nombre', d.nro_documento 'DNI',
	d.email 'email',d.telefono 'Telefono',
	d.fecha_nac 'FechaNacimmiento'
from DOCENTES D 
	join DOCENTES_MATERIAS DM on d.legajo_doc=dm.legajo_doc	
	join MATERIAS m on dm.id_materia=m.id_materia
	join CURSOS C on C.id_curso=dm.id_curso	
	join TECNICATURAS_MATERIAS tm on tm.id_materia=m.id_materia
	join TECNICATURAS t on t.id_tecnicatura=tm.id_tecnicatura
where t.id_tecnicatura in (6,3,4)
	and D.email is not null 
	and year(d.fecha_nac) between 1960 and 1969
group by d.ape_doc + space(2) + nom_doc , d.nro_documento ,
	d.email ,d.telefono ,d.legajo_doc,t.tecnicatura , d.fecha_nac
having COUNT(C.id_curso)>2

create procedure [dbo].[sp_Docentes_cursosCargo]
@legajo_doc int
as begin
select * from vis_Docentes_cursosCargo
where LEGAJOS=@legajo_doc
order by 1
end


--reporte8

create PROCEDURE [dbo].[sp_docentes_examenes]
@materia int,
@anios int
as
begin
SELECT	D.ape_doc+' '+D.nom_doc 'Docente',
		N.nacion 'Nacionalidad',
		EC.estado_civil 'EstadoCivil',		
		cast (AVG (EM.calificacion)as decimal(4,2)) 'CalificacionPromedio'
FROM DOCENTES D
JOIN NACIONALIDADES N ON N.id_nacionalidad = D.id_nacionalidad
JOIN ESTADOS_CIVILES EC ON EC.id_estado_civil = D.id_estado_civil
JOIN DOCENTES_MATERIAS DM ON DM.legajo_doc = D.legajo_doc
JOIN MATERIAS M ON M.id_materia = DM.id_materia
JOIN EXAMEN_MATERIAS EM ON EM.id_materia = M.id_materia
JOIN EXAMEN_MATERIAS EM2 ON EM2.id_materia = M.id_materia
JOIN EXAMENES E ON E.id_examen = EM.id_examen
JOIN TECNICATURAS_MATERIAS TM ON TM.id_materia = M.id_materia
JOIN TECNICATURAS T ON T.id_tecnicatura = TM.id_tecnicatura
WHERE DATEDIFF(YEAR, E.fecha_examen, GETDATE()) < @anios
GROUP BY D.ape_doc+' '+D.nom_doc,
		 N.nacion,
		 EC.estado_civil,
		 D.legajo_doc,
		 DM.legajo_doc
HAVING @materia < (SELECT COUNT(*) FROM DOCENTES_MATERIAS DM2 WHERE DM2.legajo_doc = DM.legajo_doc)
AND AVG(EM.calificacion) > (SELECT AVG(EM3.calificacion) FROM EXAMEN_MATERIAS EM3)
ORDER BY D.legajo_doc
end



create trigger dis_examen_materia_insert
on EXAMEN_MATERIAS 
for insert
as
declare @calificacion int
select @calificacion=exam.calificacion from EXAMEN_MATERIAS exam join inserted
on inserted.id_examen_materia=exam.id_examen_materia
declare @materia int
select @materia=mate.id_materia from MATERIAS mate join inserted
on inserted.id_materia=mate.id_materia
declare @legajo int
select @legajo=est.legajo_est from ESTUDIANTES est join inserted
on inserted.legajo_est=est.legajo_est

 if(@calificacion >= 8)
update ESTUDIANTES_MATERIAS set id_estado_acad = 1
where legajo_est=@legajo and id_materia=@materia
if(@calificacion >=6 or @calificacion < 8)
update ESTUDIANTES_MATERIAS set id_estado_acad = 2
where legajo_est=@legajo and id_materia=@materia
if(@calificacion <6)
update ESTUDIANTES_MATERIAS set id_estado_acad = 3
where legajo_est=@legajo and id_materia=@materia
else
begin
raiserror ('Calificacion incorrecta', 16, 1)
rollback transaction
end

select *
from ESTUDIANTES_MATERIAS
where legajo_est = 2