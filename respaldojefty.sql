-- MySQL dump 10.13  Distrib 5.7.14, for Win64 (x86_64)
--
-- Host: localhost    Database: jefty
-- ------------------------------------------------------
-- Server version	5.7.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asignare`
--

DROP TABLE IF EXISTS `asignare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignare` (
  `id_encuesta` int(8) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(8) DEFAULT NULL,
  `id_cliente` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_encuesta`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `asignare_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignare`
--

LOCK TABLES `asignare` WRITE;
/*!40000 ALTER TABLE `asignare` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(8) NOT NULL AUTO_INCREMENT,
  `no_cel` bigint(10) DEFAULT NULL,
  `direcccion` varchar(200) DEFAULT NULL,
  `no_targeta` bigint(12) DEFAULT NULL,
  `id_usuario` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,5569871425,'Calle la condeza #120',56700872097,4),(2,7223369236,'No lo se rick',1234876567,5);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientefrecuente`
--

DROP TABLE IF EXISTS `clientefrecuente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientefrecuente` (
  `id_usuario` int(11) DEFAULT NULL,
  `compra` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientefrecuente`
--

LOCK TABLES `clientefrecuente` WRITE;
/*!40000 ALTER TABLE `clientefrecuente` DISABLE KEYS */;
INSERT INTO `clientefrecuente` VALUES (4,1),(4,1),(4,1),(4,1),(4,1),(4,1),(4,1),(4,1),(4,1),(4,1),(4,1);
/*!40000 ALTER TABLE `clientefrecuente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentario` (
  `id_com` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_com`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criticasplatillo`
--

DROP TABLE IF EXISTS `criticasplatillo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `criticasplatillo` (
  `id_evaluar` int(11) NOT NULL AUTO_INCREMENT,
  `calificacion` int(10) DEFAULT NULL,
  `comentario` varchar(200) DEFAULT NULL,
  `Reto` varchar(200) DEFAULT NULL,
  `id_cliente` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_evaluar`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `criticasplatillo_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criticasplatillo`
--

LOCK TABLES `criticasplatillo` WRITE;
/*!40000 ALTER TABLE `criticasplatillo` DISABLE KEYS */;
/*!40000 ALTER TABLE `criticasplatillo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleventaplatillo`
--

DROP TABLE IF EXISTS `detalleventaplatillo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleventaplatillo` (
  `id_detalleVeta` int(11) NOT NULL AUTO_INCREMENT,
  `id_ventaPlatillo` int(11) DEFAULT NULL,
  `id_platillo` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detalleVeta`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleventaplatillo`
--

LOCK TABLES `detalleventaplatillo` WRITE;
/*!40000 ALTER TABLE `detalleventaplatillo` DISABLE KEYS */;
INSERT INTO `detalleventaplatillo` VALUES (1,1,1,1),(2,1,2,1),(3,4,1,1),(4,5,2,2),(5,5,3,2);
/*!40000 ALTER TABLE `detalleventaplatillo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detevento`
--

DROP TABLE IF EXISTS `detevento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detevento` (
  `id_detEve` int(8) NOT NULL AUTO_INCREMENT,
  `lista_platillos` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_detEve`),
  KEY `lista_platillos` (`lista_platillos`),
  CONSTRAINT `detevento_ibfk_1` FOREIGN KEY (`lista_platillos`) REFERENCES `platillo` (`id_platillo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detevento`
--

LOCK TABLES `detevento` WRITE;
/*!40000 ALTER TABLE `detevento` DISABLE KEYS */;
/*!40000 ALTER TABLE `detevento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detpaquete`
--

DROP TABLE IF EXISTS `detpaquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detpaquete` (
  `id_detPedido` int(8) NOT NULL AUTO_INCREMENT,
  `lista_platillos` int(8) DEFAULT NULL,
  `id_paquete` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_detPedido`),
  KEY `lista_platillos` (`lista_platillos`),
  KEY `id_paquete` (`id_paquete`),
  CONSTRAINT `detpaquete_ibfk_1` FOREIGN KEY (`lista_platillos`) REFERENCES `platillo` (`id_platillo`),
  CONSTRAINT `detpaquete_ibfk_2` FOREIGN KEY (`id_paquete`) REFERENCES `paquete` (`id_paquete`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detpaquete`
--

LOCK TABLES `detpaquete` WRITE;
/*!40000 ALTER TABLE `detpaquete` DISABLE KEYS */;
/*!40000 ALTER TABLE `detpaquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detpedido`
--

DROP TABLE IF EXISTS `detpedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detpedido` (
  `id_detPedido` int(8) NOT NULL AUTO_INCREMENT,
  `lista_platillos` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_detPedido`),
  KEY `lista_platillos` (`lista_platillos`),
  CONSTRAINT `detpedido_ibfk_1` FOREIGN KEY (`lista_platillos`) REFERENCES `platillo` (`id_platillo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detpedido`
--

LOCK TABLES `detpedido` WRITE;
/*!40000 ALTER TABLE `detpedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detpedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detreserv`
--

DROP TABLE IF EXISTS `detreserv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detreserv` (
  `id_detResv` int(8) NOT NULL AUTO_INCREMENT,
  `lista_platillos` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_detResv`),
  KEY `lista_platillos` (`lista_platillos`),
  CONSTRAINT `detreserv_ibfk_1` FOREIGN KEY (`lista_platillos`) REFERENCES `platillo` (`id_platillo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detreserv`
--

LOCK TABLES `detreserv` WRITE;
/*!40000 ALTER TABLE `detreserv` DISABLE KEYS */;
/*!40000 ALTER TABLE `detreserv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) DEFAULT NULL,
  `puesto` varchar(50) DEFAULT NULL,
  `salario` decimal(9,2) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (3,'Juan Alva','vendedor',1500.00,'Baja','client2.png');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta`
--

DROP TABLE IF EXISTS `encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encuesta` (
  `id_encuesta` int(8) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) DEFAULT NULL,
  `pregunta1` varchar(200) DEFAULT NULL,
  `respuesta1` varchar(100) DEFAULT NULL,
  `pregunta2` varchar(200) DEFAULT NULL,
  `respuesta2` varchar(100) DEFAULT NULL,
  `pregunta3` varchar(200) DEFAULT NULL,
  `respuesta3` varchar(100) DEFAULT NULL,
  `pregunta4` varchar(200) DEFAULT NULL,
  `respuesta4` varchar(100) DEFAULT NULL,
  `pregunta5` varchar(200) DEFAULT NULL,
  `respuesta5` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_encuesta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta`
--

LOCK TABLES `encuesta` WRITE;
/*!40000 ALTER TABLE `encuesta` DISABLE KEYS */;
INSERT INTO `encuesta` VALUES (1,'Encuesta de Cliente','¿Encontro lo que buscaba?','si','¿Alguna sugerencia de platillos?','ninguna','¿Recomendaria el sitio web?','si','¿Como le parecio el servicio?','le falta color','¿Que opina del lugar?','esta muy bien');
/*!40000 ALTER TABLE `encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `id_estado` int(8) NOT NULL AUTO_INCREMENT,
  `tipo_estado` varchar(50) DEFAULT NULL,
  `id_empleado` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `id_evento` int(8) NOT NULL AUTO_INCREMENT,
  `tip_evento` varchar(200) DEFAULT NULL,
  `nombre_evento` varchar(200) DEFAULT NULL,
  `fechaeve` date DEFAULT NULL,
  `no_personas` int(8) DEFAULT NULL,
  `id_pago` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `id_pago` (`id_pago`),
  CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id_menu` int(8) NOT NULL AUTO_INCREMENT,
  `PrimerP` varchar(100) DEFAULT NULL,
  `SegundoP` varchar(100) DEFAULT NULL,
  `TercerP` varchar(100) DEFAULT NULL,
  `Postre` varchar(100) DEFAULT NULL,
  `Costo` int(20) DEFAULT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesas`
--

DROP TABLE IF EXISTS `mesas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesas` (
  `id_mesa` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(80) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_mesa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesas`
--

LOCK TABLES `mesas` WRITE;
/*!40000 ALTER TABLE `mesas` DISABLE KEYS */;
INSERT INTO `mesas` VALUES (1,'Pasillo','Disponible'),(2,'Balcon','Disponible'),(3,'Barra','Disponible');
/*!40000 ALTER TABLE `mesas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagos` (
  `id_pago` int(8) NOT NULL AUTO_INCREMENT,
  `total` decimal(9,2) DEFAULT NULL,
  `tipo_tarjeta` varchar(200) DEFAULT NULL,
  `id_targeta` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,716.30,'credito',3123556),(2,250.00,'null',3123556),(3,250.00,'credito',3123556);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquete`
--

DROP TABLE IF EXISTS `paquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paquete` (
  `id_paquete` int(8) NOT NULL AUTO_INCREMENT,
  `costoTot` decimal(9,2) DEFAULT NULL,
  `id_pago` int(8) DEFAULT NULL,
  `id_cliente` int(8) DEFAULT NULL,
  `id_paqueteFK` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_paquete`),
  KEY `id_pago` (`id_pago`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `paquete_ibfk_1` FOREIGN KEY (`id_pago`) REFERENCES `pagos` (`id_pago`),
  CONSTRAINT `paquete_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquete`
--

LOCK TABLES `paquete` WRITE;
/*!40000 ALTER TABLE `paquete` DISABLE KEYS */;
INSERT INTO `paquete` VALUES (1,250.00,2,1,1),(2,250.00,3,1,1);
/*!40000 ALTER TABLE `paquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquetes`
--

DROP TABLE IF EXISTS `paquetes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paquetes` (
  `id_paq` int(8) NOT NULL AUTO_INCREMENT,
  `nombrePa` varchar(30) DEFAULT NULL,
  `nombrePla` varchar(30) DEFAULT NULL,
  `cantidadP` int(30) DEFAULT NULL,
  `nombreBe` varchar(30) DEFAULT NULL,
  `cantidadB` int(30) DEFAULT NULL,
  `Postre` varchar(40) DEFAULT NULL,
  `cantidadPo` int(20) DEFAULT NULL,
  `noPersona` int(20) DEFAULT NULL,
  `Costo` int(20) DEFAULT NULL,
  PRIMARY KEY (`id_paq`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquetes`
--

LOCK TABLES `paquetes` WRITE;
/*!40000 ALTER TABLE `paquetes` DISABLE KEYS */;
INSERT INTO `paquetes` VALUES (1,'Tacos','Taquitos',15,'Chesco',2,'Pastel',3,2,250);
/*!40000 ALTER TABLE `paquetes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `id_pedido` int(8) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` varchar(30) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `id_cliente` int(8) DEFAULT NULL,
  `id_platillo` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_platillo` (`id_platillo`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`id_platillo`) REFERENCES `platillo` (`id_platillo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platillo`
--

DROP TABLE IF EXISTS `platillo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platillo` (
  `id_platillo` int(8) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `rutafoto` varchar(150) DEFAULT NULL,
  `precio` decimal(9,2) DEFAULT NULL,
  `categoria` varchar(200) DEFAULT NULL,
  `tipo` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_platillo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platillo`
--

LOCK TABLES `platillo` WRITE;
/*!40000 ALTER TABLE `platillo` DISABLE KEYS */;
INSERT INTO `platillo` VALUES (1,'Budín azteca','Platillo con arroz','hdkdknlñe_kenfkwe',250.00,'Comida','Veracruzano'),(2,'Sábana a la tampiqueña','Aconpañado con aguacate y tostadas','hdkdknlñe_kenfkwe',180.00,'Desayuno','Mexicano'),(3,'Consomé ranchero','Con trozitos de chile de arbol','hdkdknlñe_kenfkwe',145.00,'Comida','mexicano'),(4,'Huachinango a la veracruzana','Plato tipico de veracruz','hdkdknlñe_kenfkwe',189.00,'Comida','Veracruzano'),(5,'Tamales oaxaqueños','Con queso oaxaca','hdkdknlñe_kenfkwe',100.00,'Comida','Mexicano');
/*!40000 ALTER TABLE `platillo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntoscliente`
--

DROP TABLE IF EXISTS `puntoscliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puntoscliente` (
  `id_usuario` int(11) DEFAULT NULL,
  `puntos` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntoscliente`
--

LOCK TABLES `puntoscliente` WRITE;
/*!40000 ALTER TABLE `puntoscliente` DISABLE KEYS */;
INSERT INTO `puntoscliente` VALUES (4,71);
/*!40000 ALTER TABLE `puntoscliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservacion`
--

DROP TABLE IF EXISTS `reservacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservacion` (
  `id_reservacion` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_reservacion` date DEFAULT NULL,
  `hora_reservacion` time DEFAULT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `hora_llegada` time DEFAULT NULL,
  `no_comensales` int(11) DEFAULT NULL,
  `id_mesa` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_reservacion`),
  KEY `id_mesa` (`id_mesa`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `reservacion_ibfk_1` FOREIGN KEY (`id_mesa`) REFERENCES `mesas` (`id_mesa`),
  CONSTRAINT `reservacion_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservacion`
--

LOCK TABLES `reservacion` WRITE;
/*!40000 ALTER TABLE `reservacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjetacredito`
--

DROP TABLE IF EXISTS `tarjetacredito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarjetacredito` (
  `id_tarjetaCredito` int(8) NOT NULL AUTO_INCREMENT,
  `venci_dia` int(2) DEFAULT NULL,
  `venci_an` int(4) DEFAULT NULL,
  `tipo` varchar(200) DEFAULT NULL,
  `propietario` varchar(200) DEFAULT NULL,
  `id_cliente` int(8) DEFAULT NULL,
  `saldo` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id_tarjetaCredito`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=MyISAM AUTO_INCREMENT=3123557 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjetacredito`
--

LOCK TABLES `tarjetacredito` WRITE;
/*!40000 ALTER TABLE `tarjetacredito` DISABLE KEYS */;
INSERT INTO `tarjetacredito` VALUES (3123556,1,2021,'Credito','Fernando',1,560.50);
/*!40000 ALTER TABLE `tarjetacredito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjetaprepago`
--

DROP TABLE IF EXISTS `tarjetaprepago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarjetaprepago` (
  `id_tarjetaPrepago` int(8) NOT NULL AUTO_INCREMENT,
  `venci_dia` int(2) DEFAULT NULL,
  `venci_an` int(4) DEFAULT NULL,
  `propietario` varchar(200) DEFAULT NULL,
  `id_cliente` int(8) DEFAULT NULL,
  `saldo` decimal(9,2) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_tarjetaPrepago`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjetaprepago`
--

LOCK TABLES `tarjetaprepago` WRITE;
/*!40000 ALTER TABLE `tarjetaprepago` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjetaprepago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(8) NOT NULL AUTO_INCREMENT,
  `nomUsuario` varchar(70) DEFAULT NULL,
  `Contrasena` varchar(70) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `apellidopat` varchar(200) DEFAULT NULL,
  `apellidomat` varchar(200) DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'LucytaniaRuz ','ed321','Lucytania','Domingoo','Hernandez','gerente',NULL,'Activo'),(2,'Juanito ','ed3dd','Juanito','Lopez','Gonzales','gerente',NULL,'Activo'),(3,'AlejandraPasty','ed3ss','Alejandra','Pastrana','Sanchez','cliente',NULL,'Activo'),(4,'Fernando','eddf3ss','Fernando','Cruz','Cruz','cliente',NULL,'Activo'),(5,'galy97','123','Ivonne','Davila','Julio','Cliente',NULL,'Activo');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventaplatillos`
--

DROP TABLE IF EXISTS `ventaplatillos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventaplatillos` (
  `id_ventaPlatillo` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tipoPago` varchar(50) DEFAULT NULL,
  `restante` float DEFAULT NULL,
  PRIMARY KEY (`id_ventaPlatillo`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventaplatillos`
--

LOCK TABLES `ventaplatillos` WRITE;
/*!40000 ALTER TABLE `ventaplatillos` DISABLE KEYS */;
INSERT INTO `ventaplatillos` VALUES (1,4,2,473.86,'2018-07-10','credito',249.4),(2,4,0,0,'2018-07-10','credito',0),(3,4,0,0,'2018-07-10','credito',0),(4,4,1,275.5,'2018-07-10','credito',145),(5,4,2,716.3,'2018-07-21','credito',0);
/*!40000 ALTER TABLE `ventaplatillos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'jefty'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-21 18:55:17
