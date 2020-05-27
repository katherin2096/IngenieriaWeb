-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: academico
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
  `id_school_director` int(11) NOT NULL COMMENT 'Ingresar numero de dni del director en curso',
  `id_school_coordinator` int(11) NOT NULL COMMENT 'Ingresar numero de dni del coordinador en curso',
  `name` varchar(255) NOT NULL COMMENT 'Ingresar codigo de semestre ejemplo 2020-1',
  `estate` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_academic`),
  KEY `school_key` (`id_school`),
  KEY `director_key` (`id_school_director`),
  KEY `cordinator_key` (`id_school_coordinator`),
  CONSTRAINT `academics_ibfk_1` FOREIGN KEY (`id_school`) REFERENCES `schools` (`id_school`),
  CONSTRAINT `academics_ibfk_2` FOREIGN KEY (`id_school_director`) REFERENCES `school_directors` (`id_school_director`),
  CONSTRAINT `academics_ibfk_3` FOREIGN KEY (`id_school_coordinator`) REFERENCES `school_coordinators` (`id_school_coordinator`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics`
--

LOCK TABLES `academics` WRITE;
/*!40000 ALTER TABLE `academics` DISABLE KEYS */;
INSERT INTO `academics` VALUES (1,1,1,1,'2020-1',1,'2020-05-10 04:56:05','2020-05-10 04:56:05');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (1,1,1,2,1,1,'2020-05-10 05:03:23','2020-05-10 05:03:23');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,1,1,'Ingenieria Web',84,5,1,'2020-05-10 05:00:15','2020-05-10 05:00:15');
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
  `email_dean` varchar(255) NOT NULL COMMENT 'Ingresar email de Decano',
  `phone_dean` varchar(15) NOT NULL COMMENT 'Ingresar celular de Decano, porfavor omita el codigo de pais',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_dean`),
  KEY `faculty_key` (`id_faculty`),
  CONSTRAINT `deans_ibfk_1` FOREIGN KEY (`id_faculty`) REFERENCES `faculties` (`id_faculty`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deans`
--

LOCK TABLES `deans` WRITE;
/*!40000 ALTER TABLE `deans` DISABLE KEYS */;
INSERT INTO `deans` VALUES (1,71995464,1,'Jose ','Zavala','jzavalax@ulasalle.edu.pe','995610252',1,'2020-05-10 04:38:47','2020-05-10 04:38:47');
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
  `id_department` int(11) NOT NULL,
  `name_department_director` varchar(255) NOT NULL COMMENT 'Ingresar nombre de director de departmento',
  `lastname_department_director` varchar(255) NOT NULL COMMENT 'Ingresar apellidos de director de departmento',
  `email_department_director` varchar(255) NOT NULL COMMENT 'Ingresar email de director de departmento',
  `phone_department_director` varchar(15) NOT NULL COMMENT 'Ingresar celular de director de departmento, porfavor omita el codigo de pais',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_department_director`),
  KEY `department_key` (`id_department`),
  CONSTRAINT `department_directors_ibfk_1` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id_department`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_directors`
--

LOCK TABLES `department_directors` WRITE;
/*!40000 ALTER TABLE `department_directors` DISABLE KEYS */;
INSERT INTO `department_directors` VALUES (1,71451248,1,'Paul ','Mendoza','pmendozas@ulasalle.edu.pe','996924526',1,'2020-05-10 04:51:47','2020-05-10 04:51:47');
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
  KEY `faculty_key` (`id_faculty`),
  CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`id_faculty`) REFERENCES `faculties` (`id_faculty`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,1,'Ingenieria y matematicas','0465',1,'2020-05-10 04:35:03','2020-05-10 04:35:03'),(2,2,'ciencias politicas','04685',1,'2020-05-10 04:49:24','2020-05-10 04:49:24');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
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
  `email_faculty_director` varchar(255) NOT NULL COMMENT 'Ingresar email de director de facultad',
  `phone_faculty_director` varchar(15) NOT NULL COMMENT 'Ingresar celular de director de facultad, porfavor omita el codigo de pais',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_faculty_director`),
  KEY `faculty_key` (`id_faculty`),
  CONSTRAINT `faculty_directors_ibfk_1` FOREIGN KEY (`id_faculty`) REFERENCES `faculties` (`id_faculty`)
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
  KEY `university_key` (`id_university`),
  CONSTRAINT `faculties_ibfk_1` FOREIGN KEY (`id_university`) REFERENCES `universities` (`id_university`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculties`
--

LOCK TABLES `faculties` WRITE;
/*!40000 ALTER TABLE `faculties` DISABLE KEYS */;
INSERT INTO `faculties` VALUES (1,1,'Ingenierias','046',1,'2020-05-10 04:34:26','2020-05-10 04:34:26'),(2,1,'Sociales','048',1,'2020-05-10 04:48:42','2020-05-10 04:48:42');
/*!40000 ALTER TABLE `faculties` ENABLE KEYS */;
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
  `email_rector` varchar(255) NOT NULL COMMENT 'Ingresar email de Rector',
  `phone_rector` varchar(15) NOT NULL COMMENT 'Ingresar celular de Rector, porfavor omita el codigo de pais',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_rector`),
  KEY `university_key` (`id_university`),
  CONSTRAINT `rectors_ibfk_1` FOREIGN KEY (`id_university`) REFERENCES `universities` (`id_university`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rectors`
--

LOCK TABLES `rectors` WRITE;
/*!40000 ALTER TABLE `rectors` DISABLE KEYS */;
INSERT INTO `rectors` VALUES (1,46521487,1,'Patricio','Quintanilla','patricio.quintanilla@ulasalle.edu.pe','995612453',1,'2020-05-10 04:37:11','2020-05-10 04:37:11');
/*!40000 ALTER TABLE `rectors` ENABLE KEYS */;
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
  `email_school_coordinator` varchar(255) NOT NULL COMMENT 'Ingresar email de coordinador de escuela',
  `phone_school_coordinator` varchar(15) NOT NULL COMMENT 'Ingresar celular del coordinador de escuela, porfavor omita el codigo de pais',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_school_coordinator`),
  KEY `school_key` (`id_school`),
  CONSTRAINT `school_coordinators_ibfk_1` FOREIGN KEY (`id_school`) REFERENCES `schools` (`id_school`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_coordinators`
--

LOCK TABLES `school_coordinators` WRITE;
/*!40000 ALTER TABLE `school_coordinators` DISABLE KEYS */;
INSERT INTO `school_coordinators` VALUES (1,741245658,1,'Yasiel ','Perez','yperezv@ulasalle.edu.pe','994456874',1,'2020-05-10 04:55:10','2020-05-10 04:55:10');
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
  `email_school_director` varchar(255) NOT NULL COMMENT 'Ingresar email de director de escuela',
  `phone_school_director` varchar(15) NOT NULL COMMENT 'Ingresar celular de director de escuela, porfavor omita el codigo de pais',
  `estate_school_director` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_school_director`),
  KEY `school_key` (`id_school`),
  CONSTRAINT `school_directors_ibfk_1` FOREIGN KEY (`id_school`) REFERENCES `schools` (`id_school`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_directors`
--

LOCK TABLES `school_directors` WRITE;
/*!40000 ALTER TABLE `school_directors` DISABLE KEYS */;
INSERT INTO `school_directors` VALUES (1,71995648,1,'Ernesto ','cuadros','ecuadrosv@ulasalle.edu.pe','996823451',1,'2020-05-10 04:53:24','2020-05-10 04:53:24');
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
  `name` varchar(255) NOT NULL COMMENT 'Ingresar nombre de escuela',
  `anexo` varchar(5) NOT NULL COMMENT 'Ingresar el anexo para comunicarse con la escuela',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_school`),
  KEY `department_key` (`id_department`),
  CONSTRAINT `schools_ibfk_1` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id_department`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES (1,1,'Ingenieria de software','0462',1,'2020-05-10 04:35:29','2020-05-10 04:35:29'),(2,2,'Derecho','057',1,'2020-05-10 04:49:42','2020-05-10 04:49:42');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,1,'2020-05-10 05:01:12','2020-05-10 05:01:12');
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
  `id_study_plan` int(11) NOT NULL COMMENT 'id de plan de estudio',
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
INSERT INTO `semesters` VALUES (1,1,'VIII',1,'2020-05-10 04:58:44','2020-05-10 04:58:44');
/*!40000 ALTER TABLE `semesters` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
INSERT INTO `shifts` VALUES (1,'Mañana','2020-05-10 05:00:39','2020-05-10 05:00:39'),(2,'Tarde','2020-05-10 05:00:47','2020-05-10 05:00:47'),(3,'Noche','2020-05-10 05:00:55','2020-05-10 05:00:55');
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
  `email_student` varchar(255) NOT NULL COMMENT 'Ingresar email de estudiante',
  `phone_student` varchar(15) NOT NULL COMMENT 'Ingresar celular de estudiante, porfavor omita el codigo de pais',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_student`),
  KEY `school_key` (`id_school`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`id_school`) REFERENCES `schools` (`id_school`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,71992126,1,'Katherine Daniela ','Ccama Huallpa','kath.ccama@gmail.com','992690267',1,'2020-05-10 05:04:02','2020-05-10 05:04:02');
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
  `name` varchar(255) NOT NULL COMMENT 'Ingresar codigo de semestre ejemplo 2020-1',
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
INSERT INTO `study_plans` VALUES (1,1,'2016',1,'2020-05-10 04:56:34','2020-05-10 04:56:34');
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
  `email_teacher` varchar(255) NOT NULL COMMENT 'Ingresar email de Docente',
  `phone_teacher` varchar(15) NOT NULL COMMENT 'Ingresar celular de Docente, porfavor omita el codigo de pais',
  `estate` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id_teacher`),
  KEY `contact_key` (`id_type_contract`),
  CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`id_type_contract`) REFERENCES `type_contracts` (`id_type_contract`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,46152378,2,'Richart ','Escobedo','rescobedoq@ulasalle.edu.pe','964587245',1,'2020-05-10 05:03:00','2020-05-10 05:03:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_contracts`
--

LOCK TABLES `type_contracts` WRITE;
/*!40000 ALTER TABLE `type_contracts` DISABLE KEYS */;
INSERT INTO `type_contracts` VALUES (1,'contrato','2020-05-10 05:01:46','2020-05-10 05:01:46'),(2,'planilla','2020-05-10 05:01:55','2020-05-10 05:01:55');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'Carrera','2020-05-10 04:59:13','2020-05-10 04:59:26'),(2,'Humanidades','2020-05-10 04:59:33','2020-05-10 04:59:33');
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
  PRIMARY KEY (`id_university`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universities`
--

LOCK TABLES `universities` WRITE;
/*!40000 ALTER TABLE `universities` DISABLE KEYS */;
INSERT INTO `universities` VALUES (1,'20456344004','Universidad la salle de Arequipa','Av. Alfonso Ugarte 517, Cercado, Arequipa - Perú','www.ulasalle.edu.pe','(54) 607555',1,'2020-05-10 03:55:38','2020-05-10 04:33:23');
/*!40000 ALTER TABLE `universities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-27 21:16:06
