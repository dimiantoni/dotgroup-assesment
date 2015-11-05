# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.42)
# Database: tasks
# Generation Time: 2015-11-05 16:24:20 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# Dump of database teste_tecnico
# ------------------------------------------------------------

DROP DATABASE IF EXISTS `teste_tecnico`;

CREATE DATABASE `teste_tecnico`;

USE teste_tecnico;

# Dump of table tasks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tasks`;

CREATE TABLE `tasks` (
  `id_task` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title_task` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `order_task` int(11) unsigned DEFAULT NULL,
  `status` smallint(2) DEFAULT '0' COMMENT '1=ativo,2=concluido,3=deletado',
  `date_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_task`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;

INSERT INTO `tasks` (`id_task`, `title_task`, `description`, `order_task`, `status`, `date_create`)
VALUES
	(1,'Análise de Requisitos do Sistema','Alinhar e validar requisitos com o PO do projeto',3,0,'2015-10-25 03:36:17'),
	(2,'Especificar Requisitos','Escrever as histórias e criar boards no kamban de development no trello',2,0,'2015-10-25 03:36:17'),
	(3,'Definição de Arquitetura','Escolha das tecnologias e definição da arquitetura do projeto',1,0,'2015-10-25 03:36:17'),
	(4,'Start In Development','Criar Repositório no Bitbucket, Configurar ambientes de dev, iniciar CodeBase com framework escolhido, fazer configurações iniciais e primeiro commit.',5,0,'2015-10-25 03:36:17'),
	(5,'Provas de conceito','Realizar primeiros testes com base em escopos iniciais e apresentar provas de conceito ao PO para validar estratégia de start do projeto',6,0,'2015-10-25 03:36:17'),
	(6,'Análise de Negócios','Análise de Negócios, estudos de caso, validação de hipóteses simulação de cenários',7,0,'2015-10-25 03:45:12'),
	(7,'Distribuição das tarefas e Estimamativas de esforços ','Realizar reunição de planejamento junto a equipe, estimar esforços e separar histórias por sprints conforme estimativas pré-definidas pela equipe.',8,0,'2015-10-25 03:54:53'),
	(8,'Development history 1','implementação em refatoração de funcionalidade 1',9,0,'2015-10-25 12:29:19'),
	(9,'Development history 2','implementação em refactor de funcionalidade 2',10,0,'2015-10-25 12:29:42'),
	(10,'Development history 3','implementação em refactor de funcionalidade 3',11,0,'2015-10-25 12:30:07'),
	(11,'Development history 4','implementação em refactor de funcionalidade 4',12,0,'2015-10-25 12:30:31'),
	(13,'Development history 6','implementação em refactor de funcionalidade 6',13,0,'2015-10-25 12:31:09'),
	(14,'Development history 7','implementação em refatoração de funcionalidade 7',14,0,'2015-10-25 12:31:42'),
	(15,'Development history 8','implementação em refatoração de funcionalidade 8',15,0,'2015-10-25 12:32:04'),
	(16,'Development history 9','implementação em refactor de funcionalidade 9',16,0,'2015-10-25 12:32:26'),
	(17,'Development history 10','implementação em refactor de funcionalidade 10',17,0,'2015-10-25 12:32:58'),
	(18,'Development history 11','implementação em refactor de funcionalidade 11',18,0,'2015-10-25 12:35:35'),
	(19,'Development history 12','implementação em refactor de funcionalidade 12',19,0,'2015-10-25 12:35:46'),
	(20,'Development history 13','implementação em refactor de funcionalidade 13',20,0,'2015-10-25 12:35:52'),
	(21,'Development history 14','implementação em refactor de funcionalidade 14',21,0,'2015-10-25 12:35:59'),
	(22,'Development history 15','implementação em refactor de funcionalidade 15',22,0,'2015-10-25 12:36:05'),
	(23,'Development history 16','implementação e refactor de funcionalidade 16',23,0,'2015-10-25 12:36:11'),
	(24,'Development history 17','implementação em refactor do código da funcionalidade 17',4,0,'2015-10-25 12:36:16'),
	(49,'Development history 17','Implementação e refactor do código da tarefa 17',24,0,'2015-11-05 11:44:24');

/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
