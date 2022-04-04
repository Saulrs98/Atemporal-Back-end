/*INSERTS PARA USUARIOS*/

INSERT INTO `usuarios` (`id_usuario`, `id_rol`, `es_admin`, `nombre`, `celular`, `correo_electronico`, `pass`, `auth_google`, `esta_activo`, `foto_cuenta`, `fecha_creado`, `fecha_actualizado`) VALUES (NULL, NULL, '1', 'Daniel Cu Sánchez', '44812312345', 'danielcu@miempresa.com', 'hash', NULL, '1', NULL, current_timestamp(), NULL);

INSERT INTO `usuarios` (`id_usuario`, `id_rol`, `es_admin`, `nombre`, `celular`, `correo_electronico`, `pass`, `auth_google`, `esta_activo`, `foto_cuenta`, `fecha_creado`, `fecha_actualizado`) VALUES (NULL, NULL, '1', 'Edson Vázquez Cruz', '8333663190', 'correo@electronico.com', 'aaaaaaaaa', NULL, '1', NULL, current_timestamp(), NULL);

/* INSERTS PARA EVENTOS */

INSERT INTO `eventos` (`id_evento`, `nombre_organizador`, `celular_organizador_principal`, `celular_organizador_secundario`, `nombre_evento`, `fecha_evento`, `hora_inicio`, `hora_final`, `ubicacion`, `descripcion`, `direccion`, `url_video`, `tipo_cobro`, `foto_evento`, `archivo_itinerario`, `esta_activo`, `fecha_creado`, `fecha_actualizado`) VALUES (NULL, 'Edson Vazquez Cruz', '72686781', '847981273', 'Torneo de comer mariscos', '2022-04-04', '8:00 AM', '14:00 PM', 'En mi casa', 'Un torneo para ver quien termina de comer primero x numero de mariscos.', 'Epigmenio González 500, San Pablo, 76130 Santiago de Querétaro, Qro.', 'https://www.youtube.com/watch?v=GwF9EjnsNUQ&ab_channel=SanctuaryLads', '1', 'https://www.pexels.com/es-es/foto/grupo-de-personas-levantan-la-mano-en-el-estadio-976866/', 'https://www.pexels.com/es-es/foto/foto-del-planificador-y-materiales-de-escritura-760710/', '1', current_timestamp(), current_timestamp());

/* INSERTS PARA BOLETO*/

INSERT INTO `boletos` (`id_boleto`, `nombre`, `cantidad`, `esta_activo`, `fecha_creado`, `fecha_actualizado`) VALUES (NULL, 'Boleto general', NULL, '1', current_timestamp(), current_timestamp());