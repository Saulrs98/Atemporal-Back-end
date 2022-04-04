DROP DATABASE IF EXISTS atemporal;

CREATE DATABASE atemporal;

use atemporal;

CREATE TABLE usuarios (
    id_usuario int NOT NULL,
    id_rol int,
    es_admin boolean NOT NULL,
    nombre varchar(255) NOT NULL,
    celular varchar(255) NOT NULL,
    correo_electronico varchar(255),
    pass varchar(255),
    auth_google integer,
    esta_activo boolean NOT NULL,
    foto_cuenta varchar(255),
    fecha_creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE roles (
    id_rol int NOT NULL,
    nombre varchar(255) NOT NULL,
    esta_activo boolean NOT NULL,
    fecha_creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE permisos (
    id_permiso int NOT NULL,
    nombre varchar(255) NOT NULL,
    esta_activo boolean NOT NULL,
    fecha_creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE eventos (
    id_evento int NOT NULL,
    nombre_organizador varchar(255) NOT NULL,
    celular_organizador_principal varchar(255) NOT NULL,
    celular_organizador_secundario varchar(255) NOT NULL,
    nombre_evento varchar(255) NOT NULL,
    fecha_evento date NOT NULL,
    hora_inicio varchar(255) NOT NULL,
    hora_final varchar(255) NOT NULL,
    ubicacion varchar(255) NOT NULL,
    descripcion varchar(1000) NOT NULL,
    direccion varchar(500) NOT NULL,
    url_video varchar(255) NOT NULL,
    tipo_cobro boolean NOT NULL,
    foto_evento varchar(255) NOT NULL,
    archivo_itinerario varchar(255) NOT NULL,
    esta_activo boolean NOT NULL,
    fecha_creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE categorias (
    id_categoria int NOT NULL,
    nombre varchar(255) NOT NULL,
    esta_activo boolean NOT NULL,
    fecha_creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE boletos (
    id_boleto int NOT NULL,
    nombre varchar(255) NOT NULL,
    cantidad int,
    esta_activo boolean NOT NULL,
    fecha_creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE metodos_pago (
    id_metodo int NOT NULL,
    nombre varchar(255) NOT NULL,
    esta_activo boolean NOT NULL,
    fecha_creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE roles_permisos (
    id_rol int NOT NULL,
    id_permiso int NOT NULL,
    esta_activo boolean NOT NULL,
    fecha_creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE roles_usuarios(
    id_usuario int NOT NULL,
    id_rol int NOT NULL,
    esta_activo boolean NOT NULL,
    fecha_creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE usuarios_eventos_crean (
    id int NOT NULL,
    id_usuario int NOT NULL,
    id_evento int NOT NULL,
    esta_aprobado boolean NOT NULL,
    esta_activo boolean NOT NULL,
    fecha_creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE usuarios_eventos_reservan (
    id int NOT NULL,
    id_usuario int NOT NULL,
    id_evento int NOT NULL,
    asistencia boolean NOT NULL,
    codigo_qr varchar(255) NOT NULL,
    esta_activo boolean NOT NULL,
    fecha_creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE eventos_metodos (
    id int NOT NULL,
    id_metodo int NOT NULL,
    id_evento int NOT NULL,
    esta_activo boolean NOT NULL,
    fecha_creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE eventos_categorias (
    id int NOT NULL,
    id_categoria int NOT NULL,
    id_evento int NOT NULL,
    esta_activo boolean NOT NULL,
    fecha_creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE eventos_boletos (
    id int NOT NULL,
    id_boleto int NOT NULL,
    id_evento int NOT NULL,
    esta_activo boolean NOT NULL,
    fecha_creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/*AQUELLAS TABLAS SIN LLAVES FORANEAS*/

ALTER TABLE roles
ADD CONSTRAINT pk_roles PRIMARY KEY (id_rol),
CHANGE id_rol id_rol int NOT NULL AUTO_INCREMENT;

ALTER TABLE permisos
ADD CONSTRAINT pk_permisos PRIMARY KEY (id_permiso),
CHANGE id_permiso id_permiso int NOT NULL AUTO_INCREMENT;

ALTER TABLE categorias
ADD CONSTRAINT pk_categorias PRIMARY KEY (id_categoria),
CHANGE id_categoria id_categoria int NOT NULL AUTO_INCREMENT;

ALTER TABLE boletos
ADD CONSTRAINT pk_boletos PRIMARY KEY (id_boleto),
CHANGE id_boleto id_boleto int NOT NULL AUTO_INCREMENT;

ALTER TABLE metodos_pago
ADD CONSTRAINT pk_metodos PRIMARY KEY (id_metodo),
CHANGE id_metodo id_metodo int NOT NULL AUTO_INCREMENT;

ALTER TABLE eventos
ADD CONSTRAINT pk_eventos PRIMARY KEY (id_evento),
CHANGE id_evento id_evento int NOT NULL AUTO_INCREMENT;

/*TABLAS CON LLAVES FORANEAS*/

ALTER TABLE usuarios
ADD CONSTRAINT pk_usuarios PRIMARY KEY (id_usuario),
CHANGE id_usuario id_usuario int NOT NULL AUTO_INCREMENT;

/*TABLAS CON LLAVES PRIMARIAS COMPUESTAS */

ALTER TABLE roles_permisos
ADD CONSTRAINT pk_roles_permisos PRIMARY KEY (id_permiso,id_rol),
ADD CONSTRAINT fk_permisos FOREIGN KEY (id_permiso) REFERENCES permisos(id_permiso),
ADD CONSTRAINT fk_roles_permisos FOREIGN KEY (id_rol) REFERENCES roles(id_rol);

ALTER TABLE usuarios_eventos_crean
ADD CONSTRAINT pk_uec PRIMARY KEY (id, id_usuario, id_evento),
ADD CONSTRAINT fk_e_crean FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
ADD CONSTRAINT fk_u_crean FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);

ALTER TABLE usuarios_eventos_reservan
ADD CONSTRAINT pk_uer PRIMARY KEY (id, id_usuario, id_evento),
ADD CONSTRAINT fk_e_reservan FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
ADD CONSTRAINT fk_u_reservan FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);

ALTER TABLE eventos_categorias
ADD CONSTRAINT pk_ec PRIMARY KEY (id, id_categoria, id_evento),
ADD CONSTRAINT fk_categorias FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
ADD CONSTRAINT fk_eventos_categorias FOREIGN KEY (id_evento) REFERENCES eventos(id_evento);

ALTER TABLE eventos_boletos
ADD CONSTRAINT pk_eb PRIMARY KEY (id, id_boleto, id_evento),
ADD CONSTRAINT fk_boletos FOREIGN KEY (id_boleto) REFERENCES boletos(id_boleto),
ADD CONSTRAINT fk_eventos_boletos FOREIGN KEY (id_evento) REFERENCES eventos(id_evento);

ALTER TABLE eventos_metodos
ADD CONSTRAINT pk_em PRIMARY KEY (id, id_metodo, id_evento),
ADD CONSTRAINT fk_metodos FOREIGN KEY (id_metodo) REFERENCES metodos_pago(id_metodo),
ADD CONSTRAINT fk_eventos_metodos FOREIGN KEY (id_evento) REFERENCES eventos(id_evento);