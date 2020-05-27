-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: simeu
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Table structure for table `academics`
--

DROP TABLE IF EXISTS `academics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academics` (
  `id_academic` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de periodo academico',
  `id_school` int(11) NOT NULL COMMENT 'id de escuela',
  `id_department_director` int(11) NOT NULL COMMENT 'Ingresar numero de dni del director en curso',
  `id_school_coordinator` int(11) NOT NULL COMMENT 'Ingresar numero de dni del coordinador en curso',
  `name` varchar(255) NOT NULL COMMENT 'Ingresar codigo de semestre ejemplo 2020-1',
  `estate` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_academic`),
  KEY `school_key` (`id_school`),
  KEY `director_key` (`id_department_director`),
  KEY `cordinator_key` (`id_school_coordinator`),
  CONSTRAINT `academics_ibfk_1` FOREIGN KEY (`id_school`) REFERENCES `schools` (`id_school`),
  CONSTRAINT `academics_ibfk_2` FOREIGN KEY (`id_department_director`) REFERENCES `department_directors` (`id_department_director`),
  CONSTRAINT `academics_ibfk_3` FOREIGN KEY (`id_school_coordinator`) REFERENCES `school_coordinators` (`id_school_coordinator`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics`
--

LOCK TABLES `academics` WRITE;
/*!40000 ALTER TABLE `academics` DISABLE KEYS */;
INSERT INTO `academics` VALUES (1,1,1,1,'2020-1',0,'2020-05-27 09:11:19','2020-05-27 09:11:19');
/*!40000 ALTER TABLE `academics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignments` (
  `assignment_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_section` int(11) NOT NULL COMMENT 'id de seccion o grupo de curso',
  `id_course` int(11) NOT NULL COMMENT 'id de curso',
  `id_shift` int(11) NOT NULL COMMENT 'id de turno',
  `id_teacher` int(11) NOT NULL COMMENT 'id de docente',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`assignment_id`),
  KEY `section_id` (`id_section`),
  KEY `course_id` (`id_course`),
  KEY `shift_id` (`id_shift`),
  KEY `teacher_id` (`id_teacher`),
  CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`id_section`) REFERENCES `sections` (`id_section`),
  CONSTRAINT `assignments_ibfk_2` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id_course`),
  CONSTRAINT `assignments_ibfk_3` FOREIGN KEY (`id_shift`) REFERENCES `shifts` (`id_shift`),
  CONSTRAINT `assignments_ibfk_4` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id_teacher`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `id_course` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de curso',
  `id_semester` int(11) NOT NULL COMMENT 'id de semestre',
  `id_type` int(11) NOT NULL COMMENT 'id de tipo de curso: obligatorio, etc',
  `name` varchar(255) NOT NULL COMMENT 'Ingresar nombre de curso',
  `hours` int(11) NOT NULL COMMENT 'Ingresar duracion en horas del curso',
  `credit` int(11) NOT NULL COMMENT 'Ingresar cantidad de creditaje del curso',
  `estate` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Estado del curso, activo o inactivo',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_course`),
  KEY `semester_id` (`id_semester`),
  KEY `type_id` (`id_type`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`id_semester`) REFERENCES `semesters` (`id_semester`),
  CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `types` (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deans`
--

DROP TABLE IF EXISTS `deans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deans` (
  `id_dean` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de decano',
  `dni_dean` int(8) NOT NULL COMMENT 'Ingresar numero de dni',
  `id_faculty` int(11) NOT NULL,
  `name_dean` varchar(255) NOT NULL COMMENT 'Ingresar nombre de Decano',
  `lastname_dean` varchar(255) NOT NULL COMMENT 'Ingresar apellidos de Decano',
  `phone_dean` varchar(15) NOT NULL COMMENT 'Ingresar celular de Decano, porfavor omita el codigo de pais',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `id_user` int(11) DEFAULT NULL COMMENT 'id user',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_dean`),
  UNIQUE KEY `dni_dean` (`dni_dean`),
  KEY `user_key` (`id_user`),
  KEY `faculty_key` (`id_faculty`),
  CONSTRAINT `deans_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `deans_ibfk_2` FOREIGN KEY (`id_faculty`) REFERENCES `faculties` (`id_faculty`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deans`
--

LOCK TABLES `deans` WRITE;
/*!40000 ALTER TABLE `deans` DISABLE KEYS */;
INSERT INTO `deans` VALUES (1,48512365,1,'Jose','Zavala','987456321',1,NULL,'2020-05-27 09:08:53','2020-05-27 09:08:53');
/*!40000 ALTER TABLE `deans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_directors`
--

DROP TABLE IF EXISTS `department_directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department_directors` (
  `id_department_director` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo director de departmento',
  `dni_department_director` int(8) NOT NULL COMMENT 'Ingresar numero de dni',
  `id_department` int(11) NOT NULL COMMENT 'codigo de departamento',
  `name_department_director` varchar(255) NOT NULL COMMENT 'Ingresar nombre de director de departmento',
  `lastname_department_director` varchar(255) NOT NULL COMMENT 'Ingresar apellidos de director de departmento',
  `phone_department_director` varchar(15) NOT NULL COMMENT 'Ingresar celular de director de departmento, porfavor omita el codigo de pais',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `id_user` int(11) DEFAULT NULL COMMENT 'id user',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_department_director`),
  UNIQUE KEY `dni_department_director` (`dni_department_director`),
  KEY `user_key` (`id_user`),
  KEY `department_key` (`id_department`),
  CONSTRAINT `department_directors_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `department_directors_ibfk_2` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id_department`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_directors`
--

LOCK TABLES `department_directors` WRITE;
/*!40000 ALTER TABLE `department_directors` DISABLE KEYS */;
INSERT INTO `department_directors` VALUES (1,48512362,1,'Paul','Mendoza','987456321',1,NULL,'2020-05-27 09:11:19','2020-05-27 09:11:19');
/*!40000 ALTER TABLE `department_directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id_department` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de departamento',
  `id_faculty` int(50) NOT NULL COMMENT 'id de facultad',
  `name_department` varchar(255) NOT NULL COMMENT 'Ingresar nombre de departamento',
  `anexo_department` varchar(5) NOT NULL COMMENT 'Ingresar el anexo para comunicarse con el departamento',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_department`),
  UNIQUE KEY `name_department` (`name_department`),
  KEY `faculty_key` (`id_faculty`),
  CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`id_faculty`) REFERENCES `faculties` (`id_faculty`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,1,'Ingenieria y matematica','0541',1,'2020-05-27 09:08:53','2020-05-27 09:08:53'),(2,2,'ciencias politicas','0551',1,'2020-05-27 09:08:53','2020-05-27 09:08:53');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enviroments`
--

DROP TABLE IF EXISTS `enviroments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enviroments` (
  `id_enviroment` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo de ambiente',
  `name_enviroment` varchar(255) NOT NULL COMMENT 'nombre de ambiente',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_enviroment`),
  UNIQUE KEY `name_enviroment` (`name_enviroment`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enviroments`
--

LOCK TABLES `enviroments` WRITE;
/*!40000 ALTER TABLE `enviroments` DISABLE KEYS */;
INSERT INTO `enviroments` VALUES (1,'presencial','2020-05-27 09:13:32','2020-05-27 09:13:32'),(2,'virtual','2020-05-27 09:13:32','2020-05-27 09:13:32');
/*!40000 ALTER TABLE `enviroments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculties`
--

DROP TABLE IF EXISTS `faculties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculties` (
  `id_faculty` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de facultad',
  `id_university` int(11) NOT NULL COMMENT 'id (RUC) de universidad',
  `name_faculty` varchar(255) NOT NULL COMMENT 'Ingresar nombre de facultad',
  `anexo_faculty` varchar(5) NOT NULL COMMENT 'Ingresar el anexo para comunicarse con la facultad',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_faculty`),
  UNIQUE KEY `name_faculty` (`name_faculty`),
  KEY `university_key` (`id_university`),
  CONSTRAINT `faculties_ibfk_1` FOREIGN KEY (`id_university`) REFERENCES `universities` (`id_university`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculties`
--

LOCK TABLES `faculties` WRITE;
/*!40000 ALTER TABLE `faculties` DISABLE KEYS */;
INSERT INTO `faculties` VALUES (1,1,'Ingenierias','054',1,'2020-05-27 09:08:53','2020-05-27 09:08:53'),(2,1,'Sociales','055',1,'2020-05-27 09:08:53','2020-05-27 09:08:53');
/*!40000 ALTER TABLE `faculties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty_directors`
--

DROP TABLE IF EXISTS `faculty_directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty_directors` (
  `id_faculty_director` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo director de facultad',
  `dni_faculty_director` int(8) NOT NULL COMMENT 'Ingresar numero de dni',
  `id_faculty` int(11) NOT NULL,
  `name_faculty_director` varchar(255) NOT NULL COMMENT 'Ingresar nombre de director de facultad',
  `lastname_faculty_director` varchar(255) NOT NULL COMMENT 'Ingresar apellidos de director de facultad',
  `phone_faculty_director` varchar(15) NOT NULL COMMENT 'Ingresar celular de director de facultad, porfavor omita el codigo de pais',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `id_user` int(11) DEFAULT NULL COMMENT 'id user',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_faculty_director`),
  UNIQUE KEY `dni_faculty_director` (`dni_faculty_director`),
  KEY `user_key` (`id_user`),
  KEY `faculty_key` (`id_faculty`),
  CONSTRAINT `faculty_directors_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `faculty_directors_ibfk_2` FOREIGN KEY (`id_faculty`) REFERENCES `faculties` (`id_faculty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_directors`
--

LOCK TABLES `faculty_directors` WRITE;
/*!40000 ALTER TABLE `faculty_directors` DISABLE KEYS */;
/*!40000 ALTER TABLE `faculty_directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keepers`
--

DROP TABLE IF EXISTS `keepers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keepers` (
  `id_keeper` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de encargado mentoria',
  `id_school` int(11) NOT NULL COMMENT 'id de carrera a la que esta asignado',
  `dni_keeper` int(8) NOT NULL COMMENT 'dni de encargado',
  `name_keeper` varchar(255) NOT NULL COMMENT 'Ingresar nombre de encargado mentoria',
  `phone_keeper` varchar(15) NOT NULL COMMENT 'Celular de encargado de mentoria',
  `id_student` int(11) DEFAULT NULL COMMENT 'Ingresar codigo del encargado',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `id_user` int(11) DEFAULT NULL COMMENT 'id user',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_keeper`),
  UNIQUE KEY `dni_keeper` (`dni_keeper`),
  KEY `user_key` (`id_user`),
  KEY `school_key` (`id_school`),
  KEY `student_key` (`id_student`),
  CONSTRAINT `keepers_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `keepers_ibfk_2` FOREIGN KEY (`id_school`) REFERENCES `schools` (`id_school`),
  CONSTRAINT `keepers_ibfk_3` FOREIGN KEY (`id_student`) REFERENCES `students` (`id_student`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keepers`
--

LOCK TABLES `keepers` WRITE;
/*!40000 ALTER TABLE `keepers` DISABLE KEYS */;
INSERT INTO `keepers` VALUES (1,1,71123656,'Marco Andrade','987456321',NULL,1,NULL,'2020-05-27 09:13:32','2020-05-27 09:13:32');
/*!40000 ALTER TABLE `keepers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentoring`
--

DROP TABLE IF EXISTS `mentoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentoring` (
  `id_mentoring` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de mentoria',
  `id_academic` int(11) NOT NULL COMMENT 'id de periodo academico',
  `id_keeper` int(11) NOT NULL COMMENT 'Ingresar codigo del encargado',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_mentoring`),
  KEY `keeper_key` (`id_keeper`),
  KEY `academic_key` (`id_academic`),
  CONSTRAINT `mentoring_ibfk_1` FOREIGN KEY (`id_keeper`) REFERENCES `keepers` (`id_keeper`),
  CONSTRAINT `mentoring_ibfk_2` FOREIGN KEY (`id_academic`) REFERENCES `academics` (`id_academic`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentoring`
--

LOCK TABLES `mentoring` WRITE;
/*!40000 ALTER TABLE `mentoring` DISABLE KEYS */;
INSERT INTO `mentoring` VALUES (1,1,1,1,'2020-05-27 09:13:32','2020-05-27 09:13:32');
/*!40000 ALTER TABLE `mentoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentoring_groups`
--

DROP TABLE IF EXISTS `mentoring_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentoring_groups` (
  `id_mentoring_group` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de grupo de mentoria',
  `id_mentor` int(11) NOT NULL COMMENT 'id de mentor',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_mentoring_group`),
  KEY `mentor_key` (`id_mentor`),
  CONSTRAINT `mentoring_groups_ibfk_1` FOREIGN KEY (`id_mentor`) REFERENCES `mentors` (`id_mentor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentoring_groups`
--

LOCK TABLES `mentoring_groups` WRITE;
/*!40000 ALTER TABLE `mentoring_groups` DISABLE KEYS */;
INSERT INTO `mentoring_groups` VALUES (4,4,1,'2020-05-27 11:17:54','2020-05-27 11:17:54'),(6,4,1,'2020-05-27 11:49:18','2020-05-27 11:49:18'),(7,6,1,'2020-05-27 11:55:19','2020-05-27 11:55:19');
/*!40000 ALTER TABLE `mentoring_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentors`
--

DROP TABLE IF EXISTS `mentors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentors` (
  `id_mentor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de mentor ',
  `id_mentoring` int(11) NOT NULL COMMENT 'id de mentoria',
  `id_student` int(11) DEFAULT NULL COMMENT 'Ingresar codigo del estudiante',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `id_user` int(11) DEFAULT NULL COMMENT 'id user',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_mentor`),
  KEY `user_key` (`id_user`),
  KEY `mentoring_key` (`id_mentoring`),
  KEY `student_key` (`id_student`),
  CONSTRAINT `mentors_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `mentors_ibfk_2` FOREIGN KEY (`id_mentoring`) REFERENCES `mentoring` (`id_mentoring`),
  CONSTRAINT `mentors_ibfk_3` FOREIGN KEY (`id_student`) REFERENCES `students` (`id_student`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentors`
--

LOCK TABLES `mentors` WRITE;
/*!40000 ALTER TABLE `mentors` DISABLE KEYS */;
INSERT INTO `mentors` VALUES (4,1,1,1,11,'2020-05-27 11:16:29','2020-05-27 11:16:29'),(6,1,2,1,13,'2020-05-27 11:54:53','2020-05-27 11:54:53');
/*!40000 ALTER TABLE `mentors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pupils`
--

DROP TABLE IF EXISTS `pupils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pupils` (
  `id_pupil` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de mentoriado ',
  `id_mentoring_group` int(11) NOT NULL COMMENT 'id de grupo de mentoria',
  `id_student` int(11) DEFAULT NULL COMMENT 'Ingresar codigo del estudiante',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pupil`),
  KEY `mentoring_group_key` (`id_mentoring_group`),
  KEY `student_key` (`id_student`),
  CONSTRAINT `pupils_ibfk_1` FOREIGN KEY (`id_mentoring_group`) REFERENCES `mentoring_groups` (`id_mentoring_group`),
  CONSTRAINT `pupils_ibfk_2` FOREIGN KEY (`id_student`) REFERENCES `students` (`id_student`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pupils`
--

LOCK TABLES `pupils` WRITE;
/*!40000 ALTER TABLE `pupils` DISABLE KEYS */;
INSERT INTO `pupils` VALUES (7,4,4,1,'2020-05-27 11:22:59','2020-05-27 11:22:59'),(8,7,5,1,'2020-05-27 11:57:01','2020-05-27 11:57:01');
/*!40000 ALTER TABLE `pupils` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rectors`
--

DROP TABLE IF EXISTS `rectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rectors` (
  `id_rector` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo de rector',
  `dni_rector` int(8) NOT NULL COMMENT 'Ingresar numero de dni',
  `id_university` int(11) NOT NULL COMMENT 'id (RUC) de universidad',
  `name_rector` varchar(255) NOT NULL COMMENT 'Ingresar nombre de Rector',
  `lastname_rector` varchar(255) NOT NULL COMMENT 'Ingresar apellidos de Rector',
  `phone_rector` varchar(15) NOT NULL COMMENT 'Ingresar celular de Rector, porfavor omita el codigo de pais',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `id_user` int(11) DEFAULT NULL COMMENT 'id user',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_rector`),
  UNIQUE KEY `dni_rector` (`dni_rector`),
  KEY `user_key` (`id_user`),
  KEY `university_key` (`id_university`),
  CONSTRAINT `rectors_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `rectors_ibfk_2` FOREIGN KEY (`id_university`) REFERENCES `universities` (`id_university`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rectors`
--

LOCK TABLES `rectors` WRITE;
/*!40000 ALTER TABLE `rectors` DISABLE KEYS */;
INSERT INTO `rectors` VALUES (1,48512364,1,'Patricio','Quintanilla','987456321',1,NULL,'2020-05-27 09:08:53','2020-05-27 09:08:53');
/*!40000 ALTER TABLE `rectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id rol',
  `name_rol` varchar(255) NOT NULL COMMENT 'Ingresar nombre de rol',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `name_rol` (`name_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','2020-05-27 09:08:53','2020-05-27 09:08:53'),(2,'mentor','2020-05-27 09:08:53','2020-05-27 09:08:53'),(3,'encargado','2020-05-27 10:54:07','2020-05-27 10:54:07');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_coordinators`
--

DROP TABLE IF EXISTS `school_coordinators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_coordinators` (
  `id_school_coordinator` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo coordinador',
  `dni_school_coordinator` int(8) NOT NULL COMMENT 'Ingresar numero de dni',
  `id_school` int(11) NOT NULL,
  `name_school_coordinator` varchar(255) NOT NULL COMMENT 'Ingresar nombre de coordinador de escuela',
  `lastname_school_coordinator` varchar(255) NOT NULL COMMENT 'Ingresar apellidos de coordinador de escuela',
  `phone_school_coordinator` varchar(15) NOT NULL COMMENT 'Ingresar celular del coordinador de escuela, porfavor omita el codigo de pais',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `id_user` int(11) DEFAULT NULL COMMENT 'id user',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_school_coordinator`),
  UNIQUE KEY `dni_school_coordinator` (`dni_school_coordinator`),
  KEY `user_key` (`id_user`),
  KEY `school_key` (`id_school`),
  CONSTRAINT `school_coordinators_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `school_coordinators_ibfk_2` FOREIGN KEY (`id_school`) REFERENCES `schools` (`id_school`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_coordinators`
--

LOCK TABLES `school_coordinators` WRITE;
/*!40000 ALTER TABLE `school_coordinators` DISABLE KEYS */;
INSERT INTO `school_coordinators` VALUES (1,48512363,1,'Yasiel','Perez','987456321',1,NULL,'2020-05-27 09:08:53','2020-05-27 09:08:53');
/*!40000 ALTER TABLE `school_coordinators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_directors`
--

DROP TABLE IF EXISTS `school_directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_directors` (
  `id_school_director` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo director',
  `dni_school_director` int(8) NOT NULL COMMENT 'Ingresar numero de dni',
  `id_school` int(11) NOT NULL,
  `name_school_director` varchar(255) NOT NULL COMMENT 'Ingresar nombre de director de escuela',
  `lastname_school_director` varchar(255) NOT NULL COMMENT 'Ingresar apellidos de director de escuela',
  `phone_school_director` varchar(15) NOT NULL COMMENT 'Ingresar celular de director de escuela, porfavor omita el codigo de pais',
  `estate_school_director` tinyint(1) NOT NULL DEFAULT '1',
  `id_user` int(11) DEFAULT NULL COMMENT 'id user',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_school_director`),
  UNIQUE KEY `dni_school_director` (`dni_school_director`),
  KEY `user_key` (`id_user`),
  KEY `school_key` (`id_school`),
  CONSTRAINT `school_directors_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `school_directors_ibfk_2` FOREIGN KEY (`id_school`) REFERENCES `schools` (`id_school`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_directors`
--

LOCK TABLES `school_directors` WRITE;
/*!40000 ALTER TABLE `school_directors` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schools` (
  `id_school` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de escuela',
  `id_department` int(11) NOT NULL COMMENT 'id de departamento',
  `name_school` varchar(255) NOT NULL COMMENT 'Ingresar nombre de escuela',
  `anexo` varchar(5) NOT NULL COMMENT 'Ingresar el anexo para comunicarse con la escuela',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_school`),
  UNIQUE KEY `name_school` (`name_school`),
  KEY `department_key` (`id_department`),
  CONSTRAINT `schools_ibfk_1` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id_department`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES (1,1,'Ingenieria de software','05411',1,'2020-05-27 09:08:53','2020-05-27 09:08:53'),(2,2,'Derecho','05511',1,'2020-05-27 09:08:53','2020-05-27 09:08:53');
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id_section` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de tipo de seccion',
  `section_number` int(11) NOT NULL COMMENT 'numero de seccion o grupo de curso',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_section`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semesters`
--

DROP TABLE IF EXISTS `semesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semesters` (
  `id_semester` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de semestre',
  `id_study_plan` int(11) NOT NULL COMMENT 'id de plan de estudio ejemplo: VIII',
  `name` varchar(255) NOT NULL COMMENT 'Ingresar numero de semestre',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_semester`),
  KEY `study_plan_key` (`id_study_plan`),
  CONSTRAINT `semesters_ibfk_1` FOREIGN KEY (`id_study_plan`) REFERENCES `study_plans` (`id_study_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semesters`
--

LOCK TABLES `semesters` WRITE;
/*!40000 ALTER TABLE `semesters` DISABLE KEYS */;
INSERT INTO `semesters` VALUES (1,1,'VIII',1,'2020-05-27 09:11:19','2020-05-27 09:11:19');
/*!40000 ALTER TABLE `semesters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session_mentoring`
--

DROP TABLE IF EXISTS `session_mentoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session_mentoring` (
  `id_session` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de sesion ',
  `id_mentoring_group` int(11) NOT NULL COMMENT 'id de grupo de mentoria',
  `hour_and_date` datetime NOT NULL COMMENT 'fecha y hora de la sesion',
  `duration_session` time NOT NULL,
  `id_enviroment` int(11) NOT NULL COMMENT 'ambiente en el que se desarrolla la sesion',
  `classroom_session` varchar(255) DEFAULT NULL COMMENT 'aula de mentoria opcional',
  `succesful` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_session`),
  KEY `mentoring_group_key` (`id_mentoring_group`),
  KEY `enviroment_key` (`id_enviroment`),
  CONSTRAINT `session_mentoring_ibfk_1` FOREIGN KEY (`id_mentoring_group`) REFERENCES `mentoring_groups` (`id_mentoring_group`),
  CONSTRAINT `session_mentoring_ibfk_2` FOREIGN KEY (`id_enviroment`) REFERENCES `enviroments` (`id_enviroment`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session_mentoring`
--

LOCK TABLES `session_mentoring` WRITE;
/*!40000 ALTER TABLE `session_mentoring` DISABLE KEYS */;
INSERT INTO `session_mentoring` VALUES (1,6,'2020-05-31 18:00:00','02:00:00',1,'',1,'2020-05-27 12:05:14','2020-05-27 12:05:14');
/*!40000 ALTER TABLE `session_mentoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shifts` (
  `id_shift` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de tipo de turno de estudio',
  `name` varchar(255) NOT NULL COMMENT 'Ingresar nombre de turno: mañana,tarde',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_shift`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id_student` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id estudiante',
  `dni_student` int(8) DEFAULT NULL COMMENT 'dni de estudiante',
  `id_school` int(11) NOT NULL,
  `name_student` varchar(255) NOT NULL COMMENT 'Ingresar nombre de estudiante',
  `lastname_student` varchar(255) NOT NULL COMMENT 'Ingresar apellidos de estudiante',
  `phone_student` varchar(15) NOT NULL COMMENT 'Ingresar celular de estudiante, porfavor omita el codigo de pais',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `id_user` int(11) DEFAULT NULL COMMENT 'id user',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_student`),
  UNIQUE KEY `dni_student` (`dni_student`),
  KEY `user_key` (`id_user`),
  KEY `school_key` (`id_school`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `students_ibfk_2` FOREIGN KEY (`id_school`) REFERENCES `schools` (`id_school`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,71992126,1,'Katherine','Ccama','987456321',1,11,'2020-05-27 09:11:19','2020-05-27 11:13:49'),(2,71123654,1,'Kenny','Mollapaza','987456321',1,13,'2020-05-27 09:11:19','2020-05-27 11:14:05'),(3,71123655,1,'Walker','Manrique','987456321',1,NULL,'2020-05-27 09:11:19','2020-05-27 09:11:19'),(4,71123660,1,'mirina','Manrique','987456321',1,16,'2020-05-27 09:13:32','2020-05-27 11:33:00'),(5,71123659,1,'diego','Manrique','987456321',1,17,'2020-05-27 09:13:32','2020-05-27 11:33:13'),(6,71123658,1,'iomar','Manrique','987456321',1,18,'2020-05-27 09:13:32','2020-05-27 11:33:20');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study_plans`
--

DROP TABLE IF EXISTS `study_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study_plans` (
  `id_study_plan` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de plan de estudio',
  `id_academic` int(11) NOT NULL COMMENT 'id de de periodo academico',
  `name_study_plans` varchar(255) NOT NULL COMMENT 'Ingresar codigo de semestre ejemplo 2016',
  `estate` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_study_plan`),
  KEY `academic_key` (`id_academic`),
  CONSTRAINT `study_plans_ibfk_1` FOREIGN KEY (`id_academic`) REFERENCES `academics` (`id_academic`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_plans`
--

LOCK TABLES `study_plans` WRITE;
/*!40000 ALTER TABLE `study_plans` DISABLE KEYS */;
INSERT INTO `study_plans` VALUES (1,1,'2016',0,'2020-05-27 09:11:19','2020-05-27 09:11:19');
/*!40000 ALTER TABLE `study_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teachers` (
  `id_teacher` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo docente',
  `dni_teacher` int(8) NOT NULL COMMENT 'Ingresar numero de dni',
  `id_type_contract` int(11) NOT NULL COMMENT 'tipo de contrato',
  `name_teacher` varchar(255) NOT NULL COMMENT 'Ingresar nombre de Docente',
  `lastname_teacher` varchar(255) NOT NULL COMMENT 'Ingresar apellidos de Docente',
  `phone_teacher` varchar(15) NOT NULL COMMENT 'Ingresar celular de Docente, porfavor omita el codigo de pais',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `id_user` int(11) DEFAULT NULL COMMENT 'id user',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_teacher`),
  UNIQUE KEY `dni_teacher` (`dni_teacher`),
  KEY `user_key` (`id_user`),
  KEY `contact_key` (`id_type_contract`),
  CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `teachers_ibfk_2` FOREIGN KEY (`id_type_contract`) REFERENCES `type_contracts` (`id_type_contract`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_contracts`
--

DROP TABLE IF EXISTS `type_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_contracts` (
  `id_type_contract` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id fe tipo de contrato',
  `name_type_contract` varchar(255) NOT NULL COMMENT 'ingresar tipo de contrato: contrato, planilla, etc',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_type_contract`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_contracts`
--

LOCK TABLES `type_contracts` WRITE;
/*!40000 ALTER TABLE `type_contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id de tipo de curso',
  `name` varchar(255) NOT NULL COMMENT 'Ingresar tipo de curso, ejem carrera, humanidad, electivo',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universities`
--

DROP TABLE IF EXISTS `universities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `universities` (
  `id_university` int(11) NOT NULL AUTO_INCREMENT COMMENT 'codigo universidad',
  `ruc_university` varchar(255) NOT NULL COMMENT 'Ingresar numero de RUC',
  `name_university` varchar(255) NOT NULL COMMENT 'Ingresar nombre de universidad',
  `address_university` varchar(255) NOT NULL COMMENT 'Ingresar direccion de universidad',
  `pagina_web` varchar(255) NOT NULL COMMENT 'Ingresar web de universidad',
  `phone_university` varchar(15) NOT NULL COMMENT 'Ingresar el telefono de la universidad con codigo de ciudad',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_university`),
  UNIQUE KEY `ruc_university` (`ruc_university`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universities`
--

LOCK TABLES `universities` WRITE;
/*!40000 ALTER TABLE `universities` DISABLE KEYS */;
INSERT INTO `universities` VALUES (1,'1234567891011','Universidad la salle de arequipa','Av alfonso ugarte','www.ulasalle.com.pe','952364851',1,'2020-05-27 09:08:53','2020-05-27 09:08:53');
/*!40000 ALTER TABLE `universities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id user',
  `email` varchar(255) NOT NULL COMMENT 'email',
  `password` varchar(255) NOT NULL COMMENT 'password user',
  `id_rol` int(11) DEFAULT NULL COMMENT 'id rol',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email` (`email`),
  KEY `rol_key` (`id_rol`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (11,'katy@gmail.com','$2y$10$ym6oC9XyczDFOERiDDtPy.RSAATqJJ4VDSiRMJmCSsGy6utZsXmIe',2,'2020-05-27 10:13:47','2020-05-27 11:47:34'),(13,'kenny_mentor@example.com','$2y$10$aUrRlYwSKkATq1rR.IQ..ep1wMltMHsc1Hxbcg6nP6gMLH39B0JB2',2,'2020-05-27 10:32:46','2020-05-27 10:32:46'),(14,'marco_encargado@gmail.com','$2y$10$ur9m6c0Ll7Sa/.dnbHyF8.0rQzMijM3hFRnU35zX7qAKE6uZT36Ky',3,'2020-05-27 10:49:01','2020-05-27 11:08:46'),(15,'yuliana_admin@gmail.com','$2y$10$sgX.sP76G9VXf.TO..OrBepv011pWjRZFmzveFjD3DCMCqhVLxzQC',1,'2020-05-27 11:08:33','2020-05-27 11:08:33'),(16,'mirina@gmail.com','$2y$10$estNeGeYmilpF5xk7Pl4yuWsiW3mvBqwYoXfOW8qGtov.mIowTmRO',NULL,'2020-05-27 11:14:55','2020-05-27 11:42:18'),(17,'diego@gmail.com','$2y$10$GeMCJVRNGK0HsQxUTbeOUuOk9hzCTnkQ3V1IU36mKYdRpwzUUdM/G',NULL,'2020-05-27 11:15:25','2020-05-27 11:15:25'),(18,'iomar@gmail.com','$2y$10$XkGM9Xv8Dx3s0Zzv5bEURO0N2JtypXDX4DvgX9tipSfyZn8MyEpOm',NULL,'2020-05-27 11:15:42','2020-05-27 11:15:42');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-27 20:14:46
