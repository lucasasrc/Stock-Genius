-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: stock_genius
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `avaliacoes`
--

DROP TABLE IF EXISTS `avaliacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacoes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `fornecedor_id` int DEFAULT NULL,
  `entrada_id` int DEFAULT NULL,
  `nota_entrega` float DEFAULT NULL,
  `nota_cuidado` float DEFAULT NULL,
  `nota_suporte` float DEFAULT NULL,
  `observacoes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fornecedor_id` (`fornecedor_id`),
  KEY `entrada_id` (`entrada_id`),
  CONSTRAINT `avaliacoes_ibfk_1` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`ID`),
  CONSTRAINT `avaliacoes_ibfk_2` FOREIGN KEY (`entrada_id`) REFERENCES `controle_estoque` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacoes`
--

LOCK TABLES `avaliacoes` WRITE;
/*!40000 ALTER TABLE `avaliacoes` DISABLE KEYS */;
INSERT INTO `avaliacoes` VALUES (1,2,25,8,10,10,'Entrega sem maiores problemas.'),(2,1,26,10,10,9,'');
/*!40000 ALTER TABLE `avaliacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_fornecedor`
--

DROP TABLE IF EXISTS `categoria_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_fornecedor` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `fornecedor_id` int DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fornecedor_id` (`fornecedor_id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `categoria_fornecedor_ibfk_1` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`ID`),
  CONSTRAINT `categoria_fornecedor_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoriaproduto` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_fornecedor`
--

LOCK TABLES `categoria_fornecedor` WRITE;
/*!40000 ALTER TABLE `categoria_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoriaproduto`
--

DROP TABLE IF EXISTS `categoriaproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoriaproduto` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) DEFAULT NULL,
  `Descricao` text,
  `FornecedorID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `unique_categoria_nome` (`Nome`),
  KEY `categoriaproduto_ibfk_1` (`FornecedorID`),
  CONSTRAINT `categoriaproduto_ibfk_1` FOREIGN KEY (`FornecedorID`) REFERENCES `fornecedor` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriaproduto`
--

LOCK TABLES `categoriaproduto` WRITE;
/*!40000 ALTER TABLE `categoriaproduto` DISABLE KEYS */;
INSERT INTO `categoriaproduto` VALUES (1,'Computador All in one','Desktop de mesa de tela.',NULL),(8,'Notebook','Computador completo port√°til.',NULL),(9,'Mouse','Dispositivo para movimenta√ß√£o do cursor do computador.',NULL),(10,'Teclado','Dispositivo para a digita√ß√£o de dados no computador.',NULL),(11,'Fone de Ouvido P2','Dispositivo de √°udio com fio.',NULL);
/*!40000 ALTER TABLE `categoriaproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controle_estoque`
--

DROP TABLE IF EXISTS `controle_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controle_estoque` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_operacao` varchar(50) NOT NULL,
  `NF` varchar(20) DEFAULT NULL,
  `id_produto` int NOT NULL,
  `quantidade` int NOT NULL,
  `id_fornecedor` int NOT NULL,
  `data` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_produto` (`id_produto`),
  KEY `id_fornecedor` (`id_fornecedor`),
  CONSTRAINT `controle_estoque_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`ID`),
  CONSTRAINT `controle_estoque_ibfk_2` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controle_estoque`
--

LOCK TABLES `controle_estoque` WRITE;
/*!40000 ALTER TABLE `controle_estoque` DISABLE KEYS */;
INSERT INTO `controle_estoque` VALUES (1,'ENTRADA','123213',4,3,1,'2024-08-20 17:33:09'),(2,'ENTRADA','52433',3,2,1,'2024-08-20 17:33:09'),(3,'SAIDA','5241',4,1,1,'2024-08-20 18:22:02'),(4,'SAIDA','12',4,1,1,'2024-08-20 18:26:29'),(5,'ENTRADA','354431',4,15,1,'2024-08-20 18:38:13'),(6,'SAIDA','33513',3,1,1,'2024-08-20 18:38:24'),(7,'ENTRADA','65324134',3,3,1,'2024-08-20 18:40:14'),(8,'SAIDA','432',3,1,1,'2024-08-20 18:40:24'),(9,'SAIDA','64534',3,2,1,'2024-08-20 18:42:17'),(10,'ENTRADA','43421',3,5,1,'2024-08-20 18:44:19'),(11,'SAIDA','65341',3,1,1,'2024-08-20 18:44:36'),(12,'ENTRADA','3269596',4,1,1,'2024-08-20 19:46:17'),(13,'SAIDA','159841562',4,13,1,'2024-08-20 19:46:29'),(14,'SAIDA','321431',3,1,1,'2024-08-27 15:29:19'),(15,'ENTRADA','123456',4,7,1,'2024-08-27 15:42:32'),(16,'ENTRADA','38638386',3,3,1,'2024-09-09 18:36:22'),(17,'SAIDA','62473',3,3,1,'2024-09-09 18:36:51'),(18,'SAIDA','42616',3,1,1,'2024-09-10 13:27:37'),(19,'ENTRADA','15412365',5,6,1,'2024-09-10 18:03:48'),(20,'ENTRADA','592564',5,1,1,'2024-09-10 18:09:15'),(21,'SAIDA','15238945',5,1,1,'2024-09-10 18:13:28'),(22,'ENTRADA','56465498',3,5,1,'2024-09-10 18:28:33'),(23,'SAIDA','42141341',3,4,1,'2024-09-10 18:30:07'),(24,'ENTRADA','45781452456',4,1,1,'2024-10-15 14:38:08'),(25,'ENTRADA','3424561',13,2,2,'2024-10-15 14:43:12'),(26,'ENTRADA','6834451',4,1,1,'2024-10-15 15:12:35');
/*!40000 ALTER TABLE `controle_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `RazaoSocial` varchar(255) DEFAULT NULL,
  `CNPJ` varchar(20) NOT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `Cidade` varchar(100) DEFAULT NULL,
  `Endereco` varchar(255) DEFAULT NULL,
  `Numero` int DEFAULT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Avaliacao` float DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `unique_cnpj` (`CNPJ`),
  UNIQUE KEY `unique_fornecedor_nome` (`RazaoSocial`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'MICROSOFT DO BRASIL','04712500000107','SP','SAO PAULO','AV PRESIDENTE JUSCELINO KUBITSCHEK 1909',1909,'11550421999','cadastroteste@microsoft.com',NULL,'04543907'),(2,'LOGITECH DO BRASIL COMERCIO DE ACESSORIOS DE INFORMATICA LTDA.','08573862000115','SP','SAO PAULO','AV DAS NACOES UNIDAS',12995,'1127690730','jrozenblit@logitech.com',NULL,'04578911');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensagens`
--

DROP TABLE IF EXISTS `mensagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensagens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `titulo` varchar(255) NOT NULL,
  `mensagem` text NOT NULL,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `mensagens_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensagens`
--

LOCK TABLES `mensagens` WRITE;
/*!40000 ALTER TABLE `mensagens` DISABLE KEYS */;
INSERT INTO `mensagens` VALUES (1,3,1,'Bem-vindo ao Sistema','Esta √© a sua primeira mensagem no sistema. N√£o se esque√ßa de verificar regularmente para novas notifica√ß√µes.','2024-08-13 23:37:42'),(2,3,1,'T√≠tulo da Segunda Mensagem','Conte√∫do da segunda mensagem para o usu√°rio 3.','2024-08-19 20:17:50'),(4,3,1,'Produto com Estoque Baixo','O estoque do produto Mouse Gamer entrou em estado cr√≠tico, pois a quantia m√≠nima de alerta de 5 unidades foi atingida. Restam apenas 1 unidades.','2024-08-20 21:42:17'),(5,3,1,'Produto com Estoque Baixo','O estoque do produto \'Mouse Gamer\' entrou em estado cr√≠tico, pois a quantia m√≠nima de alerta de 5 unidades foi atingida. Restam apenas 5 unidades.','2024-08-20 21:44:36'),(6,3,1,'Produto com Estoque Baixo','O estoque do produto \'Mouse sem fio\' entrou em estado cr√≠tico, pois a quantia m√≠nima de 5 unidades foi atingida. Restam apenas 5 unidades.','2024-08-20 22:46:29'),(7,3,1,'Produto com Estoque Baixo','O estoque do produto \'Mouse Gamer\' entrou em estado cr√≠tico, pois a quantia m√≠nima de 5 unidades foi atingida. Restam apenas 4 unidades.','2024-08-24 18:29:19'),(8,3,1,'Produto com Estoque Baixo','O estoque do produto \'Mouse Gamer\' entrou em estado cr√≠tico, pois a quantia m√≠nima de 5 unidades foi atingida. Restam apenas 4 unidades.','2024-09-09 21:36:51'),(9,3,1,'Produto com Estoque Baixo','O estoque do produto \'Mouse Gamer\' entrou em estado cr√≠tico, pois a quantia m√≠nima de 5 unidades foi atingida. Restam apenas 3 unidades.','2024-09-10 16:27:37'),(10,5,1,'Produto com Estoque Baixo','O estoque do produto \'Mouse Gamer\' entrou em estado cr√≠tico, pois a quantia m√≠nima de 5 unidades foi atingida. Restam apenas 3 unidades.','2024-09-10 16:27:37'),(11,3,1,'Produto com Estoque Baixo','O estoque do produto \'Mouse Gamer\' entrou em estado cr√≠tico, pois a quantia m√≠nima de 5 unidades foi atingida. Restam apenas 4 unidades.','2024-09-10 21:30:07'),(12,5,1,'Produto com Estoque Baixo','O estoque do produto \'Mouse Gamer\' entrou em estado cr√≠tico, pois a quantia m√≠nima de 5 unidades foi atingida. Restam apenas 4 unidades.','2024-09-10 21:30:07');
/*!40000 ALTER TABLE `mensagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_fornecedor`
--

DROP TABLE IF EXISTS `produto_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_fornecedor` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `produto_id` int DEFAULT NULL,
  `fornecedor_id` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `produto_id` (`produto_id`),
  KEY `fornecedor_id` (`fornecedor_id`),
  CONSTRAINT `produto_fornecedor_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`ID`),
  CONSTRAINT `produto_fornecedor_ibfk_2` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_fornecedor`
--

LOCK TABLES `produto_fornecedor` WRITE;
/*!40000 ALTER TABLE `produto_fornecedor` DISABLE KEYS */;
INSERT INTO `produto_fornecedor` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(8,8,1),(10,10,1),(11,11,1),(12,12,1),(13,13,2),(14,14,2);
/*!40000 ALTER TABLE `produto_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `armazenamento` varchar(50) DEFAULT NULL,
  `fornecedor` varchar(255) DEFAULT NULL,
  `quantidade` int NOT NULL DEFAULT '0',
  `qtde_min` int DEFAULT NULL,
  `cod_barras` varchar(255) NOT NULL,
  `codbarras_img` longblob,
  PRIMARY KEY (`ID`),
  KEY `fk_categoria_nome` (`categoria`),
  CONSTRAINT `fk_categoria_nome` FOREIGN KEY (`categoria`) REFERENCES `categoriaproduto` (`Nome`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Computadores','i5 decima gera√ß√£o\r\n64 gb','Computador All in one','Prateleira 1 - Se√ß√£o A','MICROSOFT DO BRASIL',0,5,'',NULL),(2,'Notebook Dell','Notebook Dell √∫ltima gera√ß√£o.','Notebook','Prateleira 2 - Se√ß√£o A','MICROSOFT DO BRASIL',3,7,'',NULL),(3,'Mouse Gamer','Mouse gamer de alto DPI.','Mouse','Prateleira 2 - Se√ß√£o B','MICROSOFT DO BRASIL',10,6,'',NULL),(4,'Mouse sem fio','Mouse sem fio 2.4 GHz','Mouse','Prateleira 1 - Se√ß√£o B','MICROSOFT DO BRASIL',3,9,'7896986281655',_binary 'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0ê\0\0\0d\0\0\0\'©Ò \0\0\0sRGB\0Æ\Œ\È\0\0\0gAMA\0\0±è¸a\0\0\0	pHYs\0\0\√\0\0\√\«o®d\0\0ÙIDATx^µ\ŒA™$1—πˇ•ˇlâ†DRv—±!;ı\Ô\ÔÑàPr@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒk\Œ8m\‹@44\" VT˜\»\Î\¬Aµ°q˚°¸\ÀO4\÷r˚á¯ºá∏=A¨®\ﬁNï\Z\Î0π°áj\–XüD@DC£°\—ˆ\»Òö≥éD7\rçÄà\’\√=Ú∫pPmh\‹~(ˇÚ\ƒçuÜ\‹˛!>\Ô!nO+™∑S\ÂÜ\∆:Lnhƒ°\Z4\÷\Á\—\–hh¥=r@º\Ê\ÏÅ#\—\∆\rDC# bEıpèº.T\Z∑ ø<ÒDcù!∑à\œ{à\€ƒä\Í\ÌTπ°±ì\Zq®çı˘@D@44\Z\ZmèØ9{\‡H@¥q\—\–àÄXQ=\‹#Ø’Ü\∆\ÌáÚ/O<\—Xg\»\Ì\‚Û\‚ˆ±¢z;Unh¨\√\‰ÜF@™Ac}>\rçÜF\€#\ƒK˛˛˛á\∆\⁄o=LA\≈\0\0\0\0IENDÆB`Ç'),(5,'Leitor de Cart√£o SD','1 TB','Computador All in one','Prateleira 1 - Se√ß√£o A','MICROSOFT DO BRASIL',8,8,'619659161538',NULL),(6,'TESTE','TESTE','Fone de Ouvido P2','Prateleira 1 - Se√ß√£o B','MICROSOFT DO BRASIL',0,3,'7896005810057',NULL),(8,'manteiga de cacau','teste','Computador All in one','Prateleira 2 - Se√ß√£o A','MICROSOFT DO BRASIL',2,6,'7898670901153',NULL),(10,'autoria','teste autoria','Fone de Ouvido P2','Prateleira 1 - Se√ß√£o A','MICROSOFT DO BRASIL',9,4,'1234',NULL),(11,'teste2','123','Fone de Ouvido P2','Prateleira 1 - Se√ß√£o A','MICROSOFT DO BRASIL',4,3,'31431513',NULL),(12,'autoria2','teste2','Computador All in one','Prateleira 1 - Se√ß√£o A','MICROSOFT DO BRASIL',12,5,'298465',NULL),(13,'teste logitech','teste novo fornecedor','Notebook','Prateleira 1 - Se√ß√£o B','LOGITECH DO BRASIL COMERCIO DE ACESSORIOS DE INFORMATICA LTDA.',2,NULL,'54321',NULL),(14,'Teste Produto','Logitech','Teclado','Prateleira 1 - Se√ß√£o A','LOGITECH DO BRASIL COMERCIO DE ACESSORIOS DE INFORMATICA LTDA.',0,NULL,'54321',NULL);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipousuario` (
  `tipo_id` int NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipousuario`
--

LOCK TABLES `tipousuario` WRITE;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` VALUES (1,'ADMIN'),(2,'operador'),(3,'Gerente');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tipo_id` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `usuario` (`usuario`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_tipo_usuario` (`tipo_id`),
  CONSTRAINT `fk_tipo_usuario` FOREIGN KEY (`tipo_id`) REFERENCES `tipousuario` (`tipo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'Lucas Antonio','lucas.santos','56F977581F2A917FAD542827C370093B392B4C33D56F62B5BF90C6841301F8FD','lucasasrc@gmail.com',1),(3,'Operador','teste.operador','56F977581F2A917FAD542827C370093B392B4C33D56F62B5BF90C6841301F8FD','zenifscl@gmail.com',2),(5,'Gerentino da Silva','teste.gerente','56F977581F2A917FAD542827C370093B392B4C33D56F62B5BF90C6841301F8FD','zenthons@hotmail.com',3);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'stock_genius'
--

--
-- Dumping routines for database 'stock_genius'
--
/*!50003 DROP PROCEDURE IF EXISTS `ContarProdutos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ContarProdutos`()
BEGIN
    SELECT 
        SUM(CASE WHEN quantidade > qtde_min THEN 1 ELSE 0 END) AS produtos_ok,
        SUM(CASE WHEN quantidade < qtde_min THEN 1 ELSE 0 END) AS produtos_alerta,
        SUM(CASE WHEN quantidade = 0 THEN 1 ELSE 0 END) AS produtos_zerados
    FROM produtos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ContarProdutosPorCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ContarProdutosPorCategoria`()
BEGIN
    SELECT categoria, COUNT(*) AS quantidade_produtos
    FROM produtos
    GROUP BY categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ContarProdutosPorFornecedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ContarProdutosPorFornecedor`()
BEGIN
    SELECT fornecedor, COUNT(DISTINCT categoria) AS quantidade_produtos 
    FROM produtos 
    GROUP BY fornecedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ExtrairDadosMovimentos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ExtrairDadosMovimentos`(
    IN input_date DATE,
    IN input_start_date DATE,
    IN input_end_date DATE,
    IN input_fornecedor VARCHAR(255)
)
BEGIN
    DECLARE fornecedor_id INT DEFAULT NULL;

    -- Buscar o ID do fornecedor com base no nome fornecido, se especificado
    IF input_fornecedor IS NOT NULL THEN
        SELECT `id` INTO fornecedor_id
        FROM `fornecedor`
        WHERE `RazaoSocial` = input_fornecedor
        LIMIT 1;
    END IF;

    -- Consulta com base na data √∫nica ou intervalo de datas
    IF input_start_date IS NULL AND input_end_date IS NULL THEN
        -- Busca com data √∫nica
        SELECT 
            p.nome AS nome_produto,
            f.RazaoSocial AS nome_fornecedor,
            ce.data,
            ce.tipo_operacao,
            ce.NF,
            ce.quantidade
        FROM 
            controle_estoque ce
        JOIN 
            produtos p ON ce.id_produto = p.id
        JOIN 
            fornecedor f ON ce.id_fornecedor = f.id
        WHERE 
            DATE(ce.data) = input_date
            AND (input_fornecedor IS NULL OR ce.id_fornecedor = fornecedor_id)
        ORDER BY 
            p.nome, ce.data;
    ELSE
        -- Busca com intervalo de datas
        SELECT 
            p.nome AS nome_produto,
            f.RazaoSocial AS nome_fornecedor,
            ce.data,
            ce.tipo_operacao,
            ce.NF,
            ce.quantidade
        FROM 
            controle_estoque ce
        JOIN 
            produtos p ON ce.id_produto = p.id
        JOIN 
            fornecedor f ON ce.id_fornecedor = f.id
        WHERE 
            DATE(ce.data) BETWEEN input_start_date AND input_end_date
            AND (input_fornecedor IS NULL OR ce.id_fornecedor = fornecedor_id)
        ORDER BY 
            p.nome, ce.data;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtrarHistoricoData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtrarHistoricoData`(
    IN input_date DATE,
    IN input_tipo_operacao VARCHAR(50),
    IN input_start_date DATE,
    IN input_end_date DATE,
    IN input_fornecedor VARCHAR(255)
)
BEGIN
    DECLARE fornecedor_id INT;

    -- Buscar o ID do fornecedor com base no nome fornecido
    SELECT `id` INTO fornecedor_id
    FROM `fornecedor`
    WHERE `RazaoSocial` = input_fornecedor
    LIMIT 1;

    -- Se nenhum ID for encontrado, definir fornecedor_id como NULL
    IF fornecedor_id IS NULL THEN
        SET fornecedor_id = 0;
    END IF;

    -- Consulta com base na data √∫nica ou intervalo de datas
    IF input_start_date IS NULL AND input_end_date IS NULL THEN
        -- Busca com data √∫nica
        SELECT * 
        FROM `controle_estoque`
        WHERE DATE(`data`) = input_date 
          AND `tipo_operacao` = input_tipo_operacao
          AND (input_fornecedor IS NULL OR `id_fornecedor` = fornecedor_id);
    ELSE
        -- Busca com intervalo de datas
        SELECT * 
        FROM `controle_estoque`
        WHERE DATE(`data`) BETWEEN input_start_date AND input_end_date
          AND `tipo_operacao` = input_tipo_operacao
          AND (input_fornecedor IS NULL OR `id_fornecedor` = fornecedor_id);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FiltrarHistoricoDataTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FiltrarHistoricoDataTable`(
    IN input_date DATE,
    IN input_tipo_operacao VARCHAR(50),
    IN input_start_date DATE,
    IN input_end_date DATE,
    IN input_fornecedor VARCHAR(255)
)
BEGIN
    DECLARE fornecedor_id INT;

    -- Buscar o ID do fornecedor com base no nome fornecido
    SELECT `id` INTO fornecedor_id
    FROM `fornecedor`
    WHERE `RazaoSocial` = input_fornecedor
    LIMIT 1;

    -- Se nenhum ID for encontrado, definir fornecedor_id como NULL
    IF fornecedor_id IS NULL THEN
        SET fornecedor_id = 0;
    END IF;

    -- Consulta com base na data √∫nica ou intervalo de datas
    IF input_start_date IS NULL AND input_end_date IS NULL THEN
        -- Busca com data √∫nica
        SELECT 
            ce.id,
            ce.NF,
            ce.quantidade,
            ce.data,
            p.nome AS nome_produto,
            f.RazaoSocial AS nome_fornecedor
        FROM 
            controle_estoque ce
        JOIN 
            produtos p ON ce.id_produto = p.id
        JOIN 
            fornecedor f ON ce.id_fornecedor = f.id
        WHERE 
            DATE(ce.data) = input_date
            AND ce.tipo_operacao = input_tipo_operacao
            AND (input_fornecedor IS NULL OR ce.id_fornecedor = fornecedor_id);
    ELSE
        -- Busca com intervalo de datas
        SELECT 
            ce.id,
            ce.NF,
            ce.quantidade,
            ce.data,
            p.nome AS nome_produto,
            f.RazaoSocial AS nome_fornecedor
        FROM 
            controle_estoque ce
        JOIN 
            produtos p ON ce.id_produto = p.id
        JOIN 
            fornecedor f ON ce.id_fornecedor = f.id
        WHERE 
            DATE(ce.data) BETWEEN input_start_date AND input_end_date
            AND ce.tipo_operacao = input_tipo_operacao
            AND (input_fornecedor IS NULL OR ce.id_fornecedor = fornecedor_id);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtrarHistoricoDataUnica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtrarHistoricoDataUnica`(
    IN input_date DATE,
    IN input_tipo_operacao VARCHAR(50)
)
BEGIN
    SELECT * 
    FROM `controle_estoque`
    WHERE DATE(`data`) = input_date 
      AND `tipo_operacao` = input_tipo_operacao;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `FiltrarHistoricoOperacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `FiltrarHistoricoOperacao`(
    IN tipoOperacao VARCHAR(50)
)
BEGIN
    SELECT 
        ce.id,
        ce.NF,
        ce.quantidade,
        ce.data,
        p.nome AS nome_produto,
        f.RazaoSocial AS nome_fornecedor
    FROM 
        controle_estoque ce
    JOIN 
        produtos p ON ce.id_produto = p.id
    JOIN 
        fornecedor f ON ce.id_fornecedor = f.id
    WHERE 
        ce.tipo_operacao = tipoOperacao;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetProdutosPorCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetProdutosPorCategoria`(IN input_categoria VARCHAR(50))
BEGIN
    SELECT 
        categoria,
        ID, 
        nome, 
        armazenamento, 
        quantidade AS Qtde, 
        qtde_min AS QtdeMin, 
        codbarras_img
    FROM produtos
    WHERE (categoria = input_categoria OR input_categoria IS NULL)
    ORDER BY categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetProdutosPorFornecedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetProdutosPorFornecedor`(IN input_fornecedor VARCHAR(255))
BEGIN
    SELECT 
        fornecedor,
        ID, 
        nome, 
        categoria,
        armazenamento, 
        quantidade AS Qtde, 
        qtde_min AS QtdeMin, 
        codbarras_img
    FROM produtos
    WHERE (fornecedor = input_fornecedor OR input_fornecedor IS NULL)
    ORDER BY fornecedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarAvaliacoes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarAvaliacoes`()
BEGIN
    SELECT 
        a.ID AS idAvaliacao,  -- ID da avalia√ß√£o
        f.RazaoSocial AS Fornecedor,
        ROUND((a.nota_entrega + a.nota_cuidado + a.nota_suporte) / 3, 1) AS Nota,
        DATE_FORMAT(c.data, '%d/%m/%Y %H:%i:%s') AS Data
    FROM 
        avaliacoes a
    JOIN 
        fornecedor f ON a.fornecedor_id = f.ID
    JOIN 
        controle_estoque c ON a.entrada_id = c.id
    ORDER BY 
        c.data DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarCategorias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarCategorias`()
BEGIN
    SELECT Nome FROM categoriaproduto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `listarFornecedores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarFornecedores`()
BEGIN
    SELECT RazaoSocial FROM fornecedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListarProdutosEstoqueBaixo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarProdutosEstoqueBaixo`()
BEGIN
    SELECT ID, nome, categoria, fornecedor, quantidade, qtde_min
    FROM produtos
    WHERE quantidade <= qtde_min;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListarProdutosEstoqueOK` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarProdutosEstoqueOK`()
BEGIN
    SELECT ID, nome, categoria, fornecedor, quantidade, qtde_min
    FROM produtos
    WHERE quantidade > qtde_min;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ListarProdutosEstoqueZerado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarProdutosEstoqueZerado`()
BEGIN
    SELECT ID, nome, categoria, fornecedor, quantidade, qtde_min
    FROM produtos
    WHERE quantidade = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrarAvaliacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarAvaliacao`(
    IN p_razaoSocial VARCHAR(255),
    IN p_notaEntrega FLOAT,
    IN p_notaCuidado FLOAT,
    IN p_notaSuporte FLOAT,
    IN p_observacoes VARCHAR(255)
)
BEGIN
    DECLARE v_fornecedor_id INT;
    DECLARE v_entrada_id INT;
    
    -- Buscar o fornecedor_id baseado na RazaoSocial
    SELECT ID INTO v_fornecedor_id
    FROM fornecedor
    WHERE RazaoSocial = p_razaoSocial
    LIMIT 1;

    -- Buscar a entrada_id mais recente na tabela controle_estoque com tipo_operacao ENTRADA
    SELECT id INTO v_entrada_id
    FROM controle_estoque
    WHERE tipo_operacao = 'ENTRADA'
    ORDER BY data DESC
    LIMIT 1;

    -- Inserir a nova avalia√ß√£o na tabela avaliacoes
    INSERT INTO avaliacoes (fornecedor_id, entrada_id, nota_entrega, nota_cuidado, nota_suporte, observacoes)
    VALUES (v_fornecedor_id, v_entrada_id, p_notaEntrega, p_notaCuidado, p_notaSuporte, p_observacoes);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verificarDataMinima` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verificarDataMinima`()
BEGIN
    SELECT DATE_FORMAT(MIN(data), '%d/%m/%Y') AS data_mais_antiga
    FROM controle_estoque;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `visualizarAvaliacao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `visualizarAvaliacao`(
    IN p_idAvaliacao INT
)
BEGIN
    SELECT 
        DATE_FORMAT(c.data, '%d/%m/%Y %H:%i:%s') AS Data,                            -- Data formatada
        f.RazaoSocial AS Fornecedor,                                                 -- Fornecedor
        p.nome AS Produto,                                                           -- Produto
        p.categoria AS Categoria,                                                    -- Categoria
        c.NF AS NotaFiscal,                                                          -- Nota Fiscal
        c.quantidade AS Quantidade,                                                  -- Quantidade
        a.nota_entrega AS NotaEntrega,                                               -- Nota Entrega
        a.nota_cuidado AS NotaCuidado,                                               -- Nota Cuidado
        a.nota_suporte AS NotaSuporte,                                               -- Nota Suporte
        ROUND((a.nota_entrega + a.nota_cuidado + a.nota_suporte) / 3, 1) AS NotaFinal, -- Nota Final (m√©dia das notas)
        a.observacoes AS Observacoes                                                 -- Observa√ß√µes
    FROM 
        avaliacoes a
    JOIN 
        controle_estoque c ON a.entrada_id = c.id  -- Relaciona com a tabela controle_estoque
    JOIN 
        fornecedor f ON a.fornecedor_id = f.ID     -- Relaciona com a tabela fornecedor
    JOIN 
        produtos p ON c.id_produto = p.ID          -- Relaciona com a tabela produtos
    WHERE 
        a.ID = p_idAvaliacao;                      -- Filtra pela avalia√ß√£o recebida como par√¢metro
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-15 16:54:05
