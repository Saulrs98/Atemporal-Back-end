CREATE DATABASE atemporal;

USE atemporal;

CREATE TABLE usuarios (
    id_usuario int,
    id_rol int,
    esAdmin boolean,
    nombre varchar(255),
    celular varchar(255),
    correo_electronico varchar(255),
    password varchar(255),
    auth_google integer,
    esta_activo boolean,
    foto_cuenta varchar(255),
    fecha_creado date,
    fecha_actualizado date
);

CREATE TABLE roles (
    id_rol int,
    nombre varchar(255),
    esta_activo boolean,
    fecha_creado date,
   	fecha_actualizado date
);

CREATE TABLE permisos (
    id_permiso int,
    nombre varchar(255),
    esta_activo boolean,
    fecha_creado date,
   	fecha_actualizado date
);

CREATE TABLE roles_permisos (
    id_rol int,
    id_permiso int,
    esta_activo boolean,
    fecha_creado date,
   	fecha_actualizado date
);

CREATE TABLE eventos (
    id_evento int,
    nombre_organizador varchar(255),
    celular_organizador_principal varchar(255),
    celular_organizador_secundario varchar(255),
    nombre_evento varchar(255),
    fecha_evento date,
    hora_inicio varchar(255),
    hora_final varchar(255),
    ubicacion varchar(255),
    descripcion varchar(1000),
    direccion varchar(500),
    url_video varchar(255),
    tipo_cobro boolean,
    foto_evento varchar(255),
    archivo_itinerario varchar(255),
    esta_activo boolean,
    fecha_creado date,
   	fecha_actualizado date
);

CREATE TABLE usuarios_eventos_crean (
    id int,
    id_usuario int,
    id_evento int,
    esta_aprobado boolean,
    esta_activo boolean,
    fecha_creado date,
   	fecha_actualizado date
);

CREATE TABLE usuarios_eventos_reservan (
    id int,
    id_usuario int,
    id_evento int,
    asistencia boolean,
    codigo_qr varchar(255),
    esta_activo boolean,
    fecha_creado date,
   	fecha_actualizado date
);

CREATE TABLE categorias (
    id_categoria int,
    nombre varchar(255),
    esta_activo boolean,
    fecha_creado date,
   	fecha_actualizado date
);

CREATE TABLE eventos_categorias (
    id int,
    id_categoria int,
    id_evento int,
    esta_activo boolean,
    fecha_creado date,
   	fecha_actualizado date
);

CREATE TABLE metodos_pago (
    id_metodo int,
    nombre varchar(255),
    esta_activo boolean,
    fecha_creado date,
   	fecha_actualizado date
);

CREATE TABLE eventos_metodos (
    id int,
    id_metodo int,
    id_evento int,
    esta_activo boolean,
    fecha_creado date,
   	fecha_actualizado date
);

/*AQUELLAS TABLAS SIN LLAVES FORANEAS*/

ALTER TABLE roles
ADD CONSTRAINT pk_roles PRIMARY KEY (id_rol);

ALTER TABLE permisos
ADD CONSTRAINT pk_permisos PRIMARY KEY (id_permiso);

ALTER TABLE categorias
ADD CONSTRAINT pk_categorias PRIMARY KEY (id_categoria);

ALTER TABLE metodos_pago
ADD CONSTRAINT pk_metodos PRIMARY KEY (id_metodo);

ALTER TABLE eventos
ADD CONSTRAINT pk_eventos PRIMARY KEY (id_evento);


/*TABLAS CON LLAVES FORANEAS*/

ALTER TABLE usuarios
ADD CONSTRAINT pk_usuarios PRIMARY KEY (id_usuario),
ADD CONSTRAINT fk_roles_usuarios FOREIGN KEY (id_rol) REFERENCES roles(id_rol);

/*TABLAS CON LLAVES PRIMARIAS COMPUESTAS */

ALTER TABLE roles_permisos
ADD CONSTRAINT pk_roles_permisos PRIMARY KEY (id_permiso,id_rol),
ADD CONSTRAINT fk_permisos FOREIGN KEY (id_permiso) REFERENCES permisos(id_permiso),
ADD CONSTRAINT fk_roles_permisos FOREIGN KEY (id_rol) REFERENCES roles(id_rol);

ALTER TABLE usuarios_eventos_crean
ADD CONSTRAINT pk_usuarios_eventos_crean PRIMARY KEY (id, id_usuario, id_evento),
ADD CONSTRAINT fk_e_crean FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
ADD CONSTRAINT fk_u_crean FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);

ALTER TABLE usuarios_eventos_reservan
ADD CONSTRAINT pk_usuarios_eventos_reservan PRIMARY KEY (id, id_usuario, id_evento),
ADD CONSTRAINT fk_e_reservan FOREIGN KEY (id_evento) REFERENCES eventos(id_evento),
ADD CONSTRAINT fk_u_reservan FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);

ALTER TABLE eventos_categorias
ADD CONSTRAINT pk_eventos_categorias PRIMARY KEY (id, id_categoria, id_evento),
ADD CONSTRAINT fk_categorias FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
ADD CONSTRAINT fk_eventos_categorias FOREIGN KEY (id_evento) REFERENCES eventos(id_evento);

ALTER TABLE eventos_metodos
ADD CONSTRAINT pk_eventos_metodos PRIMARY KEY (id, id_metodo, id_evento),
ADD CONSTRAINT fk_metodos FOREIGN KEY (id_metodo) REFERENCES metodos_pago(id_metodo),
ADD CONSTRAINT fk_eventos_metodos FOREIGN KEY (id_evento) REFERENCES eventos(id_evento);











