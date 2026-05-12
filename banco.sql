CREATE DATABASE  IF NOT EXISTS `tech_repair_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tech_repair_db`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: tech_repair_db
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'João Silva','(17) 99111-1001','joao.silva@email.com'),(2,'João Silva','(17) 99111-1001','joao.silva@email.com'),(3,'Maria Oliveira','(17) 99111-1002','maria.oliveira@email.com'),(4,'Carlos Souza','(17) 99111-1003','carlos.souza@email.com'),(5,'Ana Pereira','(17) 99111-1004','ana.pereira@email.com'),(6,'Lucas Ferreira','(17) 99111-1005','lucas.ferreira@email.com'),(7,'Fernanda Costa','(17) 99111-1006','fernanda.costa@email.com'),(8,'Rafael Gomes','(17) 99111-1007','rafael.gomes@email.com'),(9,'Juliana Martins','(17) 99111-1008','juliana.martins@email.com'),(10,'Pedro Almeida','(17) 99111-1009','pedro.almeida@email.com'),(11,'Camila Rocha','(17) 99111-1010','camila.rocha@email.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispositivos`
--

DROP TABLE IF EXISTS `dispositivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dispositivos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `marca` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `dispositivos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispositivos`
--

LOCK TABLES `dispositivos` WRITE;
/*!40000 ALTER TABLE `dispositivos` DISABLE KEYS */;
INSERT INTO `dispositivos` VALUES (1,1,'Galaxy S22','Samsung'),(2,2,'iPhone 13','Apple'),(3,3,'Moto G84','Motorola'),(4,4,'Redmi Note 12','Xiaomi'),(5,5,'Aspire 5','Acer'),(6,6,'Inspiron 15','Dell'),(7,7,'IdeaPad 3','Lenovo'),(8,8,'MacBook Air M1','Apple'),(9,9,'Galaxy Tab S8','Samsung'),(10,10,'Pavilion Gaming','HP');
/*!40000 ALTER TABLE `dispositivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordens_servico`
--

DROP TABLE IF EXISTS `ordens_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordens_servico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dispositivo_id` int NOT NULL,
  `tecnicos_id` int NOT NULL,
  `descricao_problema` text,
  `status` enum('Aguardando','Em Manutenção','Pronto') NOT NULL DEFAULT 'Aguardando',
  `data_abertura` date NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`id`),
  KEY `dispositivo_id` (`dispositivo_id`),
  KEY `tecnicos_id` (`tecnicos_id`),
  CONSTRAINT `ordens_servico_ibfk_1` FOREIGN KEY (`dispositivo_id`) REFERENCES `dispositivos` (`id`),
  CONSTRAINT `ordens_servico_ibfk_2` FOREIGN KEY (`tecnicos_id`) REFERENCES `tecnicos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordens_servico`
--

LOCK TABLES `ordens_servico` WRITE;
/*!40000 ALTER TABLE `ordens_servico` DISABLE KEYS */;
INSERT INTO `ordens_servico` VALUES (1,1,1,'Tela quebrada','Aguardando','2026-04-01'),(2,2,7,'Bateria descarregando rápido','Em Manutenção','2026-04-02'),(3,3,6,'Sistema travando','Pronto','2026-04-03'),(4,4,1,'Não liga','Em Manutenção','2026-04-04'),(5,5,2,'Teclado com falha','Aguardando','2026-04-05'),(6,6,3,'Superaquecimento','Em Manutenção','2026-04-06'),(7,7,7,'Troca de tela','Pronto','2026-04-07'),(8,8,9,'Lentidão no sistema','Aguardando','2026-04-08'),(9,9,4,'Problema no carregamento','Em Manutenção','2026-04-09'),(10,10,10,'Ventoinha com ruído','Pronto','2026-04-10'),(11,1,1,'Tela quebrada','Aguardando','2026-04-01'),(12,2,7,'Bateria descarregando rápido','Em Manutenção','2026-04-02'),(13,3,6,'Sistema travando','Pronto','2026-04-03'),(14,4,1,'Não liga','Em Manutenção','2026-04-04'),(15,5,2,'Teclado com falha','Aguardando','2026-04-05'),(16,6,3,'Superaquecimento','Em Manutenção','2026-04-06'),(17,7,7,'Troca de tela','Pronto','2026-04-07'),(18,8,9,'Lentidão no sistema','Aguardando','2026-04-08'),(19,9,4,'Problema no carregamento','Em Manutenção','2026-04-09'),(20,10,10,'Ventoinha com ruído','Pronto','2026-04-10');
/*!40000 ALTER TABLE `ordens_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnicos`
--

DROP TABLE IF EXISTS `tecnicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnicos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `especialidade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnicos`
--

LOCK TABLES `tecnicos` WRITE;
/*!40000 ALTER TABLE `tecnicos` DISABLE KEYS */;
INSERT INTO `tecnicos` VALUES (1,'André Lima','Smartphones'),(2,'Beatriz Santos','Notebooks'),(3,'Renata Alves','Tablets'),(4,'Gustavo Ribeiro','Redes'),(5,'Patrícia Fernandes','Apple Devices'),(6,'Diego Carvalho','Dell'),(7,'Vanessa Rocha','Soldagem'),(8,'Ricardo Nunes','Formatação'),(9,'Galaxy Tab S8','Samsung'),(10,'Tatiane Melo','Manutenção Geral'),(11,'André Lima','Smartphones'),(12,'Beatriz Santos','Notebooks'),(13,'Renata Alves','Tablets'),(14,'Gustavo Ribeiro','Redes'),(15,'Patrícia Fernandes','Apple Devices'),(16,'Diego Carvalho','Dell'),(17,'Vanessa Rocha','Soldagem'),(18,'Ricardo Nunes','Formatação'),(19,'Galaxy Tab S8','Samsung'),(20,'Tatiane Melo','Manutenção Geral');
/*!40000 ALTER TABLE `tecnicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tech_repair_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-11 21:36:29
