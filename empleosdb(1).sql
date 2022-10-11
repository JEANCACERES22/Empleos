-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2022 a las 05:46:21
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empleosdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authorities`
--

CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `authorities`
--

INSERT INTO `authorities` (`username`, `authority`) VALUES
('luis', 'SUPERVISOR'),
('marisol', 'ADMINISTRADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`) VALUES
(10, 'Contabilidad', 'Descripcion de la categoria Contabilidad'),
(11, 'Ventas', 'Trabajos relacionados con Ventas y precios'),
(12, 'Comunicaciones', 'Trabajos relacionados con Comunicaciones'),
(13, 'Contabilidad', 'Descripcion de la categoria Contabilidad'),
(14, 'Ventas', 'Trabajos relacionados con Ventas'),
(16, 'Blockchain y Bitcoin', 'Trabajos relacionados con Blockchain y Bitcoin, desarrollo de sistemas distribuidos, contratos inteligentes y RESTful APIs basadas en entornos de Open Source'),
(21, 'Electricidad', 'Trabajos relacionados con electricidad'),
(22, 'Carpinteria', 'Categoria de carpinteros, buenos trabajos, pago accesible'),
(23, 'Marisqueria', 'Un restaurante de mariscos es un restaurante que se especializa en cocina de mariscos y platos de mariscos, como pescado y mariscos. Los platos pueden incluir pescado de agua dulce.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id` int(11) NOT NULL,
  `perfil` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id`, `perfil`) VALUES
(1, 'SUPERVISOR'),
(2, 'ADMINISTRADOR'),
(3, 'USUARIO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `archivo` varchar(250) NOT NULL,
  `comentarios` text DEFAULT NULL,
  `idVacante` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
('luis', '{noop}luis123', 1),
('marisol', '{noop}mari123', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioperfil`
--

CREATE TABLE `usuarioperfil` (
  `idUsuario` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarioperfil`
--

INSERT INTO `usuarioperfil` (`idUsuario`, `idPerfil`) VALUES
(1, 2),
(1, 3),
(2, 1),
(3, 3),
(9, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `estatus` int(11) NOT NULL DEFAULT 1,
  `fechaRegistro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `username`, `password`, `estatus`, `fechaRegistro`) VALUES
(1, 'Ivan Tinajero', 'ivanetinajero@gmail.com', 'itinajero', '12345', 1, '2022-10-05'),
(2, 'Luis Esparza Gomez', 'luis@itinajero.net', 'luis', '{noop}luis123', 1, '2019-06-10'),
(3, 'Alan', 'hola@hola.com', 'Alpher82', '12345', 1, '2022-10-09'),
(7, 'gaelgam3r67', 'as@dd', 'gaelgam3r67', 'xd', 1, '2022-10-10'),
(9, 'Marisol Salinas Rodarte', 'marisol@itinajero.net', 'marisol', '{noop}mari123', 1, '2019-06-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacantes`
--

CREATE TABLE `vacantes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` date NOT NULL,
  `salario` double NOT NULL,
  `estatus` enum('Creada','Aprobada','Eliminada') NOT NULL,
  `destacado` int(11) NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `detalles` text DEFAULT NULL,
  `idCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vacantes`
--

INSERT INTO `vacantes` (`id`, `nombre`, `descripcion`, `fecha`, `salario`, `estatus`, `destacado`, `imagen`, `detalles`, `idCategoria`) VALUES
(9, 'Residente de obra Arquitecto o Ing Civil', 'Estamos solicitando Arquitecto / Ing Civil con experiencia en desarrollos habitacionales, en los procesos de venta, comercialización, publicidad y administradores de obras.', '2019-05-08', 200000.9, 'Aprobada', 1, 'logo12.png', '<p><strong>Descripci&oacute;n</strong><br />Empresa constructora solicita personal para puesto de Residente de Obra.<br /><br /><strong>Escolaridad:</strong> Arquitecto y/o Ingeniero Civil<br /><br /><strong>Funci&oacute;n principal:</strong><br />* Supervisi&oacute;n y control de obra<br />* Cuantificacion de avances<br />* Elaboraci&oacute;n de estimaciones<br />* Manejo de contratistas y personal<br />* Estimaciones de avance de obra<br />* Elaboraci&oacute;n de paquetes de obra<br />* Realizaciones de reports de obra<br />* Interpretaci&oacute;n de planos.( Memorias de calculo ..)<br />* An&aacute;lisis de precios unitarios.<br />* Ejecuci&oacute;n de proyectos.<br />* Bit&aacute;cora de obra<br /><br /><strong>Habilidades:</strong><br />* Negociaci&oacute;n, liderazgo, capacidad para resolver conflictos<br />* Opus, AutoCAD, Excell<br /><br /><strong>Requerimientos</strong><br />* Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura<br />* A&ntilde;os de experiencia: 4<br />* Idiomas: Ingl&eacute;s<br />* Edad: entre 27 y 60 a&ntilde;os<br />* Disponibilidad de viajar: No<br />* Disponibilidad de cambio de residencia: No</p>\r\n<p><span style=\"background-color: #ffffff; color: #0000ff;\"><strong>Interesados, favor en enviar su CV en formato PDF aqu&iacute; en la plataforma.</strong></span></p>', 10),
(11, 'Programador de Software', 'Empresa con presencia a nivel nacional, te invita a formar parte de su equipo de trabajo para diseñar, crear y realizar mantenimiento a páginas y aplicaciones web.', '2019-05-09', 19700, 'Aprobada', 0, 'logo15.png', '<p><span style=\"color: #ff0000;\"><strong>PROGRAMADOR DE SOFTWARE</strong></span><br /><br /><strong>OBJETIVO:</strong> DISE&Ntilde;AR, CREAR Y REALIZAR MANTENIMIENTO A P&Aacute;GINAS Y APLICACIONES WEB<br /><br /><strong><span style=\"color: #0000ff;\">REQUISITOS:</span></strong></p>\r\n<p>* EDAD: 25 A 35 A&Ntilde;OS<br />* LICENCIATURA: DESARROLLO DE SOFTWARE, INFORM&Aacute;TICA, INGENIER&Iacute;A EN SISTEMAS COMPUTACIONALES O AF&Iacute;N<br />* INGLES T&Eacute;CNICO<br />* EXPERIENCIA EN PUESTO SIMILAR M&Iacute;NIMA 3 A&Ntilde;OS (ESTAR EJERCIENDO ACTUALMENTE)<br />* MANEJO DE ERP<br />* EXPERIENCIA EN VISUAL C# (2 A&Ntilde;OS)<br />* EXPERIENCIA EN JAVA (2 A&Ntilde;OS)<br />* EXPERIENCIA EN MICROSOFT SQL SERVER (2 A&Ntilde;OS)<br />* EXPERIENCIA DE MVC Y POO (1 A&Ntilde;O)<br /><br /><strong><span style=\"color: #0000ff;\">FUNCIONES: (EXPERIENCIA EN ESTAS ACTIVIDADES)</span></strong></p>\r\n<p>* MANEJO DE C&Oacute;DIGO EN DISTINTOS LENGUAJES DE PROGRAMACI&Oacute;N, TALES COMO HTML, XML PHP Y JAVASCRIPT.<br />* DISE&Ntilde;AR NUEVAS APLICACIONES Y SITIOS DE INTERNET<br />* DETECTAR Y SOLUCIONAR ERRORES O PROBLEMAS EN LA EJECUCI&Oacute;N DE LAS APLICACIONES Y SITIOS WEB.<br />* AGREGAR NUEVAS FUNCIONES A LA EJECUCI&Oacute;N DE LOS SITIOS DE INTERNET Y LAS APLICACIONES<br />* ESTAR AL CORRIENTE CON LOS NUEVOS LENGUAJES DE PROGRAMACI&Oacute;N, TECNOLOG&Iacute;AS Y TENDENCIAS EN EL MERCADO<br />* COLABORAR EN LA ATENCI&Oacute;N Y CAPACITACI&Oacute;N DE LOS USUARIOS EN LOS SISTEMAS IMPLEMENTADOS<br />* DOCUMENTAR ADECUADAMENTE LOS PROGRAMAS DESARROLLADOS<br /><br /><strong><span style=\"color: #0000ff;\">OFERTA:</span></strong></p>\r\n<p>* PERCEPCI&Oacute;N MENSUAL $10,000 NETOS (PAGO QUINCENAL, INCLUYE VALES DE DESPENSA)<br />* PRESTACIONES DE LEY<br />* HORARIO: L-V 9:00 A 7:00 Y S&Aacute;BADO MEDIO D&Iacute;A<br /><br /><span style=\"color: #0000ff;\"><strong>REQUERIMIENTOS</strong></span></p>\r\n<p>* EDUCACI&Oacute;N M&Iacute;NIMA: EDUCACI&Oacute;N SUPERIOR - LICENCIATURA<br />* A&Ntilde;OS DE EXPERIENCIA: 3<br />* IDIOMAS: INGL&Eacute;S<br />* EDAD: ENTRE 25 Y 35 A&Ntilde;OS<br />* CONOCIMIENTOS: SQL SERVER, C#, JAVA, ASP.NET MVC, MYSQL<br />* DISPONIBILIDAD DE VIAJAR: NO<br />* DISPONIBILIDAD DE CAMBIO DE RESIDENCIA: NO</p>\r\n<p><em><strong>SI CUMPLES CON EL PERFIL. POR FAVOR ENVIANOS TU CV POR ESTE MEDIO EN FORMATO PDF, DOCX.</strong></em></p>\r\n<p>&nbsp;</p>', 12),
(12, 'Ejecutivo Contable', 'Empresa internacional solicita Contador Público para realizar las siguientes actividades: conciliaciones y movimientos bancarios, emisión de estados financieros, cálculo de impuestos y presentación de declaraciones, estrategias fiscales, entre otros.', '2019-05-09', 16900, 'Aprobada', 1, 'logo10.png', '<p><strong>EMPRESA L&Iacute;DER EN LA ADMINISTRACI&Oacute;N DE CAPITAL HUMANO EST&Aacute; EN B&Uacute;SQUEDA DE:</strong><br /><br /><strong>EJECUTIVO DE CONTABLE</strong><br /><br /><strong><span style=\"color: #ff0000;\">REQUISITOS:</span></strong><br /><br />- Contabilidad (Titulado o Pasante)<br />- 1 a&ntilde;o de experiencia comprobable en el &aacute;rea contable.<br /><br /><span style=\"color: #ff0000;\"><strong>FUNCIONES:</strong></span><br /><br />- Manejar los registros contables (p&oacute;lizas de ingreso y egresos diarios).<br />- C&aacute;lculo de impuestos provisionales.<br />- C&aacute;lculo de declaraciones anuales para personas morales y f&iacute;sicas.<br />- Elaboraci&oacute;n de estados financieros.<br />- Atenci&oacute;n a visitas domiciliarias.<br /><br /><strong>ZONA DE TRABAJO: Col. Buena Vista, D.F</strong></p>\r\n<p><span style=\"color: #ff0000;\"><strong>OFRECEMOS:</strong></span></p>\r\n<p>- Salario atractivo, seg&uacute;n experiencia.<br />- Prestaciones superiores a las de ley (seguro de vida, seguro de gastos m&eacute;dicos, seguro de gastos funerarios, tarjeta de descuentos, universidad corporativa), desde el primer d&iacute;a.<br /><br /><span style=\"color: #ff0000;\"><strong>REQUERIMIENTOS:</strong></span></p>\r\n<p>- Educaci&oacute;n m&iacute;nima: Educaci&oacute;n superior - Licenciatura<br />- A&ntilde;os de experiencia: 1<br />- Disponibilidad de viajar: Si<br />- Disponibilidad de cambio de residencia: No</p>\r\n<p>INTERESADOS FAVOR DE ENVIAR SU CV POR ESTE MEDIO.<br /><br /><strong>SOMOS UNA EMPRESA INCLUYENTE QUE RESPETA LA DIVERSIDAD Y NO HACE NING&Uacute;N TIPO DE DISCRIMINACI&Oacute;N YA SEA POR G&Eacute;NERO, DISCAPACIDAD, ORIENTACI&Oacute;N POL&Iacute;TICA, RELIGIOSA O SEXUAL, NI CONDICI&Oacute;N SOCIAL O EDAD.</strong></p>', 14),
(14, 'Profesor de Matematicas', 'Escuela Primaria solicita Profesor para curso de Matematicas', '2022-10-05', 8500, 'Aprobada', 0, 'escuela.png', '<h1>Los requisitos para profesor de Matematicas</h1>', 12),
(15, 'Programador de Blockchain y Bitcoin', 'Empresa Mexicana requiere Ing. de Sistemas con experiencia en desarrollo de Blockchain y Bitcoin', '2022-08-24', 30000, 'Aprobada', 1, 'Q26YFVXKWEB-chespirito.jpg', '<p><span style=\"color: #ff0000;\">Ing. en Sistemas</span></p>\r\n<p><span style=\"color: #0000ff;\">Experiencia en sistemas Descentralizados</span></p>', 16),
(19, 'Plomero', 'Trabajos relacionados con la plomeria', '2022-10-09', 12000, 'Aprobada', 1, '6N3UHEZDchespi-3.png', '<p>XDDDDDDDDDDDDDDDDD</p>\r\n<p>Plomeria, Trabajos a domicilio</p>', 14),
(20, 'Carpintero', 'Trabajos acceibles, carpintero al 100', '2022-10-01', 12000, 'Aprobada', 1, 'I2HO74VJchespi-2.jpg', '<p><span style=\"color: #4d5156; font-family: arial, sans-serif;\">La carpinter&iacute;a es el oficio de trabajar la madera para crear objetos &uacute;tiles y agradables al ser humano.</span></p>', 22);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `authorities`
--
ALTER TABLE `authorities`
  ADD UNIQUE KEY `authorities_idx_1` (`username`,`authority`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Vacante_Usuario_UNIQUE` (`idVacante`,`idUsuario`),
  ADD KEY `fk_Solicitudes_Vacantes1_idx` (`idVacante`),
  ADD KEY `fk_Solicitudes_Usuarios1_idx` (`idUsuario`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `usuarioperfil`
--
ALTER TABLE `usuarioperfil`
  ADD UNIQUE KEY `Usuario_Perfil_UNIQUE` (`idUsuario`,`idPerfil`),
  ADD KEY `fk_Usuarios1_idx` (`idUsuario`),
  ADD KEY `fk_Perfiles1_idx` (`idPerfil`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indices de la tabla `vacantes`
--
ALTER TABLE `vacantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vacantes_categorias1_idx` (`idCategoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `vacantes`
--
ALTER TABLE `vacantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `authorities`
--
ALTER TABLE `authorities`
  ADD CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `fk_Solicitudes_Usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `fk_Solicitudes_Vacantes1` FOREIGN KEY (`idVacante`) REFERENCES `vacantes` (`id`);

--
-- Filtros para la tabla `usuarioperfil`
--
ALTER TABLE `usuarioperfil`
  ADD CONSTRAINT `fk_Perfiles1` FOREIGN KEY (`idPerfil`) REFERENCES `perfiles` (`id`),
  ADD CONSTRAINT `fk_Usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `vacantes`
--
ALTER TABLE `vacantes`
  ADD CONSTRAINT `fk_vacantes_categorias1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
