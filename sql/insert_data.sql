INSERT INTO `roles` (`id_rol`, `nombre`, `esta_activo`, `fecha_creado`, `fecha_actualizado`) VALUES (NULL, 'Admin', '1', current_timestamp(), NULL);

INSERT INTO `usuarios` (`id_usuario`, `id_rol`, `es_admin`, `nombre`, `celular`, `correo_electronico`, `pass`, `auth_google`, `esta_activo`, `foto_cuenta`, `fecha_creado`, `fecha_actualizado`) VALUES (NULL, '1', '1', 'Daniel Cu Sánchez', '44812312345', 'danielcu@miempresa.com', 'hash', NULL, '1', NULL, current_timestamp(), NULL);

INSERT INTO `usuarios` (`id_usuario`, `id_rol`, `es_admin`, `nombre`, `celular`, `correo_electronico`, `pass`, `auth_google`, `esta_activo`, `foto_cuenta`, `fecha_creado`, `fecha_actualizado`) VALUES (NULL, '1', '1', 'Edson Vázquez Cruz', '8333663190', 'correo@electronico.com', 'aaaaaaaaa', NULL, '1', NULL, current_timestamp(), NULL);
