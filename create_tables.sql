create database deforestacion_destruccion_habitats;
use deforestacion_destruccion_habitats;

/* PROBLEMÁTICA:
	La deforestación en áreas tropicales está siendo impulsada por la expansión agrícola y ganadera,
	así como por la explotación de recursos naturales como la madera y minerales. Corporaciones madereras y 
	empresas mineras están obteniendo permisos de explotación de parte de los gobiernos, a menudo sin considerar
	el impacto ambiental y sin consultar a las comunidades indígenas que dependen de estos hábitats para su sustento
	y cultura. La creciente demanda de tierras para la agricultura y ganadería también incentiva la destrucción de
	áreas boscosas, mientras que desarrolladores inmobiliarios promueven la urbanización de estos territorios
	para atender el crecimiento de la población y el turismo.
	
	Organizaciones no gubernamentales ambientalistas intentan contrarrestar esta situación promoviendo prácticas
	sostenibles y concienciando a los consumidores sobre el impacto de sus decisiones. Sin embargo,
	el poder económico de las grandes corporaciones y la falta de regulación efectiva limitan la capacidad
	de estas organizaciones para detener la pérdida de biodiversidad y la degradación de los ecosistemas.
*/
CREATE TABLE empresas_mineras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_empresa VARCHAR(255) NOT NULL,
    ubicacion VARCHAR(255),
    fecha_fundacion DATE,
    numero_empleados INT,
    produccion_anual DECIMAL(10, 2),
    tipo_mineral VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



CREATE TABLE empresas_ganaderas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_empresa VARCHAR(255) NOT NULL,
    ubicacion VARCHAR(255),
    fecha_fundacion DATE,
    numero_empleados INT,
    tipo_ganado VARCHAR(255),
    produccion_anual DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE turistas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    pais_origen VARCHAR(255),
    fecha_nacimiento DATE,
    genero ENUM('Masculino', 'Femenino', 'Otro'),
    destino_turistico VARCHAR(255), 
    fecha_llegada DATE, 
    fecha_salida DATE, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create table corporaciones_madereras(
	id_corporacion int AUTO_INCREMENT,
	nombre_cop varchar(30) NOT NULL,
	sede_cop varchar(30) NOT NULL,
	lugares_tala varchar(15) NOT NULL,
	areas_reforestadas float NOT NULL,
	volumen_anual_madera float NOT NULL,
	tipo_madera varchar(15) NOT NULL,
	alianzas_ambientales varchar(30) NOT NULL,
	ingresos_anuales float NOT NULL,
	constraint pk_ic primary key (id_corporacion),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


create table desarolladores_inmobiliarios(
	id_inmobiliario int AUTO_INCREMENT,
	nombre_inm varchar(30) NOT NULL,
	sede_inm varchar(30) NOT NULL,
	tipo_proyectos varchar(15) NOT NULL,
	can_proyectos int NOT NULL,
	ubi_proyectos varchar(15) NOT NULL, 
	impacto_ambiental_proyectos varchar(30) NOT NULL,
	uso_areas_protegidas char(1) NOT NULL CHECK (uso_areas_protegidas="S" OR "N"),
	evaluación_impacto_ambiental char(1) NOT NULL,
	uso_tecn_sostenibles varchar(30) NOT NULL,
	ingresos_anuales float NOT NULL,
	constraint pk_ii primary key (id_inmobiliario),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create table gobiernos (
	id_gobierno INT AUTO_INCREMENT PRIMARY KEY, 
	nombre_pais VARCHAR(100) NOT NULL, 
	politica_forestal VARCHAR(255), 
	fondos_destinados DECIMAL(15, 2) DEFAULT 0,
	nivel_compromiso ENUM('Bajo', 'Medio', 'Alto') NOT NULL, 
	fecha_implementacion DATE NOT null,
	areas_protegidas INT DEFAULT 0,
	sanciones_deforestacion BOOLEAN DEFAULT FALSE,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE comunidades_indigenas (
	id_comunidad INT AUTO_INCREMENT PRIMARY KEY, 
	nombre_comunidad VARCHAR(100) NOT NULL, 
	poblacion INT NOT NULL, 
	region VARCHAR(100) NOT NULL, 
	actividades_preservacion TEXT, 
	impacto_deforestacion ENUM('Bajo', 'Medio', 'Alto') NOT NULL, 
	derechos_territoriales BOOLEAN DEFAULT FALSE,
	apoyo_ong BOOLEAN DEFAULT FALSE, 
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
); 


CREATE TABLE consumidores (
    id_consumidor INT AUTO_INCREMENT PRIMARY KEY,
    tipo_consumidor ENUM('Individual', 'Corporativo') NOT NULL,
    nombre VARCHAR(100),
    productos_adquiridos TEXT,
    nivel_consumo ENUM('Bajo', 'Medio', 'Alto') NOT NULL,
    apoya_sostenibilidad BOOLEAN NOT NULL,
    ubicacion_geografica VARCHAR(100),
    tipo_producto VARCHAR(100),    
    certificacion_sostenible BOOLEAN DEFAULT FALSE,  
    fecha_inicio_consumo DATE,
    comentarios TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE agricultores (
    id_agricultor INT AUTO_INCREMENT PRIMARY KEY, -- ID único para cada agricultor
    documento VARCHAR(20) NOT NULL, -- Documento de identidad del agricultor (puede ser DNI, pasaporte, etc.)
    nombre VARCHAR(100) NOT NULL, -- Nombre completo del agricultor
    pais VARCHAR(50) NOT NULL, -- País de origen o residencia del agricultor
    tipo_tierra VARCHAR(50) NOT NULL, -- Tipo de tierra (arcillosa, arenosa, etc.)
    extension_tierra DECIMAL(10, 2) NOT NULL, -- Extensión de la tierra en hectáreas (o la unidad que corresponda)
    afectaciones TEXT NULL, -- Descripción de las afectaciones que ha sufrido la tierra (erosión, deforestación, etc.)
    tecnicas_sostenibles BOOLEAN DEFAULT 0, -- Indica si usa técnicas sostenibles (1: sí, 0: no)
    produccion_anual DECIMAL(15, 2) NULL, -- Producción anual en toneladas (o la unidad que corresponda)
    tipo_cultivo VARCHAR(100) NULL, -- Tipo de cultivo que produce
    numero_empleados INT NULL, -- Número de empleados o trabajadores
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha en que el agricultor fue registrado en el sistema
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );

CREATE TABLE ong_ambientalistas (
    id_ong INT AUTO_INCREMENT PRIMARY KEY, -- ID único para cada ONG
    nombre VARCHAR(100) NOT NULL, -- Nombre de la ONG
    numero_registro VARCHAR(50) NULL, -- Número de registro, puede ser opcional
    pais VARCHAR(50) NOT NULL, -- País donde opera
    fecha_fundacion INT NOT NULL, -- Año de fundación
    mision TEXT NOT NULL, -- Descripción de la misión de la ONG
    tipo_actividades VARCHAR(100) NOT NULL, -- Actividades que realiza la ONG
    areas_enfoque VARCHAR(100) NULL, -- Áreas específicas de trabajo
    presupuesto_anual DECIMAL(15, 2) NULL, -- Presupuesto anual de la ONG
    numero_empleados INT NULL, -- Número de empleados o voluntarios
    problematicas TEXT NULL, -- Descripción de las problemáticas que aborda
    proyectos_actuales TEXT NULL, -- Descripción de proyectos actuales
    resultados_obtenidos TEXT null, -- Resultados o logros alcanzados
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha en que el agricultor fue registrado en el sistema
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* 
 * Relación de las tablas para poder realizar el MR 
*/

describe deforestacion_destruccion_habitats.desarolladores_inmobiliarios;
alter  table deforestacion_destruccion_habitats.comunidades_indigenas add column gobierno_id int;
alter  table deforestacion_destruccion_habitats.comunidades_indigenas  add foreign key (gobierno_id) references deforestacion_destruccion_habitats.gobiernos(id_gobierno);

alter  table deforestacion_destruccion_habitats.desarolladores_inmobiliarios add column gobierno_id int;
alter  table deforestacion_destruccion_habitats.desarolladores_inmobiliarios add foreign key (gobierno_id) references deforestacion_destruccion_habitats.gobiernos(id_gobierno);

alter  table deforestacion_destruccion_habitats.empresas_mineras add column gobierno_id int;
alter  table deforestacion_destruccion_habitats.empresas_mineras add foreign key (gobierno_id) references deforestacion_destruccion_habitats.gobiernos(id_gobierno);

alter  table deforestacion_destruccion_habitats.corporaciones_madereras add column gobierno_id int;
alter  table deforestacion_destruccion_habitats.corporaciones_madereras add foreign key (gobierno_id) references deforestacion_destruccion_habitats.gobiernos(id_gobierno);

alter  table deforestacion_destruccion_habitats.empresas_ganaderas add column gobierno_id int;
alter  table deforestacion_destruccion_habitats.empresas_ganaderas add foreign key (gobierno_id) references deforestacion_destruccion_habitats.gobiernos(id_gobierno);

alter  table deforestacion_destruccion_habitats.consumidores add column gobierno_id int;
alter  table deforestacion_destruccion_habitats.consumidores add foreign key (gobierno_id) references deforestacion_destruccion_habitats.gobiernos(id_gobierno);

alter  table deforestacion_destruccion_habitats.turistas add column inmobiliario_id int;
alter  table deforestacion_destruccion_habitats.turistas add foreign key (inmobiliario_id) references deforestacion_destruccion_habitats.desarolladores_inmobiliarios(id_inmobiliario);

alter table deforestacion_destruccion_habitats.agricultores add column gobierno_id int;
alter table deforestacion_destruccion_habitats.agricultores add foreign key (gobierno_id) references deforestacion_destruccion_habitats.gobiernos(id_gobierno);

alter table deforestacion_destruccion_habitats.agricultores add column ong_id int;
alter table deforestacion_destruccion_habitats.agricultores add foreign key (ong_id) references deforestacion_destruccion_habitats.ong_ambientalistas(id_ong);

alter table deforestacion_destruccion_habitats.agricultores add column gobierno_id_id int;
alter table deforestacion_destruccion_habitats.agricultores add foreign key (gobierno_id_id) references deforestacion_destruccion_habitats.gobiernos(id_gobierno);