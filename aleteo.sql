CREATE DATABASE aleteo;
USE aleteo;

CREATE TABLE `cliente` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp(),
  `imagen` blob DEFAULT NULL,
  `logo` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `cliente` (`id`, `nombre`, `direccion`, `telefono`, `correo`, `descripcion`, `fecha_creacion`, `fecha_modificacion`, `imagen`, `logo`) VALUES
(1,'Aleteo','', '-', '-', '', now(), now(), '','');

CREATE TABLE `suscripciones` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `nombres` varchar(100) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL UNIQUE,
  `comentarios` varchar(400) DEFAULT NULL,
  `codigo` varchar(30) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_suscripcion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `rol` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Común');

CREATE TABLE `usuarios` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `foto` blob DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp(),
  `id_clie` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `contrasena` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE categoria(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(100) NOT NULL,
    fecha_creacion DATETIME DEFAULT NOW()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE secciones(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    id_categoria INT,
    fecha_creacion DATETIME DEFAULT NOW(),
    FOREIGN KEY (id_categoria) REFERENCES categoria (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE podcast(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(200) NOT NULL,
    descripcion VARCHAR(500) NOT NULL,
    link VARCHAR(100),
    audio BLOB,
    id_seccion INT,
    fecha_creacion DATETIME DEFAULT NOW(),
    FOREIGN KEY (id_seccion) REFERENCES secciones (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

