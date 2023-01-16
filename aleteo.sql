-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-01-2023 a las 21:17:51
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aleteo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apoyanos`
--

CREATE TABLE `apoyanos` (
  `id` smallint(1) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `video` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `apoyanos`
--

INSERT INTO `apoyanos` (`id`, `titulo`, `descripcion`, `imagen`, `video`) VALUES
(4, 'Hola mundo', 'asndfladnsflk dnjasfasdfñnasfasdnfkmlasdñk dmfasdf', 'ImgApoy6059ea58496bd.jpg', 'https://www.youtube.com/watch?v=y6QBaZHltJw&list=RDMMy6QBaZHltJw&start_radio=1&ab_channel=RominaValeria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre_categoria` varchar(100) NOT NULL,
  `desc_categoria` varchar(200) NOT NULL COMMENT 'Comentarios adicionales de la categoría.',
  `cant_reg` int(11) NOT NULL COMMENT 'Cantidad total de registros en categoría',
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre_categoria`, `desc_categoria`, `cant_reg`, `fecha_creacion`) VALUES
(1, 'Deslizador Inicio', 'Deslizador página inicio. Si tiene vídeo es necesario colocar el \"Iframe\" de Youtube. Si no, es necesario dejar el campo vacío.', 3, '2020-09-29 13:20:08'),
(2, 'Tres Cartas (Inicio)', 'Las tres cartas que aparecen en la página Inicio. Éstas requieren una imagen en tamaño 320x180.', 4, '2020-10-05 20:03:17'),
(3, 'Frases página Inicio', 'Frases relacionadas con aleteo al Inicio de página.', 3, '2020-10-06 13:17:10'),
(4, 'Logos Footer', 'Agregación de los logos de las partes participantes', 10, '2020-12-30 18:09:02'),
(5, 'Redes Sociales Footer', 'Redes Sociales Footer', 5, '2020-12-30 18:46:58'),
(6, 'Información de Contacto', 'Información de Contacto', 0, '2021-01-23 12:22:48'),
(7, 'Descripción página principal', 'Breve descripción de la página', 1, '2021-02-15 20:35:11'),
(8, 'Suscribete', 'Suscribete', 1, '2021-02-15 21:18:31'),
(9, 'Datos Contacto', 'Datos Contacto', 2, '2021-04-03 17:57:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp(),
  `imagen` blob DEFAULT NULL,
  `imagen2` blob NOT NULL,
  `logo` blob DEFAULT NULL,
  `ico` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `direccion`, `telefono`, `correo`, `descripcion`, `fecha_creacion`, `fecha_modificacion`, `imagen`, `imagen2`, `logo`, `ico`) VALUES
(1, 'Aleteo - Transmedia', '', '-', '-', '', '2020-09-13 16:15:54', '2020-09-13 16:15:54', NULL, '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `construccion`
--

CREATE TABLE `construccion` (
  `id_constr` int(11) NOT NULL,
  `nom_pagina` varchar(30) NOT NULL,
  `identificador` varchar(20) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `img_constr` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `construccion`
--

INSERT INTO `construccion` (`id_constr`, `nom_pagina`, `identificador`, `estado`, `img_constr`) VALUES
(1, 'Inicio', 'Inicio', 1, ''),
(2, 'Podcast', 'Podcast', 1, ''),
(3, 'Periódico Digital', 'periodicoDigital', 1, 'Img603f047513a4f.jpg'),
(4, 'Organizaciones', 'Organizaciones', 1, ''),
(5, 'Serie Web', 'Serie', 1, 'Img603f048606329.jpg'),
(6, 'Video Juego', 'videoJuego', 1, 'Img6074edb181a10.gif'),
(7, 'Apoyanos', 'Apoyanos', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datauser`
--

CREATE TABLE `datauser` (
  `du_id` int(11) NOT NULL,
  `du_nombres` varchar(50) NOT NULL,
  `du_descripcion` text DEFAULT NULL,
  `du_img` varchar(100) DEFAULT NULL,
  `id_rol` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `datauser`
--

INSERT INTO `datauser` (`du_id`, `du_nombres`, `du_descripcion`, `du_img`, `id_rol`, `fecha_creacion`) VALUES
(1, 'Edison González', 'Este director de aleteo transmedia es una cosa pero baaarbara doctor... cosa pero baaarrrrbara', 'ImgUser60aaa2d38b951.jpg', 1, '2021-05-22 14:15:00'),
(2, 'Jhon González', 'Jhon es la persona encargada del desarrollo de la plataforma web. Él junto con su ingenio y su belleza han logrado lo que se puede evidenciar en la página que estás disfrutando. ', 'ImgUser60aaa2f5670f6.jpg', 4, '2021-05-23 13:38:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `futuro`
--

CREATE TABLE `futuro` (
  `id` int(11) NOT NULL,
  `fut_titulo` varchar(200) NOT NULL,
  `fut_descripcion` text NOT NULL,
  `fut_imagen` varchar(200) NOT NULL,
  `fecha_creacion_text` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `futuro`
--

INSERT INTO `futuro` (`id`, `fut_titulo`, `fut_descripcion`, `fut_imagen`, `fecha_creacion_text`, `fecha_creacion`) VALUES
(2, 'Premisas futuro 2', '<p>En informática, Hola mundo es un programa que imprime el texto «¡Hola, mundo!» en un dispositivo de visualización, en la mayoría de los casos la pantalla de un monitor. Este programa suele ser usado como introducción al estudio de un lenguaje de programación, siendo un primer ejercicio típico, y se considera fundamental desde el punto de vista didáctico. En algunos lenguajes, configurar un conjunto de herramientas básicas completo desde cero hasta el punto en que los programas triviales puedan ser compilados y ejecutados involucra una cantidad de trabajo sustancial. Por esta razón, generalmente es usado un programa muy simple para probar un nuevo conjunto de herramientas. En los sistemas basados en microcontroladores empleados para el aprendizaje, se suele considerar Hola mundo el programa que permite poner en modo intermitente un led.1​ El programa consiste en mandar alternativamente un nivel alto y uno bajo por uno de los puertos del sistema, dando a cada uno de dichos niveles un valor de retardo. El primer ejemplo documentado de un programa Hola Mundo fue en 1973, en la obra «A tutorial introduction to the language B» de Brian Kernighan.2​</p>', 'Img603f048606329.jpg', '01 Abr 2021', '2021-04-11 10:54:40'),
(4, 'Publicidad Nueva prueba', '<h4>Desde 2013, la red de <a href=\"https://es.wikipedia.org/wiki/Windows_Live_Messenger\">Windows Live Messenger</a> (anteriormente MSN Messenger) se integró a Skype tras la compra de <a href=\"https://es.wikipedia.org/wiki/Microsoft\">Microsoft</a>; un usuario MSN inicia sesión con las mismas credenciales que usaba en la red anterior para comunicarse con otro contacto de Windows Live o Skype pero solo en texto; para usar el audio y video tiene que vincular su cuenta <a href=\"https://es.wikipedia.org/wiki/Microsoft_Outlook\">Hotmail</a>/<a href=\"https://es.wikipedia.org/wiki/Microsoft_Outlook\">Outlook</a> con Skype.</h4>', 'ImgFut607349b206bbf.jpg', '11 Abr 2021', '2021-04-11 13:21:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opiniones`
--

CREATE TABLE `opiniones` (
  `id_opinion` int(11) NOT NULL,
  `texto_opinion` text NOT NULL,
  `id_periodico` int(11) NOT NULL,
  `fecha_opinion` int(11) NOT NULL,
  `fecha_opinion_text` varchar(50) DEFAULT NULL,
  `modulo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `opiniones`
--

INSERT INTO `opiniones` (`id_opinion`, `texto_opinion`, `id_periodico`, `fecha_opinion`, `fecha_opinion_text`, `modulo`) VALUES
(0, 'hola', 0, 0, '10 Abril 2021', 'periodico'),
(0, 'Hola Mundo', 0, 0, '11 Abril 2021', 'HaciaFuturo'),
(0, 'adASDasdASDasd', 0, 0, '11 Abril 2021', 'HaciaFuturo'),
(0, 'Holass miund', 0, 0, '14 Abril 2021', 'podcast'),
(0, 'Excelente Serie', 0, 0, '21 Abril 2021', 'SerieWeb'),
(0, 'Comentar sirve', 0, 0, '21 Abril 2021', 'SerieWeb'),
(0, 'Hola', 0, 0, '21 Abril 2021', 'podcast'),
(0, 'Hola ', 0, 0, '21 Abril 2021', 'apoyanos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodico`
--

CREATE TABLE `periodico` (
  `id_periodico` int(11) NOT NULL,
  `per_titulo` varchar(100) NOT NULL,
  `per_contratitulo` varchar(500) DEFAULT NULL,
  `per_autor` varchar(100) NOT NULL,
  `per_texto` text NOT NULL,
  `per_image` longblob DEFAULT NULL,
  `per_link_img` varchar(200) DEFAULT NULL,
  `per_link_pie_img` varchar(500) DEFAULT NULL,
  `fecha_publico` varchar(30) NOT NULL COMMENT 'Fecha en que se muestra el contenido',
  `fecha_publico_date` date DEFAULT NULL,
  `fecha_publicacion` date DEFAULT NULL COMMENT 'Fecha para mostrar al público',
  `per_fecha_ingreso` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `periodico`
--

INSERT INTO `periodico` (`id_periodico`, `per_titulo`, `per_contratitulo`, `per_autor`, `per_texto`, `per_image`, `per_link_img`, `per_link_pie_img`, `fecha_publico`, `fecha_publico_date`, `fecha_publicacion`, `per_fecha_ingreso`) VALUES
(1, 'El estado colombiano definitivamente se separa en tres países. ', 'Ante la arremetida de conflictos internos, Colombia se divide en tres estados independientes. Conozca cada gobierno, sus sistemas políticos, gobernantes y repercusiones sociales.', 'Redacción oficial.', '<p>6 de noviembre de 2029.<br>Por: Redacción oficial.</p><p><i>Ante la arremetida de conflictos internos, Colombia se divide en tres estados independientes. Conozca cada gobierno, sus sistemas políticos, gobernantes y repercusiones sociales.</i></p><h4><br data-cke-filler=\"true\"></h4><h4>Después de los hechos ocurridos frente a la ONU en donde supuestos terroristas del estado colombiano atentaron contra esta organización y que fuera considerado un país olvidado por el mundo (además de estar controlados por un Estado militar), empresarios y políticos de una misma visión del norte del país consiguieron emanciparse de la nación.</h4><h4><br data-cke-filler=\"true\"></h4><h4>Esto fue seguido por la comunidad indígena y afrodescendiente que decidieron migrar a la zona sur del país, en donde también se emanciparon creando otro estado, muchos incluso en desacuerdo por dejar zonas como San Basilio de Palenque, amenazada por grupos insurgentes.</h4><h4><br data-cke-filler=\"true\"></h4><h4>Con esto, Colombia se dividió en tres estados, cada uno regido por tres tipos de visiones sociales y políticas diferentes, aquí se las contamos:</h4><h4><br data-cke-filler=\"true\"></h4><h4><strong>País Andino</strong></h4><h4><br data-cke-filler=\"true\"></h4><h4>Población: 20.831.000 personas.</h4><h4>Departamentos: 14 departamentos.</h4><h4>Capital: Bogotá.</h4><h4>Tipo de Estado: Dictadura Militar</h4><h4><br data-cke-filler=\"true\"></h4><h4>Este estado es dirigido por el general Ramiro Benavidez Romero con un gabinete militar que lo preside. No tiene relación con otras regiones del mundo, debido a que es el gobierno que fue bloqueado por los demás países. Su gobierno ha sido considerado ilegítimo por sus habitantes que ya no pueden pasar a otras naciones, siendo prácticamente encarcelados en su propio país. Su política de estado está encaminada a la ruralidad con fines mercantiles de narcotráfico de nuevas drogas, entre ellas el FO, y el control de la ciudad, dejando la imposibilidad de avance social en muchos ámbitos, tecnología, arte, cultura, entre otros.</h4><h4><br data-cke-filler=\"true\"></h4><h4><strong>País Caribe-Pacífico</strong></h4><h4><br data-cke-filler=\"true\"></h4><h4>Población: 18.750.321 personas.</h4><h4>Departamentos: 11 departamentos.</h4><h4>Capital: Medellín.</h4><h4>Tipo de Estado: Democracia neoliberal</h4><h4><br data-cke-filler=\"true\"></h4><h4>Estado dirigido por Tomás Martín Méndez, elegido poco después en elecciones democráticas (muchos estipulan fraudes en éstas). Gracias a grandes luchas internacionales lograron liberar el país de la caución de los demás gobiernos del mundo y tiene libre comercio internacional. Aunque parece sofisticado, sobretodo por el avance tecnológico, todo se camufla en la construcción de este a partir del narcotráfico de drogas tradicionales. Sus habitantes viven en dos clases sociales con mucha diferencia, la clase alta y la clase baja, pero estipulan que tienen libertad y no se mueren del hambre como el país de al lado (Andino). La corrupción en este país ha logrado estándares tan altos que superan al país colombiano en sus peores tiempos. El poder se concentra en el departamento de Antioquia y el Atlántico.</h4><h4><br data-cke-filler=\"true\"></h4><h4><strong>País Amazónico</strong></h4><h4><br data-cke-filler=\"true\"></h4><h4>Población: 11.340.200 personas.</h4><h4>Departamentos: 6 departamentos.</h4><h4>Capital: Leticia</h4><h4>Tipo de Estado: Cabildo comunitario</h4><h4><br data-cke-filler=\"true\"></h4><h4>Muchos estipulaban este como un estado fallido, pero es uno de los más prósperos desde la separación. Su gobierno dado por un representante de los seis departamentos con igualdad de condiciones y con las mismas capacidades se centra en el acercamiento a la naturaleza, en defensa del Amazonas y la expulsión de empresas que la quieran explotar. Aunque se centra en el agro como su principal fuente de producción y trabajo, se especula que ha logrado avances científicos y sociales tan importantes que puede considerarse una sociedad prospera y avanzada. La ONU le abrió las puertas a lo cual se negaron con una carta, en donde rescatamos una frase que se volvió famosa: “Todas las naciones están contaminadas por la avaricia del hombre, nosotros no queremos su veneno”.</h4>', NULL, 'ImgPer6046b770d7d32.jpg', 'Ante la arremetida de conflictos internos, Colombia se divide en tres estados independientes. Conozc ', '11 Jul 2029', '2029-07-11', '2021-03-06', '2021-03-06 13:40:22'),
(3, 'asdfasdf', 'asdfasdfasdf', 'asdfasdfasdf', '<p>6 de noviembre de 2029.<br>Por: Redacción oficial.</p><p><i>Ante la arremetida de conflictos internos, Colombia se divide en tres estados independientes. Conozca cada gobierno, sus sistemas políticos, gobernantes y repercusiones sociales.</i></p><p>6 de noviembre de 2029.<br>Por: Redacción oficial.</p><p><i>Ante la arremetida de conflictos internos, Colombia se divide en tres estados independientes. Conozca cada gobierno, sus sistemas políticos, gobernantes y repercusiones sociales.</i></p><p><br data-cke-filler=\"true\"></p><h4><br data-cke-filler=\"true\"></h4><h4>Después de los hechos ocurridos frente a la ONU en donde supuestos terroristas del estado colombiano atentaron contra esta organización y que fuera considerado un país olvidado por el mundo (además de estar controlados por un Estado militar), empresarios y políticos de una misma visión del norte del país consiguieron emanciparse de la nación.</h4><h4><br data-cke-filler=\"true\"></h4><h4>Esto fue seguido por la comunidad indígena y afrodescendiente que decidieron migrar a la zona sur del país, en donde también se emanciparon creando otro estado, muchos incluso en desacuerdo por dejar zonas como San Basilio de Palenque, amenazada por grupos insurgentes.</h4><h4><br data-cke-filler=\"true\"></h4><h4>Con esto, Colombia se dividió en tres estados, cada uno regido por tres tipos de visiones sociales y políticas diferentes, aquí se las contamos:</h4><h4><br data-cke-filler=\"true\"></h4><h4><strong>País Andino</strong></h4><h4><br data-cke-filler=\"true\"></h4><h4>Población: 20.831.000 personas.</h4><h4>Departamentos: 14 departamentos.</h4><h4>Capital: Bogotá.</h4><h4>Tipo de Estado: Dictadura Militar</h4><h4><br data-cke-filler=\"true\"></h4><h4>Este estado es dirigido por el general Ramiro Benavidez Romero con un gabinete militar que lo preside. No tiene relación con otras regiones del mundo, debido a que es el gobierno que fue bloqueado por los demás países. Su gobierno ha sido considerado ilegítimo por sus habitantes que ya no pueden pasar a otras naciones, siendo prácticamente encarcelados en su propio país. Su política de estado está encaminada a la ruralidad con fines mercantiles de narcotráfico de nuevas drogas, entre ellas el FO, y el control de la ciudad, dejando la imposibilidad de avance social en muchos ámbitos, tecnología, arte, cultura, entre otros.</h4><h4><br data-cke-filler=\"true\"></h4><h4><strong>País Caribe-Pacífico</strong></h4><h4><br data-cke-filler=\"true\"></h4><h4>Población: 18.750.321 personas.</h4><h4>Departamentos: 11 departamentos.</h4><h4>Capital: Medellín.</h4><h4>Tipo de Estado: Democracia neoliberal</h4><h4><br data-cke-filler=\"true\"></h4><h4>Estado dirigido por Tomás Martín Méndez, elegido poco después en elecciones democráticas (muchos estipulan fraudes en éstas). Gracias a grandes luchas internacionales lograron liberar el país de la caución de los demás gobiernos del mundo y tiene libre comercio internacional. Aunque parece sofisticado, sobretodo por el avance tecnológico, todo se camufla en la construcción de este a partir del narcotráfico de drogas tradicionales. Sus habitantes viven en dos clases sociales con mucha diferencia, la clase alta y la clase baja, pero estipulan que tienen libertad y no se mueren del hambre como el país de al lado (Andino). La corrupción en este país ha logrado estándares tan altos que superan al país colombiano en sus peores tiempos. El poder se concentra en el departamento de Antioquia y el Atlántico.</h4><h4><br data-cke-filler=\"true\"></h4><h4><strong>País Amazónico</strong></h4><h4><br data-cke-filler=\"true\"></h4><h4>Población: 11.340.200 personas.</h4><h4>Departamentos: 6 departamentos.</h4><h4>Capital: Leticia</h4><h4>Tipo de Estado: Cabildo comunitario</h4><h4><br data-cke-filler=\"true\"></h4><h4>Muchos estipulaban este como un estado fallido, pero es uno de los más prósperos desde la separación. Su gobierno dado por un representante de los seis departamentos con igualdad de condiciones y con las mismas capacidades se centra en el acercamiento a la naturaleza, en defensa del Amazonas y la expulsión de empresas que la quieran explotar. Aunque se centra en el agro como su principal fuente de producción y trabajo, se especula que ha logrado avances científicos y sociales tan importantes que puede considerarse una sociedad prospera y avanzada. La ONU le abrió las puertas a lo cual se negaron con una carta, en donde rescatamos una frase que se volvió famosa: “Todas las naciones están contaminadas por la avaricia del hombre, nosotros no queremos su veneno”.</h4>', NULL, 'ImgPer605004d02fe10.jpg', 'Hola Mundo', '25 Mar 2021', '2021-03-25', '2021-03-17', '2021-03-15 20:07:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `podcast`
--

CREATE TABLE `podcast` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  `audio` blob DEFAULT NULL,
  `id_seccion` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Común');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rolesuser`
--

CREATE TABLE `rolesuser` (
  `rol_id` int(11) NOT NULL,
  `rol_nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rolesuser`
--

INSERT INTO `rolesuser` (`rol_id`, `rol_nombre`) VALUES
(1, 'Director'),
(2, 'Actor'),
(3, 'Actriz'),
(4, 'Desarrollador Web');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE `secciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `sec_titulo` varchar(50) NOT NULL COMMENT 'Título de sección',
  `sec_desc` varchar(500) NOT NULL COMMENT 'Descripción de la sección',
  `sec_img` text NOT NULL COMMENT 'imgágen',
  `sec_iframe` text NOT NULL COMMENT 'frame',
  `sec_link_redirect` varchar(1000) NOT NULL,
  `sec_icon` varchar(20) NOT NULL,
  `sec_estado` tinyint(1) NOT NULL COMMENT 'Estado activo / inactvio',
  `sec_posicion` int(11) NOT NULL COMMENT 'Posición para mostrar',
  `id_categoria` int(11) NOT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `secciones`
--

INSERT INTO `secciones` (`id`, `nombre`, `sec_titulo`, `sec_desc`, `sec_img`, `sec_iframe`, `sec_link_redirect`, `sec_icon`, `sec_estado`, `sec_posicion`, `id_categoria`, `fecha_creacion`) VALUES
(1, 'Vídeo Inicio', 'CROWDFUNDING', 'Este es el contenido', '', '<iframe width=\"650\" height=\"400\" src=\"https://www.youtube.com/embed/dqJ6p7lhg8Y\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', '', '', 1, 1, 1, '2020-09-29 13:38:11'),
(2, 'Imágne inicio deslizadores', 'LA MARIPOSA ALETEA', '\"El aleteo de una mariposa puede generar un tsunami al otro lado del mundo\".', 'Mariposa 1.png', '', 'serieweb.php', '', 1, 2, 1, '2020-10-05 19:38:54'),
(3, 'Podcast', 'Podcast', 'En éste podcast encontrarás toda la información hacer de premisas de futuro.', '3Podcast2.jpg', '', '', '', 1, 1, 2, '2020-10-06 12:24:14'),
(4, 'Frase alusiva a la web', '#AleteoHaciaElFuturo', 'Un simple respiro puede cambiar todo lo que conocemos', '2High_Concept.jpg', '', '', 'fa fa-puzzle-piece', 1, 1, 3, '2020-10-06 13:48:27'),
(5, 'Chimenea Cultural', 'Chimenea', 'La chimenea Cultural', 'LogosInstitucionales.png', '', '', '', 1, 1, 4, '2020-12-30 18:11:47'),
(6, 'Facebook', 'Facebook', 'Facebook', '', '', 'https://www.facebook.com/aleteotransmedia', 'fa fa-facebook', 1, 1, 5, '2020-12-30 19:04:27'),
(7, 'Twitter', 'Twitter', 'Twitter', '', '', 'https://twitter.com/CChimenea', 'fa fa-twitter', 1, 2, 5, '2020-12-30 19:04:27'),
(8, 'Instagram', 'Instagram', 'Instagram', '', '', 'https://www.instagram.com/aleteo_transmedia/', 'fa fa-instagram', 1, 3, 5, '2020-12-30 19:05:04'),
(9, 'Youtube', 'Youtube', 'Youtube', '', '', 'https://www.youtube.com/channel/UCVBNYMpvj4liLG6xSaMCJWQ/featured', 'fa fa-youtube', 1, 4, 5, '2020-12-30 20:18:17'),
(10, 'Periódico Digital', 'Periódico Digital', 'Texto sobre un futuro cercano.', 'Periodico_digital.jpg', '', '', '', 1, 2, 2, '2021-01-08 17:38:40'),
(11, 'Video Juego', 'Video Juego', 'Este es el vídeo juego de Aleteo Transmedia', 'Mariposa 3.png', '', '', '', 1, 3, 2, '2021-01-08 17:39:27'),
(12, 'Descripción Proyecto', 'SOBRE EL CONTENIDO', 'Todos los elementos creativos del contenido de esta página tienen derechos patrimoniales avalados por derechos de autor y de compra.\r\n\r\nCualquier tipo de uso no cultural o formativo y/o que convegan a generar recursos económicos sin el consentimiento de los propietarios del contenido de la página serán sancionados por ley. \r\n\r\nAleteo – Transmedia, se reserva los derechos de los contenidos realizados en este espacio virtual.\r\n\r\nProyecto apoyado por: Alcaldía mayor de Bogotá, Alcaldía de Suba, Ida', '', '', '', '', 1, 1, 7, '2021-02-15 20:36:35'),
(13, 'Suscribete', 'Suscribete', 'Si deseas recibir el contenido de Aleteo – Transmedia y novedades sobre nuestro proyecto déjanos tus datos. ', '', '', '', '', 1, 1, 8, '2021-02-15 21:19:20'),
(19, 'Datos Contacto', 'Teléfono', '+57 3214175816', '', '', 'https://api.whatsapp.com/send?phone=+573214175816&text=%C2%A1Hola!%20Deseo%20conocer%20m%C3%A1s%20sobre%20Aleteo%20-%20Transmedia', '', 1, 1, 9, '2021-04-03 17:59:33'),
(20, 'Correo', 'Correo', 'proyectoaleteoproduccion@gmail.com', '', '', 'proyectoaleteoproduccion@gmail.com', '', 1, 2, 9, '2021-04-03 18:02:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `serieweb`
--

CREATE TABLE `serieweb` (
  `id` int(11) NOT NULL,
  `serie_titulo` varchar(500) NOT NULL,
  `serie_descipcion` text NOT NULL,
  `serie_img` varchar(200) NOT NULL,
  `serie_video` varchar(500) NOT NULL,
  `serie_clasificacion` int(11) NOT NULL,
  `serie_fecha_creacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `serieweb`
--

INSERT INTO `serieweb` (`id`, `serie_titulo`, `serie_descipcion`, `serie_img`, `serie_video`, `serie_clasificacion`, `serie_fecha_creacion`) VALUES
(1, 'Este es el título del primer capítulo', 'En el primer capitulo, Camila tiene que ir en búsqueda de la gema del infinito si no tony stark se muere, y se muere de regacho sabes? porque está re mal.', 'Periodico_digital.jpg', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/dqJ6p7lhg8Y\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 1, '2021-04-21 20:01:35'),
(2, 'Este es el título de un contenido adicioanl', 'En el primer capitulo, Camila tiene que ir en búsqueda de', 'Periodico_digital.jpg', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/7iNbnineUCI\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 1, '2021-04-21 20:02:53'),
(3, 'Este es el título del 2do Capítulo', 'En el contnido adicional, Carlos tiene que ir en búsqueda de la gema del infinito si no tony stark se muere, y se muere de regacho sabes? porque está re mal.', 'Periodico_digital.jpg', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/bxYEZTcagY0\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 1, '2021-04-21 20:02:53'),
(5, 'Pruebas de las pruebas ', 'asdfasdf adfasd a ad a fad asdfads a adfasd a df adf   adfadsf ad adsf asd fad adf asd fa  a a a dfad fa sfads adsf ad fad f', 'ImgSer60a9295bc0a13.jpg', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ZmeudwRMrsU\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 1, '2021-05-22 10:55:07'),
(6, 'Hola Mundo', 'Este es el título de un contenido adicioanl	En el primer capitulo, Camila tiene que ir en búsq\r\nEste es el título de un contenido adicioanl	En el primer capitulo, Camila tiene que ir en búsq', 'ImgSer60a92a6071d70.jpg', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/bxYEZTcagY0\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 1, '2021-05-22 10:59:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suscripciones`
--

CREATE TABLE `suscripciones` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `comentarios` varchar(400) DEFAULT NULL,
  `codigo` varchar(30) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_suscripcion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `suscripciones`
--

INSERT INTO `suscripciones` (`id`, `nombres`, `telefono`, `email`, `comentarios`, `codigo`, `estado`, `fecha_suscripcion`) VALUES
(7, 'Jhon Gonzàlez', NULL, 'jhonja971106@gmail.com', NULL, NULL, NULL, '2021-03-03 14:10:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
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

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `nombres`, `estado`, `foto`, `fecha_creacion`, `fecha_modificacion`, `id_clie`, `id_rol`, `contrasena`) VALUES
(1, 'admin', 'Administrador', 1, NULL, '2021-01-24 10:42:21', '2021-01-24 10:42:21', 1, 1, '$2y$10$AO4BrMLyolVPxNNP5olmX.IigI7IOsyVvkK.6Hnm6Ph46rD1EiIeO'),
(2, 'edalgole', 'Edison González', 1, NULL, '2023-01-06 11:47:39', '2023-01-06 11:47:39', 1, 1, '$2y$10$AO4BrMLyolVPxNNP5olmX.IigI7IOsyVvkK.6Hnm6Ph46rD1EiIeO'),
(3, 'edalgole', 'Edison González', 1, NULL, '2023-01-06 11:47:52', '2023-01-06 11:47:52', 1, 1, '$2y$10$YX9/06umhngT4dsYntFlGuoJIEfKt/r9V.J5dTB48uvlvvtFn/O6W');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitador`
--

CREATE TABLE `visitador` (
  `id_visitador` varchar(100) NOT NULL,
  `fecha_primer_visita` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `visitador`
--

INSERT INTO `visitador` (`id_visitador`, `fecha_primer_visita`) VALUES
('192.168.0.10', '2021-03-08 20:41:04'),
('192.168.0.13', '2021-01-24 12:43:54'),
('192.168.0.14', '2021-04-21 19:07:37'),
('192.168.0.16', '2021-06-27 17:10:13'),
('192.168.0.17', '2021-03-08 20:25:26'),
('192.168.0.19', '2021-06-23 19:53:47'),
('192.168.0.23', '2021-07-08 13:34:20'),
('::1', '2021-01-24 12:35:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE `visitas` (
  `id_vis` int(11) NOT NULL,
  `fecha_visita` datetime DEFAULT current_timestamp(),
  `id_visitador` varchar(100) DEFAULT NULL,
  `pagina` varchar(20) DEFAULT NULL,
  `dispositivo` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `visitas`
--

INSERT INTO `visitas` (`id_vis`, `fecha_visita`, `id_visitador`, `pagina`, `dispositivo`) VALUES
(1, '2021-01-24 12:35:01', '::1', NULL, 1),
(2, '2021-01-24 12:36:24', '::1', NULL, 0),
(3, '2021-01-24 12:38:04', '::1', NULL, 0),
(4, '2021-01-24 12:39:54', '::1', NULL, 0),
(5, '2021-01-24 12:43:54', '192.168.0.13', NULL, 0),
(6, '2021-01-24 12:44:13', '192.168.0.13', NULL, 0),
(7, '2021-01-24 12:44:20', '192.168.0.13', NULL, 0),
(8, '2021-01-24 12:44:23', '192.168.0.13', NULL, 0),
(9, '2021-01-24 12:44:24', '192.168.0.13', NULL, 0),
(10, '2021-01-24 12:44:26', '192.168.0.13', NULL, 0),
(11, '2021-01-24 12:45:01', '192.168.0.13', NULL, 0),
(12, '2021-01-24 12:45:05', '192.168.0.13', NULL, 0),
(13, '2021-01-24 12:45:53', '192.168.0.13', NULL, 0),
(14, '2021-01-24 12:48:03', '::1', NULL, 0),
(15, '2021-01-24 12:49:41', '::1', NULL, 0),
(16, '2021-01-24 12:49:55', '::1', NULL, 0),
(17, '2021-01-24 12:50:08', '192.168.0.13', NULL, 0),
(18, '2021-01-24 20:38:08', '::1', NULL, 0),
(19, '2021-01-27 16:32:11', '::1', NULL, 0),
(20, '2021-01-27 16:36:09', '::1', NULL, 0),
(21, '2021-01-27 16:48:34', '::1', NULL, 0),
(22, '2021-01-27 16:49:07', '::1', NULL, 0),
(23, '2021-01-30 21:49:15', '::1', NULL, 0),
(24, '2021-01-30 21:54:19', '::1', NULL, 0),
(25, '2021-01-30 22:02:28', '::1', NULL, 0),
(26, '2021-01-31 10:21:35', '::1', NULL, 0),
(27, '2021-01-31 10:50:01', '::1', 'Inicio', 0),
(28, '2021-01-31 10:50:35', '::1', 'Podcast', 0),
(29, '2021-02-01 18:30:04', '::1', 'Inicio', 0),
(30, '2021-02-01 18:40:28', '::1', 'Podcast', 0),
(31, '2021-02-01 18:42:34', '::1', 'Inicio', 0),
(32, '2021-02-01 18:54:33', '::1', 'Inicio', 0),
(33, '2021-02-01 18:55:14', '::1', 'Podcast', 0),
(34, '2021-02-03 18:06:33', '::1', 'Inicio', 0),
(35, '2021-02-03 18:06:36', '::1', 'Inicio', 0),
(36, '2021-02-08 18:24:24', '::1', 'Inicio', 0),
(37, '2021-02-08 18:25:29', '::1', 'Podcast', 0),
(38, '2021-02-08 18:26:24', '::1', 'Inicio', 0),
(39, '2021-02-08 18:31:35', '::1', 'Podcast', 0),
(40, '2021-02-08 18:34:17', '::1', 'Inicio', 0),
(41, '2021-02-08 18:34:19', '::1', 'Inicio', 0),
(42, '2021-02-11 20:33:54', '::1', 'Inicio', 0),
(43, '2021-02-11 21:33:55', '::1', 'Inicio', 0),
(44, '2021-02-11 21:35:07', '::1', 'Inicio', 0),
(45, '2021-02-11 21:36:40', '::1', 'Inicio', 0),
(46, '2021-02-11 21:39:05', '::1', 'Inicio', 0),
(47, '2021-02-11 21:39:05', '::1', 'Inicio', 0),
(48, '2021-02-11 21:47:12', '::1', 'Inicio', 0),
(49, '2021-02-11 21:47:16', '::1', 'Inicio', 0),
(50, '2021-02-11 21:47:44', '::1', 'Inicio', 0),
(51, '2021-02-11 21:48:39', '::1', 'Inicio', 0),
(52, '2021-02-11 21:49:21', '::1', 'Inicio', 0),
(53, '2021-02-11 21:49:30', '::1', 'Podcast', 0),
(54, '2021-02-11 22:05:16', '::1', 'Inicio', 0),
(55, '2021-02-11 22:05:37', '::1', 'Inicio', 0),
(56, '2021-02-15 20:00:45', '::1', 'Inicio', 0),
(57, '2021-02-15 20:06:30', '::1', 'Inicio', 0),
(58, '2021-02-15 20:07:32', '::1', 'Inicio', 0),
(59, '2021-02-15 20:07:54', '::1', 'Inicio', 0),
(60, '2021-02-15 20:08:16', '::1', 'Inicio', 0),
(61, '2021-02-15 20:08:51', '::1', 'Inicio', 0),
(62, '2021-02-15 20:11:47', '::1', 'Inicio', 0),
(63, '2021-02-15 20:43:08', '::1', 'Inicio', 0),
(64, '2021-02-15 20:43:15', '::1', 'Inicio', 0),
(65, '2021-02-15 21:10:05', '::1', 'Inicio', 0),
(66, '2021-02-15 21:10:59', '::1', 'Inicio', 0),
(67, '2021-02-15 21:11:35', '::1', 'Inicio', 0),
(68, '2021-02-15 21:12:26', '::1', 'Inicio', 0),
(69, '2021-02-15 21:12:49', '::1', 'Inicio', 0),
(70, '2021-02-15 21:14:39', '::1', 'Inicio', 0),
(71, '2021-02-15 21:20:49', '::1', 'Inicio', 0),
(72, '2021-02-15 21:21:09', '::1', 'Inicio', 0),
(73, '2021-02-15 21:23:05', '::1', 'Inicio', 0),
(74, '2021-02-15 21:23:22', '::1', 'Inicio', 0),
(75, '2021-02-16 14:23:45', '::1', 'Inicio', 0),
(76, '2021-02-24 22:40:29', '::1', 'Inicio', 0),
(77, '2021-02-24 22:58:42', '::1', 'Inicio', 0),
(78, '2021-02-24 23:04:39', '::1', 'Inicio', 0),
(79, '2021-02-24 23:09:40', '::1', 'Inicio', 0),
(80, '2021-02-26 20:38:47', '::1', 'Inicio', 0),
(81, '2021-02-26 20:44:42', '::1', 'Inicio', 0),
(82, '2021-02-26 21:39:07', '::1', 'Inicio', 0),
(83, '2021-02-26 21:39:10', '::1', 'Podcast', 0),
(84, '2021-02-26 21:47:50', '::1', 'Organizaciones', 0),
(85, '2021-02-26 21:48:23', '::1', 'Organizaciones', 0),
(86, '2021-02-28 10:23:49', '::1', 'Inicio', 0),
(87, '2021-03-01 16:02:43', '::1', 'Inicio', 0),
(88, '2021-03-01 20:52:35', '::1', 'Inicio', 0),
(89, '2021-03-02 08:22:50', '::1', 'Inicio', 0),
(90, '2021-03-02 15:32:46', '::1', 'Periodico Digital', 0),
(91, '2021-03-02 15:34:18', '::1', 'Periodico Digital', 0),
(92, '2021-03-02 15:34:37', '::1', 'Periodico Digital', 0),
(93, '2021-03-02 15:35:20', '::1', 'Periodico Digital', 0),
(94, '2021-03-02 15:40:00', '::1', 'Inicio', 0),
(95, '2021-03-02 15:40:02', '::1', 'Periodico Digital', 0),
(96, '2021-03-02 15:40:09', '::1', 'Periodico Digital', 0),
(97, '2021-03-02 16:34:17', '::1', 'Periodico Digital', 0),
(98, '2021-03-02 16:34:20', '::1', 'Periodico Digital', 0),
(99, '2021-03-02 19:31:59', '::1', 'Inicio', 0),
(100, '2021-03-02 21:00:39', '::1', 'Periodico Digital', 0),
(101, '2021-03-02 21:00:58', '::1', 'Periodico Digital', 0),
(102, '2021-03-02 21:01:09', '::1', 'Video juego', 0),
(103, '2021-03-02 21:01:15', '::1', 'Organizaciones', 0),
(104, '2021-03-02 21:01:18', '::1', 'Apoyanos', 0),
(105, '2021-03-03 11:17:05', '::1', 'Inicio', 0),
(106, '2021-03-03 11:17:08', '::1', 'Periodico Digital', 0),
(107, '2021-03-03 13:53:35', '::1', 'Inicio', 0),
(108, '2021-03-03 13:55:07', '::1', 'Inicio', 0),
(109, '2021-03-03 13:55:55', '::1', 'Inicio', 0),
(110, '2021-03-03 13:56:40', '::1', 'Inicio', 0),
(111, '2021-03-03 13:57:59', '::1', 'Inicio', 0),
(112, '2021-03-03 13:58:39', '::1', 'Inicio', 0),
(113, '2021-03-03 14:01:42', '::1', 'Inicio', 0),
(114, '2021-03-03 14:03:23', '::1', 'Inicio', 0),
(115, '2021-03-03 14:06:03', '::1', 'Inicio', 0),
(116, '2021-03-03 14:07:26', '::1', 'Inicio', 0),
(117, '2021-03-03 14:08:42', '::1', 'Inicio', 0),
(118, '2021-03-03 14:09:08', '::1', 'Inicio', 0),
(119, '2021-03-03 17:50:32', '::1', 'Podcast', 0),
(120, '2021-03-03 18:02:10', '::1', 'Podcast', 0),
(121, '2021-03-03 19:02:17', '::1', 'Podcast', 0),
(122, '2021-03-03 19:02:19', '::1', 'Podcast', 0),
(123, '2021-03-03 20:26:42', '::1', 'Organizaciones', 0),
(124, '2021-03-06 12:22:54', '::1', 'Inicio', 0),
(125, '2021-03-06 12:23:34', '::1', 'Periodico Digital', 0),
(126, '2021-03-06 12:24:59', '::1', 'Periodico Digital', 0),
(127, '2021-03-06 12:26:01', '::1', 'Periodico Digital', 0),
(128, '2021-03-06 12:26:15', '::1', 'Periodico Digital', 0),
(129, '2021-03-06 12:26:25', '::1', 'Periodico Digital', 0),
(130, '2021-03-06 12:26:45', '::1', 'Periodico Digital', 0),
(131, '2021-03-06 12:29:29', '::1', 'Periodico Digital', 0),
(132, '2021-03-06 14:45:44', '::1', 'Periodico Digital', 0),
(133, '2021-03-06 14:46:57', '::1', 'Periodico Digital', 0),
(134, '2021-03-06 14:47:19', '::1', 'Periodico Digital', 0),
(135, '2021-03-06 14:48:13', '::1', 'Periodico Digital', 0),
(136, '2021-03-06 14:48:49', '::1', 'Periodico Digital', 0),
(137, '2021-03-06 14:49:14', '::1', 'Periodico Digital', 0),
(138, '2021-03-06 14:49:20', '::1', 'Periodico Digital', 0),
(139, '2021-03-06 14:49:54', '::1', 'Periodico Digital', 0),
(140, '2021-03-06 14:50:44', '::1', 'Periodico Digital', 0),
(141, '2021-03-06 14:50:56', '::1', 'Periodico Digital', 0),
(142, '2021-03-06 14:52:10', '::1', 'Periodico Digital', 0),
(143, '2021-03-06 14:52:28', '::1', 'Periodico Digital', 0),
(144, '2021-03-06 14:52:59', '::1', 'Periodico Digital', 0),
(145, '2021-03-06 14:55:08', '::1', 'Periodico Digital', 0),
(146, '2021-03-06 14:55:17', '::1', 'Inicio', 0),
(147, '2021-03-06 14:57:18', '::1', 'Periodico Digital', 0),
(148, '2021-03-06 14:57:25', '::1', 'Periodico Digital', 0),
(149, '2021-03-06 14:59:27', '::1', 'Periodico Digital', 0),
(150, '2021-03-06 15:00:02', '::1', 'Periodico Digital', 0),
(151, '2021-03-06 15:00:11', '::1', 'Periodico Digital', 0),
(152, '2021-03-06 15:01:55', '::1', 'Periodico Digital', 0),
(153, '2021-03-06 15:02:22', '::1', 'Periodico Digital', 0),
(154, '2021-03-06 15:04:37', '192.168.0.13', 'Periodico Digital', 0),
(155, '2021-03-06 15:25:09', '::1', 'Periodico Digital', 0),
(156, '2021-03-06 15:25:13', '::1', 'Periodico Digital', 0),
(157, '2021-03-06 15:26:13', '::1', 'Periodico Digital', 0),
(158, '2021-03-06 21:57:10', '::1', 'Inicio', 0),
(159, '2021-03-06 22:17:10', '::1', 'Periodico Digital', 0),
(160, '2021-03-06 22:39:18', '::1', 'Periodico Digital', 0),
(161, '2021-03-06 22:40:20', '::1', 'Periodico Digital', 0),
(162, '2021-03-06 22:40:28', '::1', 'Periodico Digital', 0),
(163, '2021-03-06 22:43:04', '::1', 'Periodico Digital', 0),
(164, '2021-03-06 22:43:36', '::1', 'Periodico Digital', 0),
(165, '2021-03-06 22:43:44', '::1', 'Periodico Digital', 0),
(166, '2021-03-06 22:44:15', '::1', 'Periodico Digital', 0),
(167, '2021-03-06 22:45:13', '::1', 'Periodico Digital', 0),
(168, '2021-03-06 22:45:51', '::1', 'Periodico Digital', 0),
(169, '2021-03-06 22:46:19', '::1', 'Periodico Digital', 0),
(170, '2021-03-06 22:46:26', '::1', 'Periodico Digital', 0),
(171, '2021-03-06 22:46:33', '::1', 'Periodico Digital', 0),
(172, '2021-03-06 22:46:44', '::1', 'Periodico Digital', 0),
(173, '2021-03-06 22:46:49', '::1', 'Periodico Digital', 0),
(174, '2021-03-06 22:47:09', '::1', 'Periodico Digital', 0),
(175, '2021-03-06 22:47:44', '::1', 'Periodico Digital', 0),
(176, '2021-03-06 22:48:06', '::1', 'Periodico Digital', 0),
(177, '2021-03-06 22:48:22', '::1', 'Periodico Digital', 0),
(178, '2021-03-06 22:48:35', '::1', 'Periodico Digital', 0),
(179, '2021-03-06 22:48:53', '::1', 'Periodico Digital', 0),
(180, '2021-03-06 22:49:41', '::1', 'Periodico Digital', 0),
(181, '2021-03-06 22:50:05', '::1', 'Periodico Digital', 0),
(182, '2021-03-06 22:50:19', '::1', 'Periodico Digital', 0),
(183, '2021-03-06 22:50:45', '::1', 'Periodico Digital', 0),
(184, '2021-03-06 22:50:52', '::1', 'Periodico Digital', 0),
(185, '2021-03-06 22:51:40', '::1', 'Periodico Digital', 0),
(186, '2021-03-06 22:51:50', '::1', 'Periodico Digital', 0),
(187, '2021-03-06 22:51:57', '::1', 'Periodico Digital', 0),
(188, '2021-03-06 22:55:34', '::1', 'Periodico Digital', 0),
(189, '2021-03-06 22:55:56', '::1', 'Periodico Digital', 0),
(190, '2021-03-06 22:57:12', '::1', 'Periodico Digital', 0),
(191, '2021-03-06 22:57:31', '::1', 'Periodico Digital', 0),
(192, '2021-03-06 22:57:39', '::1', 'Periodico Digital', 0),
(193, '2021-03-06 22:57:48', '::1', 'Periodico Digital', 0),
(194, '2021-03-06 22:57:56', '::1', 'Periodico Digital', 0),
(195, '2021-03-06 22:58:19', '::1', 'Periodico Digital', 0),
(196, '2021-03-06 22:59:19', '::1', 'Periodico Digital', 0),
(197, '2021-03-06 22:59:25', '::1', 'Periodico Digital', 0),
(198, '2021-03-06 22:59:36', '::1', 'Periodico Digital', 0),
(199, '2021-03-06 23:00:06', '::1', 'Periodico Digital', 0),
(200, '2021-03-06 23:00:20', '::1', 'Periodico Digital', 0),
(201, '2021-03-06 23:00:40', '::1', 'Periodico Digital', 0),
(202, '2021-03-06 23:00:49', '::1', 'Periodico Digital', 0),
(203, '2021-03-06 23:01:12', '::1', 'Periodico Digital', 0),
(204, '2021-03-06 23:01:20', '::1', 'Periodico Digital', 0),
(205, '2021-03-06 23:02:00', '::1', 'Periodico Digital', 0),
(206, '2021-03-06 23:02:11', '::1', 'Periodico Digital', 0),
(207, '2021-03-06 23:02:23', '::1', 'Periodico Digital', 0),
(208, '2021-03-06 23:02:38', '::1', 'Periodico Digital', 0),
(209, '2021-03-06 23:03:01', '::1', 'Periodico Digital', 0),
(210, '2021-03-06 23:03:13', '::1', 'Periodico Digital', 0),
(211, '2021-03-06 23:03:36', '::1', 'Periodico Digital', 0),
(212, '2021-03-06 23:04:15', '::1', 'Periodico Digital', 0),
(213, '2021-03-06 23:04:35', '::1', 'Periodico Digital', 0),
(214, '2021-03-06 23:04:58', '::1', 'Periodico Digital', 0),
(215, '2021-03-06 23:05:18', '::1', 'Periodico Digital', 0),
(216, '2021-03-06 23:05:25', '::1', 'Periodico Digital', 0),
(217, '2021-03-06 23:05:29', '::1', 'Periodico Digital', 0),
(218, '2021-03-06 23:05:57', '::1', 'Periodico Digital', 0),
(219, '2021-03-07 08:50:29', '::1', 'Periodico Digital', 0),
(220, '2021-03-07 09:05:52', '::1', 'Periodico Digital', 0),
(221, '2021-03-07 09:07:56', '::1', 'Periodico Digital', 0),
(222, '2021-03-07 09:09:51', '::1', 'Periodico Digital', 0),
(223, '2021-03-07 09:10:15', '::1', 'Periodico Digital', 0),
(224, '2021-03-07 09:12:11', '::1', 'Periodico Digital', 0),
(225, '2021-03-07 09:12:29', '::1', 'Periodico Digital', 0),
(226, '2021-03-07 09:20:49', '::1', 'Periodico Digital', 0),
(227, '2021-03-07 09:21:12', '::1', 'Periodico Digital', 0),
(228, '2021-03-07 09:21:33', '::1', 'Periodico Digital', 0),
(229, '2021-03-07 09:24:28', '::1', 'Periodico Digital', 0),
(230, '2021-03-07 09:28:01', '::1', 'Periodico Digital', 0),
(231, '2021-03-07 09:28:26', '::1', 'Periodico Digital', 0),
(232, '2021-03-07 09:33:04', '::1', 'Periodico Digital', 0),
(233, '2021-03-07 09:35:20', '::1', 'Periodico Digital', 0),
(234, '2021-03-07 09:42:58', '::1', 'Periodico Digital', 0),
(235, '2021-03-07 09:45:13', '::1', 'Periodico Digital', 0),
(236, '2021-03-07 09:45:41', '::1', 'Periodico Digital', 0),
(237, '2021-03-07 09:46:31', '::1', 'Periodico Digital', 0),
(238, '2021-03-07 09:49:11', '::1', 'Periodico Digital', 0),
(239, '2021-03-07 09:50:32', '::1', 'Periodico Digital', 0),
(240, '2021-03-07 09:50:56', '::1', 'Periodico Digital', 0),
(241, '2021-03-07 09:51:14', '::1', 'Periodico Digital', 0),
(242, '2021-03-07 10:00:00', '::1', 'Periodico Digital', 0),
(243, '2021-03-07 10:16:51', '::1', 'Periodico Digital', 0),
(244, '2021-03-07 10:17:24', '::1', 'Periodico Digital', 0),
(245, '2021-03-07 10:20:08', '::1', 'Periodico Digital', 0),
(246, '2021-03-07 10:22:10', '::1', 'Periodico Digital', 0),
(247, '2021-03-07 10:22:46', '::1', 'Periodico Digital', 0),
(248, '2021-03-07 10:23:30', '::1', 'Periodico Digital', 0),
(249, '2021-03-07 10:23:41', '::1', 'Periodico Digital', 0),
(250, '2021-03-07 10:25:22', '::1', 'Periodico Digital', 0),
(251, '2021-03-07 10:26:30', '::1', 'Periodico Digital', 0),
(252, '2021-03-07 10:27:11', '::1', 'Periodico Digital', 0),
(253, '2021-03-07 10:27:32', '::1', 'Periodico Digital', 0),
(254, '2021-03-07 10:27:44', '::1', 'Periodico Digital', 0),
(255, '2021-03-07 10:27:55', '::1', 'Periodico Digital', 0),
(256, '2021-03-07 15:39:55', '192.168.0.13', 'Periodico Digital', 0),
(257, '2021-03-07 15:51:07', '192.168.0.13', 'Periodico Digital', 0),
(258, '2021-03-07 16:55:13', '192.168.0.13', 'Periodico Digital', 0),
(259, '2021-03-07 16:56:03', '192.168.0.13', 'Organizaciones', 0),
(260, '2021-03-07 16:56:15', '192.168.0.13', 'Apoyanos', 0),
(261, '2021-03-07 16:56:18', '192.168.0.13', 'Inicio', 0),
(262, '2021-03-07 17:13:34', '192.168.0.13', 'Organizaciones', 0),
(263, '2021-03-07 17:15:15', '192.168.0.13', 'Inicio', 0),
(264, '2021-03-07 18:31:50', '::1', 'Periodico Digital', 0),
(265, '2021-03-07 18:32:32', '::1', 'Periodico Digital', 0),
(266, '2021-03-07 18:32:58', '::1', 'Periodico Digital', 0),
(267, '2021-03-07 18:33:08', '::1', 'Periodico Digital', 0),
(268, '2021-03-07 18:33:29', '::1', 'Periodico Digital', 0),
(269, '2021-03-08 08:33:45', '::1', 'Inicio', 0),
(270, '2021-03-08 08:34:09', '::1', 'Periodico Digital', 0),
(271, '2021-03-08 08:35:30', '::1', 'Periodico Digital', 0),
(272, '2021-03-08 18:34:01', '::1', 'Periodico Digital', 0),
(273, '2021-03-08 18:34:39', '::1', 'Periodico Digital', 0),
(274, '2021-03-08 18:35:30', '::1', 'Periodico Digital', 0),
(275, '2021-03-08 18:37:18', '::1', 'Periodico Digital', 0),
(276, '2021-03-08 18:37:32', '::1', 'Periodico Digital', 0),
(277, '2021-03-08 18:38:02', '::1', 'Periodico Digital', 0),
(278, '2021-03-08 18:44:11', '::1', 'Periodico Digital', 0),
(279, '2021-03-08 18:45:10', '::1', 'Periodico Digital', 0),
(280, '2021-03-08 18:47:02', '::1', 'Periodico Digital', 0),
(281, '2021-03-08 18:48:24', '::1', 'Periodico Digital', 0),
(282, '2021-03-08 18:50:04', '::1', 'Periodico Digital', 0),
(283, '2021-03-08 18:51:16', '::1', 'Periodico Digital', 0),
(284, '2021-03-08 18:52:25', '::1', 'Periodico Digital', 0),
(285, '2021-03-08 18:55:02', '::1', 'Periodico Digital', 0),
(286, '2021-03-08 18:55:42', '::1', 'Periodico Digital', 0),
(287, '2021-03-08 18:56:07', '::1', 'Periodico Digital', 0),
(288, '2021-03-08 18:56:32', '::1', 'Periodico Digital', 0),
(289, '2021-03-08 18:56:53', '::1', 'Periodico Digital', 0),
(290, '2021-03-08 18:57:32', '::1', 'Periodico Digital', 0),
(291, '2021-03-08 19:05:04', '::1', 'Periodico Digital', 0),
(292, '2021-03-08 19:05:15', '::1', 'Periodico Digital', 0),
(293, '2021-03-08 19:06:37', '::1', 'Periodico Digital', 0),
(294, '2021-03-08 19:06:48', '::1', 'Periodico Digital', 0),
(295, '2021-03-08 19:07:10', '::1', 'Periodico Digital', 0),
(296, '2021-03-08 19:21:37', '::1', 'Periodico Digital', 0),
(297, '2021-03-08 19:22:04', '::1', 'Periodico Digital', 0),
(298, '2021-03-08 19:23:46', '::1', 'Periodico Digital', 0),
(299, '2021-03-08 19:24:49', '::1', 'Periodico Digital', 0),
(300, '2021-03-08 19:25:33', '::1', 'Periodico Digital', 0),
(301, '2021-03-08 19:26:03', '::1', 'Periodico Digital', 0),
(302, '2021-03-08 19:26:29', '::1', 'Periodico Digital', 0),
(303, '2021-03-08 19:28:13', '::1', 'Periodico Digital', 0),
(304, '2021-03-08 19:33:46', '::1', 'Periodico Digital', 0),
(305, '2021-03-08 19:42:58', '::1', 'Periodico Digital', 0),
(306, '2021-03-08 19:44:23', '::1', 'Periodico Digital', 0),
(307, '2021-03-08 19:45:38', '::1', 'Periodico Digital', 0),
(308, '2021-03-08 19:47:42', '::1', 'Periodico Digital', 0),
(309, '2021-03-08 19:48:34', '::1', 'Periodico Digital', 0),
(310, '2021-03-08 19:48:48', '::1', 'Periodico Digital', 0),
(311, '2021-03-08 19:48:51', '::1', 'Periodico Digital', 0),
(312, '2021-03-08 19:50:24', '::1', 'Periodico Digital', 0),
(313, '2021-03-08 20:15:08', '::1', 'Periodico Digital', 0),
(314, '2021-03-08 20:15:19', '::1', 'Periodico Digital', 0),
(315, '2021-03-08 20:16:21', '::1', 'Periodico Digital', 0),
(316, '2021-03-08 20:17:28', '::1', 'Periodico Digital', 0),
(317, '2021-03-08 20:17:45', '::1', 'Periodico Digital', 0),
(318, '2021-03-08 20:18:18', '::1', 'Periodico Digital', 0),
(319, '2021-03-08 20:19:30', '::1', 'Periodico Digital', 0),
(320, '2021-03-08 20:19:53', '::1', 'Periodico Digital', 0),
(321, '2021-03-08 20:20:15', '::1', 'Inicio', 0),
(322, '2021-03-08 20:20:24', '::1', 'Periodico Digital', 0),
(323, '2021-03-08 20:24:07', '::1', 'Periodico Digital', 0),
(324, '2021-03-08 20:25:26', '192.168.0.17', 'Inicio', 0),
(325, '2021-03-08 20:25:30', '192.168.0.17', 'Periodico Digital', 0),
(326, '2021-03-08 20:25:44', '::1', 'Periodico Digital', 0),
(327, '2021-03-08 20:27:12', '192.168.0.17', 'Periodico Digital', 0),
(328, '2021-03-08 20:28:42', '::1', 'Periodico Digital', 0),
(329, '2021-03-08 20:28:43', '192.168.0.17', 'Periodico Digital', 0),
(330, '2021-03-08 20:28:55', '192.168.0.17', 'Inicio', 0),
(331, '2021-03-08 20:29:00', '192.168.0.17', 'Periodico Digital', 0),
(332, '2021-03-08 20:29:06', '192.168.0.17', 'Periodico Digital', 0),
(333, '2021-03-08 20:29:59', '::1', 'Periodico Digital', 0),
(334, '2021-03-08 20:31:49', '::1', 'Periodico Digital', 0),
(335, '2021-03-08 20:32:39', '::1', 'Periodico Digital', 0),
(336, '2021-03-08 20:32:44', '192.168.0.17', 'Periodico Digital', 0),
(337, '2021-03-08 20:34:03', '::1', 'Periodico Digital', 0),
(338, '2021-03-08 20:34:24', '::1', 'Periodico Digital', 0),
(339, '2021-03-08 20:34:58', '::1', 'Periodico Digital', 0),
(340, '2021-03-08 20:35:16', '::1', 'Periodico Digital', 0),
(341, '2021-03-08 20:36:02', '192.168.0.17', 'Periodico Digital', 0),
(342, '2021-03-08 20:37:13', '192.168.0.13', 'Periodico Digital', 0),
(343, '2021-03-08 20:37:37', '192.168.0.13', 'Periodico Digital', 0),
(344, '2021-03-08 20:37:49', '192.168.0.13', 'Periodico Digital', 0),
(345, '2021-03-08 20:38:01', '192.168.0.13', 'Periodico Digital', 0),
(346, '2021-03-08 20:39:27', '192.168.0.13', 'Periodico Digital', 0),
(347, '2021-03-08 20:41:04', '192.168.0.10', 'Periodico Digital', 0),
(348, '2021-03-08 20:41:08', '192.168.0.10', 'Periodico Digital', 0),
(349, '2021-03-08 21:20:16', '192.168.0.17', 'Inicio', 0),
(350, '2021-03-08 21:39:08', '192.168.0.13', 'Organizaciones', 0),
(351, '2021-03-09 14:21:14', '::1', 'Inicio', 0),
(352, '2021-03-09 14:21:28', '::1', 'Podcast', 0),
(353, '2021-03-09 14:21:34', '::1', 'Podcast', 0),
(354, '2021-03-09 14:21:40', '::1', 'Periodico Digital', 0),
(355, '2021-03-09 18:07:35', '::1', 'Organizaciones', 0),
(356, '2021-03-09 19:12:52', '::1', 'Inicio', 0),
(357, '2021-03-09 19:12:55', '::1', 'Inicio', 0),
(358, '2021-03-09 19:12:57', '::1', 'Organizaciones', 0),
(359, '2021-03-09 19:12:58', '::1', 'Periodico Digital', 0),
(360, '2021-03-10 08:10:54', '::1', 'Inicio', 0),
(361, '2021-03-10 08:11:18', '::1', 'Inicio', 0),
(362, '2021-03-10 08:12:34', '::1', 'Inicio', 0),
(363, '2021-03-10 08:12:41', '::1', 'Periodico Digital', 0),
(364, '2021-03-10 19:30:41', '::1', 'Periodico Digital', 0),
(365, '2021-03-11 21:49:49', '::1', 'Inicio', 0),
(366, '2021-03-11 21:49:51', '::1', 'Periodico Digital', 0),
(367, '2021-03-11 21:51:23', '::1', 'Periodico Digital', 0),
(368, '2021-03-11 21:58:58', '::1', 'Periodico Digital', 0),
(369, '2021-03-11 21:59:47', '192.168.0.17', 'Inicio', 0),
(370, '2021-03-11 21:59:50', '192.168.0.17', 'Periodico Digital', 0),
(371, '2021-03-11 22:06:30', '::1', 'Periodico Digital', 0),
(372, '2021-03-11 22:06:39', '::1', 'Periodico Digital', 0),
(373, '2021-03-11 22:06:43', '::1', 'Periodico Digital', 0),
(374, '2021-03-11 22:07:48', '::1', 'Periodico Digital', 0),
(375, '2021-03-15 20:03:53', '::1', 'Inicio', 0),
(376, '2021-03-15 20:04:09', '::1', 'Inicio', 0),
(377, '2021-03-15 20:04:11', '::1', 'Periodico Digital', 0),
(378, '2021-03-15 20:04:22', '::1', 'Periodico Digital', 0),
(379, '2021-03-15 20:07:40', '::1', 'Periodico Digital', 0),
(380, '2021-03-16 17:06:44', '::1', 'Inicio', 0),
(381, '2021-03-16 17:06:56', '::1', 'Inicio', 0),
(382, '2021-03-16 17:07:44', '192.168.0.17', 'Inicio', 0),
(383, '2021-03-16 17:11:24', '::1', 'Inicio', 0),
(384, '2021-03-16 17:13:10', '::1', 'Inicio', 1),
(385, '2021-03-16 17:13:39', '192.168.0.17', 'Inicio', 1),
(386, '2021-03-16 17:14:02', '192.168.0.17', 'Inicio', 1),
(387, '2021-03-16 17:14:51', '::1', 'Inicio', 1),
(388, '2021-03-16 17:14:51', '::1', 'Inicio', 1),
(389, '2021-03-16 17:15:07', '192.168.0.17', 'Inicio', 1),
(390, '2021-03-16 17:15:40', '::1', 'Inicio', 1),
(391, '2021-03-16 17:15:44', '192.168.0.17', 'Inicio', 1),
(392, '2021-03-16 17:16:15', '192.168.0.17', 'Inicio', 1),
(393, '2021-03-16 17:16:28', '::1', 'Inicio', 1),
(394, '2021-03-23 08:18:42', '::1', 'Inicio', 1),
(395, '2021-03-23 08:18:44', '::1', 'Apoyanos', 1),
(396, '2021-03-23 08:21:52', '::1', 'Apoyanos', 1),
(397, '2021-03-23 08:22:02', '::1', 'Apoyanos', 1),
(398, '2021-03-23 08:22:28', '::1', 'Apoyanos', 1),
(399, '2021-03-23 08:22:59', '::1', 'Apoyanos', 1),
(400, '2021-03-23 08:23:42', '::1', 'Apoyanos', 1),
(401, '2021-03-23 08:24:42', '::1', 'Apoyanos', 1),
(402, '2021-03-23 08:25:21', '::1', 'Apoyanos', 1),
(403, '2021-03-23 08:26:53', '::1', 'Periodico Digital', 1),
(404, '2021-03-23 08:27:15', '::1', 'Apoyanos', 1),
(405, '2021-03-23 08:29:20', '::1', 'Apoyanos', 1),
(406, '2021-03-27 20:09:18', '::1', 'Inicio', 0),
(407, '2021-03-27 20:09:27', '::1', 'Inicio', 0),
(408, '2021-03-27 21:59:06', '::1', 'Inicio', 0),
(409, '2021-04-03 17:17:45', '::1', 'Inicio', 0),
(410, '2021-04-03 17:33:35', '::1', 'Inicio', 0),
(411, '2021-04-03 17:34:09', '::1', 'Inicio', 0),
(412, '2021-04-03 17:34:53', '::1', 'Inicio', 0),
(413, '2021-04-03 17:35:13', '::1', 'Inicio', 0),
(414, '2021-04-03 17:36:31', '::1', 'Inicio', 0),
(415, '2021-04-03 17:37:16', '::1', 'Inicio', 0),
(416, '2021-04-03 17:37:22', '::1', 'Inicio', 0),
(417, '2021-04-03 17:37:28', '::1', 'Inicio', 0),
(418, '2021-04-03 17:39:36', '::1', 'Inicio', 0),
(419, '2021-04-03 17:40:19', '::1', 'Inicio', 0),
(420, '2021-04-03 17:40:36', '::1', 'Inicio', 0),
(421, '2021-04-03 17:40:49', '::1', 'Inicio', 0),
(422, '2021-04-03 17:41:55', '192.168.0.13', 'Inicio', 0),
(423, '2021-04-03 17:42:28', '::1', 'Inicio', 0),
(424, '2021-04-03 17:42:48', '::1', 'Inicio', 0),
(425, '2021-04-03 17:43:00', '::1', 'Inicio', 0),
(426, '2021-04-03 17:43:57', '::1', 'Inicio', 0),
(427, '2021-04-03 17:44:31', '::1', 'Inicio', 0),
(428, '2021-04-03 17:44:36', '::1', 'Inicio', 0),
(429, '2021-04-03 17:45:14', '::1', 'Inicio', 0),
(430, '2021-04-03 17:46:56', '::1', 'Inicio', 0),
(431, '2021-04-03 17:47:06', '::1', 'Inicio', 0),
(432, '2021-04-03 17:47:14', '::1', 'Inicio', 0),
(433, '2021-04-03 17:47:45', '::1', 'Inicio', 0),
(434, '2021-04-03 17:51:27', '::1', 'Inicio', 0),
(435, '2021-04-03 17:51:40', '::1', 'Inicio', 0),
(436, '2021-04-03 17:54:24', '::1', 'Inicio', 0),
(437, '2021-04-03 17:54:46', '::1', 'Inicio', 0),
(438, '2021-04-03 18:06:30', '::1', 'Inicio', 0),
(439, '2021-04-03 18:08:28', '::1', 'Inicio', 0),
(440, '2021-04-03 18:08:41', '::1', 'Inicio', 0),
(441, '2021-04-03 18:09:18', '::1', 'Inicio', 0),
(442, '2021-04-03 18:27:47', '::1', 'Inicio', 0),
(443, '2021-04-10 16:30:34', '::1', 'Inicio', 0),
(444, '2021-04-10 16:30:55', '::1', 'Inicio', 0),
(445, '2021-04-10 16:31:02', '::1', 'Inicio', 0),
(446, '2021-04-10 16:31:32', '::1', 'Inicio', 0),
(447, '2021-04-10 16:31:34', '::1', 'Apoyanos', 0),
(448, '2021-04-10 16:31:51', '::1', 'Apoyanos', 0),
(449, '2021-04-10 16:39:17', '::1', 'Organizaciones', 0),
(450, '2021-04-10 16:39:20', '::1', 'Video juego', 0),
(451, '2021-04-10 16:39:31', '::1', 'Periodico Digital', 0),
(452, '2021-04-10 16:41:36', '::1', 'Periodico Digital', 0),
(453, '2021-04-11 09:26:29', '::1', 'Inicio', 0),
(454, '2021-04-11 09:33:40', '::1', 'Hacia el Futuro', 0),
(455, '2021-04-11 09:35:03', '::1', 'Hacia el Futuro', 0),
(456, '2021-04-11 09:43:03', '::1', 'Hacia el Futuro', 0),
(457, '2021-04-11 10:35:22', '::1', 'Hacia el Futuro', 0),
(458, '2021-04-11 10:35:45', '::1', 'Hacia el Futuro', 0),
(459, '2021-04-11 10:36:46', '::1', 'Hacia el Futuro', 0),
(460, '2021-04-11 10:37:29', '::1', 'Hacia el Futuro', 0),
(461, '2021-04-11 10:39:37', '::1', 'Hacia el Futuro', 0),
(462, '2021-04-11 10:39:52', '::1', 'Hacia el Futuro', 0),
(463, '2021-04-11 10:42:55', '::1', 'Hacia el Futuro', 0),
(464, '2021-04-11 10:51:28', '::1', 'Hacia el Futuro', 0),
(465, '2021-04-11 10:52:10', '::1', 'Hacia el Futuro', 0),
(466, '2021-04-11 10:52:35', '::1', 'Hacia el Futuro', 0),
(467, '2021-04-11 10:53:20', '::1', 'Hacia el Futuro', 0),
(468, '2021-04-11 10:53:59', '::1', 'Hacia el Futuro', 0),
(469, '2021-04-11 10:54:41', '::1', 'Hacia el Futuro', 0),
(470, '2021-04-11 10:56:44', '::1', 'Hacia el Futuro', 0),
(471, '2021-04-11 10:57:08', '::1', 'Hacia el Futuro', 0),
(472, '2021-04-11 10:57:20', '::1', 'Hacia el Futuro', 0),
(473, '2021-04-11 11:22:00', '::1', 'Hacia el Futuro', 0),
(474, '2021-04-11 11:22:58', '::1', 'Hacia el Futuro', 0),
(475, '2021-04-11 11:23:23', '::1', 'Hacia el Futuro', 0),
(476, '2021-04-11 11:24:34', '::1', 'Hacia el Futuro', 0),
(477, '2021-04-11 11:25:03', '::1', 'Hacia el Futuro', 0),
(478, '2021-04-11 11:25:46', '::1', 'Hacia el Futuro', 0),
(479, '2021-04-11 11:26:29', '::1', 'Hacia el Futuro', 0),
(480, '2021-04-11 13:21:45', '::1', 'Hacia el Futuro', 0),
(481, '2021-04-11 13:22:22', '::1', 'Hacia el Futuro', 0),
(482, '2021-04-11 13:22:25', '::1', 'Periodico Digital', 0),
(483, '2021-04-11 13:28:34', '::1', 'Hacia el Futuro', 0),
(484, '2021-04-11 13:32:41', '::1', 'Hacia el Futuro', 0),
(485, '2021-04-11 13:33:08', '::1', 'Hacia el Futuro', 0),
(486, '2021-04-11 13:49:11', '::1', 'Hacia el Futuro', 0),
(487, '2021-04-11 14:10:21', '::1', 'Hacia el Futuro', 0),
(488, '2021-04-11 14:10:45', '::1', 'Hacia el Futuro', 0),
(489, '2021-04-11 14:14:21', '::1', 'Hacia el Futuro', 0),
(490, '2021-04-11 14:14:36', '::1', 'Hacia el Futuro', 0),
(491, '2021-04-11 14:20:28', '::1', 'Hacia el Futuro', 0),
(492, '2021-04-11 14:20:55', '::1', 'Hacia el Futuro', 0),
(493, '2021-04-11 16:13:39', '::1', 'Hacia el Futuro', 0),
(494, '2021-04-12 19:33:43', '::1', 'Inicio', 0),
(495, '2021-04-12 19:34:00', '::1', 'Video juego', 0),
(496, '2021-04-12 19:34:03', '::1', 'Organizaciones', 0),
(497, '2021-04-12 19:34:06', '::1', 'Video juego', 0),
(498, '2021-04-12 19:34:07', '::1', 'Apoyanos', 0),
(499, '2021-04-12 19:34:09', '::1', 'Video juego', 0),
(500, '2021-04-12 19:34:13', '::1', 'Podcast', 0),
(501, '2021-04-12 19:34:15', '::1', 'Serie Web', 0),
(502, '2021-04-12 19:34:19', '::1', 'Hacia el Futuro', 0),
(503, '2021-04-12 19:34:22', '::1', 'Serie Web', 0),
(504, '2021-04-12 19:34:49', '::1', 'Serie Web', 0),
(505, '2021-04-12 19:36:43', '::1', 'Podcast', 0),
(506, '2021-04-12 19:36:48', '::1', 'Periodico Digital', 0),
(507, '2021-04-12 19:36:54', '::1', 'Apoyanos', 0),
(508, '2021-04-12 19:36:58', '::1', 'Hacia el Futuro', 0),
(509, '2021-04-12 19:37:47', '::1', 'Hacia el Futuro', 0),
(510, '2021-04-12 19:37:50', '::1', 'Serie Web', 0),
(511, '2021-04-12 19:38:09', '::1', 'Serie Web', 0),
(512, '2021-04-12 19:38:24', '::1', 'Serie Web', 0),
(513, '2021-04-12 19:43:46', '::1', 'Serie Web', 0),
(514, '2021-04-12 19:47:28', '::1', 'Serie Web', 0),
(515, '2021-04-12 19:47:52', '::1', 'Serie Web', 0),
(516, '2021-04-12 19:51:17', '::1', 'Serie Web', 0),
(517, '2021-04-12 19:53:08', '::1', 'Hacia el Futuro', 0),
(518, '2021-04-12 19:53:11', '::1', 'Serie Web', 0),
(519, '2021-04-12 19:53:12', '::1', 'Podcast', 0),
(520, '2021-04-12 19:53:14', '::1', 'Periodico Digital', 0),
(521, '2021-04-12 19:53:18', '::1', 'Organizaciones', 0),
(522, '2021-04-12 19:53:20', '::1', 'Apoyanos', 0),
(523, '2021-04-12 19:53:24', '::1', 'Serie Web', 0),
(524, '2021-04-12 19:53:29', '::1', 'Video juego', 0),
(525, '2021-04-12 19:55:41', '::1', 'Video juego', 0),
(526, '2021-04-12 20:21:48', '::1', 'Serie Web', 0),
(527, '2021-04-13 19:25:44', '::1', 'Inicio', 0),
(528, '2021-04-13 19:25:46', '::1', 'Serie Web', 0),
(529, '2021-04-13 19:29:25', '::1', 'Serie Web', 0),
(530, '2021-04-13 19:30:19', '::1', 'Serie Web', 0),
(531, '2021-04-13 19:30:40', '::1', 'Serie Web', 0),
(532, '2021-04-13 19:31:22', '::1', 'Serie Web', 0),
(533, '2021-04-13 19:32:39', '::1', 'Serie Web', 0),
(534, '2021-04-13 19:32:46', '::1', 'Serie Web', 0),
(535, '2021-04-13 19:32:59', '::1', 'Serie Web', 0),
(536, '2021-04-13 19:33:23', '::1', 'Serie Web', 0),
(537, '2021-04-13 19:33:43', '::1', 'Serie Web', 0),
(538, '2021-04-13 19:33:51', '::1', 'Serie Web', 0),
(539, '2021-04-13 19:34:23', '::1', 'Serie Web', 0),
(540, '2021-04-13 19:36:02', '::1', 'Serie Web', 0),
(541, '2021-04-13 19:38:06', '::1', 'Serie Web', 0),
(542, '2021-04-13 19:38:08', '::1', 'Periodico Digital', 0),
(543, '2021-04-13 19:38:43', '::1', 'Serie Web', 0),
(544, '2021-04-13 19:39:15', '::1', 'Serie Web', 0),
(545, '2021-04-13 19:41:34', '::1', 'Serie Web', 0),
(546, '2021-04-13 19:42:02', '::1', 'Serie Web', 0),
(547, '2021-04-13 19:42:08', '::1', 'Serie Web', 0),
(548, '2021-04-13 19:42:46', '::1', 'Serie Web', 0),
(549, '2021-04-13 19:42:58', '::1', 'Serie Web', 0),
(550, '2021-04-13 19:43:20', '::1', 'Serie Web', 0),
(551, '2021-04-13 19:43:59', '::1', 'Serie Web', 0),
(552, '2021-04-13 19:46:00', '::1', 'Serie Web', 0),
(553, '2021-04-13 19:46:08', '::1', 'Serie Web', 0),
(554, '2021-04-13 19:47:46', '::1', 'Serie Web', 0),
(555, '2021-04-13 19:48:22', '::1', 'Serie Web', 0),
(556, '2021-04-13 19:51:46', '::1', 'Serie Web', 0),
(557, '2021-04-13 19:54:01', '::1', 'Serie Web', 0),
(558, '2021-04-13 20:04:33', '::1', 'Serie Web', 0),
(559, '2021-04-13 20:05:32', '::1', 'Serie Web', 0),
(560, '2021-04-13 20:06:47', '::1', 'Serie Web', 0),
(561, '2021-04-13 20:07:43', '::1', 'Serie Web', 0),
(562, '2021-04-13 20:08:28', '::1', 'Serie Web', 0),
(563, '2021-04-13 20:09:11', '::1', 'Serie Web', 0),
(564, '2021-04-13 20:13:19', '::1', 'Serie Web', 0),
(565, '2021-04-13 20:13:27', '::1', 'Serie Web', 0),
(566, '2021-04-13 20:25:38', '::1', 'Serie Web', 0),
(567, '2021-04-13 20:26:40', '::1', 'Serie Web', 0),
(568, '2021-04-13 20:27:17', '::1', 'Serie Web', 0),
(569, '2021-04-13 20:27:18', '::1', 'Inicio', 0),
(570, '2021-04-13 20:28:31', '::1', 'Serie Web', 0),
(571, '2021-04-13 20:30:24', '::1', 'Serie Web', 0),
(572, '2021-04-13 20:31:28', '::1', 'Serie Web', 0),
(573, '2021-04-13 20:33:11', '::1', 'Serie Web', 0),
(574, '2021-04-13 20:35:37', '::1', 'Serie Web', 0),
(575, '2021-04-13 20:36:18', '::1', 'Serie Web', 0),
(576, '2021-04-13 20:41:03', '::1', 'Serie Web', 0),
(577, '2021-04-13 20:41:59', '::1', 'Serie Web', 0),
(578, '2021-04-13 20:42:29', '::1', 'Serie Web', 0),
(579, '2021-04-13 20:42:54', '::1', 'Serie Web', 0),
(580, '2021-04-13 20:43:21', '::1', 'Serie Web', 0),
(581, '2021-04-13 20:43:46', '::1', 'Serie Web', 0),
(582, '2021-04-13 20:44:14', '::1', 'Serie Web', 0),
(583, '2021-04-13 20:44:48', '::1', 'Serie Web', 0),
(584, '2021-04-13 20:45:32', '::1', 'Serie Web', 0),
(585, '2021-04-13 20:46:17', '::1', 'Serie Web', 0),
(586, '2021-04-13 20:47:06', '::1', 'Serie Web', 0),
(587, '2021-04-13 20:48:04', '::1', 'Serie Web', 0),
(588, '2021-04-13 20:48:55', '::1', 'Serie Web', 0),
(589, '2021-04-14 18:44:57', '::1', 'Inicio', 0),
(590, '2021-04-14 18:44:59', '::1', 'Podcast', 0),
(591, '2021-04-14 18:45:53', '::1', 'Podcast', 0),
(592, '2021-04-14 18:51:05', '::1', 'Podcast', 0),
(593, '2021-04-14 18:57:12', '::1', 'Podcast', 0),
(594, '2021-04-14 18:57:30', '::1', 'Podcast', 0),
(595, '2021-04-14 19:00:57', '::1', 'Periodico Digital', 0),
(596, '2021-04-14 19:01:02', '::1', 'Organizaciones', 0),
(597, '2021-04-14 19:01:04', '::1', 'Apoyanos', 0),
(598, '2021-04-14 19:01:07', '::1', 'Podcast', 0),
(599, '2021-04-14 19:08:33', '::1', 'Serie Web', 0),
(600, '2021-04-14 19:09:54', '::1', 'Serie Web', 0),
(601, '2021-04-14 19:10:22', '::1', 'Serie Web', 0),
(602, '2021-04-14 19:10:41', '::1', 'Serie Web', 0),
(603, '2021-04-14 19:11:07', '::1', 'Serie Web', 0),
(604, '2021-04-14 19:11:50', '::1', 'Serie Web', 0),
(605, '2021-04-14 19:13:52', '::1', 'Serie Web', 0),
(606, '2021-04-14 21:33:36', '::1', 'Serie Web', 0),
(607, '2021-04-14 21:34:14', '::1', 'Serie Web', 0),
(608, '2021-04-14 21:34:21', '::1', 'Serie Web', 0),
(609, '2021-04-14 21:38:24', '::1', 'Serie Web', 0),
(610, '2021-04-14 21:49:37', '::1', 'Serie Web', 0),
(611, '2021-04-14 21:49:54', '::1', 'Serie Web', 0),
(612, '2021-04-14 21:57:04', '::1', 'Serie Web', 0),
(613, '2021-04-14 21:58:21', '::1', 'Serie Web', 0),
(614, '2021-04-14 21:59:40', '::1', 'Serie Web', 0),
(615, '2021-04-14 22:00:02', '::1', 'Serie Web', 0),
(616, '2021-04-14 22:00:19', '::1', 'Serie Web', 0),
(617, '2021-04-14 22:00:43', '::1', 'Serie Web', 0),
(618, '2021-04-14 22:01:05', '::1', 'Serie Web', 0),
(619, '2021-04-14 22:01:22', '::1', 'Serie Web', 0),
(620, '2021-04-14 22:02:29', '::1', 'Serie Web', 0),
(621, '2021-04-14 22:03:00', '::1', 'Serie Web', 0),
(622, '2021-04-14 22:03:18', '::1', 'Serie Web', 0),
(623, '2021-04-14 22:03:32', '::1', 'Serie Web', 0),
(624, '2021-04-14 22:04:03', '::1', 'Serie Web', 0),
(625, '2021-04-14 22:04:14', '::1', 'Serie Web', 0),
(626, '2021-04-14 22:05:15', '::1', 'Serie Web', 0),
(627, '2021-04-14 22:05:22', '::1', 'Serie Web', 0),
(628, '2021-04-14 22:06:40', '::1', 'Serie Web', 0),
(629, '2021-04-14 22:08:15', '::1', 'Serie Web', 0),
(630, '2021-04-14 22:08:40', '::1', 'Serie Web', 0),
(631, '2021-04-14 22:09:00', '::1', 'Serie Web', 0),
(632, '2021-04-14 22:09:24', '::1', 'Serie Web', 0),
(633, '2021-04-14 22:12:22', '::1', 'Serie Web', 0),
(634, '2021-04-14 22:13:11', '::1', 'Serie Web', 0),
(635, '2021-04-14 22:15:17', '::1', 'Serie Web', 0),
(636, '2021-04-14 22:16:03', '::1', 'Serie Web', 0),
(637, '2021-04-14 22:18:27', '::1', 'Serie Web', 0),
(638, '2021-04-14 22:19:09', '::1', 'Serie Web', 0),
(639, '2021-04-15 18:52:17', '::1', 'Inicio', 0),
(640, '2021-04-15 18:53:00', '::1', 'Serie Web', 0),
(641, '2021-04-15 18:54:30', '::1', 'Serie Web', 0),
(642, '2021-04-15 19:04:41', '::1', 'Serie Web', 0),
(643, '2021-04-15 19:09:10', '::1', 'Serie Web', 0),
(644, '2021-04-15 19:09:23', '::1', 'Serie Web', 0),
(645, '2021-04-15 19:10:00', '::1', 'Serie Web', 0),
(646, '2021-04-15 19:13:51', '::1', 'Serie Web', 0),
(647, '2021-04-15 19:19:14', '::1', 'Serie Web', 0),
(648, '2021-04-15 19:20:43', '::1', 'Serie Web', 0),
(649, '2021-04-15 19:20:55', '::1', 'Serie Web', 0),
(650, '2021-04-15 19:21:50', '::1', 'Serie Web', 0),
(651, '2021-04-15 19:22:06', '::1', 'Serie Web', 0),
(652, '2021-04-15 19:22:17', '::1', 'Serie Web', 0),
(653, '2021-04-15 19:26:06', '::1', 'Serie Web', 0),
(654, '2021-04-15 19:27:08', '::1', 'Serie Web', 0),
(655, '2021-04-15 19:27:15', '::1', 'Serie Web', 0),
(656, '2021-04-15 19:27:59', '::1', 'Serie Web', 0),
(657, '2021-04-15 19:28:37', '::1', 'Serie Web', 0),
(658, '2021-04-15 19:29:36', '::1', 'Serie Web', 0),
(659, '2021-04-15 19:31:04', '::1', 'Serie Web', 0),
(660, '2021-04-15 19:31:32', '::1', 'Serie Web', 0),
(661, '2021-04-15 19:31:56', '::1', 'Serie Web', 0),
(662, '2021-04-15 19:33:48', '::1', 'Serie Web', 0),
(663, '2021-04-15 19:34:14', '::1', 'Serie Web', 0),
(664, '2021-04-15 19:34:49', '::1', 'Serie Web', 0),
(665, '2021-04-15 19:35:05', '::1', 'Serie Web', 0),
(666, '2021-04-15 19:36:13', '::1', 'Serie Web', 0),
(667, '2021-04-15 19:36:28', '::1', 'Serie Web', 0),
(668, '2021-04-15 19:38:11', '::1', 'Serie Web', 0),
(669, '2021-04-15 19:38:31', '::1', 'Serie Web', 0),
(670, '2021-04-15 19:38:39', '::1', 'Serie Web', 0),
(671, '2021-04-15 20:13:06', '::1', 'Serie Web', 0),
(672, '2021-04-15 20:13:16', '::1', 'Serie Web', 0),
(673, '2021-04-15 20:16:42', '::1', 'Serie Web', 0),
(674, '2021-04-15 20:19:12', '::1', 'Serie Web', 0),
(675, '2021-04-15 20:22:03', '::1', 'Serie Web', 0),
(676, '2021-04-15 20:22:43', '::1', 'Serie Web', 0),
(677, '2021-04-15 20:23:01', '::1', 'Serie Web', 0),
(678, '2021-04-20 17:05:04', '::1', 'Inicio', 0),
(679, '2021-04-20 17:05:05', '::1', 'Serie Web', 0),
(680, '2021-04-20 18:23:03', '::1', 'Inicio', 0),
(681, '2021-04-20 18:23:05', '::1', 'Serie Web', 0),
(682, '2021-04-20 19:08:47', '::1', 'Serie Web', 0),
(683, '2021-04-20 19:13:22', '::1', 'Serie Web', 0),
(684, '2021-04-20 19:15:01', '::1', 'Serie Web', 0),
(685, '2021-04-20 19:15:54', '::1', 'Serie Web', 0),
(686, '2021-04-20 19:16:31', '::1', 'Serie Web', 0),
(687, '2021-04-20 19:17:03', '::1', 'Serie Web', 0),
(688, '2021-04-20 19:17:33', '::1', 'Serie Web', 0),
(689, '2021-04-20 19:37:41', '::1', 'Serie Web', 0),
(690, '2021-04-20 19:38:15', '::1', 'Serie Web', 0),
(691, '2021-04-20 19:40:42', '::1', 'Serie Web', 0),
(692, '2021-04-20 19:48:53', '::1', 'Serie Web', 0),
(693, '2021-04-20 19:49:53', '::1', 'Serie Web', 0),
(694, '2021-04-20 19:50:36', '::1', 'Serie Web', 0),
(695, '2021-04-20 19:54:09', '::1', 'Serie Web', 0),
(696, '2021-04-20 19:59:12', '::1', 'Serie Web', 0),
(697, '2021-04-20 19:59:48', '::1', 'Serie Web', 0),
(698, '2021-04-20 20:03:41', '::1', 'Serie Web', 0),
(699, '2021-04-20 20:04:27', '::1', 'Serie Web', 0),
(700, '2021-04-20 20:04:54', '::1', 'Serie Web', 0),
(701, '2021-04-20 20:05:13', '::1', 'Serie Web', 0),
(702, '2021-04-20 20:05:27', '::1', 'Serie Web', 0),
(703, '2021-04-20 20:06:03', '::1', 'Serie Web', 0),
(704, '2021-04-20 20:06:16', '::1', 'Serie Web', 0),
(705, '2021-04-20 20:07:04', '::1', 'Serie Web', 0),
(706, '2021-04-20 20:08:32', '::1', 'Serie Web', 0),
(707, '2021-04-20 20:09:24', '::1', 'Serie Web', 0),
(708, '2021-04-20 20:11:08', '::1', 'Serie Web', 0),
(709, '2021-04-20 20:12:04', '::1', 'Serie Web', 0),
(710, '2021-04-20 20:12:11', '::1', 'Serie Web', 0),
(711, '2021-04-20 20:12:27', '::1', 'Serie Web', 0),
(712, '2021-04-20 20:12:46', '::1', 'Serie Web', 0),
(713, '2021-04-20 21:17:45', '::1', 'Serie Web', 0),
(714, '2021-04-21 14:50:59', '::1', 'Inicio', 0),
(715, '2021-04-21 14:51:02', '::1', 'Serie Web', 0),
(716, '2021-04-21 17:48:25', '::1', 'Serie Web', 0),
(717, '2021-04-21 17:49:03', '::1', 'Serie Web', 0),
(718, '2021-04-21 17:49:21', '::1', 'Serie Web', 0),
(719, '2021-04-21 17:49:26', '::1', 'Serie Web', 0),
(720, '2021-04-21 17:50:46', '::1', 'Serie Web', 0),
(721, '2021-04-21 17:50:54', '::1', 'Serie Web', 0),
(722, '2021-04-21 17:52:20', '::1', 'Serie Web', 0),
(723, '2021-04-21 17:53:09', '::1', 'Serie Web', 0),
(724, '2021-04-21 17:53:28', '::1', 'Serie Web', 0),
(725, '2021-04-21 17:54:13', '::1', 'Serie Web', 0),
(726, '2021-04-21 17:54:20', '::1', 'Serie Web', 0),
(727, '2021-04-21 17:54:30', '::1', 'Serie Web', 0),
(728, '2021-04-21 17:54:37', '::1', 'Serie Web', 0),
(729, '2021-04-21 17:54:55', '::1', 'Serie Web', 0),
(730, '2021-04-21 17:55:52', '::1', 'Serie Web', 0),
(731, '2021-04-21 17:56:25', '::1', 'Serie Web', 0),
(732, '2021-04-21 18:00:18', '::1', 'Serie Web', 0),
(733, '2021-04-21 18:01:31', '::1', 'Serie Web', 0),
(734, '2021-04-21 18:02:15', '::1', 'Serie Web', 0),
(735, '2021-04-21 18:02:27', '::1', 'Serie Web', 0),
(736, '2021-04-21 18:02:42', '::1', 'Serie Web', 0),
(737, '2021-04-21 18:02:56', '::1', 'Serie Web', 0),
(738, '2021-04-21 18:03:44', '::1', 'Serie Web', 0),
(739, '2021-04-21 18:04:38', '::1', 'Serie Web', 0),
(740, '2021-04-21 18:06:17', '::1', 'Serie Web', 0),
(741, '2021-04-21 18:06:30', '::1', 'Serie Web', 0),
(742, '2021-04-21 18:07:35', '::1', 'Serie Web', 0),
(743, '2021-04-21 18:08:50', '::1', 'Serie Web', 0),
(744, '2021-04-21 18:11:15', '::1', 'Serie Web', 0),
(745, '2021-04-21 18:15:56', '::1', 'Serie Web', 0),
(746, '2021-04-21 18:38:55', '192.168.0.13', 'Inicio', 1),
(747, '2021-04-21 18:38:59', '192.168.0.13', 'Serie Web', 1),
(748, '2021-04-21 18:39:52', '::1', 'Serie Web', 0),
(749, '2021-04-21 18:40:01', '::1', 'Serie Web', 0),
(750, '2021-04-21 18:40:50', '::1', 'Serie Web', 0),
(751, '2021-04-21 18:42:35', '::1', 'Serie Web', 0),
(752, '2021-04-21 18:43:08', '::1', 'Serie Web', 0),
(753, '2021-04-21 18:44:47', '::1', 'Serie Web', 0),
(754, '2021-04-21 18:44:58', '::1', 'Serie Web', 0),
(755, '2021-04-21 18:46:30', '::1', 'Serie Web', 0),
(756, '2021-04-21 18:46:37', '::1', 'Serie Web', 0),
(757, '2021-04-21 18:46:59', '::1', 'Serie Web', 0),
(758, '2021-04-21 18:47:39', '::1', 'Serie Web', 0),
(759, '2021-04-21 18:48:37', '::1', 'Serie Web', 0),
(760, '2021-04-21 18:49:31', '::1', 'Serie Web', 0),
(761, '2021-04-21 18:50:34', '::1', 'Serie Web', 0),
(762, '2021-04-21 18:52:26', '::1', 'Serie Web', 0),
(763, '2021-04-21 18:52:58', '::1', 'Serie Web', 0),
(764, '2021-04-21 18:53:11', '::1', 'Serie Web', 0),
(765, '2021-04-21 18:53:38', '::1', 'Serie Web', 0),
(766, '2021-04-21 18:53:54', '::1', 'Serie Web', 0),
(767, '2021-04-21 18:54:03', '::1', 'Serie Web', 0),
(768, '2021-04-21 18:54:21', '::1', 'Serie Web', 0),
(769, '2021-04-21 18:54:37', '::1', 'Serie Web', 0),
(770, '2021-04-21 18:54:59', '::1', 'Serie Web', 0),
(771, '2021-04-21 18:55:08', '::1', 'Serie Web', 0),
(772, '2021-04-21 18:55:18', '::1', 'Serie Web', 0),
(773, '2021-04-21 18:55:24', '::1', 'Serie Web', 0),
(774, '2021-04-21 18:55:34', '::1', 'Serie Web', 0),
(775, '2021-04-21 18:55:53', '::1', 'Serie Web', 0),
(776, '2021-04-21 18:56:32', '192.168.0.13', 'Serie Web', 1),
(777, '2021-04-21 18:57:27', '192.168.0.13', 'Hacia el Futuro', 1),
(778, '2021-04-21 18:57:32', '192.168.0.13', 'Serie Web', 1),
(779, '2021-04-21 19:00:14', '::1', 'Serie Web', 0),
(780, '2021-04-21 19:00:39', '192.168.0.13', 'Serie Web', 1),
(781, '2021-04-21 19:01:15', '192.168.0.13', 'Serie Web', 1),
(782, '2021-04-21 19:07:37', '192.168.0.14', 'Inicio', 0),
(783, '2021-04-21 19:07:40', '192.168.0.14', 'Serie Web', 0),
(784, '2021-04-21 19:08:00', '192.168.0.14', 'Serie Web', 0),
(785, '2021-04-21 19:08:05', '192.168.0.14', 'Serie Web', 0),
(786, '2021-04-21 19:10:30', '192.168.0.13', 'Serie Web', 1),
(787, '2021-04-21 19:10:35', '192.168.0.13', 'Serie Web', 1),
(788, '2021-04-21 19:10:39', '192.168.0.14', 'Serie Web', 0),
(789, '2021-04-21 19:11:12', '192.168.0.14', 'Serie Web', 0),
(790, '2021-04-21 19:12:33', '::1', 'Serie Web', 0),
(791, '2021-04-21 19:14:49', '::1', 'Serie Web', 0),
(792, '2021-04-21 19:15:34', '::1', 'Serie Web', 0),
(793, '2021-04-21 19:16:12', '::1', 'Serie Web', 0),
(794, '2021-04-21 19:16:55', '192.168.0.13', 'Serie Web', 1),
(795, '2021-04-21 19:17:53', '192.168.0.13', 'Serie Web', 1),
(796, '2021-04-21 19:20:52', '::1', 'Serie Web', 0),
(797, '2021-04-21 19:21:07', '192.168.0.13', 'Serie Web', 1),
(798, '2021-04-21 19:21:13', '192.168.0.13', 'Serie Web', 1),
(799, '2021-04-21 19:21:30', '192.168.0.13', 'Inicio', 1),
(800, '2021-04-21 19:21:53', '::1', 'Serie Web', 0),
(801, '2021-04-21 19:22:25', '::1', 'Serie Web', 0),
(802, '2021-04-21 19:22:40', '192.168.0.13', 'Inicio', 1),
(803, '2021-04-21 19:22:47', '192.168.0.13', 'Serie Web', 1),
(804, '2021-04-21 19:25:25', '::1', 'Serie Web', 0),
(805, '2021-04-21 19:25:34', '::1', 'Serie Web', 0),
(806, '2021-04-21 19:25:47', '::1', 'Serie Web', 0),
(807, '2021-04-21 19:26:47', '::1', 'Podcast', 0),
(808, '2021-04-21 19:26:56', '::1', 'Apoyanos', 0),
(809, '2021-04-21 19:27:07', '::1', 'Apoyanos', 0),
(810, '2021-04-21 19:27:12', '::1', 'Organizaciones', 0),
(811, '2021-04-21 19:27:13', '::1', 'Video juego', 0),
(812, '2021-04-21 19:27:16', '::1', 'Periodico Digital', 0),
(813, '2021-04-21 19:27:21', '::1', 'Podcast', 0),
(814, '2021-04-21 19:27:25', '::1', 'Serie Web', 0),
(815, '2021-04-21 19:42:54', '::1', 'Periodico Digital', 0),
(816, '2021-04-21 20:03:13', '::1', 'Serie Web', 0),
(817, '2021-04-21 20:03:45', '::1', 'Serie Web', 0),
(818, '2021-04-21 20:20:26', '::1', 'Serie Web', 0),
(819, '2021-04-21 20:29:45', '::1', 'Serie Web', 0),
(820, '2021-04-21 20:30:03', '::1', 'Serie Web', 0),
(821, '2021-04-21 20:30:17', '::1', 'Serie Web', 0),
(822, '2021-04-21 21:07:35', '192.168.0.13', 'Serie Web', 1),
(823, '2021-04-22 17:07:14', '::1', 'Inicio', 0),
(824, '2021-04-22 17:20:37', '::1', 'Serie Web', 0),
(825, '2021-04-22 17:21:18', '::1', 'Serie Web', 0),
(826, '2021-04-22 17:26:27', '::1', 'Serie Web', 0),
(827, '2021-04-22 17:28:26', '::1', 'Serie Web', 0),
(828, '2021-04-22 17:29:48', '::1', 'Serie Web', 0),
(829, '2021-04-22 17:31:03', '::1', 'Serie Web', 0),
(830, '2021-04-22 17:31:23', '::1', 'Serie Web', 0),
(831, '2021-04-22 17:31:50', '::1', 'Serie Web', 0),
(832, '2021-04-22 17:32:57', '::1', 'Serie Web', 0),
(833, '2021-04-22 17:33:06', '::1', 'Serie Web', 0),
(834, '2021-04-22 17:33:51', '::1', 'Serie Web', 0),
(835, '2021-04-22 17:35:00', '::1', 'Serie Web', 0),
(836, '2021-04-22 17:35:08', '::1', 'Serie Web', 0),
(837, '2021-04-22 17:35:21', '::1', 'Serie Web', 0),
(838, '2021-04-22 17:36:22', '::1', 'Serie Web', 0),
(839, '2021-04-22 17:37:19', '192.168.0.13', 'Inicio', 1),
(840, '2021-04-22 17:39:11', '::1', 'Serie Web', 0),
(841, '2021-04-22 17:39:20', '192.168.0.13', 'Serie Web', 1),
(842, '2021-04-22 17:42:25', '192.168.0.13', 'Serie Web', 1),
(843, '2021-04-22 18:00:30', '192.168.0.14', 'Inicio', 0),
(844, '2021-04-22 18:00:33', '192.168.0.14', 'Serie Web', 0),
(845, '2021-04-22 18:05:29', '::1', 'Inicio', 0),
(846, '2021-04-22 18:05:32', '::1', 'Serie Web', 0),
(847, '2021-04-22 18:19:39', '::1', 'Serie Web', 0),
(848, '2021-04-22 18:20:25', '::1', 'Serie Web', 0),
(849, '2021-04-22 18:25:48', '::1', 'Serie Web', 0),
(850, '2021-04-22 18:28:34', '::1', 'Serie Web', 0),
(851, '2021-04-22 18:28:44', '::1', 'Serie Web', 0),
(852, '2021-04-22 18:28:57', '::1', 'Serie Web', 0),
(853, '2021-04-22 18:29:40', '::1', 'Serie Web', 0),
(854, '2021-04-22 18:30:54', '::1', 'Serie Web', 0),
(855, '2021-04-22 18:33:47', '::1', 'Serie Web', 0),
(856, '2021-04-22 18:37:01', '::1', 'Serie Web', 0),
(857, '2021-04-22 18:37:44', '::1', 'Serie Web', 0),
(858, '2021-04-22 18:45:22', '::1', 'Serie Web', 0),
(859, '2021-04-22 18:48:55', '::1', 'Serie Web', 0),
(860, '2021-04-22 18:49:42', '::1', 'Serie Web', 0),
(861, '2021-04-22 18:50:15', '::1', 'Serie Web', 0),
(862, '2021-04-22 18:51:03', '::1', 'Serie Web', 0),
(863, '2021-04-22 18:51:36', '::1', 'Serie Web', 0),
(864, '2021-04-22 18:57:29', '::1', 'Serie Web', 0),
(865, '2021-04-22 19:04:07', '::1', 'Serie Web', 0),
(866, '2021-04-22 19:04:39', '::1', 'Serie Web', 0),
(867, '2021-04-22 19:04:58', '::1', 'Serie Web', 0),
(868, '2021-04-22 19:05:28', '::1', 'Serie Web', 0),
(869, '2021-04-22 19:10:46', '::1', 'Serie Web', 0),
(870, '2021-04-22 19:12:40', '::1', 'Serie Web', 0),
(871, '2021-04-22 19:19:30', '::1', 'Serie Web', 0),
(872, '2021-04-22 19:19:58', '::1', 'Serie Web', 0),
(873, '2021-04-22 19:21:03', '::1', 'Serie Web', 0),
(874, '2021-04-22 19:24:36', '::1', 'Serie Web', 0),
(875, '2021-04-22 19:25:12', '::1', 'Serie Web', 0),
(876, '2021-04-22 19:26:27', '::1', 'Serie Web', 0),
(877, '2021-04-22 19:33:44', '::1', 'Serie Web', 0),
(878, '2021-04-22 19:56:43', '::1', 'Serie Web', 0),
(879, '2021-04-26 18:40:34', '::1', 'Inicio', 0),
(880, '2021-04-26 18:40:40', '::1', 'Serie Web', 0),
(881, '2021-04-26 21:59:49', '::1', 'Serie Web', 0),
(882, '2021-04-27 21:44:59', '::1', 'Inicio', 0),
(883, '2021-04-27 21:45:02', '::1', 'Serie Web', 0),
(884, '2021-04-27 22:05:33', '::1', 'Serie Web', 0),
(885, '2021-04-27 22:06:16', '::1', 'Serie Web', 0),
(886, '2021-04-27 22:07:54', '::1', 'Serie Web', 0),
(887, '2021-04-27 22:09:57', '::1', 'Serie Web', 0),
(888, '2021-04-27 22:10:30', '::1', 'Serie Web', 0),
(889, '2021-04-27 22:10:51', '::1', 'Serie Web', 0),
(890, '2021-04-27 22:11:19', '::1', 'Serie Web', 0),
(891, '2021-05-17 15:31:23', '::1', 'Inicio', 0),
(892, '2021-05-17 15:35:53', '::1', 'Inicio', 0),
(893, '2021-05-17 15:37:46', '::1', 'Inicio', 0),
(894, '2021-05-17 15:38:03', '::1', 'Serie Web', 0),
(895, '2021-05-22 09:52:58', '::1', 'Inicio', 0),
(896, '2021-05-22 09:53:02', '::1', 'Periodico Digital', 0),
(897, '2021-05-22 09:53:49', '::1', 'Periodico Digital', 0),
(898, '2021-05-22 10:01:11', '::1', 'Serie Web', 0),
(899, '2021-05-22 10:52:47', '::1', 'Serie Web', 0),
(900, '2021-05-22 10:53:45', '::1', 'Serie Web', 0),
(901, '2021-05-22 10:55:11', '::1', 'Serie Web', 0),
(902, '2021-05-22 10:56:19', '::1', 'Serie Web', 0),
(903, '2021-05-22 10:56:43', '::1', 'Serie Web', 0),
(904, '2021-05-22 10:57:51', '::1', 'Serie Web', 0),
(905, '2021-05-22 10:59:35', '::1', 'Serie Web', 0),
(906, '2021-05-22 10:59:47', '::1', 'Serie Web', 0),
(907, '2021-05-22 11:00:53', '::1', 'Serie Web', 0),
(908, '2021-05-22 11:08:22', '::1', 'Serie Web', 0),
(909, '2021-05-22 11:08:37', '::1', 'Serie Web', 0),
(910, '2021-05-22 11:09:21', '::1', 'Serie Web', 0),
(911, '2021-05-22 11:09:42', '::1', 'Serie Web', 0),
(912, '2021-05-22 11:10:36', '::1', 'Serie Web', 0),
(913, '2021-05-22 11:12:25', '::1', 'Serie Web', 0),
(914, '2021-05-22 11:13:13', '::1', 'Serie Web', 0),
(915, '2021-05-22 11:14:01', '::1', 'Serie Web', 0),
(916, '2021-05-22 11:15:11', '::1', 'Serie Web', 0),
(917, '2021-05-22 11:51:46', '::1', 'Serie Web', 0),
(918, '2021-05-22 11:54:45', '::1', 'Serie Web', 0),
(919, '2021-05-22 11:56:23', '::1', 'Serie Web', 0),
(920, '2021-05-22 11:57:41', '::1', 'Serie Web', 0),
(921, '2021-05-22 11:58:29', '::1', 'Serie Web', 0),
(922, '2021-05-22 12:07:24', '::1', 'Periodico Digital', 0),
(923, '2021-05-22 12:21:30', '::1', 'Organizaciones', 0),
(924, '2021-05-23 14:12:26', '::1', 'Inicio', 0),
(925, '2021-05-23 14:13:18', '::1', 'Inicio', 0),
(926, '2021-05-23 14:14:15', '::1', 'Organizaciones', 0),
(927, '2021-05-23 14:14:21', '::1', 'Organizaciones', 0),
(928, '2021-05-23 14:15:24', '::1', 'Participantes', 0),
(929, '2021-05-23 14:15:25', '::1', 'Participantes', 0),
(930, '2021-05-23 14:15:27', '::1', 'Participantes', 0),
(931, '2021-05-23 14:16:11', '::1', 'Participantes', 0),
(932, '2021-05-23 14:22:34', '::1', 'Participantes', 0),
(933, '2021-05-23 14:22:47', '::1', 'Participantes', 0),
(934, '2021-05-23 14:23:37', '::1', 'Participantes', 0),
(935, '2021-05-23 14:25:15', '::1', 'Participantes', 0);
INSERT INTO `visitas` (`id_vis`, `fecha_visita`, `id_visitador`, `pagina`, `dispositivo`) VALUES
(936, '2021-05-23 14:25:28', '::1', 'Participantes', 0),
(937, '2021-05-23 14:27:28', '::1', 'Participantes', 0),
(938, '2021-05-25 20:19:25', '::1', 'Inicio', 0),
(939, '2021-06-01 19:41:18', '::1', 'Inicio', 0),
(940, '2021-06-01 19:41:21', '::1', 'Serie Web', 0),
(941, '2021-06-23 19:48:30', '::1', 'Inicio', 0),
(942, '2021-06-23 19:48:33', '::1', 'Video juego', 0),
(943, '2021-06-23 19:49:35', '::1', 'Video juego', 0),
(944, '2021-06-23 19:49:57', '::1', 'Video juego', 0),
(945, '2021-06-23 19:53:47', '192.168.0.19', 'Video juego', 0),
(946, '2021-06-23 20:23:45', '::1', 'Video juego', 0),
(947, '2021-06-27 16:28:26', '::1', 'Inicio', 0),
(948, '2021-06-27 16:28:35', '::1', 'Video juego', 0),
(949, '2021-06-27 16:36:20', '192.168.0.14', 'Video juego', 0),
(950, '2021-06-27 16:42:44', '::1', 'Video juego', 0),
(951, '2021-06-27 16:46:47', '192.168.0.14', 'Video juego', 0),
(952, '2021-06-27 16:46:54', '192.168.0.14', 'Video juego', 0),
(953, '2021-06-27 16:48:13', '192.168.0.14', 'Video juego', 0),
(954, '2021-06-27 16:48:18', '192.168.0.14', 'Video juego', 0),
(955, '2021-06-27 16:54:04', '::1', 'Video juego', 0),
(956, '2021-06-27 17:04:57', '192.168.0.14', 'Video juego', 0),
(957, '2021-06-27 17:05:34', '192.168.0.14', 'Video juego', 0),
(958, '2021-06-27 17:05:55', '192.168.0.14', 'Video juego', 0),
(959, '2021-06-27 17:06:56', '::1', 'Video juego', 0),
(960, '2021-06-27 17:07:47', '::1', 'Video juego', 0),
(961, '2021-06-27 17:10:13', '192.168.0.16', 'Inicio', 1),
(962, '2021-06-27 17:10:18', '192.168.0.16', 'Video juego', 1),
(963, '2021-06-27 17:17:05', '192.168.0.14', 'Video juego', 0),
(964, '2021-06-27 17:17:19', '192.168.0.14', 'Video juego', 0),
(965, '2021-06-27 17:17:36', '192.168.0.14', 'Video juego', 0),
(966, '2021-06-27 17:17:37', '::1', 'Video juego', 0),
(967, '2021-07-03 10:27:33', '::1', 'Inicio', 0),
(968, '2021-07-03 10:27:48', '::1', 'Serie Web', 0),
(969, '2021-07-03 10:28:24', '::1', 'Serie Web', 0),
(970, '2021-07-03 10:28:31', '::1', 'Periodico Digital', 0),
(971, '2021-07-03 10:28:35', '::1', 'Apoyanos', 0),
(972, '2021-07-03 10:28:41', '::1', 'Inicio', 0),
(973, '2021-07-08 13:34:20', '192.168.0.23', 'Inicio', 0),
(974, '2021-07-08 16:48:23', '::1', 'Inicio', 0),
(975, '2021-08-18 20:43:50', '::1', 'Inicio', 0),
(976, '2021-08-18 20:43:57', '::1', 'Serie Web', 0),
(977, '2023-01-12 15:40:28', '::1', 'Inicio', 0),
(978, '2023-01-12 15:40:45', '::1', 'Serie Web', 0),
(979, '2023-01-12 15:40:59', '::1', 'Podcast', 0),
(980, '2023-01-12 15:41:09', '::1', 'Periodico Digital', 0),
(981, '2023-01-12 15:41:19', '::1', 'Video juego', 0),
(982, '2023-01-12 15:41:42', '::1', 'Organizaciones', 0),
(983, '2023-01-12 15:50:33', '::1', 'Participantes', 0),
(984, '2023-01-12 15:50:42', '::1', 'Apoyanos', 0),
(985, '2023-01-12 15:50:49', '::1', 'Participantes', 0),
(986, '2023-01-12 20:12:39', '::1', 'Participantes', 0),
(987, '2023-01-12 20:13:11', '::1', 'Participantes', 0),
(988, '2023-01-12 20:13:48', '::1', 'Participantes', 0),
(989, '2023-01-12 20:15:11', '::1', 'Participantes', 0),
(990, '2023-01-12 20:15:54', '::1', 'Participantes', 0),
(991, '2023-01-12 20:17:39', '::1', 'Participantes', 0),
(992, '2023-01-12 20:17:46', '::1', 'Participantes', 0),
(993, '2023-01-12 20:17:58', '::1', 'Participantes', 0),
(994, '2023-01-12 20:22:42', '::1', 'Participantes', 0),
(995, '2023-01-12 20:23:14', '::1', 'Participantes', 0),
(996, '2023-01-12 20:23:17', '::1', 'Participantes', 0),
(997, '2023-01-12 20:23:51', '::1', 'Participantes', 0),
(998, '2023-01-12 20:24:12', '::1', 'Participantes', 0),
(999, '2023-01-12 20:24:17', '::1', 'Participantes', 0),
(1000, '2023-01-12 20:24:43', '::1', 'Participantes', 0),
(1001, '2023-01-12 20:24:52', '::1', 'Participantes', 0),
(1002, '2023-01-12 20:25:01', '::1', 'Participantes', 0),
(1003, '2023-01-12 20:25:10', '::1', 'Participantes', 0),
(1004, '2023-01-12 20:25:22', '::1', 'Participantes', 0),
(1005, '2023-01-12 20:25:53', '::1', 'Participantes', 0),
(1006, '2023-01-12 20:26:05', '::1', 'Participantes', 0),
(1007, '2023-01-12 20:26:23', '::1', 'Participantes', 0),
(1008, '2023-01-12 20:27:04', '::1', 'Participantes', 0),
(1009, '2023-01-12 20:27:54', '::1', 'Participantes', 0),
(1010, '2023-01-12 20:28:00', '::1', 'Participantes', 0),
(1011, '2023-01-12 20:28:12', '::1', 'Participantes', 0),
(1012, '2023-01-12 20:28:24', '::1', 'Participantes', 0),
(1013, '2023-01-12 20:28:43', '::1', 'Participantes', 0),
(1014, '2023-01-12 20:29:05', '::1', 'Participantes', 0),
(1015, '2023-01-12 20:29:28', '::1', 'Participantes', 0),
(1016, '2023-01-12 20:29:41', '::1', 'Participantes', 0),
(1017, '2023-01-12 20:30:04', '::1', 'Participantes', 0),
(1018, '2023-01-12 20:30:10', '::1', 'Participantes', 0),
(1019, '2023-01-12 20:30:19', '::1', 'Participantes', 0),
(1020, '2023-01-12 20:32:53', '::1', 'Participantes', 0),
(1021, '2023-01-12 20:33:14', '::1', 'Participantes', 0),
(1022, '2023-01-12 20:33:20', '::1', 'Participantes', 0),
(1023, '2023-01-12 20:33:26', '::1', 'Inicio', 0),
(1024, '2023-01-12 20:33:48', '::1', 'Inicio', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `apoyanos`
--
ALTER TABLE `apoyanos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `construccion`
--
ALTER TABLE `construccion`
  ADD PRIMARY KEY (`id_constr`);

--
-- Indices de la tabla `datauser`
--
ALTER TABLE `datauser`
  ADD PRIMARY KEY (`du_id`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `futuro`
--
ALTER TABLE `futuro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `periodico`
--
ALTER TABLE `periodico`
  ADD PRIMARY KEY (`id_periodico`);

--
-- Indices de la tabla `podcast`
--
ALTER TABLE `podcast`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_seccion` (`id_seccion`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rolesuser`
--
ALTER TABLE `rolesuser`
  ADD PRIMARY KEY (`rol_id`);

--
-- Indices de la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `serieweb`
--
ALTER TABLE `serieweb`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `suscripciones`
--
ALTER TABLE `suscripciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `visitador`
--
ALTER TABLE `visitador`
  ADD UNIQUE KEY `id_visitador` (`id_visitador`);

--
-- Indices de la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD PRIMARY KEY (`id_vis`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `apoyanos`
--
ALTER TABLE `apoyanos`
  MODIFY `id` smallint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `construccion`
--
ALTER TABLE `construccion`
  MODIFY `id_constr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `datauser`
--
ALTER TABLE `datauser`
  MODIFY `du_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `futuro`
--
ALTER TABLE `futuro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `periodico`
--
ALTER TABLE `periodico`
  MODIFY `id_periodico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `podcast`
--
ALTER TABLE `podcast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rolesuser`
--
ALTER TABLE `rolesuser`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `secciones`
--
ALTER TABLE `secciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `serieweb`
--
ALTER TABLE `serieweb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `suscripciones`
--
ALTER TABLE `suscripciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `visitas`
--
ALTER TABLE `visitas`
  MODIFY `id_vis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1025;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `datauser`
--
ALTER TABLE `datauser`
  ADD CONSTRAINT `datauser_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rolesuser` (`rol_id`);

--
-- Filtros para la tabla `podcast`
--
ALTER TABLE `podcast`
  ADD CONSTRAINT `podcast_ibfk_1` FOREIGN KEY (`id_seccion`) REFERENCES `secciones` (`id`);

--
-- Filtros para la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD CONSTRAINT `secciones_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
