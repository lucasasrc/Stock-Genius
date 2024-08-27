-- MySQL dump 10.13  Distrib 9.0.1, for Win64 (x86_64)
--
-- Host: localhost    Database: stock_genius
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

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
INSERT INTO `categoriaproduto` VALUES (1,'Computador All in one','Desktop de mesa de tela.',NULL),(8,'Notebook','Computador completo portátil.',NULL),(9,'Mouse','Dispositivo para movimentação do cursor do computador.',NULL),(10,'Teclado','Dispositivo para a digitação de dados no computador.',NULL),(11,'Fone de Ouvido P2','Dispositivo de áudio com fio.',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controle_estoque`
--

LOCK TABLES `controle_estoque` WRITE;
/*!40000 ALTER TABLE `controle_estoque` DISABLE KEYS */;
INSERT INTO `controle_estoque` VALUES (1,'ENTRADA','123213',4,3,1,'2024-08-20 17:33:09'),(2,'ENTRADA','52433',3,2,1,'2024-08-20 17:33:09'),(3,'SAIDA','5241',4,1,1,'2024-08-20 18:22:02'),(4,'SAIDA','12',4,1,1,'2024-08-20 18:26:29'),(5,'ENTRADA','354431',4,15,1,'2024-08-20 18:38:13'),(6,'SAIDA','33513',3,1,1,'2024-08-20 18:38:24'),(7,'ENTRADA','65324134',3,3,1,'2024-08-20 18:40:14'),(8,'SAIDA','432',3,1,1,'2024-08-20 18:40:24'),(9,'SAIDA','64534',3,2,1,'2024-08-20 18:42:17'),(10,'ENTRADA','43421',3,5,1,'2024-08-20 18:44:19'),(11,'SAIDA','65341',3,1,1,'2024-08-20 18:44:36'),(12,'ENTRADA','3269596',4,1,1,'2024-08-20 19:46:17'),(13,'SAIDA','159841562',4,13,1,'2024-08-20 19:46:29'),(14,'SAIDA','321431',3,1,1,'2024-08-27 15:29:19'),(15,'ENTRADA','123456',4,7,1,'2024-08-27 15:42:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'MICROSOFT DO BRASIL','04712500000107','SP','SAO PAULO','AV PRESIDENTE JUSCELINO KUBITSCHEK 1909',1909,'11550421999','cadastroteste@microsoft.com',NULL,'04543907');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensagens`
--

LOCK TABLES `mensagens` WRITE;
/*!40000 ALTER TABLE `mensagens` DISABLE KEYS */;
INSERT INTO `mensagens` VALUES (1,3,1,'Bem-vindo ao Sistema','Esta é a sua primeira mensagem no sistema. Não se esqueça de verificar regularmente para novas notificações.','2024-08-13 23:37:42'),(2,3,1,'Título da Segunda Mensagem','Conteúdo da segunda mensagem para o usuário 3.','2024-08-19 20:17:50'),(4,3,1,'Produto com Estoque Baixo','O estoque do produto Mouse Gamer entrou em estado crítico, pois a quantia mínima de alerta de 5 unidades foi atingida. Restam apenas 1 unidades.','2024-08-20 21:42:17'),(5,3,1,'Produto com Estoque Baixo','O estoque do produto \'Mouse Gamer\' entrou em estado crítico, pois a quantia mínima de alerta de 5 unidades foi atingida. Restam apenas 5 unidades.','2024-08-20 21:44:36'),(6,3,1,'Produto com Estoque Baixo','O estoque do produto \'Mouse sem fio\' entrou em estado crítico, pois a quantia mínima de 5 unidades foi atingida. Restam apenas 5 unidades.','2024-08-20 22:46:29'),(7,3,1,'Produto com Estoque Baixo','O estoque do produto \'Mouse Gamer\' entrou em estado crítico, pois a quantia mínima de 5 unidades foi atingida. Restam apenas 4 unidades.','2024-08-24 18:29:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_fornecedor`
--

LOCK TABLES `produto_fornecedor` WRITE;
/*!40000 ALTER TABLE `produto_fornecedor` DISABLE KEYS */;
INSERT INTO `produto_fornecedor` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1);
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
  `fornecedor` varchar(50) DEFAULT NULL,
  `quantidade` int NOT NULL DEFAULT '0',
  `qtde_min` int DEFAULT NULL,
  `cod_barras` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_categoria_nome` (`categoria`),
  CONSTRAINT `fk_categoria_nome` FOREIGN KEY (`categoria`) REFERENCES `categoriaproduto` (`Nome`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Computadores','i5 decima geração\r\n64 gb','Computador All in one','Prateleira 1 - Seção A','MICROSOFT DO BRASIL',0,5,''),(2,'Notebook Dell','Notebook Dell última geração.','Notebook','Prateleira 2 - Seção A','MICROSOFT DO BRASIL',0,5,''),(3,'Mouse Gamer','Mouse gamer de alto DPI.','Mouse','Prateleira 2 - Seção B','MICROSOFT DO BRASIL',4,5,''),(4,'Mouse sem fio','Mouse sem fio 2.4 GHz','Mouse','Prateleira 1 - Seção B','MICROSOFT DO BRASIL',12,5,''),(5,'Leitor de Cartão SD','1 TB','Computador All in one','Prateleira 1 - Seção A','MICROSOFT DO BRASIL',0,NULL,'619659161538');
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
INSERT INTO `tipousuario` VALUES (1,'ADMIN'),(2,'operador');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'Lucas Antonio','lucas.santos','FBFE49562F7F19C8FDA9A7E32D6A50AE76F2043AC7E49667B2C5284AB9C87486','lucasasrc@gmail.com',1),(3,'Operador','teste.operador','56F977581F2A917FAD542827C370093B392B4C33D56F62B5BF90C6841301F8FD','zenifscl@gmail.com',2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-27 17:06:08
