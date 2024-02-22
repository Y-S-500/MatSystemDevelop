DROP DATABASE MatSystem;

CREATE DATABASE MatSystem;
USE MatSystem;



CREATE TABLE `archivos_matricula` (
id_archivos_matricula INTEGER PRIMARY key not null auto_increment,
archivos blob not NULL 
);

CREATE TABLE `documentos`(
  id_documentos  INTEGER PRIMARY key not null auto_increment,
  documentos blob NOT NULL
);

CREATE TABLE `programas_ofertados`(
 id_programas_ofertados INTEGER  primary key not null auto_increment,
 programas_ofertados_nombre VARCHAR(200) NOT null,
 programas_ofertados_fecha_inicio DATE NOT NULL,
 programas_ofertados_fecha_fin DATE NOT NULL

);


CREATE TABLE `departamento`(
 id_departamento INTEGER PRIMARY key NOT NULL auto_increment,
 departamento_codigo VARCHAR (202) NOT NULL,
 departamento_nombre VARCHAR (200) Not Null
 

);

CREATE TABLE `municipio`(
 id_municipio INTEGER PRIMARY key NOT NULL auto_increment,
 municipio_codigo VARCHAR (202) NOT NULL,
 municipio_nombre VARCHAR (200) Not null
 

);

CREATE TABLE `tipo_indentificacion`(
 id_tipoIndentificacion INTEGER PRIMARY key NOT NULL auto_increment,
 tipo_indentificacion_descripcion VARCHAR(100) NOT NULL,
 tipo_indentificacion_referencia VARCHAR(4) NOT NULL
);
CREATE TABLE `genero`(
 id_genero INTEGER PRIMARY KEY Not NULL auto_increment,
 genero_descripcion VARCHAR(100) NOT Null,
);

CREATE TABLE `validacion_cadena_formacion`(
 id_validacion_cadena_formacion INTEGER PRIMARY key NOT NULL auto_increment,
 validacion_tecnico_documento BLOB NOT NULL
);


CREATE TABLE `instituciones_educativas`(
	id_instituciones_educativas INTEGER PRIMARY key NOT NULL auto_increment,
	instituciones_educativas_nombre VARCHAR(300) NOT NULL,
	id_departamento INTEGER,
	id_municipio INTEGER,
	
	FOREIGN key (id_departamento) REFERENCES departamento(id_departamento),
	FOREIGN key (id_municipio) REFERENCES municipio(id_municipio)
);

CREATE TABLE `persona`(
		   id_persona INTEGER PRIMARY key NOT NULL auto_increment,
			persona_primer_nombre varchar(100) NOT NULL ,
			persona_segundo_nombre varchar(100) NULL ,

   
			persona_primer_apellido VARCHAR(100) Not NULL,
			persona_segundo_apellido VARCHAR(100)  NULL,

			persona_fecha_nacimiento DATE NOT NULL,
			persona_numero_contacto BIGINT NOT NULL,
		    persona_correo_electronico VARCHAR(200) NOT NULL,
			persona_direccion VARCHAR(200) NOT NULL,
			persona_numero_indentificacion INTEGER NOT NULL,


		
   id_validacion_cadena_formacion INTEGER,
   id_genero INTEGER,
   id_tipoIndentificacion INTEGER,
   id_instituciones_educativas INTEGER,
   id_programas_ofertados INTEGER,
   id_archivos_matricula INTEGER,
   id_documentos INTEGER,
   
   FOREIGN key (id_tipoIndentificacion) REFERENCES tipo_indentificacion(id_tipoIndentificacion),
  FOREIGN key (id_instituciones_educativas) REFERENCES instituciones_educativas(id_instituciones_educativas),
	FOREIGN key (id_programas_ofertados) REFERENCES programas_ofertados(id_programas_ofertados),
	FOREIGN key (id_archivos_matricula) REFERENCES archivos_matricula(id_archivos_matricula),
	FOREIGN key (id_genero) REFERENCES genero(id_genero),
	FOREIGN key (id_documentos) REFERENCES documentos(id_documentos),
	FOREIGN key (id_validacion_cadena_formacion) REFERENCES validacion_cadena_formacion(id_validacion_cadena_formacion)


);

CREATE ROLES "rl_lectura","rl_escritura";

CREATE ROLE "rl_lector";
CREATE ROLE "rl_escritor";

2) ascignar permisos
GRANT SELECT,UPDATE ON MatSystem.* TO "rl_lector";
GRANT INSERT,UPDATE,DELETE on MatSystem.* to "rl_escritor";

ver si tiene los permisos adecuados
show GRANTs for "rl_escritura"

ver permisos que tiene el rol de lectura
 show GRANTs for "rl_lectura"
 
asignar a usuario los roles
GRANT "rl_lectura" TO Aprendiz;
verificar los prmisos
SHOW GRANTS FOR Aprendiz;

GRANT "rl_escritor" TO Aministrador;
verificar los prmisos
SHOW GRANTS FOR Aministrador;



CREATE ROLES "rl_lector","rl_escritor"

CREATE USER `usuarios`(

	id_user INTEGER PRIMARY key auto_increment;
	usuarios_usuario VARCHAR(100) NOT NULL;
	usuarios_contraseña VARCHAR(2000) NOT NULL;
	

)


CREATE user Aprendiz IDENTIFIED by '12345';
darle los permisos respectivos
grant SELECT,UPDATE,DELETE on MatSystem.* to Aprendiz;


CREATE user Aministrador IDENTIFIED by '12345';
darle los permisos respectivos
grant SELECT,INSERT,UPDATE,DELETE on MatSystem.* to Aministrador;


