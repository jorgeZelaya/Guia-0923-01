-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2016 a las 02:25:53
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_inventario`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_del_producto` (`p_id_producto` INT)  begin
delete from
tbl_producto
where id_producto = p_id_producto;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_ins_producto` (`id_unidad_medida` INT, `nombre` VARCHAR(100), `descripcion` VARCHAR(500))  begin
insert into tbl_producto
(id_unidad_medida, nombre, descripcion)
values (id_unidad_medida, nombre, descripcion);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_sel_productos` ()  begin
select * from vis_productos;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_upd_producto` (`p_id_producto` INT, `p_id_unidad_medida` INT, `p_nombre` VARCHAR(100), `p_descripcion` VARCHAR(500))  begin
update tbl_producto
set
id_unidad_medida = p_id_unidad_medida,
nombre = p_nombre,
descripcion = p_descripcion
where
id_producto = p_id_producto;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_personas`
--

CREATE TABLE `tbl_personas` (
  `id_persona` int(11) NOT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_personas`
--

INSERT INTO `tbl_personas` (`id_persona`, `nombres`, `apellidos`) VALUES
(1, 'Claudia', 'Rivas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_producto`
--

CREATE TABLE `tbl_producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `id_unidad_medida` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_unidad_medida`
--

CREATE TABLE `tbl_unidad_medida` (
  `id_unidad_medida` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `abreviado` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_unidad_medida`
--

INSERT INTO `tbl_unidad_medida` (`id_unidad_medida`, `descripcion`, `abreviado`) VALUES
(1, 'libras', 'lb'),
(2, 'kilogramos', 'kg');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vis_productos`
--
CREATE TABLE `vis_productos` (
`id_producto` int(11)
,`nombre` varchar(100)
,`descripcion` varchar(500)
,`unidad_medida` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vis_productos`
--
DROP TABLE IF EXISTS `vis_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vis_productos`  AS  select `a`.`id_producto` AS `id_producto`,`a`.`nombre` AS `nombre`,`a`.`descripcion` AS `descripcion`,`b`.`descripcion` AS `unidad_medida` from (`tbl_producto` `a` left join `tbl_unidad_medida` `b` on((`a`.`id_unidad_medida` = `b`.`id_unidad_medida`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_personas`
--
ALTER TABLE `tbl_personas`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_tbl_producto_tbl_unidad_medida_idx` (`id_unidad_medida`);

--
-- Indices de la tabla `tbl_unidad_medida`
--
ALTER TABLE `tbl_unidad_medida`
  ADD PRIMARY KEY (`id_unidad_medida`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_personas`
--
ALTER TABLE `tbl_personas`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_unidad_medida`
--
ALTER TABLE `tbl_unidad_medida`
  MODIFY `id_unidad_medida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
  ADD CONSTRAINT `fk_tbl_producto_tbl_unidad_medida` FOREIGN KEY (`id_unidad_medida`) REFERENCES `tbl_unidad_medida` (`id_unidad_medida`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
