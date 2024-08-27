-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: prd-mod-mysql01.vicentelopez.gov.ar    Database: keycloakdev
-- ------------------------------------------------------
-- Server version	5.5.68-MariaDB

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
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` varchar(2550) DEFAULT NULL,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ADMIN_EVENT_TIME` (`REALM_ID`,`ADMIN_EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('004a89a9-541b-47d7-bfb0-b46d9bf9bf4b',NULL,'conditional-user-configured','a6362837-3fda-4079-bc1f-4fb892f0260e','8dd5b032-054e-4390-9764-4536f6afea01',0,10,_binary '\0',NULL,NULL),('042b6b2b-19f2-4015-9fea-f6499b8fc345',NULL,NULL,'a6362837-3fda-4079-bc1f-4fb892f0260e','dff62c6d-c6c8-415d-ba31-31dd8f401030',2,30,_binary '','a9b09de3-99f0-4c91-ae10-d1c8c9403b1e',NULL),('076b61ef-6977-4b94-a019-0f0378e172c4',NULL,'client-secret-jwt','a6362837-3fda-4079-bc1f-4fb892f0260e','872a4ece-3235-4f2a-bec1-314b425e3eb6',2,30,_binary '\0',NULL,NULL),('07e0b945-0aea-49e0-b099-50fd7fb961dc',NULL,NULL,'a6362837-3fda-4079-bc1f-4fb892f0260e','0362bca3-42f1-402b-be89-98a0ba2ae994',1,40,_binary '','48b85a25-13fa-494a-9741-d65b027780a6',NULL),('0861c8bb-b91e-449d-af1e-7bd42b9637d7',NULL,'basic-auth','a6362837-3fda-4079-bc1f-4fb892f0260e','67f65143-0de0-4b30-a3e0-89a1e50ef6f4',0,10,_binary '\0',NULL,NULL),('0bd877b1-b555-45fa-8fda-f773c21d4841',NULL,NULL,'20b6c21c-504d-4f91-96b2-fd3dfbff4203','4b4389f4-c930-4dbb-8db5-4af556f795ef',1,40,_binary '','ebcc25aa-413e-4b1f-b4fe-8b493bf47be8',NULL),('0cb1436c-44df-4eda-8f18-4a1bcebcca3d',NULL,'reset-otp','20b6c21c-504d-4f91-96b2-fd3dfbff4203','ebcc25aa-413e-4b1f-b4fe-8b493bf47be8',0,20,_binary '\0',NULL,NULL),('10d17894-121d-4557-bd05-b933cdf0d3a1',NULL,'reset-otp','a6362837-3fda-4079-bc1f-4fb892f0260e','48b85a25-13fa-494a-9741-d65b027780a6',0,20,_binary '\0',NULL,NULL),('12efda52-bd6e-45ec-94e8-ded601b73a21',NULL,'auth-cookie','a6362837-3fda-4079-bc1f-4fb892f0260e','84968d46-1978-4844-9d0c-8b13c4658589',2,10,_binary '\0',NULL,NULL),('194b953e-8d72-44b3-bfb5-f5d88beb6985',NULL,'client-jwt','a6362837-3fda-4079-bc1f-4fb892f0260e','872a4ece-3235-4f2a-bec1-314b425e3eb6',2,20,_binary '\0',NULL,NULL),('1dbabf90-e8c7-4d8e-b9e0-fc0197199f7b',NULL,'conditional-user-configured','a6362837-3fda-4079-bc1f-4fb892f0260e','83c0d70a-676d-481d-90d6-8d9292a465db',0,10,_binary '\0',NULL,NULL),('1dc84b76-17c4-4ba1-97fc-086ed9ba53ef',NULL,'idp-review-profile','a6362837-3fda-4079-bc1f-4fb892f0260e','6cdb3fcf-ffa7-4b16-a4d9-9b813ade8d7a',0,10,_binary '\0',NULL,'2c3693a0-9e6c-41ce-84f7-eba0c29fa1c1'),('206410aa-49a3-415d-9244-a3af050695b8',NULL,'auth-spnego','a6362837-3fda-4079-bc1f-4fb892f0260e','84968d46-1978-4844-9d0c-8b13c4658589',3,20,_binary '\0',NULL,NULL),('21b3a925-5421-4e7b-83f9-5aa3fe8f0594',NULL,'auth-spnego','20b6c21c-504d-4f91-96b2-fd3dfbff4203','ea32f07b-8094-448f-9bab-e68e152b2a85',3,30,_binary '\0',NULL,NULL),('2b39bdc5-1a05-4606-b65f-ae4bfcac9d62',NULL,'docker-http-basic-authenticator','20b6c21c-504d-4f91-96b2-fd3dfbff4203','552e90d8-8b05-49a0-a28a-0eb4847de256',0,10,_binary '\0',NULL,NULL),('3525c50b-2a2f-4266-92ab-644cdc627b8f',NULL,'direct-grant-validate-otp','a6362837-3fda-4079-bc1f-4fb892f0260e','83c0d70a-676d-481d-90d6-8d9292a465db',0,20,_binary '\0',NULL,NULL),('352e8b94-8c24-47cb-8ce2-31d048acd84c',NULL,NULL,'a6362837-3fda-4079-bc1f-4fb892f0260e','6f60d870-ff1b-4641-80d7-dd3d5f282f28',1,30,_binary '','83c0d70a-676d-481d-90d6-8d9292a465db',NULL),('358dabc7-e441-469c-92e7-62f52f03207c',NULL,'docker-http-basic-authenticator','a6362837-3fda-4079-bc1f-4fb892f0260e','6a673dd7-f954-4c1e-a456-404b11789712',0,10,_binary '\0',NULL,NULL),('36153ab1-ae76-432f-a9f7-ff6eab313771',NULL,'reset-credentials-choose-user','20b6c21c-504d-4f91-96b2-fd3dfbff4203','4b4389f4-c930-4dbb-8db5-4af556f795ef',0,10,_binary '\0',NULL,NULL),('36fbda15-b7f4-47db-8a32-406f98d75d2f',NULL,'direct-grant-validate-username','a6362837-3fda-4079-bc1f-4fb892f0260e','6f60d870-ff1b-4641-80d7-dd3d5f282f28',0,10,_binary '\0',NULL,NULL),('388ed55c-2153-4965-8508-e7c1516b3976',NULL,NULL,'a6362837-3fda-4079-bc1f-4fb892f0260e','3408f371-b85e-48dd-a9aa-ab24f60fd168',0,20,_binary '','70bc9159-fc9a-4321-87db-ab234c26e41d',NULL),('396625c9-f100-4642-b7f3-a47eb0fd274e',NULL,'auth-username-password-form','20b6c21c-504d-4f91-96b2-fd3dfbff4203','9d2b9ad9-e853-4416-84bb-ac33ace7f8e8',0,10,_binary '\0',NULL,NULL),('3a787933-b09d-4c84-bd85-f873f0b0e0fd',NULL,'auth-cookie','20b6c21c-504d-4f91-96b2-fd3dfbff4203','39a5d7e9-a41e-4efd-b527-3cea72923e50',2,10,_binary '\0',NULL,NULL),('3ee473f5-146c-42ab-8b5e-b24da2fa84d3',NULL,'registration-profile-action','20b6c21c-504d-4f91-96b2-fd3dfbff4203','537a9421-92c7-49ca-bfa9-7bb85ef7c098',0,40,_binary '\0',NULL,NULL),('42e8ecd7-b1b3-42c9-b35e-4e6f067c7868',NULL,'idp-username-password-form','a6362837-3fda-4079-bc1f-4fb892f0260e','75d4188a-b6f5-46c6-96db-098e4ca020cc',0,10,_binary '\0',NULL,NULL),('460449c8-58ba-46f7-96a6-d6027452b4a1',NULL,'registration-profile-action','a6362837-3fda-4079-bc1f-4fb892f0260e','6d27c637-5c9c-4263-829e-717619131cb0',0,40,_binary '\0',NULL,NULL),('47b23d0d-4901-4bad-bd0b-0ad1e1b3a118',NULL,NULL,'20b6c21c-504d-4f91-96b2-fd3dfbff4203','c879dd95-638a-48f5-8638-3b8455f77614',0,20,_binary '','0f21251f-0cbd-4541-a254-90e0cc0133f5',NULL),('48ca321c-5296-45a4-aab9-7c0bf997c3f9',NULL,'idp-username-password-form','20b6c21c-504d-4f91-96b2-fd3dfbff4203','a9362ad4-714a-437b-8d1d-b3a8355cdf3e',0,10,_binary '\0',NULL,NULL),('49c5ea5b-e160-407d-927b-a7bd7b770984',NULL,'identity-provider-redirector','a6362837-3fda-4079-bc1f-4fb892f0260e','dff62c6d-c6c8-415d-ba31-31dd8f401030',2,25,_binary '\0',NULL,NULL),('4a6f6c1f-e841-41e4-9021-25ef94a4a9a7',NULL,'client-x509','a6362837-3fda-4079-bc1f-4fb892f0260e','872a4ece-3235-4f2a-bec1-314b425e3eb6',2,40,_binary '\0',NULL,NULL),('5011692a-463b-4db5-8852-1f4aa7ce8a29',NULL,NULL,'20b6c21c-504d-4f91-96b2-fd3dfbff4203','0f21251f-0cbd-4541-a254-90e0cc0133f5',2,20,_binary '','a9362ad4-714a-437b-8d1d-b3a8355cdf3e',NULL),('5369b117-15dc-43fc-ada3-687f5be330e4',NULL,'no-cookie-redirect','a6362837-3fda-4079-bc1f-4fb892f0260e','c6ddb2ce-5d56-4dca-aa66-22b3c5a8f28b',0,10,_binary '\0',NULL,NULL),('550f29ad-5240-4ad4-b530-41c3209cde7f',NULL,'registration-password-action','a6362837-3fda-4079-bc1f-4fb892f0260e','6d27c637-5c9c-4263-829e-717619131cb0',0,50,_binary '\0',NULL,NULL),('5792db51-9f62-4cdb-a8ee-0abb75aff902',NULL,'direct-grant-validate-password','a6362837-3fda-4079-bc1f-4fb892f0260e','6f60d870-ff1b-4641-80d7-dd3d5f282f28',0,20,_binary '\0',NULL,NULL),('588e85e6-790e-4a6d-be6e-6373c3f9b163',NULL,'auth-otp-form','20b6c21c-504d-4f91-96b2-fd3dfbff4203','9374c5f1-e28c-479c-9fb9-9f967af3c380',0,20,_binary '\0',NULL,NULL),('5c7285a8-d27d-4e1f-880f-0f7aa9f475f7',NULL,'auth-otp-form','a6362837-3fda-4079-bc1f-4fb892f0260e','4837579b-48a6-4b57-bcd4-854dec471145',0,20,_binary '\0',NULL,NULL),('5eb323db-e8a9-4b8c-9f2b-c8a19e29bb5a',NULL,'identity-provider-redirector','a6362837-3fda-4079-bc1f-4fb892f0260e','84968d46-1978-4844-9d0c-8b13c4658589',2,25,_binary '\0',NULL,NULL),('5efcdcbf-c266-4722-bd61-008307e78344',NULL,NULL,'a6362837-3fda-4079-bc1f-4fb892f0260e','8c21c151-f85f-4aef-834b-f4a26a12abab',1,20,_binary '','6d7ee06c-5aaa-43c4-9e7d-f512858b8faa',NULL),('6212fe47-5676-4246-a232-0f7c4d95d2d0',NULL,'client-x509','20b6c21c-504d-4f91-96b2-fd3dfbff4203','31a551f1-f60f-47cd-a929-00d9ed476959',2,40,_binary '\0',NULL,NULL),('67d2506f-cc8d-4feb-8867-34f1f6ea2859',NULL,NULL,'20b6c21c-504d-4f91-96b2-fd3dfbff4203','2dd58333-444c-4c68-b7cb-d6a4dbcaafa8',2,20,_binary '','c879dd95-638a-48f5-8638-3b8455f77614',NULL),('71391d7c-8706-43d8-923c-669758281a82',NULL,'reset-password','a6362837-3fda-4079-bc1f-4fb892f0260e','0362bca3-42f1-402b-be89-98a0ba2ae994',0,30,_binary '\0',NULL,NULL),('75a4ce49-c57c-4091-9fd0-3775452f3af1',NULL,'reset-credential-email','20b6c21c-504d-4f91-96b2-fd3dfbff4203','4b4389f4-c930-4dbb-8db5-4af556f795ef',0,20,_binary '\0',NULL,NULL),('76a5c4a8-3a5f-495f-b3e1-c6f85b69f362',NULL,'registration-recaptcha-action','a6362837-3fda-4079-bc1f-4fb892f0260e','6d27c637-5c9c-4263-829e-717619131cb0',3,60,_binary '\0',NULL,NULL),('7b65641d-029f-49a2-81a0-339b14747dfc',NULL,'conditional-user-configured','20b6c21c-504d-4f91-96b2-fd3dfbff4203','ebcc25aa-413e-4b1f-b4fe-8b493bf47be8',0,10,_binary '\0',NULL,NULL),('7eccc762-740b-4921-a7d6-5224675c0429',NULL,'registration-recaptcha-action','20b6c21c-504d-4f91-96b2-fd3dfbff4203','537a9421-92c7-49ca-bfa9-7bb85ef7c098',3,60,_binary '\0',NULL,NULL),('8547bdf2-db71-433b-b95f-6d69dd99caa4',NULL,'idp-create-user-if-unique','20b6c21c-504d-4f91-96b2-fd3dfbff4203','2dd58333-444c-4c68-b7cb-d6a4dbcaafa8',2,10,_binary '\0',NULL,'ec2bb5b5-3748-49a8-b850-fe6c0e93f3fe'),('878677ce-625f-4f60-9c0a-45b1538229bc',NULL,'basic-auth-otp','a6362837-3fda-4079-bc1f-4fb892f0260e','67f65143-0de0-4b30-a3e0-89a1e50ef6f4',3,20,_binary '\0',NULL,NULL),('87ac0806-2505-4140-b9d5-9045c75367be',NULL,'auth-spnego','20b6c21c-504d-4f91-96b2-fd3dfbff4203','39a5d7e9-a41e-4efd-b527-3cea72923e50',3,20,_binary '\0',NULL,NULL),('8849caba-fcda-43f6-b22e-4e2ed66b5a15',NULL,'registration-user-creation','20b6c21c-504d-4f91-96b2-fd3dfbff4203','537a9421-92c7-49ca-bfa9-7bb85ef7c098',0,20,_binary '\0',NULL,NULL),('88794301-98f9-4425-8527-038eb1036099',NULL,'idp-review-profile','20b6c21c-504d-4f91-96b2-fd3dfbff4203','9ec0e1af-0171-4a0d-b346-301a61674ef9',0,10,_binary '\0',NULL,'8ec1d6ee-41fb-4a3a-a00c-84277f01a52c'),('89149194-fd28-4512-b7fb-0169f3ec7ecf',NULL,NULL,'20b6c21c-504d-4f91-96b2-fd3dfbff4203','9d2b9ad9-e853-4416-84bb-ac33ace7f8e8',1,20,_binary '','01e42919-719d-48b5-b90e-b082ce3f435c',NULL),('8eca3fac-f1ed-4803-a456-a675d2b56a24',NULL,'direct-grant-validate-username','20b6c21c-504d-4f91-96b2-fd3dfbff4203','e9e55b04-c1eb-49fe-8b9e-ffd0cd83e3b7',0,10,_binary '\0',NULL,NULL),('90e33fc3-cebe-44da-96cc-8a9b97fbbd0b',NULL,'idp-confirm-link','20b6c21c-504d-4f91-96b2-fd3dfbff4203','c879dd95-638a-48f5-8638-3b8455f77614',0,10,_binary '\0',NULL,NULL),('928d75b5-afa7-4c85-9fa7-6efecc3e3168',NULL,'auth-spnego','a6362837-3fda-4079-bc1f-4fb892f0260e','dff62c6d-c6c8-415d-ba31-31dd8f401030',3,20,_binary '\0',NULL,NULL),('92e36700-353d-4cb6-936c-7598206d7d53',NULL,'idp-create-user-if-unique','a6362837-3fda-4079-bc1f-4fb892f0260e','3e31696a-5851-4bc9-a5e0-c33c29c38686',2,10,_binary '\0',NULL,'07b9ae77-e5eb-430a-aed4-9136c20f8fad'),('95082744-cca2-4024-a7b2-67c3bfbb04fe',NULL,NULL,'20b6c21c-504d-4f91-96b2-fd3dfbff4203','a9362ad4-714a-437b-8d1d-b3a8355cdf3e',1,20,_binary '','9374c5f1-e28c-479c-9fb9-9f967af3c380',NULL),('95645039-ced4-46d8-97b0-4d10f6e36477',NULL,'conditional-user-configured','a6362837-3fda-4079-bc1f-4fb892f0260e','4837579b-48a6-4b57-bcd4-854dec471145',0,10,_binary '\0',NULL,NULL),('95b99bb1-bc21-4b8f-841e-dc5049249667',NULL,'auth-otp-form','a6362837-3fda-4079-bc1f-4fb892f0260e','8dd5b032-054e-4390-9764-4536f6afea01',0,20,_binary '\0',NULL,NULL),('96008920-d9f3-4d6d-8937-1d88979fc627',NULL,NULL,'a6362837-3fda-4079-bc1f-4fb892f0260e','75d4188a-b6f5-46c6-96db-098e4ca020cc',1,20,_binary '','8dd5b032-054e-4390-9764-4536f6afea01',NULL),('a194d27f-ff0f-4449-a47b-c73ae1b3a418',NULL,'reset-password','20b6c21c-504d-4f91-96b2-fd3dfbff4203','4b4389f4-c930-4dbb-8db5-4af556f795ef',0,30,_binary '\0',NULL,NULL),('a27aec38-8bc3-4323-88d7-2c09339f673c',NULL,'http-basic-authenticator','20b6c21c-504d-4f91-96b2-fd3dfbff4203','9edfcc45-2f92-401e-a6c0-bbdda841152c',0,10,_binary '\0',NULL,NULL),('a281a1c1-6228-49b8-8d7e-29085e8af593',NULL,'idp-email-verification','20b6c21c-504d-4f91-96b2-fd3dfbff4203','0f21251f-0cbd-4541-a254-90e0cc0133f5',2,10,_binary '\0',NULL,NULL),('a28f425f-e3b1-45ac-a30c-d933702d0e62',NULL,'registration-page-form','20b6c21c-504d-4f91-96b2-fd3dfbff4203','09f46c26-458c-4972-8e9e-1d101ab8aec1',0,10,_binary '','537a9421-92c7-49ca-bfa9-7bb85ef7c098',NULL),('a4fc9ebf-ba50-4daf-b420-03b4cd0df3e3',NULL,'identity-provider-redirector','20b6c21c-504d-4f91-96b2-fd3dfbff4203','39a5d7e9-a41e-4efd-b527-3cea72923e50',2,25,_binary '\0',NULL,NULL),('a7b3ad85-a826-4b34-8618-cfe3980712d1',NULL,NULL,'20b6c21c-504d-4f91-96b2-fd3dfbff4203','39a5d7e9-a41e-4efd-b527-3cea72923e50',2,30,_binary '','9d2b9ad9-e853-4416-84bb-ac33ace7f8e8',NULL),('a9f58e9b-ef7e-43ec-b53e-e28940b5c626',NULL,'conditional-user-configured','a6362837-3fda-4079-bc1f-4fb892f0260e','6d7ee06c-5aaa-43c4-9e7d-f512858b8faa',0,10,_binary '\0',NULL,NULL),('aab4a3e1-b2c7-4cbc-adcf-9512405a48ba',NULL,NULL,'20b6c21c-504d-4f91-96b2-fd3dfbff4203','9ec0e1af-0171-4a0d-b346-301a61674ef9',0,20,_binary '','2dd58333-444c-4c68-b7cb-d6a4dbcaafa8',NULL),('aabc1ed8-d39f-40c0-859e-3e7e39cf710e',NULL,'registration-page-form','a6362837-3fda-4079-bc1f-4fb892f0260e','bcf7f9d1-e46a-4ce7-8388-3e5f221fcb72',0,10,_binary '','6d27c637-5c9c-4263-829e-717619131cb0',NULL),('aaeacb96-d847-4c94-82d5-01301ce05211',NULL,'client-secret','20b6c21c-504d-4f91-96b2-fd3dfbff4203','31a551f1-f60f-47cd-a929-00d9ed476959',2,10,_binary '\0',NULL,NULL),('acaff445-7cb6-4064-84bd-c6a2ef255850',NULL,NULL,'a6362837-3fda-4079-bc1f-4fb892f0260e','70bc9159-fc9a-4321-87db-ab234c26e41d',2,20,_binary '','75d4188a-b6f5-46c6-96db-098e4ca020cc',NULL),('ae8e659d-9568-4688-ad67-a62f4b91f4a8',NULL,'reset-credential-email','a6362837-3fda-4079-bc1f-4fb892f0260e','0362bca3-42f1-402b-be89-98a0ba2ae994',0,20,_binary '\0',NULL,NULL),('b3b7691d-009c-4ef5-97a1-e02564a56563',NULL,NULL,'a6362837-3fda-4079-bc1f-4fb892f0260e','6cdb3fcf-ffa7-4b16-a4d9-9b813ade8d7a',0,20,_binary '','3e31696a-5851-4bc9-a5e0-c33c29c38686',NULL),('b55f6ae7-e06b-41b6-b621-757c5a6bc079',NULL,'auth-username-password-form','a6362837-3fda-4079-bc1f-4fb892f0260e','a9b09de3-99f0-4c91-ae10-d1c8c9403b1e',0,10,_binary '\0',NULL,NULL),('b9a54407-6280-4396-a2b6-816e1d4fa79b',NULL,'conditional-user-configured','20b6c21c-504d-4f91-96b2-fd3dfbff4203','01e42919-719d-48b5-b90e-b082ce3f435c',0,10,_binary '\0',NULL,NULL),('c079f19b-e780-473d-b8ad-585c2dc9c280',NULL,'registration-password-action','20b6c21c-504d-4f91-96b2-fd3dfbff4203','537a9421-92c7-49ca-bfa9-7bb85ef7c098',0,50,_binary '\0',NULL,NULL),('c0804e7b-45bc-4ff0-bb1a-cc3ae1d8e492',NULL,'idp-confirm-link','a6362837-3fda-4079-bc1f-4fb892f0260e','3408f371-b85e-48dd-a9aa-ab24f60fd168',0,10,_binary '\0',NULL,NULL),('c170bd0f-5c04-4462-ab44-00a3de02b30c',NULL,NULL,'20b6c21c-504d-4f91-96b2-fd3dfbff4203','e29b4da9-605e-4cce-a058-dde817000647',0,20,_binary '','ea32f07b-8094-448f-9bab-e68e152b2a85',NULL),('c2df2607-e102-4ba7-b3b0-af398c6044ed',NULL,'auth-spnego','a6362837-3fda-4079-bc1f-4fb892f0260e','67f65143-0de0-4b30-a3e0-89a1e50ef6f4',3,30,_binary '\0',NULL,NULL),('c3d90953-f991-450f-b4c9-42921a26ce9c',NULL,'conditional-user-configured','20b6c21c-504d-4f91-96b2-fd3dfbff4203','a33c1868-1b29-4fe6-a3b3-168008df9b17',0,10,_binary '\0',NULL,NULL),('cbd896ec-426f-43f1-9301-2090bcc75325',NULL,'auth-cookie','a6362837-3fda-4079-bc1f-4fb892f0260e','dff62c6d-c6c8-415d-ba31-31dd8f401030',2,10,_binary '\0',NULL,NULL),('ce11fd56-5a1f-4a4c-a1d8-bd619b6a0f81',NULL,NULL,'a6362837-3fda-4079-bc1f-4fb892f0260e','3e31696a-5851-4bc9-a5e0-c33c29c38686',2,20,_binary '','3408f371-b85e-48dd-a9aa-ab24f60fd168',NULL),('d2c73a77-1ea0-4300-a71f-8193fed11c8e',NULL,'conditional-user-configured','a6362837-3fda-4079-bc1f-4fb892f0260e','48b85a25-13fa-494a-9741-d65b027780a6',0,10,_binary '\0',NULL,NULL),('d94ebbcc-66a3-4020-808a-f6c927d91619',NULL,'no-cookie-redirect','20b6c21c-504d-4f91-96b2-fd3dfbff4203','e29b4da9-605e-4cce-a058-dde817000647',0,10,_binary '\0',NULL,NULL),('d95769b5-8f08-486b-8812-dd217cf06f86',NULL,'reset-credentials-choose-user','a6362837-3fda-4079-bc1f-4fb892f0260e','0362bca3-42f1-402b-be89-98a0ba2ae994',0,10,_binary '\0',NULL,NULL),('dd01d4d7-bf65-4d74-b1b2-6530a1dd602d',NULL,'basic-auth-otp','20b6c21c-504d-4f91-96b2-fd3dfbff4203','ea32f07b-8094-448f-9bab-e68e152b2a85',3,20,_binary '\0',NULL,NULL),('e238fef8-97ba-44ed-a6dd-af21b5b8ae32',NULL,'direct-grant-validate-password','20b6c21c-504d-4f91-96b2-fd3dfbff4203','e9e55b04-c1eb-49fe-8b9e-ffd0cd83e3b7',0,20,_binary '\0',NULL,NULL),('e266d6f1-3cb8-4862-bd1f-181b301234df',NULL,'client-secret-jwt','20b6c21c-504d-4f91-96b2-fd3dfbff4203','31a551f1-f60f-47cd-a929-00d9ed476959',2,30,_binary '\0',NULL,NULL),('e3110dea-67d2-4841-b2a0-812e627c46e8',NULL,'auth-username-password-form','a6362837-3fda-4079-bc1f-4fb892f0260e','8c21c151-f85f-4aef-834b-f4a26a12abab',0,10,_binary '\0',NULL,NULL),('e525aaad-ffc4-418a-9163-0730c61a9d51',NULL,NULL,'a6362837-3fda-4079-bc1f-4fb892f0260e','a9b09de3-99f0-4c91-ae10-d1c8c9403b1e',1,20,_binary '','4837579b-48a6-4b57-bcd4-854dec471145',NULL),('e70265b1-ebbd-4a2a-8e1f-f28be51f74b0',NULL,'client-jwt','20b6c21c-504d-4f91-96b2-fd3dfbff4203','31a551f1-f60f-47cd-a929-00d9ed476959',2,20,_binary '\0',NULL,NULL),('e7042d5f-59da-4d66-882b-936b510e78ef',NULL,NULL,'a6362837-3fda-4079-bc1f-4fb892f0260e','84968d46-1978-4844-9d0c-8b13c4658589',2,30,_binary '','8c21c151-f85f-4aef-834b-f4a26a12abab',NULL),('e815bd9a-c44e-4a82-bd63-4e03bf1aaf6b',NULL,'conditional-user-configured','20b6c21c-504d-4f91-96b2-fd3dfbff4203','9374c5f1-e28c-479c-9fb9-9f967af3c380',0,10,_binary '\0',NULL,NULL),('eef84cd1-dfb4-4e2e-9012-a05cdef820c9',NULL,'idp-email-verification','a6362837-3fda-4079-bc1f-4fb892f0260e','70bc9159-fc9a-4321-87db-ab234c26e41d',2,10,_binary '\0',NULL,NULL),('ef73762d-c0ae-46f9-97a3-d18498bf84a3',NULL,NULL,'a6362837-3fda-4079-bc1f-4fb892f0260e','c6ddb2ce-5d56-4dca-aa66-22b3c5a8f28b',0,20,_binary '','67f65143-0de0-4b30-a3e0-89a1e50ef6f4',NULL),('f25b8793-15fc-4bd9-afcf-18d03e685e02',NULL,'basic-auth','20b6c21c-504d-4f91-96b2-fd3dfbff4203','ea32f07b-8094-448f-9bab-e68e152b2a85',0,10,_binary '\0',NULL,NULL),('f3adc2c1-9b31-4056-8319-637afc14425b',NULL,NULL,'20b6c21c-504d-4f91-96b2-fd3dfbff4203','e9e55b04-c1eb-49fe-8b9e-ffd0cd83e3b7',1,30,_binary '','a33c1868-1b29-4fe6-a3b3-168008df9b17',NULL),('f529c418-e9ac-4cd2-b59e-5ee1bc58348d',NULL,'client-secret','a6362837-3fda-4079-bc1f-4fb892f0260e','872a4ece-3235-4f2a-bec1-314b425e3eb6',2,10,_binary '\0',NULL,NULL),('f64f0418-3b0d-4b5f-aaf5-f2c5c73587f2',NULL,'registration-user-creation','a6362837-3fda-4079-bc1f-4fb892f0260e','6d27c637-5c9c-4263-829e-717619131cb0',0,20,_binary '\0',NULL,NULL),('f9711472-52fa-4796-b396-cc113ac353a6',NULL,'auth-otp-form','20b6c21c-504d-4f91-96b2-fd3dfbff4203','01e42919-719d-48b5-b90e-b082ce3f435c',0,20,_binary '\0',NULL,NULL),('f9f39413-85b8-49d1-a43c-0c3a6d91443b',NULL,'direct-grant-validate-otp','20b6c21c-504d-4f91-96b2-fd3dfbff4203','a33c1868-1b29-4fe6-a3b3-168008df9b17',0,20,_binary '\0',NULL,NULL),('fc432820-6a8b-441b-b408-036502d6ef92',NULL,'auth-otp-form','a6362837-3fda-4079-bc1f-4fb892f0260e','6d7ee06c-5aaa-43c4-9e7d-f512858b8faa',0,20,_binary '\0',NULL,NULL),('fec7c139-9940-4fe6-b104-7668223cfad9',NULL,'http-basic-authenticator','a6362837-3fda-4079-bc1f-4fb892f0260e','ca6f63bd-2992-4912-8088-9d1808ceba5e',0,10,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('01e42919-719d-48b5-b90e-b082ce3f435c','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','20b6c21c-504d-4f91-96b2-fd3dfbff4203','basic-flow',_binary '\0',_binary ''),('0362bca3-42f1-402b-be89-98a0ba2ae994','reset credentials','Reset credentials for a user if they forgot their password or something','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '',_binary ''),('09f46c26-458c-4972-8e9e-1d101ab8aec1','registration','registration flow','20b6c21c-504d-4f91-96b2-fd3dfbff4203','basic-flow',_binary '',_binary ''),('0f21251f-0cbd-4541-a254-90e0cc0133f5','Account verification options','Method with which to verity the existing account','20b6c21c-504d-4f91-96b2-fd3dfbff4203','basic-flow',_binary '\0',_binary ''),('2dd58333-444c-4c68-b7cb-d6a4dbcaafa8','User creation or linking','Flow for the existing/non-existing user alternatives','20b6c21c-504d-4f91-96b2-fd3dfbff4203','basic-flow',_binary '\0',_binary ''),('31a551f1-f60f-47cd-a929-00d9ed476959','clients','Base authentication for clients','20b6c21c-504d-4f91-96b2-fd3dfbff4203','client-flow',_binary '',_binary ''),('3408f371-b85e-48dd-a9aa-ab24f60fd168','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '\0',_binary ''),('39a5d7e9-a41e-4efd-b527-3cea72923e50','browser','browser based authentication','20b6c21c-504d-4f91-96b2-fd3dfbff4203','basic-flow',_binary '',_binary ''),('3e31696a-5851-4bc9-a5e0-c33c29c38686','User creation or linking','Flow for the existing/non-existing user alternatives','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '\0',_binary ''),('4837579b-48a6-4b57-bcd4-854dec471145','Copy of browser Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '\0',_binary '\0'),('48b85a25-13fa-494a-9741-d65b027780a6','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '\0',_binary ''),('4b4389f4-c930-4dbb-8db5-4af556f795ef','reset credentials','Reset credentials for a user if they forgot their password or something','20b6c21c-504d-4f91-96b2-fd3dfbff4203','basic-flow',_binary '',_binary ''),('537a9421-92c7-49ca-bfa9-7bb85ef7c098','registration form','registration form','20b6c21c-504d-4f91-96b2-fd3dfbff4203','form-flow',_binary '\0',_binary ''),('552e90d8-8b05-49a0-a28a-0eb4847de256','docker auth','Used by Docker clients to authenticate against the IDP','20b6c21c-504d-4f91-96b2-fd3dfbff4203','basic-flow',_binary '',_binary ''),('67f65143-0de0-4b30-a3e0-89a1e50ef6f4','Authentication Options','Authentication options.','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '\0',_binary ''),('6a673dd7-f954-4c1e-a456-404b11789712','docker auth','Used by Docker clients to authenticate against the IDP','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '',_binary ''),('6cdb3fcf-ffa7-4b16-a4d9-9b813ade8d7a','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '',_binary ''),('6d27c637-5c9c-4263-829e-717619131cb0','registration form','registration form','a6362837-3fda-4079-bc1f-4fb892f0260e','form-flow',_binary '\0',_binary ''),('6d7ee06c-5aaa-43c4-9e7d-f512858b8faa','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '\0',_binary ''),('6f60d870-ff1b-4641-80d7-dd3d5f282f28','direct grant','OpenID Connect Resource Owner Grant','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '',_binary ''),('70bc9159-fc9a-4321-87db-ab234c26e41d','Account verification options','Method with which to verity the existing account','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '\0',_binary ''),('75d4188a-b6f5-46c6-96db-098e4ca020cc','Verify Existing Account by Re-authentication','Reauthentication of existing account','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '\0',_binary ''),('83c0d70a-676d-481d-90d6-8d9292a465db','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '\0',_binary ''),('84968d46-1978-4844-9d0c-8b13c4658589','browser','browser based authentication','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '',_binary ''),('872a4ece-3235-4f2a-bec1-314b425e3eb6','clients','Base authentication for clients','a6362837-3fda-4079-bc1f-4fb892f0260e','client-flow',_binary '',_binary ''),('8c21c151-f85f-4aef-834b-f4a26a12abab','forms','Username, password, otp and other auth forms.','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '\0',_binary ''),('8dd5b032-054e-4390-9764-4536f6afea01','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '\0',_binary ''),('9374c5f1-e28c-479c-9fb9-9f967af3c380','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','20b6c21c-504d-4f91-96b2-fd3dfbff4203','basic-flow',_binary '\0',_binary ''),('9d2b9ad9-e853-4416-84bb-ac33ace7f8e8','forms','Username, password, otp and other auth forms.','20b6c21c-504d-4f91-96b2-fd3dfbff4203','basic-flow',_binary '\0',_binary ''),('9ec0e1af-0171-4a0d-b346-301a61674ef9','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','20b6c21c-504d-4f91-96b2-fd3dfbff4203','basic-flow',_binary '',_binary ''),('9edfcc45-2f92-401e-a6c0-bbdda841152c','saml ecp','SAML ECP Profile Authentication Flow','20b6c21c-504d-4f91-96b2-fd3dfbff4203','basic-flow',_binary '',_binary ''),('a33c1868-1b29-4fe6-a3b3-168008df9b17','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','20b6c21c-504d-4f91-96b2-fd3dfbff4203','basic-flow',_binary '\0',_binary ''),('a9362ad4-714a-437b-8d1d-b3a8355cdf3e','Verify Existing Account by Re-authentication','Reauthentication of existing account','20b6c21c-504d-4f91-96b2-fd3dfbff4203','basic-flow',_binary '\0',_binary ''),('a9b09de3-99f0-4c91-ae10-d1c8c9403b1e','Copy of browser forms','Username, password, otp and other auth forms.','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '\0',_binary '\0'),('bcf7f9d1-e46a-4ce7-8388-3e5f221fcb72','registration','registration flow','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '',_binary ''),('c6ddb2ce-5d56-4dca-aa66-22b3c5a8f28b','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '',_binary ''),('c879dd95-638a-48f5-8638-3b8455f77614','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','20b6c21c-504d-4f91-96b2-fd3dfbff4203','basic-flow',_binary '\0',_binary ''),('ca6f63bd-2992-4912-8088-9d1808ceba5e','saml ecp','SAML ECP Profile Authentication Flow','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '',_binary ''),('dff62c6d-c6c8-415d-ba31-31dd8f401030','Copy of browser','browser based authentication','a6362837-3fda-4079-bc1f-4fb892f0260e','basic-flow',_binary '',_binary '\0'),('e29b4da9-605e-4cce-a058-dde817000647','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','20b6c21c-504d-4f91-96b2-fd3dfbff4203','basic-flow',_binary '',_binary ''),('e9e55b04-c1eb-49fe-8b9e-ffd0cd83e3b7','direct grant','OpenID Connect Resource Owner Grant','20b6c21c-504d-4f91-96b2-fd3dfbff4203','basic-flow',_binary '',_binary ''),('ea32f07b-8094-448f-9bab-e68e152b2a85','Authentication Options','Authentication options.','20b6c21c-504d-4f91-96b2-fd3dfbff4203','basic-flow',_binary '\0',_binary ''),('ebcc25aa-413e-4b1f-b4fe-8b493bf47be8','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','20b6c21c-504d-4f91-96b2-fd3dfbff4203','basic-flow',_binary '\0',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('07b9ae77-e5eb-430a-aed4-9136c20f8fad','create unique user config','a6362837-3fda-4079-bc1f-4fb892f0260e'),('2c3693a0-9e6c-41ce-84f7-eba0c29fa1c1','review profile config','a6362837-3fda-4079-bc1f-4fb892f0260e'),('8ec1d6ee-41fb-4a3a-a00c-84277f01a52c','review profile config','20b6c21c-504d-4f91-96b2-fd3dfbff4203'),('ec2bb5b5-3748-49a8-b850-fe6c0e93f3fe','create unique user config','20b6c21c-504d-4f91-96b2-fd3dfbff4203');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('07b9ae77-e5eb-430a-aed4-9136c20f8fad','false','require.password.update.after.registration'),('2c3693a0-9e6c-41ce-84f7-eba0c29fa1c1','missing','update.profile.on.first.login'),('8ec1d6ee-41fb-4a3a-a00c-84277f01a52c','missing','update.profile.on.first.login'),('ec2bb5b5-3748-49a8-b850-fe6c0e93f3fe','false','require.password.update.after.registration');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` tinyint(1) NOT NULL DEFAULT '0',
  `FULL_SCOPE_ALLOWED` tinyint(1) NOT NULL DEFAULT '0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` tinyint(1) NOT NULL DEFAULT '0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` tinyint(1) NOT NULL DEFAULT '0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` tinyint(1) NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('066f2a02-3f96-4cfa-9fd7-e295eddedc51',1,1,'buv-client',0,0,'puuoAa8CTlbTLv5uSdtYSxuWNfKhwfDA','',0,'',0,'a6362837-3fda-4079-bc1f-4fb892f0260e','openid-connect',-1,_binary '',_binary '\0','',_binary '\0','client-secret','','',NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('1a2ee814-a842-4e83-a6c1-7fb032639d66',1,0,'realm-management',0,0,NULL,NULL,1,NULL,0,'a6362837-3fda-4079-bc1f-4fb892f0260e','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('209490ed-9eb5-49f1-8ad3-b634190f138d',1,0,'account',0,1,NULL,'/realms/master/account/',0,NULL,0,'20b6c21c-504d-4f91-96b2-fd3dfbff4203','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('21263250-78b6-4bda-a2f7-db61a43887ea',1,0,'BUV-realm',0,0,NULL,NULL,1,NULL,0,'20b6c21c-504d-4f91-96b2-fd3dfbff4203',NULL,0,_binary '\0',_binary '\0','BUV Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('2d4dec4c-0c3e-4b94-a2a1-6e68ccf8eaf1',1,1,'dev-client',0,1,NULL,'',0,'',0,'a6362837-3fda-4079-bc1f-4fb892f0260e','openid-connect',-1,_binary '',_binary '\0','',_binary '\0','client-secret','','',NULL,_binary '',_binary '\0',_binary '',_binary ''),('41ed9506-24ac-42af-a8bb-8a88e090697b',1,0,'master-realm',0,0,NULL,NULL,1,NULL,0,'20b6c21c-504d-4f91-96b2-fd3dfbff4203',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7',1,1,'mibarrio-client-tst',0,0,'i8q5FnvBIhMDAMmVNuqiFyx37F0jmlV7','',0,'',0,'a6362837-3fda-4079-bc1f-4fb892f0260e','openid-connect',-1,_binary '',_binary '\0','',_binary '\0','client-secret','','App Mi Barrio Cliente keycloak TST',NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('50a61bff-3ecb-4b8a-8461-42f81212550d',1,1,'deportes-client',0,0,'ZRU5BVdVbFmMfTi9aedHorGV5Exida9w','',0,'',0,'a6362837-3fda-4079-bc1f-4fb892f0260e','openid-connect',-1,_binary '',_binary '\0','deportes-client',_binary '\0','client-secret','','',NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('56dbc594-fc48-4f78-aef0-ae52325ee512',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'a6362837-3fda-4079-bc1f-4fb892f0260e','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('59d280aa-8b97-4e3d-bad9-5a86acd3d9c9',1,1,'admin-cli',0,1,NULL,'',0,'',0,'a6362837-3fda-4079-bc1f-4fb892f0260e','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret','','',NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('605b2748-d68d-4296-bb07-5f1f693dc27a',1,1,'markey-client-online',0,1,NULL,'',0,'',0,'a6362837-3fda-4079-bc1f-4fb892f0260e','openid-connect',-1,_binary '',_binary '\0','markey',_binary '\0','client-secret','','',NULL,_binary '',_binary '\0',_binary '',_binary ''),('6ce71902-186b-49d4-bac0-2f55165ea684',1,0,'admin-cli',0,1,NULL,NULL,0,NULL,0,'20b6c21c-504d-4f91-96b2-fd3dfbff4203','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('75016c51-30b1-45b7-8454-b2fb2c353215',1,0,'broker',0,0,NULL,NULL,1,NULL,0,'20b6c21c-504d-4f91-96b2-fd3dfbff4203','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('7d98848c-daa6-4508-a519-eb348ba3c055',1,1,'pciudadana-portal',0,0,'qENDTouDZafTM2SoNcLwlETewdKw689z','',0,'',0,'a6362837-3fda-4079-bc1f-4fb892f0260e','openid-connect',-1,_binary '',_binary '\0','Participacion Ciudadana ',_binary '\0','client-secret','','',NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('7e166491-3e57-4d03-ae88-b175cc6dc202',1,1,'tad-mesa',0,1,NULL,'',0,'',0,'a6362837-3fda-4079-bc1f-4fb892f0260e','openid-connect',-1,_binary '',_binary '\0','TAD Mesa',_binary '\0','client-secret','','prueba identificación Mesa Digital',NULL,_binary '',_binary '\0',_binary '',_binary ''),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f',1,1,'empleos-client',0,0,'Hz4AtqrKRbTGrEkSgU6HiQ5wiSBObicr','',0,'',0,'a6362837-3fda-4079-bc1f-4fb892f0260e','openid-connect',-1,_binary '',_binary '\0','Portal de Empleos client tst',_binary '\0','client-secret','','Portal de empleos Vicente Lopez\nhttps://empleo.vicentelopez.gov.ar/',NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('c97499b9-2697-478e-91d3-6125ce5c7771',1,0,'account',0,1,NULL,'/realms/BUV/account/',0,NULL,0,'a6362837-3fda-4079-bc1f-4fb892f0260e','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('d0cdeacb-905c-4879-bb48-4595fdd3969d',1,1,'vlo_rusoft_CZxeS8o98yo6tMfv',0,0,'rSBuoFUJfqVZH1RDXmDyNDZcCRUxeJZv','',0,'',0,'a6362837-3fda-4079-bc1f-4fb892f0260e','openid-connect',-1,_binary '',_binary '\0','Client IIPP',_binary '','client-secret','','',NULL,_binary '',_binary '\0',_binary '',_binary ''),('d48e5aa3-9a0a-4e3b-b8b3-236114df7301',1,0,'security-admin-console',0,1,NULL,'/admin/BUV/console/',0,NULL,0,'a6362837-3fda-4079-bc1f-4fb892f0260e','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('f8e07e76-9ef9-446e-858c-da3d72b30d77',1,0,'account-console',0,1,NULL,'/realms/master/account/',0,NULL,0,'20b6c21c-504d-4f91-96b2-fd3dfbff4203','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('fda74549-8bda-4d87-8fe4-632f1c8f8a3c',1,0,'security-admin-console',0,1,NULL,'/admin/master/console/',0,NULL,0,'20b6c21c-504d-4f91-96b2-fd3dfbff4203','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('ffdacefe-6633-4321-8817-f765be106869',1,0,'account-console',0,1,NULL,'/realms/BUV/account/',0,NULL,0,'a6362837-3fda-4079-bc1f-4fb892f0260e','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('066f2a02-3f96-4cfa-9fd7-e295eddedc51','backchannel.logout.revoke.offline.tokens','false'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','backchannel.logout.session.required','true'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','client.secret.creation.time','1675962698'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','display.on.consent.screen','false'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','oauth2.device.authorization.grant.enabled','false'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','oidc.ciba.grant.enabled','false'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','post.logout.redirect.uris','https://auth-oscity.firebaseapp.com/__/auth/handler##http://localhost:8000/*##https://os-arg-vicente-lopez.firebaseapp.com/__/auth/handler##https://openidconnect.net/*##https://identidadigital.vicentelopez.gov.ar/*##http://tst-mod-web03.vicentelopez.gov.ar/*##http://localhost:3000/*##vlmibarrio://vicentelopez.gov.ar*##http://dev-sip-web02.vicentelopez.gov.ar:3001/*##http://dev-sip-web02.vicentelopez.gov.ar:8080/*##https://identidaddigital.vicentelopez.gov.ar/__/auth/handler/*##https://prepro-tad.vicentelopez.gov.ar/*##https://prd-sip-web06.vicentelopez.gov.ar:3000/login/callback/*##http://dev-mod-web09.vicentelopez.gov.ar/sicuv/*##https://openid-gw-iipp.vicentelopez.gov.ar/login/callback##http://dev-mod-web09.vicentelopez.gov.ar/sicuv/##https://localhost:8001/*##https://demos.citymis.co/*##https://dev-deportes.vicentelopez.gov.ar/mibarriovecinos/Account/MvlId*##http://dev-mod-iis02.vicentelopez.gov.ar/DeportesPublic*##http://localhost:7069/*##https://dev-mod-iis02.vicentelopez.gov.ar/*##http://localhost:8000/login/*##https://localhost:8005/*##http://localhost:8005/*##http://15.228.204.194/*##https://15.228.204.194/*##http://15.228.204.194##https://identidaddigital.vicentelopez.gov.ar/*##https://dev-deportes.vicentelopez.gov.ar##vlmibarrio://vicentelopez.gov.ar/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','use.jwks.url','false'),('209490ed-9eb5-49f1-8ad3-b634190f138d','post.logout.redirect.uris','+'),('2d4dec4c-0c3e-4b94-a2a1-6e68ccf8eaf1','backchannel.logout.revoke.offline.tokens','false'),('2d4dec4c-0c3e-4b94-a2a1-6e68ccf8eaf1','backchannel.logout.session.required','true'),('2d4dec4c-0c3e-4b94-a2a1-6e68ccf8eaf1','display.on.consent.screen','false'),('2d4dec4c-0c3e-4b94-a2a1-6e68ccf8eaf1','oauth2.device.authorization.grant.enabled','false'),('2d4dec4c-0c3e-4b94-a2a1-6e68ccf8eaf1','oidc.ciba.grant.enabled','false'),('2d4dec4c-0c3e-4b94-a2a1-6e68ccf8eaf1','post.logout.redirect.uris','http://localhost:8000/*'),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','backchannel.logout.revoke.offline.tokens','false'),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','backchannel.logout.session.required','true'),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','client.secret.creation.time','1716406261'),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','display.on.consent.screen','false'),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','oauth2.device.authorization.grant.enabled','false'),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','oidc.ciba.grant.enabled','false'),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','post.logout.redirect.uris','vlmibarrio://vicentelopez.gov.ar##vlmibarrio://vicentelopez.gov.ar/*'),('50a61bff-3ecb-4b8a-8461-42f81212550d','backchannel.logout.revoke.offline.tokens','false'),('50a61bff-3ecb-4b8a-8461-42f81212550d','backchannel.logout.session.required','true'),('50a61bff-3ecb-4b8a-8461-42f81212550d','client.secret.creation.time','1713969540'),('50a61bff-3ecb-4b8a-8461-42f81212550d','display.on.consent.screen','false'),('50a61bff-3ecb-4b8a-8461-42f81212550d','oauth2.device.authorization.grant.enabled','false'),('50a61bff-3ecb-4b8a-8461-42f81212550d','oidc.ciba.grant.enabled','false'),('50a61bff-3ecb-4b8a-8461-42f81212550d','post.logout.redirect.uris','https://dev-deportes.vicentelopez.gov.ar/mibarriovecinos/Account/MvlId*##https://dev-deportes.vicentelopez.gov.ar/*'),('59d280aa-8b97-4e3d-bad9-5a86acd3d9c9','backchannel.logout.revoke.offline.tokens','false'),('59d280aa-8b97-4e3d-bad9-5a86acd3d9c9','backchannel.logout.session.required','true'),('59d280aa-8b97-4e3d-bad9-5a86acd3d9c9','client.secret.creation.time','1678197010'),('59d280aa-8b97-4e3d-bad9-5a86acd3d9c9','display.on.consent.screen','false'),('59d280aa-8b97-4e3d-bad9-5a86acd3d9c9','oauth2.device.authorization.grant.enabled','false'),('59d280aa-8b97-4e3d-bad9-5a86acd3d9c9','oidc.ciba.grant.enabled','false'),('605b2748-d68d-4296-bb07-5f1f693dc27a','backchannel.logout.revoke.offline.tokens','false'),('605b2748-d68d-4296-bb07-5f1f693dc27a','backchannel.logout.session.required','true'),('605b2748-d68d-4296-bb07-5f1f693dc27a','client.secret.creation.time','1673524073'),('605b2748-d68d-4296-bb07-5f1f693dc27a','display.on.consent.screen','false'),('605b2748-d68d-4296-bb07-5f1f693dc27a','oauth2.device.authorization.grant.enabled','false'),('605b2748-d68d-4296-bb07-5f1f693dc27a','oidc.ciba.grant.enabled','false'),('605b2748-d68d-4296-bb07-5f1f693dc27a','post.logout.redirect.uris','http://localhost:8000/*'),('605b2748-d68d-4296-bb07-5f1f693dc27a','use.jwks.url','false'),('7d98848c-daa6-4508-a519-eb348ba3c055','backchannel.logout.revoke.offline.tokens','false'),('7d98848c-daa6-4508-a519-eb348ba3c055','backchannel.logout.session.required','true'),('7d98848c-daa6-4508-a519-eb348ba3c055','client.secret.creation.time','1703000583'),('7d98848c-daa6-4508-a519-eb348ba3c055','display.on.consent.screen','false'),('7d98848c-daa6-4508-a519-eb348ba3c055','oauth2.device.authorization.grant.enabled','false'),('7d98848c-daa6-4508-a519-eb348ba3c055','oidc.ciba.grant.enabled','false'),('7d98848c-daa6-4508-a519-eb348ba3c055','post.logout.redirect.uris','https://testing2.diphot.com.ar/vl-presupuesto-participativo/auth/keycloak/callback'),('7e166491-3e57-4d03-ae88-b175cc6dc202','backchannel.logout.revoke.offline.tokens','false'),('7e166491-3e57-4d03-ae88-b175cc6dc202','backchannel.logout.session.required','true'),('7e166491-3e57-4d03-ae88-b175cc6dc202','client.secret.creation.time','1677697610'),('7e166491-3e57-4d03-ae88-b175cc6dc202','display.on.consent.screen','false'),('7e166491-3e57-4d03-ae88-b175cc6dc202','oauth2.device.authorization.grant.enabled','false'),('7e166491-3e57-4d03-ae88-b175cc6dc202','oidc.ciba.grant.enabled','false'),('7e166491-3e57-4d03-ae88-b175cc6dc202','post.logout.redirect.uris','http://localhost:5050/*##https://prepro-tad.vicentelopez.gov.ar/*##http://localhost:3000/*'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','backchannel.logout.revoke.offline.tokens','false'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','backchannel.logout.session.required','true'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','client.secret.creation.time','1696341698'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','display.on.consent.screen','false'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','oauth2.device.authorization.grant.enabled','false'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','oidc.ciba.grant.enabled','false'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','post.logout.redirect.uris','http://localhost:8005/*##https://localhost:8005/*##http://localhost:8005/##https://localhost:8005/login/sso##https://localhost:8005/login/sso/*##http://18.229.123.224/*##https://18.229.123.224/*##https://empleo.vicentelopez.gov.ar/*##https://empleo.vicentelopez.gov.ar/login/sso/redirect*'),('c97499b9-2697-478e-91d3-6125ce5c7771','post.logout.redirect.uris','+'),('d0cdeacb-905c-4879-bb48-4595fdd3969d','backchannel.logout.revoke.offline.tokens','false'),('d0cdeacb-905c-4879-bb48-4595fdd3969d','backchannel.logout.session.required','true'),('d0cdeacb-905c-4879-bb48-4595fdd3969d','client.secret.creation.time','1675965685'),('d0cdeacb-905c-4879-bb48-4595fdd3969d','display.on.consent.screen','false'),('d0cdeacb-905c-4879-bb48-4595fdd3969d','login_theme','BUV'),('d0cdeacb-905c-4879-bb48-4595fdd3969d','oauth2.device.authorization.grant.enabled','false'),('d0cdeacb-905c-4879-bb48-4595fdd3969d','oidc.ciba.grant.enabled','false'),('d48e5aa3-9a0a-4e3b-b8b3-236114df7301','pkce.code.challenge.method','S256'),('d48e5aa3-9a0a-4e3b-b8b3-236114df7301','post.logout.redirect.uris','+'),('f8e07e76-9ef9-446e-858c-da3d72b30d77','pkce.code.challenge.method','S256'),('f8e07e76-9ef9-446e-858c-da3d72b30d77','post.logout.redirect.uris','+'),('fda74549-8bda-4d87-8fe4-632f1c8f8a3c','pkce.code.challenge.method','S256'),('fda74549-8bda-4d87-8fe4-632f1c8f8a3c','post.logout.redirect.uris','+'),('ffdacefe-6633-4321-8817-f765be106869','pkce.code.challenge.method','S256'),('ffdacefe-6633-4321-8817-f765be106869','post.logout.redirect.uris','+');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `EXPIRATION` int(11) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  `REMAINING_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL DEFAULT '',
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('016de98d-3748-4db6-b4b7-b0564d779c88','email','a6362837-3fda-4079-bc1f-4fb892f0260e','OpenID Connect built-in scope: email','openid-connect'),('07d9d5ce-4175-4b65-856d-87715e627e2c','address','20b6c21c-504d-4f91-96b2-fd3dfbff4203','OpenID Connect built-in scope: address','openid-connect'),('0a62bd0f-9076-4240-a3da-c06ec1e142ad','acr','20b6c21c-504d-4f91-96b2-fd3dfbff4203','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect'),('0fb72e7b-5a4f-4ea6-9523-faaff6a303db','openid','a6362837-3fda-4079-bc1f-4fb892f0260e','openid','openid-connect'),('1f572c55-7b94-4667-8e3c-d63f93176d99','microprofile-jwt','a6362837-3fda-4079-bc1f-4fb892f0260e','Microprofile - JWT built-in scope','openid-connect'),('22fee9af-78b2-4560-b57d-7977d89e7b72','email','20b6c21c-504d-4f91-96b2-fd3dfbff4203','OpenID Connect built-in scope: email','openid-connect'),('2b6ce36e-4e5e-40cb-b517-8584cd9b2351','microprofile-jwt','20b6c21c-504d-4f91-96b2-fd3dfbff4203','Microprofile - JWT built-in scope','openid-connect'),('2ffa1fdd-22a2-4a41-8c84-52ecc66de28d','role_list','20b6c21c-504d-4f91-96b2-fd3dfbff4203','SAML role list','saml'),('3837e21d-2fdc-45d5-86cd-ebfceb73d7d6','role_list','a6362837-3fda-4079-bc1f-4fb892f0260e','SAML role list','saml'),('41bbc137-35c0-4c6f-92ad-ec287a24b678','roles','a6362837-3fda-4079-bc1f-4fb892f0260e','OpenID Connect scope for add user roles to the access token','openid-connect'),('48141992-faeb-4c66-9be6-c76e8e37d53c','roles','20b6c21c-504d-4f91-96b2-fd3dfbff4203','OpenID Connect scope for add user roles to the access token','openid-connect'),('65212589-6ee4-404b-b248-7a08f647cec9','phone','20b6c21c-504d-4f91-96b2-fd3dfbff4203','OpenID Connect built-in scope: phone','openid-connect'),('823e6346-4043-4eb2-a9a0-22fbb73ad7b5','web-origins','a6362837-3fda-4079-bc1f-4fb892f0260e','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('98c08b2e-cd2a-4449-aac4-02eeb92c4068','address','a6362837-3fda-4079-bc1f-4fb892f0260e','OpenID Connect built-in scope: address','openid-connect'),('a083faa5-c057-4a29-a988-376caf87f095','web-origins','20b6c21c-504d-4f91-96b2-fd3dfbff4203','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('a23821f5-cfa5-49ee-887b-d08f17f57a59','phone','a6362837-3fda-4079-bc1f-4fb892f0260e','OpenID Connect built-in scope: phone','openid-connect'),('aa5c095f-a207-4cdd-bbfd-8b3d97598391','offline_access','a6362837-3fda-4079-bc1f-4fb892f0260e','OpenID Connect built-in scope: offline_access','openid-connect'),('adc16ec3-7e26-44e4-89c2-25a991ced270','offline_access','20b6c21c-504d-4f91-96b2-fd3dfbff4203','OpenID Connect built-in scope: offline_access','openid-connect'),('cdd4b208-4ea0-4af5-9a99-7238ee5a5de2','profile','20b6c21c-504d-4f91-96b2-fd3dfbff4203','OpenID Connect built-in scope: profile','openid-connect'),('de97970b-f8e9-4063-ab46-7d3adbf17b3e','profile','a6362837-3fda-4079-bc1f-4fb892f0260e','OpenID Connect built-in scope: profile','openid-connect'),('e5cab7b9-2c9a-4ca7-9f60-f448590afe5c','acr','a6362837-3fda-4079-bc1f-4fb892f0260e','OpenID Connect scope for add acr (authentication context class reference) to the token','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL DEFAULT '',
  `VALUE` varchar(2048) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('016de98d-3748-4db6-b4b7-b0564d779c88','${emailScopeConsentText}','consent.screen.text'),('016de98d-3748-4db6-b4b7-b0564d779c88','true','display.on.consent.screen'),('016de98d-3748-4db6-b4b7-b0564d779c88','true','include.in.token.scope'),('07d9d5ce-4175-4b65-856d-87715e627e2c','${addressScopeConsentText}','consent.screen.text'),('07d9d5ce-4175-4b65-856d-87715e627e2c','true','display.on.consent.screen'),('07d9d5ce-4175-4b65-856d-87715e627e2c','true','include.in.token.scope'),('0a62bd0f-9076-4240-a3da-c06ec1e142ad','false','display.on.consent.screen'),('0a62bd0f-9076-4240-a3da-c06ec1e142ad','false','include.in.token.scope'),('0fb72e7b-5a4f-4ea6-9523-faaff6a303db','false','display.on.consent.screen'),('0fb72e7b-5a4f-4ea6-9523-faaff6a303db','','gui.order'),('0fb72e7b-5a4f-4ea6-9523-faaff6a303db','true','include.in.token.scope'),('1f572c55-7b94-4667-8e3c-d63f93176d99','false','display.on.consent.screen'),('1f572c55-7b94-4667-8e3c-d63f93176d99','true','include.in.token.scope'),('22fee9af-78b2-4560-b57d-7977d89e7b72','${emailScopeConsentText}','consent.screen.text'),('22fee9af-78b2-4560-b57d-7977d89e7b72','true','display.on.consent.screen'),('22fee9af-78b2-4560-b57d-7977d89e7b72','true','include.in.token.scope'),('2b6ce36e-4e5e-40cb-b517-8584cd9b2351','false','display.on.consent.screen'),('2b6ce36e-4e5e-40cb-b517-8584cd9b2351','true','include.in.token.scope'),('2ffa1fdd-22a2-4a41-8c84-52ecc66de28d','${samlRoleListScopeConsentText}','consent.screen.text'),('2ffa1fdd-22a2-4a41-8c84-52ecc66de28d','true','display.on.consent.screen'),('3837e21d-2fdc-45d5-86cd-ebfceb73d7d6','${samlRoleListScopeConsentText}','consent.screen.text'),('3837e21d-2fdc-45d5-86cd-ebfceb73d7d6','true','display.on.consent.screen'),('41bbc137-35c0-4c6f-92ad-ec287a24b678','${rolesScopeConsentText}','consent.screen.text'),('41bbc137-35c0-4c6f-92ad-ec287a24b678','true','display.on.consent.screen'),('41bbc137-35c0-4c6f-92ad-ec287a24b678','false','include.in.token.scope'),('48141992-faeb-4c66-9be6-c76e8e37d53c','${rolesScopeConsentText}','consent.screen.text'),('48141992-faeb-4c66-9be6-c76e8e37d53c','true','display.on.consent.screen'),('48141992-faeb-4c66-9be6-c76e8e37d53c','false','include.in.token.scope'),('65212589-6ee4-404b-b248-7a08f647cec9','${phoneScopeConsentText}','consent.screen.text'),('65212589-6ee4-404b-b248-7a08f647cec9','true','display.on.consent.screen'),('65212589-6ee4-404b-b248-7a08f647cec9','true','include.in.token.scope'),('823e6346-4043-4eb2-a9a0-22fbb73ad7b5','','consent.screen.text'),('823e6346-4043-4eb2-a9a0-22fbb73ad7b5','false','display.on.consent.screen'),('823e6346-4043-4eb2-a9a0-22fbb73ad7b5','false','include.in.token.scope'),('98c08b2e-cd2a-4449-aac4-02eeb92c4068','${addressScopeConsentText}','consent.screen.text'),('98c08b2e-cd2a-4449-aac4-02eeb92c4068','true','display.on.consent.screen'),('98c08b2e-cd2a-4449-aac4-02eeb92c4068','true','include.in.token.scope'),('a083faa5-c057-4a29-a988-376caf87f095','','consent.screen.text'),('a083faa5-c057-4a29-a988-376caf87f095','false','display.on.consent.screen'),('a083faa5-c057-4a29-a988-376caf87f095','false','include.in.token.scope'),('a23821f5-cfa5-49ee-887b-d08f17f57a59','${phoneScopeConsentText}','consent.screen.text'),('a23821f5-cfa5-49ee-887b-d08f17f57a59','true','display.on.consent.screen'),('a23821f5-cfa5-49ee-887b-d08f17f57a59','true','include.in.token.scope'),('aa5c095f-a207-4cdd-bbfd-8b3d97598391','${offlineAccessScopeConsentText}','consent.screen.text'),('aa5c095f-a207-4cdd-bbfd-8b3d97598391','true','display.on.consent.screen'),('adc16ec3-7e26-44e4-89c2-25a991ced270','${offlineAccessScopeConsentText}','consent.screen.text'),('adc16ec3-7e26-44e4-89c2-25a991ced270','true','display.on.consent.screen'),('cdd4b208-4ea0-4af5-9a99-7238ee5a5de2','${profileScopeConsentText}','consent.screen.text'),('cdd4b208-4ea0-4af5-9a99-7238ee5a5de2','true','display.on.consent.screen'),('cdd4b208-4ea0-4af5-9a99-7238ee5a5de2','true','include.in.token.scope'),('de97970b-f8e9-4063-ab46-7d3adbf17b3e','${profileScopeConsentText}','consent.screen.text'),('de97970b-f8e9-4063-ab46-7d3adbf17b3e','true','display.on.consent.screen'),('de97970b-f8e9-4063-ab46-7d3adbf17b3e','true','include.in.token.scope'),('e5cab7b9-2c9a-4ca7-9f60-f448590afe5c','false','display.on.consent.screen'),('e5cab7b9-2c9a-4ca7-9f60-f448590afe5c','false','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL DEFAULT '',
  `SCOPE_ID` varchar(255) NOT NULL DEFAULT '',
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('066f2a02-3f96-4cfa-9fd7-e295eddedc51','016de98d-3748-4db6-b4b7-b0564d779c88',_binary ''),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','1f572c55-7b94-4667-8e3c-d63f93176d99',_binary '\0'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','41bbc137-35c0-4c6f-92ad-ec287a24b678',_binary ''),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','823e6346-4043-4eb2-a9a0-22fbb73ad7b5',_binary ''),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','98c08b2e-cd2a-4449-aac4-02eeb92c4068',_binary '\0'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','a23821f5-cfa5-49ee-887b-d08f17f57a59',_binary '\0'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','aa5c095f-a207-4cdd-bbfd-8b3d97598391',_binary '\0'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','de97970b-f8e9-4063-ab46-7d3adbf17b3e',_binary ''),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','e5cab7b9-2c9a-4ca7-9f60-f448590afe5c',_binary ''),('1a2ee814-a842-4e83-a6c1-7fb032639d66','016de98d-3748-4db6-b4b7-b0564d779c88',_binary ''),('1a2ee814-a842-4e83-a6c1-7fb032639d66','1f572c55-7b94-4667-8e3c-d63f93176d99',_binary '\0'),('1a2ee814-a842-4e83-a6c1-7fb032639d66','41bbc137-35c0-4c6f-92ad-ec287a24b678',_binary ''),('1a2ee814-a842-4e83-a6c1-7fb032639d66','823e6346-4043-4eb2-a9a0-22fbb73ad7b5',_binary ''),('1a2ee814-a842-4e83-a6c1-7fb032639d66','98c08b2e-cd2a-4449-aac4-02eeb92c4068',_binary '\0'),('1a2ee814-a842-4e83-a6c1-7fb032639d66','a23821f5-cfa5-49ee-887b-d08f17f57a59',_binary '\0'),('1a2ee814-a842-4e83-a6c1-7fb032639d66','aa5c095f-a207-4cdd-bbfd-8b3d97598391',_binary '\0'),('1a2ee814-a842-4e83-a6c1-7fb032639d66','de97970b-f8e9-4063-ab46-7d3adbf17b3e',_binary ''),('1a2ee814-a842-4e83-a6c1-7fb032639d66','e5cab7b9-2c9a-4ca7-9f60-f448590afe5c',_binary ''),('209490ed-9eb5-49f1-8ad3-b634190f138d','07d9d5ce-4175-4b65-856d-87715e627e2c',_binary '\0'),('209490ed-9eb5-49f1-8ad3-b634190f138d','0a62bd0f-9076-4240-a3da-c06ec1e142ad',_binary ''),('209490ed-9eb5-49f1-8ad3-b634190f138d','22fee9af-78b2-4560-b57d-7977d89e7b72',_binary ''),('209490ed-9eb5-49f1-8ad3-b634190f138d','2b6ce36e-4e5e-40cb-b517-8584cd9b2351',_binary '\0'),('209490ed-9eb5-49f1-8ad3-b634190f138d','48141992-faeb-4c66-9be6-c76e8e37d53c',_binary ''),('209490ed-9eb5-49f1-8ad3-b634190f138d','65212589-6ee4-404b-b248-7a08f647cec9',_binary '\0'),('209490ed-9eb5-49f1-8ad3-b634190f138d','a083faa5-c057-4a29-a988-376caf87f095',_binary ''),('209490ed-9eb5-49f1-8ad3-b634190f138d','adc16ec3-7e26-44e4-89c2-25a991ced270',_binary '\0'),('209490ed-9eb5-49f1-8ad3-b634190f138d','cdd4b208-4ea0-4af5-9a99-7238ee5a5de2',_binary ''),('2d4dec4c-0c3e-4b94-a2a1-6e68ccf8eaf1','016de98d-3748-4db6-b4b7-b0564d779c88',_binary ''),('2d4dec4c-0c3e-4b94-a2a1-6e68ccf8eaf1','1f572c55-7b94-4667-8e3c-d63f93176d99',_binary '\0'),('2d4dec4c-0c3e-4b94-a2a1-6e68ccf8eaf1','41bbc137-35c0-4c6f-92ad-ec287a24b678',_binary ''),('2d4dec4c-0c3e-4b94-a2a1-6e68ccf8eaf1','823e6346-4043-4eb2-a9a0-22fbb73ad7b5',_binary ''),('2d4dec4c-0c3e-4b94-a2a1-6e68ccf8eaf1','98c08b2e-cd2a-4449-aac4-02eeb92c4068',_binary '\0'),('2d4dec4c-0c3e-4b94-a2a1-6e68ccf8eaf1','a23821f5-cfa5-49ee-887b-d08f17f57a59',_binary '\0'),('2d4dec4c-0c3e-4b94-a2a1-6e68ccf8eaf1','aa5c095f-a207-4cdd-bbfd-8b3d97598391',_binary '\0'),('2d4dec4c-0c3e-4b94-a2a1-6e68ccf8eaf1','de97970b-f8e9-4063-ab46-7d3adbf17b3e',_binary ''),('2d4dec4c-0c3e-4b94-a2a1-6e68ccf8eaf1','e5cab7b9-2c9a-4ca7-9f60-f448590afe5c',_binary ''),('41ed9506-24ac-42af-a8bb-8a88e090697b','07d9d5ce-4175-4b65-856d-87715e627e2c',_binary '\0'),('41ed9506-24ac-42af-a8bb-8a88e090697b','0a62bd0f-9076-4240-a3da-c06ec1e142ad',_binary ''),('41ed9506-24ac-42af-a8bb-8a88e090697b','22fee9af-78b2-4560-b57d-7977d89e7b72',_binary ''),('41ed9506-24ac-42af-a8bb-8a88e090697b','2b6ce36e-4e5e-40cb-b517-8584cd9b2351',_binary '\0'),('41ed9506-24ac-42af-a8bb-8a88e090697b','48141992-faeb-4c66-9be6-c76e8e37d53c',_binary ''),('41ed9506-24ac-42af-a8bb-8a88e090697b','65212589-6ee4-404b-b248-7a08f647cec9',_binary '\0'),('41ed9506-24ac-42af-a8bb-8a88e090697b','a083faa5-c057-4a29-a988-376caf87f095',_binary ''),('41ed9506-24ac-42af-a8bb-8a88e090697b','adc16ec3-7e26-44e4-89c2-25a991ced270',_binary '\0'),('41ed9506-24ac-42af-a8bb-8a88e090697b','cdd4b208-4ea0-4af5-9a99-7238ee5a5de2',_binary ''),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','016de98d-3748-4db6-b4b7-b0564d779c88',_binary ''),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','1f572c55-7b94-4667-8e3c-d63f93176d99',_binary '\0'),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','41bbc137-35c0-4c6f-92ad-ec287a24b678',_binary ''),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','823e6346-4043-4eb2-a9a0-22fbb73ad7b5',_binary ''),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','98c08b2e-cd2a-4449-aac4-02eeb92c4068',_binary '\0'),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','a23821f5-cfa5-49ee-887b-d08f17f57a59',_binary '\0'),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','aa5c095f-a207-4cdd-bbfd-8b3d97598391',_binary '\0'),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','de97970b-f8e9-4063-ab46-7d3adbf17b3e',_binary ''),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','e5cab7b9-2c9a-4ca7-9f60-f448590afe5c',_binary ''),('50a61bff-3ecb-4b8a-8461-42f81212550d','016de98d-3748-4db6-b4b7-b0564d779c88',_binary ''),('50a61bff-3ecb-4b8a-8461-42f81212550d','1f572c55-7b94-4667-8e3c-d63f93176d99',_binary '\0'),('50a61bff-3ecb-4b8a-8461-42f81212550d','41bbc137-35c0-4c6f-92ad-ec287a24b678',_binary ''),('50a61bff-3ecb-4b8a-8461-42f81212550d','823e6346-4043-4eb2-a9a0-22fbb73ad7b5',_binary ''),('50a61bff-3ecb-4b8a-8461-42f81212550d','98c08b2e-cd2a-4449-aac4-02eeb92c4068',_binary '\0'),('50a61bff-3ecb-4b8a-8461-42f81212550d','a23821f5-cfa5-49ee-887b-d08f17f57a59',_binary '\0'),('50a61bff-3ecb-4b8a-8461-42f81212550d','aa5c095f-a207-4cdd-bbfd-8b3d97598391',_binary '\0'),('50a61bff-3ecb-4b8a-8461-42f81212550d','de97970b-f8e9-4063-ab46-7d3adbf17b3e',_binary ''),('50a61bff-3ecb-4b8a-8461-42f81212550d','e5cab7b9-2c9a-4ca7-9f60-f448590afe5c',_binary ''),('56dbc594-fc48-4f78-aef0-ae52325ee512','016de98d-3748-4db6-b4b7-b0564d779c88',_binary ''),('56dbc594-fc48-4f78-aef0-ae52325ee512','1f572c55-7b94-4667-8e3c-d63f93176d99',_binary '\0'),('56dbc594-fc48-4f78-aef0-ae52325ee512','41bbc137-35c0-4c6f-92ad-ec287a24b678',_binary ''),('56dbc594-fc48-4f78-aef0-ae52325ee512','823e6346-4043-4eb2-a9a0-22fbb73ad7b5',_binary ''),('56dbc594-fc48-4f78-aef0-ae52325ee512','98c08b2e-cd2a-4449-aac4-02eeb92c4068',_binary '\0'),('56dbc594-fc48-4f78-aef0-ae52325ee512','a23821f5-cfa5-49ee-887b-d08f17f57a59',_binary '\0'),('56dbc594-fc48-4f78-aef0-ae52325ee512','aa5c095f-a207-4cdd-bbfd-8b3d97598391',_binary '\0'),('56dbc594-fc48-4f78-aef0-ae52325ee512','de97970b-f8e9-4063-ab46-7d3adbf17b3e',_binary ''),('56dbc594-fc48-4f78-aef0-ae52325ee512','e5cab7b9-2c9a-4ca7-9f60-f448590afe5c',_binary ''),('59d280aa-8b97-4e3d-bad9-5a86acd3d9c9','016de98d-3748-4db6-b4b7-b0564d779c88',_binary ''),('59d280aa-8b97-4e3d-bad9-5a86acd3d9c9','0fb72e7b-5a4f-4ea6-9523-faaff6a303db',_binary ''),('59d280aa-8b97-4e3d-bad9-5a86acd3d9c9','1f572c55-7b94-4667-8e3c-d63f93176d99',_binary '\0'),('59d280aa-8b97-4e3d-bad9-5a86acd3d9c9','41bbc137-35c0-4c6f-92ad-ec287a24b678',_binary ''),('59d280aa-8b97-4e3d-bad9-5a86acd3d9c9','823e6346-4043-4eb2-a9a0-22fbb73ad7b5',_binary ''),('59d280aa-8b97-4e3d-bad9-5a86acd3d9c9','98c08b2e-cd2a-4449-aac4-02eeb92c4068',_binary '\0'),('59d280aa-8b97-4e3d-bad9-5a86acd3d9c9','a23821f5-cfa5-49ee-887b-d08f17f57a59',_binary '\0'),('59d280aa-8b97-4e3d-bad9-5a86acd3d9c9','aa5c095f-a207-4cdd-bbfd-8b3d97598391',_binary '\0'),('59d280aa-8b97-4e3d-bad9-5a86acd3d9c9','de97970b-f8e9-4063-ab46-7d3adbf17b3e',_binary ''),('59d280aa-8b97-4e3d-bad9-5a86acd3d9c9','e5cab7b9-2c9a-4ca7-9f60-f448590afe5c',_binary ''),('605b2748-d68d-4296-bb07-5f1f693dc27a','016de98d-3748-4db6-b4b7-b0564d779c88',_binary ''),('605b2748-d68d-4296-bb07-5f1f693dc27a','1f572c55-7b94-4667-8e3c-d63f93176d99',_binary '\0'),('605b2748-d68d-4296-bb07-5f1f693dc27a','41bbc137-35c0-4c6f-92ad-ec287a24b678',_binary ''),('605b2748-d68d-4296-bb07-5f1f693dc27a','823e6346-4043-4eb2-a9a0-22fbb73ad7b5',_binary ''),('605b2748-d68d-4296-bb07-5f1f693dc27a','98c08b2e-cd2a-4449-aac4-02eeb92c4068',_binary '\0'),('605b2748-d68d-4296-bb07-5f1f693dc27a','a23821f5-cfa5-49ee-887b-d08f17f57a59',_binary '\0'),('605b2748-d68d-4296-bb07-5f1f693dc27a','aa5c095f-a207-4cdd-bbfd-8b3d97598391',_binary '\0'),('605b2748-d68d-4296-bb07-5f1f693dc27a','de97970b-f8e9-4063-ab46-7d3adbf17b3e',_binary ''),('605b2748-d68d-4296-bb07-5f1f693dc27a','e5cab7b9-2c9a-4ca7-9f60-f448590afe5c',_binary ''),('6ce71902-186b-49d4-bac0-2f55165ea684','07d9d5ce-4175-4b65-856d-87715e627e2c',_binary '\0'),('6ce71902-186b-49d4-bac0-2f55165ea684','0a62bd0f-9076-4240-a3da-c06ec1e142ad',_binary ''),('6ce71902-186b-49d4-bac0-2f55165ea684','22fee9af-78b2-4560-b57d-7977d89e7b72',_binary ''),('6ce71902-186b-49d4-bac0-2f55165ea684','2b6ce36e-4e5e-40cb-b517-8584cd9b2351',_binary '\0'),('6ce71902-186b-49d4-bac0-2f55165ea684','48141992-faeb-4c66-9be6-c76e8e37d53c',_binary ''),('6ce71902-186b-49d4-bac0-2f55165ea684','65212589-6ee4-404b-b248-7a08f647cec9',_binary '\0'),('6ce71902-186b-49d4-bac0-2f55165ea684','a083faa5-c057-4a29-a988-376caf87f095',_binary ''),('6ce71902-186b-49d4-bac0-2f55165ea684','adc16ec3-7e26-44e4-89c2-25a991ced270',_binary '\0'),('6ce71902-186b-49d4-bac0-2f55165ea684','cdd4b208-4ea0-4af5-9a99-7238ee5a5de2',_binary ''),('75016c51-30b1-45b7-8454-b2fb2c353215','07d9d5ce-4175-4b65-856d-87715e627e2c',_binary '\0'),('75016c51-30b1-45b7-8454-b2fb2c353215','0a62bd0f-9076-4240-a3da-c06ec1e142ad',_binary ''),('75016c51-30b1-45b7-8454-b2fb2c353215','22fee9af-78b2-4560-b57d-7977d89e7b72',_binary ''),('75016c51-30b1-45b7-8454-b2fb2c353215','2b6ce36e-4e5e-40cb-b517-8584cd9b2351',_binary '\0'),('75016c51-30b1-45b7-8454-b2fb2c353215','48141992-faeb-4c66-9be6-c76e8e37d53c',_binary ''),('75016c51-30b1-45b7-8454-b2fb2c353215','65212589-6ee4-404b-b248-7a08f647cec9',_binary '\0'),('75016c51-30b1-45b7-8454-b2fb2c353215','a083faa5-c057-4a29-a988-376caf87f095',_binary ''),('75016c51-30b1-45b7-8454-b2fb2c353215','adc16ec3-7e26-44e4-89c2-25a991ced270',_binary '\0'),('75016c51-30b1-45b7-8454-b2fb2c353215','cdd4b208-4ea0-4af5-9a99-7238ee5a5de2',_binary ''),('7d98848c-daa6-4508-a519-eb348ba3c055','016de98d-3748-4db6-b4b7-b0564d779c88',_binary ''),('7d98848c-daa6-4508-a519-eb348ba3c055','1f572c55-7b94-4667-8e3c-d63f93176d99',_binary '\0'),('7d98848c-daa6-4508-a519-eb348ba3c055','41bbc137-35c0-4c6f-92ad-ec287a24b678',_binary ''),('7d98848c-daa6-4508-a519-eb348ba3c055','823e6346-4043-4eb2-a9a0-22fbb73ad7b5',_binary ''),('7d98848c-daa6-4508-a519-eb348ba3c055','98c08b2e-cd2a-4449-aac4-02eeb92c4068',_binary '\0'),('7d98848c-daa6-4508-a519-eb348ba3c055','a23821f5-cfa5-49ee-887b-d08f17f57a59',_binary '\0'),('7d98848c-daa6-4508-a519-eb348ba3c055','aa5c095f-a207-4cdd-bbfd-8b3d97598391',_binary '\0'),('7d98848c-daa6-4508-a519-eb348ba3c055','de97970b-f8e9-4063-ab46-7d3adbf17b3e',_binary ''),('7d98848c-daa6-4508-a519-eb348ba3c055','e5cab7b9-2c9a-4ca7-9f60-f448590afe5c',_binary ''),('7e166491-3e57-4d03-ae88-b175cc6dc202','016de98d-3748-4db6-b4b7-b0564d779c88',_binary ''),('7e166491-3e57-4d03-ae88-b175cc6dc202','1f572c55-7b94-4667-8e3c-d63f93176d99',_binary '\0'),('7e166491-3e57-4d03-ae88-b175cc6dc202','41bbc137-35c0-4c6f-92ad-ec287a24b678',_binary ''),('7e166491-3e57-4d03-ae88-b175cc6dc202','823e6346-4043-4eb2-a9a0-22fbb73ad7b5',_binary ''),('7e166491-3e57-4d03-ae88-b175cc6dc202','98c08b2e-cd2a-4449-aac4-02eeb92c4068',_binary '\0'),('7e166491-3e57-4d03-ae88-b175cc6dc202','a23821f5-cfa5-49ee-887b-d08f17f57a59',_binary '\0'),('7e166491-3e57-4d03-ae88-b175cc6dc202','aa5c095f-a207-4cdd-bbfd-8b3d97598391',_binary '\0'),('7e166491-3e57-4d03-ae88-b175cc6dc202','de97970b-f8e9-4063-ab46-7d3adbf17b3e',_binary ''),('7e166491-3e57-4d03-ae88-b175cc6dc202','e5cab7b9-2c9a-4ca7-9f60-f448590afe5c',_binary ''),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','016de98d-3748-4db6-b4b7-b0564d779c88',_binary ''),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','1f572c55-7b94-4667-8e3c-d63f93176d99',_binary '\0'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','41bbc137-35c0-4c6f-92ad-ec287a24b678',_binary ''),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','823e6346-4043-4eb2-a9a0-22fbb73ad7b5',_binary ''),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','98c08b2e-cd2a-4449-aac4-02eeb92c4068',_binary '\0'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','a23821f5-cfa5-49ee-887b-d08f17f57a59',_binary '\0'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','aa5c095f-a207-4cdd-bbfd-8b3d97598391',_binary '\0'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','de97970b-f8e9-4063-ab46-7d3adbf17b3e',_binary ''),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','e5cab7b9-2c9a-4ca7-9f60-f448590afe5c',_binary ''),('c97499b9-2697-478e-91d3-6125ce5c7771','016de98d-3748-4db6-b4b7-b0564d779c88',_binary ''),('c97499b9-2697-478e-91d3-6125ce5c7771','1f572c55-7b94-4667-8e3c-d63f93176d99',_binary '\0'),('c97499b9-2697-478e-91d3-6125ce5c7771','41bbc137-35c0-4c6f-92ad-ec287a24b678',_binary ''),('c97499b9-2697-478e-91d3-6125ce5c7771','823e6346-4043-4eb2-a9a0-22fbb73ad7b5',_binary ''),('c97499b9-2697-478e-91d3-6125ce5c7771','98c08b2e-cd2a-4449-aac4-02eeb92c4068',_binary '\0'),('c97499b9-2697-478e-91d3-6125ce5c7771','a23821f5-cfa5-49ee-887b-d08f17f57a59',_binary '\0'),('c97499b9-2697-478e-91d3-6125ce5c7771','aa5c095f-a207-4cdd-bbfd-8b3d97598391',_binary '\0'),('c97499b9-2697-478e-91d3-6125ce5c7771','de97970b-f8e9-4063-ab46-7d3adbf17b3e',_binary ''),('c97499b9-2697-478e-91d3-6125ce5c7771','e5cab7b9-2c9a-4ca7-9f60-f448590afe5c',_binary ''),('d0cdeacb-905c-4879-bb48-4595fdd3969d','016de98d-3748-4db6-b4b7-b0564d779c88',_binary ''),('d0cdeacb-905c-4879-bb48-4595fdd3969d','1f572c55-7b94-4667-8e3c-d63f93176d99',_binary '\0'),('d0cdeacb-905c-4879-bb48-4595fdd3969d','41bbc137-35c0-4c6f-92ad-ec287a24b678',_binary ''),('d0cdeacb-905c-4879-bb48-4595fdd3969d','823e6346-4043-4eb2-a9a0-22fbb73ad7b5',_binary ''),('d0cdeacb-905c-4879-bb48-4595fdd3969d','98c08b2e-cd2a-4449-aac4-02eeb92c4068',_binary '\0'),('d0cdeacb-905c-4879-bb48-4595fdd3969d','a23821f5-cfa5-49ee-887b-d08f17f57a59',_binary '\0'),('d0cdeacb-905c-4879-bb48-4595fdd3969d','aa5c095f-a207-4cdd-bbfd-8b3d97598391',_binary '\0'),('d0cdeacb-905c-4879-bb48-4595fdd3969d','de97970b-f8e9-4063-ab46-7d3adbf17b3e',_binary ''),('d0cdeacb-905c-4879-bb48-4595fdd3969d','e5cab7b9-2c9a-4ca7-9f60-f448590afe5c',_binary ''),('d48e5aa3-9a0a-4e3b-b8b3-236114df7301','016de98d-3748-4db6-b4b7-b0564d779c88',_binary ''),('d48e5aa3-9a0a-4e3b-b8b3-236114df7301','1f572c55-7b94-4667-8e3c-d63f93176d99',_binary '\0'),('d48e5aa3-9a0a-4e3b-b8b3-236114df7301','41bbc137-35c0-4c6f-92ad-ec287a24b678',_binary ''),('d48e5aa3-9a0a-4e3b-b8b3-236114df7301','823e6346-4043-4eb2-a9a0-22fbb73ad7b5',_binary ''),('d48e5aa3-9a0a-4e3b-b8b3-236114df7301','98c08b2e-cd2a-4449-aac4-02eeb92c4068',_binary '\0'),('d48e5aa3-9a0a-4e3b-b8b3-236114df7301','a23821f5-cfa5-49ee-887b-d08f17f57a59',_binary '\0'),('d48e5aa3-9a0a-4e3b-b8b3-236114df7301','aa5c095f-a207-4cdd-bbfd-8b3d97598391',_binary '\0'),('d48e5aa3-9a0a-4e3b-b8b3-236114df7301','de97970b-f8e9-4063-ab46-7d3adbf17b3e',_binary ''),('d48e5aa3-9a0a-4e3b-b8b3-236114df7301','e5cab7b9-2c9a-4ca7-9f60-f448590afe5c',_binary ''),('f8e07e76-9ef9-446e-858c-da3d72b30d77','07d9d5ce-4175-4b65-856d-87715e627e2c',_binary '\0'),('f8e07e76-9ef9-446e-858c-da3d72b30d77','0a62bd0f-9076-4240-a3da-c06ec1e142ad',_binary ''),('f8e07e76-9ef9-446e-858c-da3d72b30d77','22fee9af-78b2-4560-b57d-7977d89e7b72',_binary ''),('f8e07e76-9ef9-446e-858c-da3d72b30d77','2b6ce36e-4e5e-40cb-b517-8584cd9b2351',_binary '\0'),('f8e07e76-9ef9-446e-858c-da3d72b30d77','48141992-faeb-4c66-9be6-c76e8e37d53c',_binary ''),('f8e07e76-9ef9-446e-858c-da3d72b30d77','65212589-6ee4-404b-b248-7a08f647cec9',_binary '\0'),('f8e07e76-9ef9-446e-858c-da3d72b30d77','a083faa5-c057-4a29-a988-376caf87f095',_binary ''),('f8e07e76-9ef9-446e-858c-da3d72b30d77','adc16ec3-7e26-44e4-89c2-25a991ced270',_binary '\0'),('f8e07e76-9ef9-446e-858c-da3d72b30d77','cdd4b208-4ea0-4af5-9a99-7238ee5a5de2',_binary ''),('fda74549-8bda-4d87-8fe4-632f1c8f8a3c','07d9d5ce-4175-4b65-856d-87715e627e2c',_binary '\0'),('fda74549-8bda-4d87-8fe4-632f1c8f8a3c','0a62bd0f-9076-4240-a3da-c06ec1e142ad',_binary ''),('fda74549-8bda-4d87-8fe4-632f1c8f8a3c','22fee9af-78b2-4560-b57d-7977d89e7b72',_binary ''),('fda74549-8bda-4d87-8fe4-632f1c8f8a3c','2b6ce36e-4e5e-40cb-b517-8584cd9b2351',_binary '\0'),('fda74549-8bda-4d87-8fe4-632f1c8f8a3c','48141992-faeb-4c66-9be6-c76e8e37d53c',_binary ''),('fda74549-8bda-4d87-8fe4-632f1c8f8a3c','65212589-6ee4-404b-b248-7a08f647cec9',_binary '\0'),('fda74549-8bda-4d87-8fe4-632f1c8f8a3c','a083faa5-c057-4a29-a988-376caf87f095',_binary ''),('fda74549-8bda-4d87-8fe4-632f1c8f8a3c','adc16ec3-7e26-44e4-89c2-25a991ced270',_binary '\0'),('fda74549-8bda-4d87-8fe4-632f1c8f8a3c','cdd4b208-4ea0-4af5-9a99-7238ee5a5de2',_binary ''),('ffdacefe-6633-4321-8817-f765be106869','016de98d-3748-4db6-b4b7-b0564d779c88',_binary ''),('ffdacefe-6633-4321-8817-f765be106869','1f572c55-7b94-4667-8e3c-d63f93176d99',_binary '\0'),('ffdacefe-6633-4321-8817-f765be106869','41bbc137-35c0-4c6f-92ad-ec287a24b678',_binary ''),('ffdacefe-6633-4321-8817-f765be106869','823e6346-4043-4eb2-a9a0-22fbb73ad7b5',_binary ''),('ffdacefe-6633-4321-8817-f765be106869','98c08b2e-cd2a-4449-aac4-02eeb92c4068',_binary '\0'),('ffdacefe-6633-4321-8817-f765be106869','a23821f5-cfa5-49ee-887b-d08f17f57a59',_binary '\0'),('ffdacefe-6633-4321-8817-f765be106869','aa5c095f-a207-4cdd-bbfd-8b3d97598391',_binary '\0'),('ffdacefe-6633-4321-8817-f765be106869','de97970b-f8e9-4063-ab46-7d3adbf17b3e',_binary ''),('ffdacefe-6633-4321-8817-f765be106869','e5cab7b9-2c9a-4ca7-9f60-f448590afe5c',_binary '');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL DEFAULT '',
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('aa5c095f-a207-4cdd-bbfd-8b3d97598391','82d6364c-1261-4995-9b68-01248f329d15'),('adc16ec3-7e26-44e4-89c2-25a991ced270','bb9f3abd-7b2a-4e32-a9e5-39f5e3160020');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('00ad6e5a-282e-4390-afba-5872de683711','rsa-enc-generated','a6362837-3fda-4079-bc1f-4fb892f0260e','rsa-enc-generated','org.keycloak.keys.KeyProvider','a6362837-3fda-4079-bc1f-4fb892f0260e',NULL),('0493c49e-8f86-4809-b783-6e2ad1932e5d','rsa-generated','a6362837-3fda-4079-bc1f-4fb892f0260e','rsa-generated','org.keycloak.keys.KeyProvider','a6362837-3fda-4079-bc1f-4fb892f0260e',NULL),('13e17553-c495-48e6-b577-5337ea05b7a7','Allowed Client Scopes','a6362837-3fda-4079-bc1f-4fb892f0260e','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','a6362837-3fda-4079-bc1f-4fb892f0260e','authenticated'),('15930900-977f-4b29-a19e-dfa997a3d280','aes-generated','20b6c21c-504d-4f91-96b2-fd3dfbff4203','aes-generated','org.keycloak.keys.KeyProvider','20b6c21c-504d-4f91-96b2-fd3dfbff4203',NULL),('29b81f65-3af1-46b7-8f1b-56e1ad2a44be','hmac-generated','a6362837-3fda-4079-bc1f-4fb892f0260e','hmac-generated','org.keycloak.keys.KeyProvider','a6362837-3fda-4079-bc1f-4fb892f0260e',NULL),('338ec85a-e694-4aaa-a7e5-5c1d58d99d8e','Max Clients Limit','20b6c21c-504d-4f91-96b2-fd3dfbff4203','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','20b6c21c-504d-4f91-96b2-fd3dfbff4203','anonymous'),('3858e540-55dd-4eb9-bd0b-5c5d6ac6df21','Allowed Client Scopes','20b6c21c-504d-4f91-96b2-fd3dfbff4203','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','20b6c21c-504d-4f91-96b2-fd3dfbff4203','anonymous'),('38dac199-5c3a-4829-922a-67b11c716216','Consent Required','a6362837-3fda-4079-bc1f-4fb892f0260e','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','a6362837-3fda-4079-bc1f-4fb892f0260e','anonymous'),('38e7b5cd-db21-4eb4-8509-c2b318242b39','Allowed Protocol Mapper Types','a6362837-3fda-4079-bc1f-4fb892f0260e','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','a6362837-3fda-4079-bc1f-4fb892f0260e','authenticated'),('455ee077-2298-4b7d-8c23-1f80ee6d7372','Trusted Hosts','20b6c21c-504d-4f91-96b2-fd3dfbff4203','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','20b6c21c-504d-4f91-96b2-fd3dfbff4203','anonymous'),('4acd5c70-f181-4f60-b975-4187476a10f4','Allowed Protocol Mapper Types','20b6c21c-504d-4f91-96b2-fd3dfbff4203','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','20b6c21c-504d-4f91-96b2-fd3dfbff4203','anonymous'),('510b5dbb-26ff-40a3-8dfd-9a606fd3b009','hmac-generated','20b6c21c-504d-4f91-96b2-fd3dfbff4203','hmac-generated','org.keycloak.keys.KeyProvider','20b6c21c-504d-4f91-96b2-fd3dfbff4203',NULL),('75d6a382-a648-4ddc-bbf9-3e6796ac449e','rsa-generated','20b6c21c-504d-4f91-96b2-fd3dfbff4203','rsa-generated','org.keycloak.keys.KeyProvider','20b6c21c-504d-4f91-96b2-fd3dfbff4203',NULL),('78642a73-5579-46cf-880d-71439c3bd1ca','Allowed Client Scopes','a6362837-3fda-4079-bc1f-4fb892f0260e','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','a6362837-3fda-4079-bc1f-4fb892f0260e','anonymous'),('82462d03-2269-4f66-abac-b22fb1dc1536','Allowed Protocol Mapper Types','20b6c21c-504d-4f91-96b2-fd3dfbff4203','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','20b6c21c-504d-4f91-96b2-fd3dfbff4203','authenticated'),('8390e0a4-f20d-46e4-b1bd-e1439ba7c639','Max Clients Limit','a6362837-3fda-4079-bc1f-4fb892f0260e','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','a6362837-3fda-4079-bc1f-4fb892f0260e','anonymous'),('ba8bf208-3aa6-41db-81f0-1fe5a363bc5a','Consent Required','20b6c21c-504d-4f91-96b2-fd3dfbff4203','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','20b6c21c-504d-4f91-96b2-fd3dfbff4203','anonymous'),('be137845-56ab-4bcd-b141-ffa6f6b95a0b','Full Scope Disabled','20b6c21c-504d-4f91-96b2-fd3dfbff4203','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','20b6c21c-504d-4f91-96b2-fd3dfbff4203','anonymous'),('cdabc3b1-7f2e-4388-895e-fd5bbe941549','Allowed Client Scopes','20b6c21c-504d-4f91-96b2-fd3dfbff4203','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','20b6c21c-504d-4f91-96b2-fd3dfbff4203','authenticated'),('d250ca72-2a23-479a-9b06-5965f57fc599',NULL,'20b6c21c-504d-4f91-96b2-fd3dfbff4203','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','20b6c21c-504d-4f91-96b2-fd3dfbff4203',NULL),('db85fe75-c49c-46c6-a248-7bb545e6cce2','Trusted Hosts','a6362837-3fda-4079-bc1f-4fb892f0260e','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','a6362837-3fda-4079-bc1f-4fb892f0260e','anonymous'),('deb0dd31-901d-4f3f-b245-8a4a4c90aee3','Full Scope Disabled','a6362837-3fda-4079-bc1f-4fb892f0260e','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','a6362837-3fda-4079-bc1f-4fb892f0260e','anonymous'),('e060562b-497c-4c57-9874-a8b80cfb594c','Allowed Protocol Mapper Types','a6362837-3fda-4079-bc1f-4fb892f0260e','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','a6362837-3fda-4079-bc1f-4fb892f0260e','anonymous'),('e7fcebea-e5ed-49cc-8750-2c92a8774edf',NULL,'a6362837-3fda-4079-bc1f-4fb892f0260e','declarative-user-profile','org.keycloak.userprofile.UserProfileProvider','a6362837-3fda-4079-bc1f-4fb892f0260e',NULL),('e86f90c0-ce39-4885-b469-fcd6f655b9ab','rsa-enc-generated','20b6c21c-504d-4f91-96b2-fd3dfbff4203','rsa-enc-generated','org.keycloak.keys.KeyProvider','20b6c21c-504d-4f91-96b2-fd3dfbff4203',NULL),('f95df92e-b980-46f4-8d47-852a729e49fc','aes-generated','a6362837-3fda-4079-bc1f-4fb892f0260e','aes-generated','org.keycloak.keys.KeyProvider','a6362837-3fda-4079-bc1f-4fb892f0260e',NULL);
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('0037978e-e933-4d90-9cef-8ca8c5d56784','29b81f65-3af1-46b7-8f1b-56e1ad2a44be','kid','a93ed97d-da7c-41a6-8946-037ea720550d'),('01ef074b-847b-4009-a7c2-82bb462a2636','e86f90c0-ce39-4885-b469-fcd6f655b9ab','priority','100'),('089f78e6-8472-4567-9b8d-eb9661373347','00ad6e5a-282e-4390-afba-5872de683711','privateKey','MIIEpAIBAAKCAQEAqfLqThVyOjcQo1XGuh0vL0gRm+Ggc5VW1BvLWvauNKWcD07vi2skkcO3LyXhjv+jqdQT8neLOtR/LzVfvZUWzvUGnCZK1LUvjFdzsi4xhE6qwnSNNvpWvz9PPRDaHKJyREXtLOOuZTjWmBRUqPFwpIloNBAyJC3tkM1Aqzf4z8dSeb4n/LrOJ007xtKTO05F4XzqZZupLxqVPvTSrF8uwaVQV6jhdMbRqsLnd+7r06RGtZFyG4W2TfrPKV+vRVHYrsY2ktskSByDYuy8AzqW2HrCqh1dUrdT6owAhXQwneehXbHCU9yVistO2VcTy0a2TCeo8GMdlMNl53pTlYA9ywIDAQABAoIBADsL7SBoDyHu09cMDFnJngU9cvDH+alu75YOeh8GqgwcphYjhNLZzQDgERtOfAnlBAYTa0LJChTMk8vhLXx++ke5lixWmZVBxl1qXQZBSm7/rhCV0iKR4+Xapzs+Sam9Pxo9eWQpTwRYNSbtmWSBTnO8UfoUzncHhgzTY26Zqdb2hicfjIqRmRKe89pZIDJ6vVOXZLjBi0gW7CKVTqW+cbXaYo2kW6WShXOT2BmM0Linc8L3hX9Fttlhi674Ur7V8kjYaxsBi8nVRdPZxZDSLeoT1B3v4gr54v9qspxBTyQEWYEF/LUZopP6kY5xcXGFusG1guOGPFbfXPBqlsyd1HECgYEA5l1p1LwJnc4ZxvTBrOb8A4ohvWDcmmAJc4yZ9EangvQdsH7tbh2+MMuiTjGd0gOarWcHihyH/MNs4Zs3m52yUCb0X9r5BG8Eh1FRcpwJj9EDEdIqbdYJNB6rOxJhS+LkD/ir4LeNzDmvJKK1uSbJo6TVzew4CFbZZco7xYDRxeUCgYEAvNxiIp1gcldyY3gt97cc8ppmhxJ7a5yPyowuMsCAp5g8z1BNE3vuTv/8pc5YXFTWFFJNR40tXuOSKnDbid8nt36MM3S2Cx+HkAji+lBqlSiXh0UjwJJ4OekAHbe/AYrVL25tf6DHUEIN3oPbhqLg/w1m5TxTMvSdKzjLb9iuue8CgYAKkAvzOjACsVmTOtPKlsjFbMcBRPi4h2DHkJHalobFxWW7GwbN/sUivaOSjEndQFcOTmQVHBvMJjXO3mwdUYzEihS4dHTolCKUBdGDPM5fbskCPy283YyMfD+DtOMLNLsaVF+lLSVuUNLMDj3g4Htsanl3OLaVA05ykWROOQrlVQKBgQCsf5J20U2tQiftqHA76JldER+CUaQ/BvHi66SqoF8iNI+eP1cW68QfjfpiKxVTx/z89Ks3JkCBgdQYRZqP1C4/kCtYOEqp4DN+oE9ImDixYjD80W61TlLXefSsMA8axoavWupSfzRtHtfyHHdfAtgEvWX1DONlED2Zo7dUwhHdKwKBgQCXtwU0426yJwSsA54xFFom8F0x4Klw7LuuMBOQKHMwbMKqMPxgZ9NDLya+Yb8mj9WawfU3EgUd2lRhREcu/MRnJDbUNqPjzEPTqSoRvFBgAZdsfFkaafieDyhGRrwMAlN6LMQlfSrCoJkA4thrsD02Oyhb7Eo/pVKZ6ukHHSzu6w=='),('0b1984b0-71d1-47c6-97ad-46c012a39eed','db85fe75-c49c-46c6-a248-7bb545e6cce2','client-uris-must-match','true'),('0e2730f5-dec7-41b7-bac2-a7301df7e019','78642a73-5579-46cf-880d-71439c3bd1ca','allow-default-scopes','true'),('0ec2c34c-f66f-4160-9598-9c02f597fb7d','e86f90c0-ce39-4885-b469-fcd6f655b9ab','algorithm','RSA-OAEP'),('1229e8cb-a62f-4e8b-a1b7-8d4a66e66155','00ad6e5a-282e-4390-afba-5872de683711','algorithm','RSA-OAEP'),('144534ed-39a4-4478-bd35-038883f1806b','82462d03-2269-4f66-abac-b22fb1dc1536','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('1c1eab90-9e33-4bd9-abce-a965f8745aaa','4acd5c70-f181-4f60-b975-4187476a10f4','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('1d660a69-4620-41a5-a0ad-03bc208ab59b','15930900-977f-4b29-a19e-dfa997a3d280','priority','100'),('22e9a9b6-b55b-4f58-8763-5e244a9abe1e','0493c49e-8f86-4809-b783-6e2ad1932e5d','keyUse','SIG'),('2ae0a6ea-92a2-44e1-b6d5-d6b2b8ad9039','0493c49e-8f86-4809-b783-6e2ad1932e5d','certificate','MIIClTCCAX0CBgGFHNAVljANBgkqhkiG9w0BAQsFADAOMQwwCgYDVQQDDANCVVYwHhcNMjIxMjE2MjExOTM3WhcNMzIxMjE2MjEyMTE3WjAOMQwwCgYDVQQDDANCVVYwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCqVAKRiUYVudERPPUMNK3jqp5lqWrGJpY/cS2rZC9193zKoAn+aiiJgOztreUy/9iKFa2tiG0gCU7cOEnBQW3+isnmHEF7pRRL5N3MpF/Vo3j2whfNgT3qL1iQQ6tj1q41o7J+REUSfnMQWirww87PHXrdwylOw0tB0mmbR9Uah2zFcZc/bvHMh5hE18vrM2mhDjO7wk6fJjZMUoVdRECBReJ17R5GDUcClTIg+7Hxq9fBUwQySPgpTpaQ7rorwUVFPwqMzATDNsJ7E91eByB9WJNtalUeoRvY6SVP7G+OTLTdQxlzI7BjB9daBXRyIk9fky364dpiGYZX0rqKKYaVAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAKGQXhh9kRzcIBhJiy3697bfx7PkdfLt5qWDMlYbI/PTU6IRK38lybXb+uKwXXTy3vr8rAnNrb8vrZUbzbb4atoKMdPKBUL4odJcWYPcU4nTqtcuz3LckXbXqn31ZkhpO8KLaFY57sWIMbAQnyW59WPr1T1HtQyZqtkg6goL4FnzzWdrG07VY39WW1blJ8VL6SJr1QIZjFe66Xz768y8RYjENDSdw71/3KwNpAcU/ZDBfiRYy/3uMxDYSorKKhrKJ5IWDhQUoPTQ9g7Apl4ZSxTM0AgdzVPpHG10VgwV5weURhvRAVuBS1I1hiaBiEpoZh9FXwggzWUKQSmpeYNoqZY='),('30227969-8c74-45c6-b3b4-35940f1eb827','e060562b-497c-4c57-9874-a8b80cfb594c','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('30595540-0ea8-4260-85af-587664661910','db85fe75-c49c-46c6-a248-7bb545e6cce2','host-sending-registration-request-must-match','true'),('36394bdd-359d-461e-9476-418301364d82','15930900-977f-4b29-a19e-dfa997a3d280','secret','8pM0X0CqrX73pjiJ14m4hQ'),('392a16be-272c-4fa4-b8ab-21a77e75445e','f95df92e-b980-46f4-8d47-852a729e49fc','secret','Bj2kxjw1C9i3L_XiaCBILw'),('399486b5-e251-4fa4-bfc6-322c35b0eefd','cdabc3b1-7f2e-4388-895e-fd5bbe941549','allow-default-scopes','true'),('3b9db373-fcf7-497e-a5b5-5cfc2cd3769d','4acd5c70-f181-4f60-b975-4187476a10f4','allowed-protocol-mapper-types','saml-user-property-mapper'),('3bcc29e1-d8e1-4fd0-b82e-f8489e6c50ac','82462d03-2269-4f66-abac-b22fb1dc1536','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('4003c4a6-0f59-49cd-ae8f-65e602ed3a57','e060562b-497c-4c57-9874-a8b80cfb594c','allowed-protocol-mapper-types','saml-user-property-mapper'),('4039fd71-c5bf-4ba1-a7ca-9b26a2cfe0bb','82462d03-2269-4f66-abac-b22fb1dc1536','allowed-protocol-mapper-types','saml-role-list-mapper'),('454974fe-1436-4e93-ae89-c7b8aca54aaf','82462d03-2269-4f66-abac-b22fb1dc1536','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('4bf2251d-d1cd-4ce8-bd9a-b98c459f85f7','455ee077-2298-4b7d-8c23-1f80ee6d7372','host-sending-registration-request-must-match','true'),('4ff14f7c-a962-4b21-b2e0-1757a5d1f3fb','38e7b5cd-db21-4eb4-8509-c2b318242b39','allowed-protocol-mapper-types','saml-user-property-mapper'),('54d4fd9d-3ddc-4538-99b3-f0dfd018aa83','38e7b5cd-db21-4eb4-8509-c2b318242b39','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('54ffc461-2293-48e3-a8bc-042f7c2ce0f9','4acd5c70-f181-4f60-b975-4187476a10f4','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('5b63612b-1177-463a-a4e5-57388b2bf9bc','e86f90c0-ce39-4885-b469-fcd6f655b9ab','privateKey','MIIEogIBAAKCAQEAxNF484n9udrQpZad6zLucxQ21hA+DRxYDXXr1V9fVb5qgQ0Db7kpaZM7NWKnkvKsZT+nS8iZ+HUt6a0Yl96AT2xK0YLySt3vOLnAosTgK7ys6IErrIAINQe3t3Eyn73yg1MQ23w99VfvdCY5DKpGLem4nq08NG+47HbOQWGhG+mU50ca9J8kqzmlJFOpBE9jzj5g/eQQ2tvQ3siXb3tNKWAW91jDwK+bwv3ahRRtlQ6aLxRdhCHYhwsqeXBRcnJzj9Yw9ez4t4uE2OgOR3J6iSSS1q0GEHwrfQHpHPSUXt8ACUHcNjtFDRKfeubtCalLZE8HPXn/LWe1GS6FJMQRnQIDAQABAoIBABm7KQzt5XX+3XhIkKzHI9V3txOVXAdqxTg9Sm/C4DvdgR8ODHz2wCtFTGBWXYIgp9k00TJfL4IED9SVBLoWJMA9cCqj6/lNupC3+C9Pfd8584ESIhuTQX9tWt9otS2dL69rlLCdNZx1uqB8vsihGju2aqSUEWLpmEuR3LU/hkiXrjURuQjwMrJeAjH0mD0CJRpKqUGr6HMoNC4JhA/addiNlwzZdcCAtYjBeM1spIQ05bTSfsDQFSH8OjyWTkcexudxov6FQXhs8KOzaGAOwJT3Z/pgw0zXsVng3K5G2LKL8Y4Fr93mD+Z0RuH1AxEE+8eluIPHAqAnsYjS4dw5vCECgYEA83YUP581jYbhLMEIiZ8FUQyaQvZD9GEncjJJoLc+n847mw4/xdu8XXmfNjw9eBrUbQ+iismVkHyMUpPXtaZua8sP3La4JuJwKdBlG5di6L/AN4ZWsT6R5nTUKNsOx69Rvb1DOZ5VdEiZFB+nJlSf61vfV4ejHz4awcS/zh1FFd8CgYEAzvRtebr2gkUSTGhZZhmvW8RHB25+GxG1G1H5C3lqo7Rvyj04d0Msbgxyb0DJ/kvQOrIzzs4u4enyaD76C/p5sQ3mw6EzYsDWPpHVDVr+GewNM9IbmX4qYiWDXc2fy3LwVVxFc2XDdgpirVnwB4r3TfeozzelcYdA8tYX3gSFMAMCgYB31JmYywMv2sCAJ67NFgEm6F4RMWc3JI6mzYuh2C+xtm9uHTBUcZggJhmwNyxGLmZ6G6T0TM4Z5MOobW5R0U4uLi9rgl/Xe8KbQiBR2UxspNy2N5/584MafExko5V9wZQpILuy43TKHGWEGyRJYIOp83lVesRWP1oqH24MxClZ3wKBgDCa95s/beXqkwGfAGAaaDUFRClaqgNxhTeFaRhoy8Lm/dphxoE8JZMzGS1H6ijvZVhjwgcwJZKpf2U8ZT2q9im/OhN4KLlo0OihF4irdkJgTjl9fz3tg8bJSLEfOghuVkO2CBmyLNXsWoCcPuOGn86P+/Wu/AxN19MwtSpPpXhBAoGAGXaWwHyWnuGVdrSHJQfxfR5f0Qt/q8GcFYaozRDNMpVfHh3mfyfynkMBPJpGRdyF7IMd1aYR+acaJ0V0DThlT39zlhTw/W4lb+LGQu0FbXz6djc+0YrOT/vkuhbewkaY91yqX2qrXXy+YayUmhJ3fSe6yjA6quKStcbkFOB/kJ8='),('61ad9ad5-f02f-477d-929f-8bf7d9777eff','29b81f65-3af1-46b7-8f1b-56e1ad2a44be','priority','100'),('61c5215a-4787-43cd-ae3d-8aff42de4b22','0493c49e-8f86-4809-b783-6e2ad1932e5d','privateKey','MIIEowIBAAKCAQEAqlQCkYlGFbnRETz1DDSt46qeZalqxiaWP3Etq2Qvdfd8yqAJ/mooiYDs7a3lMv/YihWtrYhtIAlO3DhJwUFt/orJ5hxBe6UUS+TdzKRf1aN49sIXzYE96i9YkEOrY9auNaOyfkRFEn5zEFoq8MPOzx163cMpTsNLQdJpm0fVGodsxXGXP27xzIeYRNfL6zNpoQ4zu8JOnyY2TFKFXURAgUXide0eRg1HApUyIPux8avXwVMEMkj4KU6WkO66K8FFRT8KjMwEwzbCexPdXgcgfViTbWpVHqEb2OklT+xvjky03UMZcyOwYwfXWgV0ciJPX5Mt+uHaYhmGV9K6iimGlQIDAQABAoIBAAQeRw1JnlLGUk5XpOLQP5fBMhZqAn17L4el/vvwI+/3AC2DsZd/wxj8r53ZO3ELJmtDoMD7oGHVf8fg1N2x7Td/QmhIgh0meGdpB6OGoj+PizbyKfJWKo79PpJcZH+OkFnr1OlrJqgOu82nKcx2UODenlrQI3FL/7I+JL9e/QF+FHd3HHdaOxPTM/PetrHxQA3fcSuAFARDOpGAkFpaHaQ61i/X0c/emkPhzaccWVX0t2/ugz6qU0KHcHAUXzogz+rs2aUz9atozQs1ZInB6Crbb8ebpJApod8dW1cPw5eeZCLdUtG8YelZZVCDtIBVBqSaD/5FiBUDaoHhIhaHqwECgYEA4HmrilPjeuCxo21+5aSDDG1bZgwCdRuzHi5jfl83+uN6q5HOJ6kjbPvinF+1fztoxjnKaLO50C2Hba2y/dwEKxCY+ytzJomDIlX36fpCHCCc9gf/33iTyhVUxyqVuBjvjEz+ZuZDo6CE77867++18I1ZAcffC3Pvci/Ofy0yKwECgYEAwj+k8UJnTPYaaV2Z1bRvZFS5U33efSRqJEOATbo2cHQu2r9yUKMDOKIvUIdC+cEeQ6fFs39GX594U06CwezwwLEcmrbcaMSXX8o+aqzQyE0gNzDeXL8aJOfTWvD9s3OyeRk/fAder7upsTcG1F3FwXHCGAEqrr8SJsuYzU2hf5UCgYBEfxwHI74AWtwZwGm+bUrH2f7Pzs5ZKdCoXwNhJnEQj6V5AQ7lL0luEhZ+HP5nCpvYEP5goKcMjTgMEbrSl/Z1paToz8NdeQyYx57UuNa/enwq3xoG+OYv/f5Wn/n7qTA/oabng1AUeADYn4O+f2kHNDp6vqCjAAeK0meyivoKAQKBgCdCsdXJdBOMEl6FephE9dazgRms8REeEQ3vTrlnD6W+9dFkrHg72mTR8vo1vIW6UKGgAUd8S/77vlgoICmN+EMaCQwENZw/T9EekWsCLtitLfu5ttfMED6xVHinCMACfGoZfklVPAAM0Alvc8PsiBHHKlGrurLDD6ojsGiebivZAoGBAIbSetWRquTcLMEu/Ck/4FMxg9k6ppKWeW9SH2EkF6IJ7piE5pzPjfu7aEiuJzobwEtg2dSD9ASi58MgQAeXIDuJDRzOi0lExRSLmMaleowmYSD3UHUJyvqbDwnmVJ7GVsjQwIyGupgUcFRNT12A4Jb0clbk0tpDl38X76p8KY+l'),('689097b8-c3ac-40ec-8df8-ec1c1e694bfb','338ec85a-e694-4aaa-a7e5-5c1d58d99d8e','max-clients','200'),('6a91f2cc-077f-4a64-8912-ed498aaad59e','75d6a382-a648-4ddc-bbf9-3e6796ac449e','certificate','MIICmzCCAYMCBgGFHEXzFTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIxMjE2MTg0ODQ0WhcNMzIxMjE2MTg1MDI0WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDBxfbSovBBW3Y3/CQ4G5EjYLc3izrhB7mDbGg//YOZk2wp2XASt99znfv7e+0yG9frCLy1puygLiK600efWz4NUVWCA0cxzoUj1mvgyzMBsvcMN6T+AuXuoqPND51CeDjl6q5YCuRglpDpSBGQmgsuPa7Ht3lf09xFLidF0Wy+m12Yw6r/w4sH2Iyh+FYDdo7+tnYL1fW0ZiXAzI5BA1yL7M5TSHnODbvsTzrKG39oEOkkFnN6Kdhuloi6OkX7ApuqJXg06UXYIjGYY29TT8eyMzgNrDRfYWt0d+AV+UPmn0cs+ntScauXNUDTBTZMfeAN6pjGtuNoXrB13aCzkUn9AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFqUf2rYY/qQRU19zY4AmlM1DUxkXSEuUmXUQV35a6v/o6s8EF+vv+uIk1mXSwRxDkCcPeeJi+qjqfd8Osea6qXTuI+7EJGupuGgxkl8/Pi3U7Ue5T8tqfLSs44ZuQMS0ghnISL/jTqcBTOheXOTY1fTf/9qQ0fHzXWTOeWxg64xgq6qmstHw93+uL6V+P6za7rip4caq7BvqhfIlCofXTUBxH+la3VO3R8A/QqScVnI8DATUuF1FaoKP0HNDGY2WJSOeLbDHtR7wntXLY4JZcFdsx3282ppFjpUR0UdU/Tcr93Mb6fl3Qrbj2UjS553dBs0rWH0a1fQQTUPltiPRv8='),('6c7fd340-3dfa-4dce-b09a-3566edd1bfd6','38e7b5cd-db21-4eb4-8509-c2b318242b39','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('6ddef2c3-f903-4e60-a3c5-82f65c1f97a7','e060562b-497c-4c57-9874-a8b80cfb594c','allowed-protocol-mapper-types','oidc-full-name-mapper'),('72b34dbc-16b2-4fef-8d44-5f2484f36560','75d6a382-a648-4ddc-bbf9-3e6796ac449e','keyUse','SIG'),('736b709b-dd58-4a40-9715-d3ba19058781','38e7b5cd-db21-4eb4-8509-c2b318242b39','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('77ecdb0a-969c-4e7e-b6a9-ede0f7f12697','e86f90c0-ce39-4885-b469-fcd6f655b9ab','certificate','MIICmzCCAYMCBgGFHEX0CjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIxMjE2MTg0ODQ0WhcNMzIxMjE2MTg1MDI0WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDE0Xjzif252tCllp3rMu5zFDbWED4NHFgNdevVX19VvmqBDQNvuSlpkzs1YqeS8qxlP6dLyJn4dS3prRiX3oBPbErRgvJK3e84ucCixOArvKzogSusgAg1B7e3cTKfvfKDUxDbfD31V+90JjkMqkYt6bierTw0b7jsds5BYaEb6ZTnRxr0nySrOaUkU6kET2POPmD95BDa29DeyJdve00pYBb3WMPAr5vC/dqFFG2VDpovFF2EIdiHCyp5cFFycnOP1jD17Pi3i4TY6A5HcnqJJJLWrQYQfCt9Aekc9JRe3wAJQdw2O0UNEp965u0JqUtkTwc9ef8tZ7UZLoUkxBGdAgMBAAEwDQYJKoZIhvcNAQELBQADggEBADg6O0jtaJgPxi3IKz11jGgb7Kcw9lCk02aH/+Ac1Ko8oJTczpFJPzSCXmVd4HzfobgVkctFkCCq99T36UTKlxUm3qupxmsfQpSKtIvt1KkdNs0bBU4CmGSEycpKLd19jDTvw2/R6isdkfBIjL6cRoYQB1iX2VB7z9IVPedvURmgwkWmNAEytoG0yg/MeqMUQhXhJhJkaUqCL1bhCvDwLNtSLAy64ER9X7CtQToaqU7s6rxKcbL/eDBpWUOOtsAVIJbDUmKTTqkkAtQztq3C5bzmKFW7cMBAOy9VW1/6HuFjsVmVdYgcHnbFZtmaObBAbobalH2PR368wJNBG/QsLGw='),('81bc435f-d3fa-43e2-a8f8-e4decc47c19d','75d6a382-a648-4ddc-bbf9-3e6796ac449e','priority','100'),('83397468-b690-4325-a9d6-98448da12fb6','82462d03-2269-4f66-abac-b22fb1dc1536','allowed-protocol-mapper-types','saml-user-property-mapper'),('8540cc8c-03eb-44df-b556-51b2553ee023','e060562b-497c-4c57-9874-a8b80cfb594c','allowed-protocol-mapper-types','saml-role-list-mapper'),('85d47763-97d5-4179-af8b-250801b46781','4acd5c70-f181-4f60-b975-4187476a10f4','allowed-protocol-mapper-types','oidc-address-mapper'),('8cad89ae-6507-49b8-b864-82a4a2687268','e86f90c0-ce39-4885-b469-fcd6f655b9ab','keyUse','ENC'),('8d782e40-7e42-4644-85a9-79380c9faa27','3858e540-55dd-4eb9-bd0b-5c5d6ac6df21','allow-default-scopes','true'),('90ed20b9-8887-436f-81c0-20746ba52356','00ad6e5a-282e-4390-afba-5872de683711','certificate','MIIClTCCAX0CBgGFHNAW9jANBgkqhkiG9w0BAQsFADAOMQwwCgYDVQQDDANCVVYwHhcNMjIxMjE2MjExOTM3WhcNMzIxMjE2MjEyMTE3WjAOMQwwCgYDVQQDDANCVVYwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCp8upOFXI6NxCjVca6HS8vSBGb4aBzlVbUG8ta9q40pZwPTu+LaySRw7cvJeGO/6Op1BPyd4s61H8vNV+9lRbO9QacJkrUtS+MV3OyLjGETqrCdI02+la/P089ENoconJERe0s465lONaYFFSo8XCkiWg0EDIkLe2QzUCrN/jPx1J5vif8us4nTTvG0pM7TkXhfOplm6kvGpU+9NKsXy7BpVBXqOF0xtGqwud37uvTpEa1kXIbhbZN+s8pX69FUdiuxjaS2yRIHINi7LwDOpbYesKqHV1St1PqjACFdDCd56FdscJT3JWKy07ZVxPLRrZMJ6jwYx2Uw2XnelOVgD3LAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAE16VjffRBRS8xua8t8xAZMyT9ohXSQzRlXbvqRihITOX6amA0gF5Bx97BbBPEnBIkOktbcGSJJlRTqYobyJW1k0IsWl+9k31cGCIgaRZ7Hlt8GU6tlslLp6Bko2QjbZoatUB7yRdJ2LnX/bjpRVy7QPMqVMqB6qIJVd42UZHF5G5tyvV4Ab6PGJrBN4Met4+WDXwm7dWYuuhoP41cEXpuSouL8PWyVaKdxK/31sK5yenejSvj58vOTpz/QTajDIY/f5uMsY0vYq1gk8daMTjKjh2lPxFaOXwXRD46w82nghOs4pGzBhwvP0x0Z/yMemg8+PhGhmYfv7kFw8ZI9MKCk='),('97230bc4-73ca-4b3f-9051-5d3d265fbeee','82462d03-2269-4f66-abac-b22fb1dc1536','allowed-protocol-mapper-types','oidc-address-mapper'),('9afe6271-af0c-4e60-a570-737edd619216','00ad6e5a-282e-4390-afba-5872de683711','priority','100'),('9bc1f159-6c87-4872-9fab-228b592a74a3','0493c49e-8f86-4809-b783-6e2ad1932e5d','priority','100'),('a4aaaa29-dd8a-427e-8a93-32c88fe42bfd','8390e0a4-f20d-46e4-b1bd-e1439ba7c639','max-clients','200'),('a5710fb8-c111-4a86-96d3-bb201e64fba5','29b81f65-3af1-46b7-8f1b-56e1ad2a44be','algorithm','HS256'),('a74b8daf-89a2-40e3-83bb-2b7a5ed58c21','82462d03-2269-4f66-abac-b22fb1dc1536','allowed-protocol-mapper-types','oidc-full-name-mapper'),('a880a5c1-c08b-493e-be3c-89199d1dd8bc','e060562b-497c-4c57-9874-a8b80cfb594c','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('abbdf57a-5420-46dd-b2dc-73583afe97ec','4acd5c70-f181-4f60-b975-4187476a10f4','allowed-protocol-mapper-types','oidc-full-name-mapper'),('ac97d18d-469f-4b98-8620-d152baad0f69','4acd5c70-f181-4f60-b975-4187476a10f4','allowed-protocol-mapper-types','saml-role-list-mapper'),('ad22807c-4ddc-4ba3-9cba-10bf55346cec','4acd5c70-f181-4f60-b975-4187476a10f4','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('b8cc6d88-5b37-4d6c-8885-438e49519830','510b5dbb-26ff-40a3-8dfd-9a606fd3b009','algorithm','HS256'),('c1de31c9-09c9-461b-a155-5aabdf2c608c','75d6a382-a648-4ddc-bbf9-3e6796ac449e','privateKey','MIIEogIBAAKCAQEAwcX20qLwQVt2N/wkOBuRI2C3N4s64Qe5g2xoP/2DmZNsKdlwErffc537+3vtMhvX6wi8tabsoC4iutNHn1s+DVFVggNHMc6FI9Zr4MszAbL3DDek/gLl7qKjzQ+dQng45equWArkYJaQ6UgRkJoLLj2ux7d5X9PcRS4nRdFsvptdmMOq/8OLB9iMofhWA3aO/rZ2C9X1tGYlwMyOQQNci+zOU0h5zg277E86yht/aBDpJBZzeinYbpaIujpF+wKbqiV4NOlF2CIxmGNvU0/HsjM4Daw0X2FrdHfgFflD5p9HLPp7UnGrlzVA0wU2TH3gDeqYxrbjaF6wdd2gs5FJ/QIDAQABAoIBABmf7vQL+BmshAWt97GJHmMUodCxPigOuB8DxwWEplKOMaTsdusCxdn+78O3WmFgrT0M+rz1m3UopLnFbENL8vjFOLmTarwmGL/p1c+fD4UPVabtSjRieGWxEa2cfaoR8UmhBKKVTijiaxIZJbl++tuH7K/HOOsjPo3SJ1S5ooJ8w0IDeik9gCiqLY4kipGWjO6uW13mmiWoK6lvcaTJdJz0lVz9DLVODZeIr4eUcaL6FuBmGvuc0emrrdsUm+GJcacWclDYPufGAzy+R5mUnElBbK83uHXiaxGoVoDzJAPZmXvd+G1Wpk21y3dJYjcWT8oNFfcLlTHQZfy3L1igW0ECgYEA/CaTUeKoLwAJTwMoDUKrsLbyEZ2Ur6tbG3wKl6jovGIqcjSbx4K6iU5gNQTogVtlYQcQWmp3dCvDhuaNCXeAv4BZqYyuuoRTqTek1Si6UnajXm570dic/slXQOWuxiss+mfRjV5vca4bCSJENLTehhZFqs2o1YCdC/zvPanx6SMCgYEAxLs+zA5jE7IeTH+PHvtdG5DYu6j1atovjNIOg8f7oMLuFkiqhQLawLWJW++eAPsm6Ig9Nxm00+vvJEkgqfqbSXqwbtDgcIuWcFnEnjANVDZuRsbqhqxpp3erVGYKsu5m4No1FzWSbIJYVOvYWze+p/Asui2ghMQlIkX45pZ4gl8CgYA1sfFFSsMN3zAcR0vMJxpws0SxQ6FaF197ZtrKmQmWtEDduR5DSi929d2+7KCmi1P3aY2t82Yksv0cSRRXo78jCK4PUQoUZgF604Kicd3bmbAId/aeJUapay7NfxvMz3zwhhM1y5pn1u+i7k0f/DQ20Z9cVBdT/+NxnhdERmBhiQKBgARb0axbtT4+eAVh3h3lm858ixC9UZKoet032jJ5P830A6piucRwp8AVRZHP4URMTDRisFiELUl0tLutExgxATfDjB0oa5CSxyZ+Fqkaj3EKM69FwPRy5XRcZmNcT2hfd9ALhZmaCkB1MtfO0eBTf9ngrF0DncbTQa9ctYMGWm0pAoGATEmXZBw8EK+n/2OrGOt8CZ+6BOccHBoQBmxAdUlPIWJxICq/NDpeRTY9gFJecm0VQvCxiUybr+U/KvG8aIScgqnYjqueCmpNIzdTHGgJ5P9enC8LJnpaBjA3ZoZYStylEm9ZtRZ5Jk6vIWfC8CfXyGLLwfYxIjezVhELoAKjrZA='),('c33dfd64-aebc-4499-96b5-446a6f5559cf','e060562b-497c-4c57-9874-a8b80cfb594c','allowed-protocol-mapper-types','oidc-address-mapper'),('c3d40556-8939-45b8-8f05-fa4b96f9d3c4','13e17553-c495-48e6-b577-5337ea05b7a7','allow-default-scopes','true'),('c440de2a-5585-4159-b190-d70ae72fae01','38e7b5cd-db21-4eb4-8509-c2b318242b39','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('c5c095c1-19cf-481d-be11-45180601bf7b','f95df92e-b980-46f4-8d47-852a729e49fc','priority','100'),('cfbb5bef-3fe7-4b4d-8e0a-d34f2b42bd39','38e7b5cd-db21-4eb4-8509-c2b318242b39','allowed-protocol-mapper-types','oidc-full-name-mapper'),('d1001ddc-a31f-49fa-860a-2ad14b754e58','00ad6e5a-282e-4390-afba-5872de683711','keyUse','ENC'),('d51f9af8-e39f-45aa-b051-ed3ab76c25fc','38e7b5cd-db21-4eb4-8509-c2b318242b39','allowed-protocol-mapper-types','saml-role-list-mapper'),('d744dd34-14bc-43c6-9ed3-b1374a94a4d3','455ee077-2298-4b7d-8c23-1f80ee6d7372','client-uris-must-match','true'),('db73588e-5f63-4ed7-9c9d-1ba7f1271067','38e7b5cd-db21-4eb4-8509-c2b318242b39','allowed-protocol-mapper-types','oidc-address-mapper'),('e726491a-b769-4b8c-9ad9-fb035c2531f8','15930900-977f-4b29-a19e-dfa997a3d280','kid','4f9201c3-580a-4775-bcb7-bff14ffeecf9'),('e8b7c356-ec4a-46cc-b62d-c705e470971e','e060562b-497c-4c57-9874-a8b80cfb594c','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('ec02c869-4420-473e-b2d9-4adb33929576','e060562b-497c-4c57-9874-a8b80cfb594c','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('f0be385b-6ed2-4c8c-9bbd-847271800dd4','510b5dbb-26ff-40a3-8dfd-9a606fd3b009','priority','100'),('f31785dc-dba0-43bc-923e-cd2f76e561bc','f95df92e-b980-46f4-8d47-852a729e49fc','kid','421c4f54-ad9e-4c52-8d31-2fbd2da77c12'),('f38225a7-c336-4712-9f32-fc78f41c31d5','29b81f65-3af1-46b7-8f1b-56e1ad2a44be','secret','DyEUF9mPdKjnZ3pkAfYNMvEnyp-u6OjVLcuY6Rho390-YCyvkUyyaxCMRmGqpshx-NMMLJ_0B2tzC8ywBK2BDg'),('f7e734f2-a4bd-4a36-ae59-9c490950881c','510b5dbb-26ff-40a3-8dfd-9a606fd3b009','kid','e7a9ad49-443a-4f19-b677-d265cc4b0c2a'),('fc730fd0-0ace-4b7c-bf82-e7a11350fe9f','4acd5c70-f181-4f60-b975-4187476a10f4','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('fcb80d11-cf0e-4388-95a7-84089393beec','82462d03-2269-4f66-abac-b22fb1dc1536','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('ff93e1a2-485d-458b-80cb-7a20e88108cd','510b5dbb-26ff-40a3-8dfd-9a606fd3b009','secret','2WEabR5lfO80rcO76XuMrj917klUTmdKhNYPysiUysnZmVW7-y2hYJWNjmO5GS1vKZPiUTVf5XxSKcNDqq4cfg');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('0fa385fe-a377-4b82-adfa-11d4396c000b','a69f7be8-41e8-463f-b7af-564b527b9663'),('16e22ec5-1cef-48f2-b9af-c96fd21cfaf8','f7cd8b2d-18ec-4a34-b332-10b8acdaa9f0'),('1c47767d-adf1-4f32-a8d2-4af563295583','366b1de5-a859-4aab-a341-af484d3b4c65'),('1c47767d-adf1-4f32-a8d2-4af563295583','b3c12c7d-f0c1-4b3e-83b5-8371fd940548'),('30369298-ec2f-4c6b-846c-542bd5e451ed','d0f00303-f083-43e4-851f-29081e2e4a7f'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','0c7c36b9-d7c6-4fa4-b3f1-f8ef924b7a36'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','0eb808bc-63b1-4e91-b379-197391b5d693'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','1c47767d-adf1-4f32-a8d2-4af563295583'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','21d4eea0-497a-451b-979f-999ee108adad'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','2405eeb1-a4f5-4321-93a6-8d2f8f7ecf5f'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','30369298-ec2f-4c6b-846c-542bd5e451ed'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','357cdc4c-d4da-431c-a10a-cc25ec39f1da'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','366b1de5-a859-4aab-a341-af484d3b4c65'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','426cd661-6ffb-411f-a8ab-7510acdc8ae5'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','47088402-9773-4ff4-b2cd-5879ae7dc3ef'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','51af51c1-dd9c-4d2a-aea0-e34171c8a3c2'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','528f143b-c794-4a16-a433-5ced0c2d1c1b'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','5b0600e7-4f81-403f-b420-8691b7d4729e'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','5cee7b73-d477-4d48-98ae-0d2fa661cb8d'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','650e04a3-e9ad-4580-b7f7-3aa5abf4fc48'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','681da8f4-89db-4dee-8453-c4d82a2046f6'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','6c8ce33a-6df2-4426-91fd-231804a8ae5b'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','76db992a-c87d-488a-8133-ef7957fb2340'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','7b22688b-d556-4787-aa46-7d81e3655092'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','7fc323e5-10e0-47ca-b6cf-c07207b5afd9'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','836aaa33-27bb-46f2-a997-0b920c3d9b6e'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','83cc73d0-f212-4da3-a04c-785a1726997f'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','8e0b900a-8eb0-457e-aad3-569d95a3bd94'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','99c9e6dd-482e-43d7-8140-d7a381affc29'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','a24dc662-1c12-486c-9187-dad992c7bd86'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','af0cbf63-fbee-44ce-80a4-38e017f6c53d'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','b3c12c7d-f0c1-4b3e-83b5-8371fd940548'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','b6df00dc-9405-4774-913f-4015807f054d'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','bc3d5359-45a7-4dec-90d0-308c5554da13'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','cb1dc963-9b8b-4cc2-a8d6-f5f4b67f5f52'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','d0f00303-f083-43e4-851f-29081e2e4a7f'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','d412e950-b10b-4a92-9428-5d7c67c33f31'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','d8eec3d0-eb58-47a4-883e-fed22a05b521'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','d91f2680-e786-490d-a3e1-fa80513c01d2'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','de793237-6ad7-433c-a6ff-b84d31aa032d'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','f1c836ef-37f7-4b4e-a3b7-ec13b9858ca6'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','f8ec931c-cb98-48b6-a3fd-21e750ff4798'),('528f143b-c794-4a16-a433-5ced0c2d1c1b','b6df00dc-9405-4774-913f-4015807f054d'),('70793dd1-b815-43a9-a9f4-fb05420bbad3','0ba80dc3-3952-4ab5-aeb1-d470383c89af'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','2691871d-33a7-4d6f-96ac-9015b8701612'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','82d6364c-1261-4995-9b68-01248f329d15'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','8cde1e0f-2419-42d7-b1c8-d791f0f89131'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','f2dddf86-9d55-4597-9ade-b4af91ef3f09'),('83197cc5-1d32-4ed1-b36c-8d9252720ea6','0fa385fe-a377-4b82-adfa-11d4396c000b'),('83197cc5-1d32-4ed1-b36c-8d9252720ea6','860926bd-2819-4bee-be10-4ede337fd782'),('83197cc5-1d32-4ed1-b36c-8d9252720ea6','b2f594f3-ddb1-42f5-9c74-80077f2a2bc5'),('83197cc5-1d32-4ed1-b36c-8d9252720ea6','bb9f3abd-7b2a-4e32-a9e5-39f5e3160020'),('b038d0cb-5c43-4e01-b6b6-7740bf01de0f','d663bb49-4a64-44cd-ba95-c208e6f70b38'),('b9a675fb-4a84-4474-a13a-e3d3a945b246','5da35329-9120-493a-84f4-a40653d66b9b'),('b9a675fb-4a84-4474-a13a-e3d3a945b246','bcd9f23b-8026-4c4b-8250-58e1df799f2f'),('cb1dc963-9b8b-4cc2-a8d6-f5f4b67f5f52','0eb808bc-63b1-4e91-b379-197391b5d693'),('cb1dc963-9b8b-4cc2-a8d6-f5f4b67f5f52','6c8ce33a-6df2-4426-91fd-231804a8ae5b'),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','0ba80dc3-3952-4ab5-aeb1-d470383c89af'),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','0fd65ced-0dd8-45d4-85b7-2070b141b76b'),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','1041ca36-cad2-4ca0-a7a2-d1867b9dc89e'),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','10bb56c1-81fc-4010-93d8-abf49b0a891f'),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','36af5873-9d8c-471b-b809-cd425757762e'),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','4566a386-eb3f-4f26-a89c-2d3a15760b39'),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','4b2b88a2-ae05-4e22-97e3-84af3e84d938'),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','5da35329-9120-493a-84f4-a40653d66b9b'),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','6edee55e-2f26-4c2c-a089-a17946818170'),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','70793dd1-b815-43a9-a9f4-fb05420bbad3'),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','72e01e94-651d-4b03-b4d0-6b716c574ae3'),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','7bf43570-7e75-4604-be60-6f89fc51a00a'),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','88ce5326-6826-4c48-b53e-781c5037b48b'),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','8a08ac22-e3f4-4621-b708-1d7457b29fb7'),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','9359c600-8be2-43ac-b6b9-5e051c122312'),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','adcd8718-a69d-41ee-a698-955bc30e9cd2'),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','b9a675fb-4a84-4474-a13a-e3d3a945b246'),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','bcd9f23b-8026-4c4b-8250-58e1df799f2f'),('f2dddf86-9d55-4597-9ade-b4af91ef3f09','548713d4-8147-40f1-8877-fd84f3ac19b8');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('0027f22a-fcd7-4d1b-851f-02a328e29d06',NULL,'password','1f7d61c3-e1b1-414e-8323-241e8e016c96',1706698617334,'My password','{\"value\":\"IoYhohbrnHmMTrIEI4Wf24FRl3thdSmeAp6pwyaxmrTj3RR0I5kdkMHDuMoQd86LMGzSwwORaxd563PH63HsHw==\",\"salt\":\"NS0PrybhkoLErgbxTBSxHA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('051317b9-05db-4008-9ea2-a49d52bc9414',NULL,'password','36f2163a-5667-40a2-8213-31cf2a37ec6a',1684255082482,NULL,'{\"value\":\"Yn7f+sNcY1HR3ZoEuea+6mqIfwO2m5opLkKyNXg5YAnweoJiwYztd4GL6P4NHv24gWdE5mQXvIPxeBmnfdb7yQ==\",\"salt\":\"RQEjf0xO51RDkE5CCvvhDQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('09f4c8c8-d554-463f-83c9-e9d32abf02c6',NULL,'password','8e75a67e-1d4c-47e4-abad-c82fe429d0fb',1683564964193,NULL,'{\"value\":\"KATXNsQUyFTmLusTXwrlcp5vPGhO8BenrVHAUWCXsr7Hyl/pl2PKQjIYWMv38wm+qdnjmdnc2rgyEER3k3ryAA==\",\"salt\":\"ttNo7XKZ5STiCIWbqNzYpA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('12480e86-7984-4a0e-b57f-4baa8986cea8',NULL,'password','f42b03a3-677e-4032-a40e-e125e386dfe4',1684348088481,NULL,'{\"value\":\"g9lt/QHglTmKNxrleIZtAh1f9wc/UNKaFdrQMWxhNfKnl3Sr05jByBHKPGKWp8LPFFR1R/6e+U93ZyZDYeIcEQ==\",\"salt\":\"S3Po+x12dgxDJnVeMLB9rw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('142c98a2-ed98-47e8-8bd8-b5fbe605bab0',NULL,'password','29e7ed38-fbf2-4610-bea6-810be8433bbd',1683210717188,NULL,'{\"value\":\"f2KbCcewt3zOJ5YUi/FI/WtmTqIymrRrUGpLEmLcXmy7mkj6+k/EYgzWeoefGmfuyQZx5Np5XAuLM5rVtg/w5w==\",\"salt\":\"Fg1BSN+rxe31ceLpBkO74w==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('16b80f44-e934-4419-90ca-2f64fa53c7cc',NULL,'password','f9976153-fdae-45a7-8286-f4ea351a3d73',1673524811487,'My password','{\"value\":\"JTzwCgMTN6m7I9q6r4Lybkkls2tsxaon7BPz7Te2SG+Qx2dRm3Wi0S9avWQX7lpmvJqdfBlkS5KAAA9UYH2USw==\",\"salt\":\"c7568XB5x37TAiKqvbPpiw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('16e9d156-bcb4-4b12-b9e0-cf99d5f226bb',NULL,'password','1a899fbf-ea97-4810-b6c7-85f6320a48c2',1704722852636,'My password','{\"value\":\"KyTfM5yfmr4usi9n6YRZAcafRsrN2T075MwLW8VasSanel7UFg+6zcCSsNXv9F/70yVQc4DozkvjXSMQK2UU6w==\",\"salt\":\"mt7PFJYaEiBSg/VjtvutDA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('16f2ce49-59c9-4b03-a8ca-68b2af1369fb',NULL,'password','cffee809-37fe-4979-9451-de65e72e6d92',1691765751582,NULL,'{\"value\":\"tjP25WBwzvlVJIMhIL+sEpfWS/5tlz0CFHafkZb/hnSyqNP1NjHH1FOaXV+8xLNmv2GXLhJi4ZZKRGSi3/o3MA==\",\"salt\":\"Uy67tjr5pU2+bw6jg9llLA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('1f2546b8-2d73-4614-8a0f-8c24d1c85e4e',NULL,'password','19b3fd04-9916-4fea-80f1-5222ea73871f',1686057221420,NULL,'{\"value\":\"eB2BqvVFuHVvw8fanu7Togl5pUy2pIXDSxbLcrqq8apPKnAruiyvrbxxr44EWdfVbOEEzUB8VYh5ejgFfYWQ0A==\",\"salt\":\"H689oY6N9uhFNRmaAtPRbA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('249272c9-f9be-457a-aa59-ce0ef2ea2143',NULL,'password','87595d73-a378-4a35-a98d-399af37570b4',1683215169033,NULL,'{\"value\":\"LGXz/9q27Y0zzHw0wWxm48R802UCVsn1VBL9+0sMOI09spaW20ysmIC0dNp/6DNzNW/KWA6ODPBksgCVcPqhfQ==\",\"salt\":\"G2YQUT8zr5qTi0x1vS1j0g==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('272509b7-ca83-4c69-8540-332cdc914fdc',NULL,'password','569a6e88-4036-4d8e-b0f0-d7e5d5f682aa',1696870536385,NULL,'{\"value\":\"4erRS1S2LyDoL9tkV/oYzhHcB7Ydt2M9QDqaab8Jz8rbCiN1XxGIdlAUIGJ4TUGXIIQp5TD4aY8g5V8to4pHkw==\",\"salt\":\"lFwDY9pNOjLTIJf1W4/dhg==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('293cc962-4409-4087-a9a0-d903985aa53d',NULL,'password','53decf0c-d8fd-4ff9-9f51-049737b756da',1706805577168,'My password','{\"value\":\"RmGmZ8NqCh9iBoAzO2MviUpmyBDWEX+DCj+e0/PDC8ZYJmB0pp4rYXVSqzPCgX5xrSAtYmS+F7KUUJQ6mWfiOg==\",\"salt\":\"0QWnsvHVaatmNKIWFxLX3A==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('2adf30af-2515-4cd1-93fd-7a3645acb895',NULL,'password','39d1ff0e-7bba-4717-9f16-a18f4b49df92',1676296197737,'My password','{\"value\":\"GJywscGPOqu4n5V3xXMilrKWZ0m7Xzko1lz6S0a8mMCjCe3j5rmg3DVOl+3IPsle7W1/+CBuKsFLIPjgTxMNFg==\",\"salt\":\"UNdtopUojuyYi3SvZ1EX6g==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('2dcf6ae2-f351-4b16-ba28-bfe4ffbf176a',NULL,'password','d348b562-d9cb-4d47-8926-61d1ed6b159d',1678382324615,NULL,'{\"value\":\"meRpuBSqy6QMopTzadJCYKoy7vCURpP6xOSLviWhyxoIH9IF3beN++FRiVtmwdjXPbeeBHoV0EXMryWC4/xjaA==\",\"salt\":\"k1bzQpNS912RB+WGKzlnwQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('2e44cd2a-0dcd-4a30-96f0-50f1c2330f97',NULL,'password','686fad5a-0d9a-4df9-8e44-e3249d7e36b8',1679435609166,'My password','{\"value\":\"VGH/kW4HNmXv1hpjA5QDXgerdOj8GBDWXVj7XWts4CSNzI9c+Ro/2vAIcA6VHwsTLt1vHOSajHbfOql6tjkIvg==\",\"salt\":\"dqU0nDfzMlUctktTpJcHaA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('325e313c-b27d-40c0-a0ef-d71874518d09',NULL,'password','3912d048-5887-4f80-a675-6acaa235e0eb',1696337793210,NULL,'{\"value\":\"sFg7p5Ru4fjIAhsCwVjn7RyS7K8FVTxflFt2SbZ7zwiMdibZ+rOSrEAkrlx2pTXnf+y2v7cWt5YF/ceS31Qf+Q==\",\"salt\":\"2RTnJm1CdCVfpqTM06u0Ng==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('34de35ce-d2c7-4bde-9273-25c4cdf0a210',NULL,'password','11630e4d-0eac-40e9-96e1-fd489ecfa49c',1678198568257,NULL,'{\"value\":\"v7BX+Go9ehHlyeyVP5a3StlmqAiHsUztTAWjB+zXmPz/bsgZoqh1KNRcKkO58kGSnCjpcNTAQdr3Hem3WXX59g==\",\"salt\":\"4l1vfBbOqtrYCwZi4sNgzw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('35285259-ca0b-46be-bf2d-9cc973110c80',NULL,'password','c3da0664-3dd3-4e1e-ac0d-d284bcad0fc7',1719258518220,'My password','{\"value\":\"Yjf4t+zQW39pznsbpD/imvCcgKXk0o1/+3XcglqtUto0B4JxWfrU/CobdYiIIHCae4WquIUrI05hoknUZ3ihyA==\",\"salt\":\"v2hj+nba5xAKf+lsXJwp0w==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('35d377e0-6742-4974-9801-72110d5c874b',NULL,'password','2472413f-a1e5-413d-a8bd-a4a44f45957e',1711046374040,NULL,'{\"value\":\"5aKYJqdp4T+sAiFjKaZTJ3t8TuJ4ZjlDpKG2cO8MeTypP/dvpLeOPMkL1e9CDYX+E7YBWJtSP1ML2gBSki8bug==\",\"salt\":\"E7+LWQg0aoOmkKVI9QMvQA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('36b03238-1e6d-46cf-a77d-34f76898cec7',NULL,'password','1315ec80-bf51-4c47-8238-f3be4fee30e5',1679435580578,'My password','{\"value\":\"Ye3/I8/1pAbjn5GCRPoOh8NjC34dL34LZADuL/PZ6BKpg3dYMblggFs2QQOemrKJ/0FgtHZn11PMA3rQQdprVw==\",\"salt\":\"XJt32l8X+AQ7PhyUHQ3X8Q==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('3734ec2e-519a-4dec-8aef-9b0c6a7eb4bc',NULL,'password','cb247a8b-9550-4f7d-963a-f49549c66538',1686330830904,NULL,'{\"value\":\"CTcUidS9DGDsNcANa8aLPpYiLAedOCtB1psUCSEsFA/eYzJxiThyfbqSOPO/am4nihap1DYggRaJ7aJknX7OwA==\",\"salt\":\"7ij2pfEZ9/DKt9PQSXZ1MQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('38817670-bab5-41e9-880c-51202b3ce822',NULL,'password','eddf377e-b9b8-4101-b2dd-57d0dda9ed91',1674831635301,NULL,'{\"value\":\"EP8E+y/jTvYE6mmB8qxx7AJLG5JPplNf7PkYLv7mt9xucZ11Sgh2mctKk2eN1SevJQURkPbZkpnQxfRF2+xNYw==\",\"salt\":\"8sgRagYrynOsg2gDbyBTSQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('3e6cc3e1-2678-43b0-80b7-82f6f12a616a',NULL,'password','4fb4b408-e2ac-43bd-8ccc-f8a613a8484a',1684416479518,NULL,'{\"value\":\"dAD1ATB+Dpyr1M9Nqe6M7MTn3qeRdCsISoJryXiuXpXIR4a7uvoVufEgFAcklxJS+A51BXHiv+KXmVGPHBtR9Q==\",\"salt\":\"PQLfTsaZV7CxR0cjEemnSg==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('3ef00ded-28cc-4665-85f9-11674a5c9376',NULL,'password','c980985a-1173-4edd-b3af-7ae97327a461',1683209449831,NULL,'{\"value\":\"j7uR6mQ4kaXvwtIt2nwN3LlzIpCFOTDheCIM+RBa2mCGNB+iZiAMOslSKeFVXfXxcDUUJn0Z4TUvdpUOfNI/xQ==\",\"salt\":\"rmJgFmGhF5bzog0uZ8K53w==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('52fb27f3-a86b-43cb-8f65-22099f63a419',NULL,'password','5065a3a5-365a-4ff8-9bff-85e461298cef',1685979941222,NULL,'{\"value\":\"DPYiKekN7tb6RFEQeyCNVlRg2MF3Bw0koO9lJR18iCDGm+180vFiQbhxyspeAUTMZOjlQhAH0YjCDej4//3IDw==\",\"salt\":\"7O1dk6AhvkgkhEdcON8wVg==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('5b5b2097-8b41-4b02-a6ad-1983080ac615',NULL,'password','1940f269-513a-49bb-a18a-028c6abdd350',1675961389010,NULL,'{\"value\":\"9Eqgh/ETqph+HznRyqRGPtJf7sJ4mNj6pTfq48cSXqUfR29JQ9YjSuLkFflxBKkeDw3Fgxu5vh5FjxUXUHwrpQ==\",\"salt\":\"PfktQvvWF8WHSZLEKcFIgA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('6b2f6c80-7526-4abc-84e5-7b007cc7e187',NULL,'password','cba8d48f-2895-4007-9293-3e1b0abeb732',1708368438894,NULL,'{\"value\":\"et7/rzdTmN/zofXgCgJw3Fj67wVWwrDzjf3WewmIW1vrJHGaTJswGaJjflfXosy/fuN31ICVVMBTgr2bO3rJjA==\",\"salt\":\"H9wvCgjtXwD9dnXJRYzyRQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('6dbe116a-470a-40c9-a3db-d2e37fd90740',NULL,'password','b1a29476-a370-4acb-9105-c2c990663334',1687961553113,NULL,'{\"value\":\"k03LmropyPcyQbz3CLktJ6KA5YaXkYmqNj7PBDk2WzMJyPzpJGNhEWtdfog3K1CNo/TJsc2k01W2/bLOW6Z5rw==\",\"salt\":\"/fS6suChw0k6vTANB31RAw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('70843f56-8485-4139-ab7b-9fa19c356940',NULL,'password','ad7c8534-46f4-4d6c-bdd0-d6714a329ef9',1685457536791,NULL,'{\"value\":\"od/FsgWNLTZ3wa90fRuh2Q3dd0NxDZU0qm/7MnCws/IRk1CZrLJn+hmbRiPDYq0BV54aF/zJQjtIPHshO6rPWA==\",\"salt\":\"c5uq5IBAIG+jMWEXikmmIA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('720e6e12-19c1-46f2-9b7d-8ac015d5a021',NULL,'password','7ff9a958-a172-41f4-9af1-12ffeb6b5730',1678987966166,'My password','{\"value\":\"Jmv45ra5coknR163FlxNwOI6GSiTpiQ/DTkhPfI2aIeYNoNS82TmG1xzdwjs7Lea/YyKw5/HHnn41a+GdivEhw==\",\"salt\":\"X8F71j5S7ITIr6cqvmG4XQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('753ec1ff-ba6c-4b5f-b307-8843c74aaf50',NULL,'password','3900c4e2-8f89-4e7d-acca-bb37c46de779',1709226374636,NULL,'{\"value\":\"J0NXO4L4T4E21n3F8I93pv6OSpd+zgPQF037RiDIQRqGh7kauWtVJ1/oWe8H3KYZm+FcV0YT6fIiAfQ8npkeHw==\",\"salt\":\"C6dxwEpfFLqnuHDmntfvTQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('7c4b344d-8aa8-4164-a1ec-52eb9800595b',NULL,'password','cd7bf83b-0d14-420e-b285-e62969434153',1674038693752,NULL,'{\"value\":\"RMQnaMFjL/kuABWSRl+agRfV254kyyj8PZQ6CQbck/AzBCPSMPMSOiWCHPQ4SfPKVY0o1OUT6HQutUtGJmSzXA==\",\"salt\":\"69FA5+k+EnDi33bfQQ1Jdg==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('80453033-8c35-4672-8ef0-d4f13df7cbde',NULL,'password','794fba61-c2f8-429a-90e9-9b972399c7df',1674662142325,NULL,'{\"value\":\"UtAa8W6OnrrR+Bj7OzEs8L7T6KI334fVYajqd0ZEvjkOhQkOeH1lhhNN9NQXMhcJc/WlVChNAZi6glNWeKYJDg==\",\"salt\":\"mwBwf6wAUfkLIFD1z5GhIA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('809599cf-634b-428d-a479-4b711c01b951',NULL,'password','ad1940ca-3581-452d-87ad-fc70156b4848',1684417017074,NULL,'{\"value\":\"NGSdzumiYY8RomAMq0yKJjLEAdNFZw5H2E+FhH7UIw/WeCMNyVEB91tku3dDbNDPyU5pcwCbUdRzcN4OumlZZw==\",\"salt\":\"HwUjuCyJDckrHz5MddVi8A==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('84941160-4db7-4b78-afe7-891c4624f052',NULL,'password','557fc54a-86ad-4fc8-a92f-8de7f2f0cbb4',1693320202506,'My password','{\"value\":\"GhFAHyqDEYvkvtoe0LHlkLMGyOlHsFjWQN7F6b1S1vZAhCZXehnCOtyBkkkKFmmtS95LzikBG/pij2PytsSaWQ==\",\"salt\":\"xzcMZP6RGsQo6RENLz1Oxw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('919a3770-c3f5-4193-898c-4fd559931a9f',NULL,'password','78df3168-6fde-4783-af0b-0c9e67ed1924',1683305059306,NULL,'{\"value\":\"FviNwJ9P3K8z6FtcZQNz6BePw2up9/7gDEOCbrBH1W7vITHWbjtvnLegWoMTyVm2RzAJUrzYAMwepCcV/UVwKA==\",\"salt\":\"nJb6cIzrMNGvDUnYw90FEw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('98da3b6d-8168-4e5c-a876-e25c40f949b1',NULL,'password','04193736-41b3-4b59-81e5-40cafb81ed09',1686682713730,NULL,'{\"value\":\"7fvdh44J3LXxXq1i4Tydd4+nrBxwidXcIvznCIo/+kMHJAElufGIZ7hOBboQf3uFjdu8MyDYI+987p43ZMfvdA==\",\"salt\":\"eXZv3N1FY9w4+crolh1pqQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('9a421be3-2943-45f4-a175-d177beeda96a',NULL,'password','86fd24d8-e964-43bd-8607-5f24e95a0184',1683216548535,NULL,'{\"value\":\"QYbW75/vfPyQBTmmVh5bF+JfBTs3/WIVQuzJ2nV86prSEiw58upbxNLtOwwtE9R0NNJ2gLafZKBY44JCbKmjyg==\",\"salt\":\"D+nGLrDV3nthkfHZarB/WQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('9be0b5eb-fd91-4a9a-9133-1c6b5f4d7f1e',NULL,'password','2f1b8435-7f26-4103-9000-49f0fafa7c4b',1684261585574,NULL,'{\"value\":\"ZLrPcj8d1z04nrXSwRsUo0E43Ab0ycc0Q+YZfcsatjMYE13+WqlroDCXEeJ4oq8d0HLJm2djaSCXotxuekKYNQ==\",\"salt\":\"K2FWpH+cUXi0cwKDGDysrw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('9e5643f8-6959-4a96-bc53-92efa8c2a0a6',NULL,'password','aa4c22da-bb49-44ea-9955-d5d20bab750b',1683134502467,NULL,'{\"value\":\"kOJSdD3cNUQ8Wt005EN52VpiHQIkoguW4ClBRz9CVM5Dvzn6MUAc2dUEV84mXJ7Q6k82LVs3Ul87hUKpP5WLOg==\",\"salt\":\"gkdA/FfF67B4+xnm7/K5PA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('a06690d1-d68f-48ed-a77d-af262ece7bdd',NULL,'password','1527fb6c-da4f-47fd-80dc-e1c16c856c70',1685981792410,NULL,'{\"value\":\"7ZGV7Od5mG8IaYXumaDJnFEwPA+ypG2sqfp6WhQ4VhI4I/Uz7iz90r0xz8GMsgMa0JeJe2ZIgDkEtGkdOLiPaw==\",\"salt\":\"4LsCtT2p19AACKTNKiRQjg==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('a0fedee1-dcdf-4a73-a13e-0c00b92bc601',NULL,'password','e0b463ea-71ed-44d3-b1a9-dd7713047c42',1716460726074,'My password','{\"value\":\"6K0quxi9jcWvhajzv3PX72pz6AscMi6mAnXcxm7fSsddC9Obm8FarXtUfsCxfNifAZ+mERr/xcUZqQKYEoBlNw==\",\"salt\":\"Lfkj5XgvH4EPhUPm4VCBlw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('adb18159-3344-4146-a049-e91e0e4e3eb9',NULL,'password','50fabba9-3ea6-49f8-a1f5-d24ccd3aa5e1',1679435652064,'My password','{\"value\":\"1ALmhwp4M5PLGbIWJJNygYGMEQhpvDa5bAnK4dogTbJHEM1VUzPo+9nhQYjy3XSfHTPyBBswaK4hA6NVFVtiEg==\",\"salt\":\"ZVoRg8zvLvKmob0oA3A+jA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('b04d932b-e994-45fb-8f44-d7851338991a',NULL,'password','4565e2ea-fd60-46f4-8b4f-7f27770266a7',1684761726117,NULL,'{\"value\":\"Dlw6DXFaMRP0ZmSWwVH5Ji86VEQjpAGWKsc28YKNZ2NQh0TdMuYWTS3rE4dRcLeeKHqGJAoQ59D3LopLJ1/0FQ==\",\"salt\":\"6d7TYLve/rU9/9GwxKRfWg==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('b6a549b5-a364-42c2-b89c-d9fd1b180cfe',NULL,'password','92e0b432-4f59-4966-8ee0-d52cc5253378',1696527940175,NULL,'{\"value\":\"6ydiPN82RFVPYMCQEKfO6KDiRw6A85tTgjNlz7dm5CgfmV/4d8b/tvEmBR1uTP/mvGQDNy34gLfSaD2z1cT8wg==\",\"salt\":\"xYMrCN1CEdgThjPiw6kXAw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('bccb46e5-3cf2-480e-9691-9fbe34fd57d5',NULL,'password','7a3c889d-f872-408a-aeec-f39abd7c6fe8',1672685077173,'My password','{\"value\":\"cT7UAFo84rZQXCYJmU8N7mbbtL5JMfyNXsKILqTudNBcvOkuC9xK5d7v2BsWr1xSZTqpJcFluAq3g+K4AsLaxQ==\",\"salt\":\"1IQimToQfxGu+Qv4gGZUmA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('d4f6395a-b795-4921-9d01-800bf5916934',NULL,'password','3243d9c5-5b55-4a49-838e-3472315ff83b',1683808163698,NULL,'{\"value\":\"FmXFA3dqXpXu8nrg/YPdhF8sFtM6nUg3Lz9Gdsm9ooxvuagly7j2oQTaujAOZmo/LbK4ENXwW/IUnmOeAWyUMg==\",\"salt\":\"DwOiAlJN6My0R/hje1V53Q==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('e4145a6e-2095-4622-bd10-4e0e9445cfed',NULL,'password','342231af-f5f1-4a2a-80da-990e7a7fe77d',1699627875236,NULL,'{\"value\":\"oHLA4YphqsTweSqjqGpZvA+K6hlXF0i/WZp9T3Kp6r5FNTMIIrP7DgzMEnpa/1NcPAdD42i5QFrahSB0aYXA3w==\",\"salt\":\"Zxj+37q8KE7KGiYW8jPpKg==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('edabbbfc-99a2-4098-8551-ccf1b86219a0',NULL,'password','61686a39-6b06-405e-9dfb-d8e26c69d8ab',1704462497767,NULL,'{\"value\":\"T2eU6GfRksvr5VV7nlBtvvKZkBI2ugsBoeUgnSu5oeMB7zke5W+OcwhsqgtoOWpf7IrHCJfMPed0nmnDRi5CtA==\",\"salt\":\"H1UmecCCyZ3wRJcnlcI4wg==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('f69e0319-33e7-48b3-a482-6824b41a1ca8',NULL,'password','1da8ef53-8add-4738-b446-9bfa9dde2a3e',1707419347054,'My password','{\"value\":\"NYMGeWqdzMQiHsvnP4qhlFNmdHtPtzP4tv/G9EL/5hPau+c2eWLB8t0TGauIAsvkOcZ030yH/ttph0e1c84lKA==\",\"salt\":\"7W3Nh7NXMAerEeqoT1pxyg==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('faa0f6bf-e6fa-41be-811c-128435e6821d',NULL,'password','bd3c3d69-f9a7-4fdb-bf00-954733e053be',1671693493804,'My password','{\"value\":\"s/9LtNNanUn9+6izgWBwP7BFgdDP7QdrT/8JYR0Tb1g1h/tCcBWQiH7NwbUIp+XgAL80QJGNOjvdCxQH91CCGQ==\",\"salt\":\"b517gfvA4atGC4DLl167gA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('fe6a4e49-8ed5-4e48-b172-b25cce06aeb2',NULL,'password','1fa20ccb-2466-4d41-9741-b1045f578d5c',1696870552665,NULL,'{\"value\":\"WCHfGLuLosjNq/LoiXRAlc5Z3VVx2MYglulVd+xFPwWNb4jkreq8EEbFuuVAy4QVVoAbtIxdSZUMf/cmUSUT2Q==\",\"salt\":\"U9rN47P5qWyXLY9EpIR3CQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2022-12-16 15:48:23',1,'EXECUTED','8:bda77d94bf90182a1e30c24f1c155ec7','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.8.0',NULL,NULL,'1216288993'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2022-12-16 15:48:23',2,'MARK_RAN','8:1ecb330f30986693d1cba9ab579fa219','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'4.8.0',NULL,NULL,'1216288993'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2022-12-16 15:48:23',3,'EXECUTED','8:cb7ace19bc6d959f305605d255d4c843','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'4.8.0',NULL,NULL,'1216288993'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2022-12-16 15:53:52',4,'EXECUTED','8:80230013e961310e6872e871be424a63','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2022-12-16 15:53:52',5,'EXECUTED','8:67f4c20929126adc0c8e9bf48279d244','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2022-12-16 15:53:52',6,'MARK_RAN','8:7311018b0b8179ce14628ab412bb6783','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2022-12-16 15:53:52',7,'EXECUTED','8:037ba1216c3640f8785ee6b8e7c8e3c1','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2022-12-16 15:53:52',8,'MARK_RAN','8:7fe6ffe4af4df289b3157de32c624263','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2022-12-16 15:53:52',9,'EXECUTED','8:9c136bc3187083a98745c7d03bc8a303','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2022-12-16 15:53:52',10,'EXECUTED','8:b5f09474dca81fb56a97cf5b6553d331','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2022-12-16 15:53:52',11,'EXECUTED','8:ca924f31bd2a3b219fdcfe78c82dacf4','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2022-12-16 15:53:52',12,'MARK_RAN','8:8acad7483e106416bcfa6f3b824a16cd','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2022-12-16 15:53:52',13,'EXECUTED','8:9b1266d17f4f87c78226f5055408fd5e','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-12-16 15:53:53',14,'EXECUTED','8:d80ec4ab6dbfe573550ff72396c7e910','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-12-16 15:53:53',15,'MARK_RAN','8:d86eb172171e7c20b9c849b584d147b2','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-12-16 15:53:53',16,'MARK_RAN','8:5735f46f0fa60689deb0ecdc2a0dea22','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-12-16 15:53:53',17,'EXECUTED','8:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2022-12-16 15:53:53',18,'EXECUTED','8:5c1a8fd2014ac7fc43b90a700f117b23','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2022-12-16 15:53:53',19,'EXECUTED','8:1f6c2c2dfc362aff4ed75b3f0ef6b331','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2022-12-16 15:53:53',20,'EXECUTED','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2022-12-16 15:53:53',21,'MARK_RAN','8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2022-12-16 15:53:53',22,'MARK_RAN','8:dee9246280915712591f83a127665107','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2022-12-16 15:53:53',23,'EXECUTED','8:d9fa18ffa355320395b86270680dd4fe','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2022-12-16 15:53:53',24,'EXECUTED','8:90cff506fedb06141ffc1c71c4a1214c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2022-12-16 15:53:53',25,'MARK_RAN','8:11a788aed4961d6d29c427c063af828c','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'4.8.0',NULL,NULL,'1216619030'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2022-12-16 15:53:53',26,'EXECUTED','8:a4218e51e1faf380518cce2af5d39b43','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2022-12-16 15:53:53',27,'EXECUTED','8:d9e9a1bfaa644da9952456050f07bbdc','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2022-12-16 15:53:53',28,'EXECUTED','8:d1bf991a6163c0acbfe664b615314505','update tableName=RESOURCE_SERVER_POLICY','',NULL,'4.8.0',NULL,NULL,'1216619030'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2022-12-16 15:53:53',29,'EXECUTED','8:88a743a1e87ec5e30bf603da68058a8c','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2022-12-16 15:53:53',30,'EXECUTED','8:c5517863c875d325dea463d00ec26d7a','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2022-12-16 15:53:53',31,'EXECUTED','8:ada8b4833b74a498f376d7136bc7d327','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2022-12-16 15:53:53',32,'EXECUTED','8:b9b73c8ea7299457f99fcbb825c263ba','customChange','',NULL,'4.8.0',NULL,NULL,'1216619030'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-12-16 15:53:53',33,'EXECUTED','8:07724333e625ccfcfc5adc63d57314f3','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'1216619030'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-12-16 15:53:53',34,'MARK_RAN','8:8b6fd445958882efe55deb26fc541a7b','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-12-16 15:53:53',35,'EXECUTED','8:29b29cfebfd12600897680147277a9d7','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2022-12-16 15:53:53',36,'EXECUTED','8:73ad77ca8fd0410c7f9f15a471fa52bc','addColumn tableName=REALM','',NULL,'4.8.0',NULL,NULL,'1216619030'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-12-16 15:53:53',37,'EXECUTED','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'1216619030'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2022-12-16 15:53:53',38,'EXECUTED','8:27180251182e6c31846c2ddab4bc5781','addColumn tableName=FED_USER_CONSENT','',NULL,'4.8.0',NULL,NULL,'1216619030'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2022-12-16 15:53:53',39,'EXECUTED','8:d56f201bfcfa7a1413eb3e9bc02978f9','addColumn tableName=IDENTITY_PROVIDER','',NULL,'4.8.0',NULL,NULL,'1216619030'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-12-16 15:53:53',40,'MARK_RAN','8:91f5522bf6afdc2077dfab57fbd3455c','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.8.0',NULL,NULL,'1216619030'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-12-16 15:53:53',41,'MARK_RAN','8:0f01b554f256c22caeb7d8aee3a1cdc8','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'4.8.0',NULL,NULL,'1216619030'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2022-12-16 15:53:53',42,'EXECUTED','8:ab91cf9cee415867ade0e2df9651a947','customChange','',NULL,'4.8.0',NULL,NULL,'1216619030'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-12-16 15:53:54',43,'EXECUTED','8:ceac9b1889e97d602caf373eadb0d4b7','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2022-12-16 15:53:54',44,'EXECUTED','8:84b986e628fe8f7fd8fd3c275c5259f2','addColumn tableName=USER_ENTITY','',NULL,'4.8.0',NULL,NULL,'1216619030'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-12-16 15:53:54',45,'EXECUTED','8:a164ae073c56ffdbc98a615493609a52','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.8.0',NULL,NULL,'1216619030'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-12-16 15:53:54',46,'EXECUTED','8:70a2b4f1f4bd4dbf487114bdb1810e64','customChange','',NULL,'4.8.0',NULL,NULL,'1216619030'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-12-16 15:53:54',47,'MARK_RAN','8:7be68b71d2f5b94b8df2e824f2860fa2','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'4.8.0',NULL,NULL,'1216619030'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-12-16 15:53:54',48,'EXECUTED','8:bab7c631093c3861d6cf6144cd944982','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-12-16 15:53:54',49,'EXECUTED','8:fa809ac11877d74d76fe40869916daad','addColumn tableName=REALM','',NULL,'4.8.0',NULL,NULL,'1216619030'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2022-12-16 15:53:54',50,'EXECUTED','8:fac23540a40208f5f5e326f6ceb4d291','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2022-12-16 15:53:54',51,'EXECUTED','8:2612d1b8a97e2b5588c346e817307593','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2022-12-16 15:53:54',52,'EXECUTED','8:9842f155c5db2206c88bcb5d1046e941','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'1216619030'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2022-12-16 15:53:54',53,'EXECUTED','8:2e12e06e45498406db72d5b3da5bbc76','update tableName=REALM','',NULL,'4.8.0',NULL,NULL,'1216619030'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2022-12-16 15:53:54',54,'EXECUTED','8:33560e7c7989250c40da3abdabdc75a4','update tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'1216619030'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-12-16 15:53:54',55,'EXECUTED','8:87a8d8542046817a9107c7eb9cbad1cd','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'4.8.0',NULL,NULL,'1216619030'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-12-16 15:53:54',56,'EXECUTED','8:3ea08490a70215ed0088c273d776311e','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'4.8.0',NULL,NULL,'1216619030'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-12-16 15:53:54',57,'EXECUTED','8:2d56697c8723d4592ab608ce14b6ed68','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-12-16 15:53:54',58,'EXECUTED','8:3e423e249f6068ea2bbe48bf907f9d86','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2022-12-16 15:53:55',59,'EXECUTED','8:15cabee5e5df0ff099510a0fc03e4103','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2022-12-16 15:53:55',60,'EXECUTED','8:4b80200af916ac54d2ffbfc47918ab0e','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'4.8.0',NULL,NULL,'1216619030'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2022-12-16 15:53:55',61,'EXECUTED','8:66564cd5e168045d52252c5027485bbb','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2022-12-16 15:53:55',62,'EXECUTED','8:1c7064fafb030222be2bd16ccf690f6f','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'4.8.0',NULL,NULL,'1216619030'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2022-12-16 15:53:55',63,'EXECUTED','8:2de18a0dce10cdda5c7e65c9b719b6e5','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.8.0',NULL,NULL,'1216619030'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2022-12-16 15:53:55',64,'EXECUTED','8:03e413dd182dcbd5c57e41c34d0ef682','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'4.8.0',NULL,NULL,'1216619030'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2022-12-16 15:53:55',65,'EXECUTED','8:d27b42bb2571c18fbe3fe4e4fb7582a7','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'4.8.0',NULL,NULL,'1216619030'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2022-12-16 15:53:55',66,'EXECUTED','8:698baf84d9fd0027e9192717c2154fb8','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2022-12-16 15:53:55',67,'EXECUTED','8:ced8822edf0f75ef26eb51582f9a821a','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'4.8.0',NULL,NULL,'1216619030'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2022-12-16 15:53:55',68,'EXECUTED','8:f0abba004cf429e8afc43056df06487d','addColumn tableName=REALM','',NULL,'4.8.0',NULL,NULL,'1216619030'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2022-12-16 15:53:55',69,'EXECUTED','8:6662f8b0b611caa359fcf13bf63b4e24','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2022-12-16 15:53:55',70,'EXECUTED','8:9e6b8009560f684250bdbdf97670d39e','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'4.8.0',NULL,NULL,'1216619030'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2022-12-16 15:53:55',71,'EXECUTED','8:4223f561f3b8dc655846562b57bb502e','addColumn tableName=RESOURCE_SERVER','',NULL,'4.8.0',NULL,NULL,'1216619030'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-12-16 15:53:55',72,'EXECUTED','8:215a31c398b363ce383a2b301202f29e','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'1216619030'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-12-16 15:53:55',73,'EXECUTED','8:83f7a671792ca98b3cbd3a1a34862d3d','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'1216619030'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-12-16 15:53:55',74,'MARK_RAN','8:f58ad148698cf30707a6efbdf8061aa7','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'4.8.0',NULL,NULL,'1216619030'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-12-16 15:53:55',75,'EXECUTED','8:79e4fd6c6442980e58d52ffc3ee7b19c','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-12-16 15:53:55',76,'EXECUTED','8:87af6a1e6d241ca4b15801d1f86a297d','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'4.8.0',NULL,NULL,'1216619030'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-12-16 15:53:55',77,'EXECUTED','8:b44f8d9b7b6ea455305a6d72a200ed15','addColumn tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'1216619030'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-12-16 15:53:55',78,'MARK_RAN','8:2d8ed5aaaeffd0cb004c046b4a903ac5','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-12-16 15:53:55',79,'EXECUTED','8:e290c01fcbc275326c511633f6e2acde','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-12-16 15:53:55',80,'MARK_RAN','8:c9db8784c33cea210872ac2d805439f8','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-12-16 15:53:55',81,'EXECUTED','8:95b676ce8fc546a1fcfb4c92fae4add5','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'4.8.0',NULL,NULL,'1216619030'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-12-16 15:53:55',82,'MARK_RAN','8:38a6b2a41f5651018b1aca93a41401e5','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'1216619030'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-12-16 15:53:55',83,'EXECUTED','8:3fb99bcad86a0229783123ac52f7609c','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'1216619030'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-12-16 15:53:55',84,'MARK_RAN','8:64f27a6fdcad57f6f9153210f2ec1bdb','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'4.8.0',NULL,NULL,'1216619030'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-12-16 15:53:55',85,'EXECUTED','8:ab4f863f39adafd4c862f7ec01890abc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'4.8.0',NULL,NULL,'1216619030'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2022-12-16 15:53:55',86,'EXECUTED','8:13c419a0eb336e91ee3a3bf8fda6e2a7','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'4.8.0',NULL,NULL,'1216619030'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2022-12-16 15:53:55',87,'EXECUTED','8:e3fb1e698e0471487f51af1ed80fe3ac','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2022-12-16 15:53:55',88,'EXECUTED','8:babadb686aab7b56562817e60bf0abd0','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'4.8.0',NULL,NULL,'1216619030'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-12-16 15:53:55',89,'EXECUTED','8:72d03345fda8e2f17093d08801947773','addColumn tableName=REALM; customChange','',NULL,'4.8.0',NULL,NULL,'1216619030'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-12-16 15:53:55',90,'EXECUTED','8:61c9233951bd96ffecd9ba75f7d978a4','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'4.8.0',NULL,NULL,'1216619030'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-12-16 15:53:55',91,'EXECUTED','8:ea82e6ad945cec250af6372767b25525','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'1216619030'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-12-16 15:53:55',92,'EXECUTED','8:d3f4a33f41d960ddacd7e2ef30d126b3','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-12-16 15:53:55',93,'MARK_RAN','8:1284a27fbd049d65831cb6fc07c8a783','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.8.0',NULL,NULL,'1216619030'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-12-16 15:53:55',94,'EXECUTED','8:9d11b619db2ae27c25853b8a37cd0dea','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'4.8.0',NULL,NULL,'1216619030'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-12-16 15:53:55',95,'MARK_RAN','8:3002bb3997451bb9e8bac5c5cd8d6327','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-12-16 15:53:55',96,'EXECUTED','8:dfbee0d6237a23ef4ccbb7a4e063c163','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'4.8.0',NULL,NULL,'1216619030'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-12-16 15:53:55',97,'EXECUTED','8:75f3e372df18d38c62734eebb986b960','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'4.8.0',NULL,NULL,'1216619030'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-12-16 15:53:55',98,'MARK_RAN','8:7fee73eddf84a6035691512c85637eef','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'1216619030'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-12-16 15:53:55',99,'MARK_RAN','8:7a11134ab12820f999fbf3bb13c3adc8','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'1216619030'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-12-16 15:53:55',100,'EXECUTED','8:f43dfba07ba249d5d932dc489fd2b886','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'1216619030'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-12-16 15:53:55',101,'MARK_RAN','8:18186f0008b86e0f0f49b0c4d0e842ac','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'1216619030'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-12-16 15:53:55',102,'EXECUTED','8:09c2780bcb23b310a7019d217dc7b433','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'4.8.0',NULL,NULL,'1216619030'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-12-16 15:53:55',103,'EXECUTED','8:276a44955eab693c970a42880197fff2','customChange','',NULL,'4.8.0',NULL,NULL,'1216619030'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2022-12-16 15:53:55',104,'EXECUTED','8:ba8ee3b694d043f2bfc1a1079d0760d7','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'4.8.0',NULL,NULL,'1216619030'),('17.0.0-9562','keycloak','META-INF/jpa-changelog-17.0.0.xml','2022-12-16 15:53:55',105,'EXECUTED','8:5e06b1d75f5d17685485e610c2851b17','createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY','',NULL,'4.8.0',NULL,NULL,'1216619030'),('18.0.0-10625-IDX_ADMIN_EVENT_TIME','keycloak','META-INF/jpa-changelog-18.0.0.xml','2022-12-16 15:53:55',106,'EXECUTED','8:4b80546c1dc550ac552ee7b24a4ab7c0','createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY','',NULL,'4.8.0',NULL,NULL,'1216619030'),('19.0.0-10135','keycloak','META-INF/jpa-changelog-19.0.0.xml','2022-12-16 15:53:55',107,'EXECUTED','8:af510cd1bb2ab6339c45372f3e491696','customChange','',NULL,'4.8.0',NULL,NULL,'1216619030'),('20.0.0-12964-supported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2022-12-16 15:53:55',108,'EXECUTED','8:d00f99ed899c4d2ae9117e282badbef5','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.8.0',NULL,NULL,'1216619030'),('20.0.0-12964-unsupported-dbs','keycloak','META-INF/jpa-changelog-20.0.0.xml','2022-12-16 15:53:55',109,'MARK_RAN','8:314e803baf2f1ec315b3464e398b8247','createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE','',NULL,'4.8.0',NULL,NULL,'1216619030'),('client-attributes-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-20.0.0.xml','2022-12-16 15:53:55',110,'EXECUTED','8:56e4677e7e12556f70b604c573840100','addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES','',NULL,'4.8.0',NULL,NULL,'1216619030');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` tinyint(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,0,NULL,NULL),(1000,0,NULL,NULL),(1001,0,NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('20b6c21c-504d-4f91-96b2-fd3dfbff4203','07d9d5ce-4175-4b65-856d-87715e627e2c',_binary '\0'),('20b6c21c-504d-4f91-96b2-fd3dfbff4203','0a62bd0f-9076-4240-a3da-c06ec1e142ad',_binary ''),('20b6c21c-504d-4f91-96b2-fd3dfbff4203','22fee9af-78b2-4560-b57d-7977d89e7b72',_binary ''),('20b6c21c-504d-4f91-96b2-fd3dfbff4203','2b6ce36e-4e5e-40cb-b517-8584cd9b2351',_binary '\0'),('20b6c21c-504d-4f91-96b2-fd3dfbff4203','2ffa1fdd-22a2-4a41-8c84-52ecc66de28d',_binary ''),('20b6c21c-504d-4f91-96b2-fd3dfbff4203','48141992-faeb-4c66-9be6-c76e8e37d53c',_binary ''),('20b6c21c-504d-4f91-96b2-fd3dfbff4203','65212589-6ee4-404b-b248-7a08f647cec9',_binary '\0'),('20b6c21c-504d-4f91-96b2-fd3dfbff4203','a083faa5-c057-4a29-a988-376caf87f095',_binary ''),('20b6c21c-504d-4f91-96b2-fd3dfbff4203','adc16ec3-7e26-44e4-89c2-25a991ced270',_binary '\0'),('20b6c21c-504d-4f91-96b2-fd3dfbff4203','cdd4b208-4ea0-4af5-9a99-7238ee5a5de2',_binary ''),('a6362837-3fda-4079-bc1f-4fb892f0260e','016de98d-3748-4db6-b4b7-b0564d779c88',_binary ''),('a6362837-3fda-4079-bc1f-4fb892f0260e','0fb72e7b-5a4f-4ea6-9523-faaff6a303db',_binary ''),('a6362837-3fda-4079-bc1f-4fb892f0260e','1f572c55-7b94-4667-8e3c-d63f93176d99',_binary '\0'),('a6362837-3fda-4079-bc1f-4fb892f0260e','3837e21d-2fdc-45d5-86cd-ebfceb73d7d6',_binary ''),('a6362837-3fda-4079-bc1f-4fb892f0260e','41bbc137-35c0-4c6f-92ad-ec287a24b678',_binary ''),('a6362837-3fda-4079-bc1f-4fb892f0260e','823e6346-4043-4eb2-a9a0-22fbb73ad7b5',_binary ''),('a6362837-3fda-4079-bc1f-4fb892f0260e','98c08b2e-cd2a-4449-aac4-02eeb92c4068',_binary '\0'),('a6362837-3fda-4079-bc1f-4fb892f0260e','a23821f5-cfa5-49ee-887b-d08f17f57a59',_binary '\0'),('a6362837-3fda-4079-bc1f-4fb892f0260e','aa5c095f-a207-4cdd-bbfd-8b3d97598391',_binary '\0'),('a6362837-3fda-4079-bc1f-4fb892f0260e','de97970b-f8e9-4063-ab46-7d3adbf17b3e',_binary ''),('a6362837-3fda-4079-bc1f-4fb892f0260e','e5cab7b9-2c9a-4ca7-9f60-f448590afe5c',_binary '');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` varchar(2550) DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` varchar(2024) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  KEY `IDX_GROUP_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('0ba80dc3-3952-4ab5-aeb1-d470383c89af','1a2ee814-a842-4e83-a6c1-7fb032639d66',_binary '','${role_query-clients}','query-clients','a6362837-3fda-4079-bc1f-4fb892f0260e','1a2ee814-a842-4e83-a6c1-7fb032639d66',NULL),('0c7c36b9-d7c6-4fa4-b3f1-f8ef924b7a36','21263250-78b6-4bda-a2f7-db61a43887ea',_binary '','${role_view-authorization}','view-authorization','20b6c21c-504d-4f91-96b2-fd3dfbff4203','21263250-78b6-4bda-a2f7-db61a43887ea',NULL),('0eb808bc-63b1-4e91-b379-197391b5d693','41ed9506-24ac-42af-a8bb-8a88e090697b',_binary '','${role_query-groups}','query-groups','20b6c21c-504d-4f91-96b2-fd3dfbff4203','41ed9506-24ac-42af-a8bb-8a88e090697b',NULL),('0fa385fe-a377-4b82-adfa-11d4396c000b','209490ed-9eb5-49f1-8ad3-b634190f138d',_binary '','${role_manage-account}','manage-account','20b6c21c-504d-4f91-96b2-fd3dfbff4203','209490ed-9eb5-49f1-8ad3-b634190f138d',NULL),('0fd65ced-0dd8-45d4-85b7-2070b141b76b','1a2ee814-a842-4e83-a6c1-7fb032639d66',_binary '','${role_manage-users}','manage-users','a6362837-3fda-4079-bc1f-4fb892f0260e','1a2ee814-a842-4e83-a6c1-7fb032639d66',NULL),('1041ca36-cad2-4ca0-a7a2-d1867b9dc89e','1a2ee814-a842-4e83-a6c1-7fb032639d66',_binary '','${role_create-client}','create-client','a6362837-3fda-4079-bc1f-4fb892f0260e','1a2ee814-a842-4e83-a6c1-7fb032639d66',NULL),('10bb56c1-81fc-4010-93d8-abf49b0a891f','1a2ee814-a842-4e83-a6c1-7fb032639d66',_binary '','${role_manage-realm}','manage-realm','a6362837-3fda-4079-bc1f-4fb892f0260e','1a2ee814-a842-4e83-a6c1-7fb032639d66',NULL),('1266d884-1b9f-4734-bfec-037dcb7f9f12','209490ed-9eb5-49f1-8ad3-b634190f138d',_binary '','${role_view-applications}','view-applications','20b6c21c-504d-4f91-96b2-fd3dfbff4203','209490ed-9eb5-49f1-8ad3-b634190f138d',NULL),('127ba3a0-9793-4a8f-aa22-6901ef2a565c','c97499b9-2697-478e-91d3-6125ce5c7771',_binary '','${role_delete-account}','delete-account','a6362837-3fda-4079-bc1f-4fb892f0260e','c97499b9-2697-478e-91d3-6125ce5c7771',NULL),('13f3b614-3f73-4f12-9bc0-e3cea6001158','a6362837-3fda-4079-bc1f-4fb892f0260e',_binary '\0','Role para poder hacer delete (delete) en la BUV','buv-delete','a6362837-3fda-4079-bc1f-4fb892f0260e',NULL,NULL),('16e22ec5-1cef-48f2-b9af-c96fd21cfaf8','209490ed-9eb5-49f1-8ad3-b634190f138d',_binary '','${role_manage-consent}','manage-consent','20b6c21c-504d-4f91-96b2-fd3dfbff4203','209490ed-9eb5-49f1-8ad3-b634190f138d',NULL),('1b796b74-eddd-4c3f-9ef3-7e93d03da432','a6362837-3fda-4079-bc1f-4fb892f0260e',_binary '\0','','otp-role','a6362837-3fda-4079-bc1f-4fb892f0260e',NULL,NULL),('1c47767d-adf1-4f32-a8d2-4af563295583','21263250-78b6-4bda-a2f7-db61a43887ea',_binary '','${role_view-users}','view-users','20b6c21c-504d-4f91-96b2-fd3dfbff4203','21263250-78b6-4bda-a2f7-db61a43887ea',NULL),('21d4eea0-497a-451b-979f-999ee108adad','41ed9506-24ac-42af-a8bb-8a88e090697b',_binary '','${role_manage-clients}','manage-clients','20b6c21c-504d-4f91-96b2-fd3dfbff4203','41ed9506-24ac-42af-a8bb-8a88e090697b',NULL),('2405eeb1-a4f5-4321-93a6-8d2f8f7ecf5f','21263250-78b6-4bda-a2f7-db61a43887ea',_binary '','${role_manage-realm}','manage-realm','20b6c21c-504d-4f91-96b2-fd3dfbff4203','21263250-78b6-4bda-a2f7-db61a43887ea',NULL),('2691871d-33a7-4d6f-96ac-9015b8701612','a6362837-3fda-4079-bc1f-4fb892f0260e',_binary '\0','${role_uma_authorization}','uma_authorization','a6362837-3fda-4079-bc1f-4fb892f0260e',NULL,NULL),('30369298-ec2f-4c6b-846c-542bd5e451ed','21263250-78b6-4bda-a2f7-db61a43887ea',_binary '','${role_view-clients}','view-clients','20b6c21c-504d-4f91-96b2-fd3dfbff4203','21263250-78b6-4bda-a2f7-db61a43887ea',NULL),('32dd3568-0a3e-4f72-a92f-eaa6218a8e01','56dbc594-fc48-4f78-aef0-ae52325ee512',_binary '','${role_read-token}','read-token','a6362837-3fda-4079-bc1f-4fb892f0260e','56dbc594-fc48-4f78-aef0-ae52325ee512',NULL),('357cdc4c-d4da-431c-a10a-cc25ec39f1da','21263250-78b6-4bda-a2f7-db61a43887ea',_binary '','${role_manage-identity-providers}','manage-identity-providers','20b6c21c-504d-4f91-96b2-fd3dfbff4203','21263250-78b6-4bda-a2f7-db61a43887ea',NULL),('366b1de5-a859-4aab-a341-af484d3b4c65','21263250-78b6-4bda-a2f7-db61a43887ea',_binary '','${role_query-groups}','query-groups','20b6c21c-504d-4f91-96b2-fd3dfbff4203','21263250-78b6-4bda-a2f7-db61a43887ea',NULL),('36af5873-9d8c-471b-b809-cd425757762e','1a2ee814-a842-4e83-a6c1-7fb032639d66',_binary '','${role_manage-events}','manage-events','a6362837-3fda-4079-bc1f-4fb892f0260e','1a2ee814-a842-4e83-a6c1-7fb032639d66',NULL),('426cd661-6ffb-411f-a8ab-7510acdc8ae5','41ed9506-24ac-42af-a8bb-8a88e090697b',_binary '','${role_create-client}','create-client','20b6c21c-504d-4f91-96b2-fd3dfbff4203','41ed9506-24ac-42af-a8bb-8a88e090697b',NULL),('4566a386-eb3f-4f26-a89c-2d3a15760b39','1a2ee814-a842-4e83-a6c1-7fb032639d66',_binary '','${role_view-authorization}','view-authorization','a6362837-3fda-4079-bc1f-4fb892f0260e','1a2ee814-a842-4e83-a6c1-7fb032639d66',NULL),('47088402-9773-4ff4-b2cd-5879ae7dc3ef','21263250-78b6-4bda-a2f7-db61a43887ea',_binary '','${role_create-client}','create-client','20b6c21c-504d-4f91-96b2-fd3dfbff4203','21263250-78b6-4bda-a2f7-db61a43887ea',NULL),('4b2b88a2-ae05-4e22-97e3-84af3e84d938','1a2ee814-a842-4e83-a6c1-7fb032639d66',_binary '','${role_query-realms}','query-realms','a6362837-3fda-4079-bc1f-4fb892f0260e','1a2ee814-a842-4e83-a6c1-7fb032639d66',NULL),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','20b6c21c-504d-4f91-96b2-fd3dfbff4203',_binary '\0','${role_admin}','admin','20b6c21c-504d-4f91-96b2-fd3dfbff4203',NULL,NULL),('51af51c1-dd9c-4d2a-aea0-e34171c8a3c2','41ed9506-24ac-42af-a8bb-8a88e090697b',_binary '','${role_manage-users}','manage-users','20b6c21c-504d-4f91-96b2-fd3dfbff4203','41ed9506-24ac-42af-a8bb-8a88e090697b',NULL),('528f143b-c794-4a16-a433-5ced0c2d1c1b','41ed9506-24ac-42af-a8bb-8a88e090697b',_binary '','${role_view-clients}','view-clients','20b6c21c-504d-4f91-96b2-fd3dfbff4203','41ed9506-24ac-42af-a8bb-8a88e090697b',NULL),('548713d4-8147-40f1-8877-fd84f3ac19b8','c97499b9-2697-478e-91d3-6125ce5c7771',_binary '','${role_manage-account-links}','manage-account-links','a6362837-3fda-4079-bc1f-4fb892f0260e','c97499b9-2697-478e-91d3-6125ce5c7771',NULL),('56b1f324-1ab6-44b9-961e-2ca2a497245b','b4cd395b-6b9b-4930-b7bc-4ec1540a692f',_binary '',NULL,'uma_protection','a6362837-3fda-4079-bc1f-4fb892f0260e','b4cd395b-6b9b-4930-b7bc-4ec1540a692f',NULL),('5b0600e7-4f81-403f-b420-8691b7d4729e','21263250-78b6-4bda-a2f7-db61a43887ea',_binary '','${role_manage-clients}','manage-clients','20b6c21c-504d-4f91-96b2-fd3dfbff4203','21263250-78b6-4bda-a2f7-db61a43887ea',NULL),('5cee7b73-d477-4d48-98ae-0d2fa661cb8d','41ed9506-24ac-42af-a8bb-8a88e090697b',_binary '','${role_view-realm}','view-realm','20b6c21c-504d-4f91-96b2-fd3dfbff4203','41ed9506-24ac-42af-a8bb-8a88e090697b',NULL),('5da35329-9120-493a-84f4-a40653d66b9b','1a2ee814-a842-4e83-a6c1-7fb032639d66',_binary '','${role_query-groups}','query-groups','a6362837-3fda-4079-bc1f-4fb892f0260e','1a2ee814-a842-4e83-a6c1-7fb032639d66',NULL),('64ad5086-873b-431d-a12d-f9650a4c9205','209490ed-9eb5-49f1-8ad3-b634190f138d',_binary '','${role_view-groups}','view-groups','20b6c21c-504d-4f91-96b2-fd3dfbff4203','209490ed-9eb5-49f1-8ad3-b634190f138d',NULL),('650e04a3-e9ad-4580-b7f7-3aa5abf4fc48','41ed9506-24ac-42af-a8bb-8a88e090697b',_binary '','${role_manage-authorization}','manage-authorization','20b6c21c-504d-4f91-96b2-fd3dfbff4203','41ed9506-24ac-42af-a8bb-8a88e090697b',NULL),('681da8f4-89db-4dee-8453-c4d82a2046f6','41ed9506-24ac-42af-a8bb-8a88e090697b',_binary '','${role_view-events}','view-events','20b6c21c-504d-4f91-96b2-fd3dfbff4203','41ed9506-24ac-42af-a8bb-8a88e090697b',NULL),('6c8ce33a-6df2-4426-91fd-231804a8ae5b','41ed9506-24ac-42af-a8bb-8a88e090697b',_binary '','${role_query-users}','query-users','20b6c21c-504d-4f91-96b2-fd3dfbff4203','41ed9506-24ac-42af-a8bb-8a88e090697b',NULL),('6edee55e-2f26-4c2c-a089-a17946818170','1a2ee814-a842-4e83-a6c1-7fb032639d66',_binary '','${role_manage-authorization}','manage-authorization','a6362837-3fda-4079-bc1f-4fb892f0260e','1a2ee814-a842-4e83-a6c1-7fb032639d66',NULL),('70793dd1-b815-43a9-a9f4-fb05420bbad3','1a2ee814-a842-4e83-a6c1-7fb032639d66',_binary '','${role_view-clients}','view-clients','a6362837-3fda-4079-bc1f-4fb892f0260e','1a2ee814-a842-4e83-a6c1-7fb032639d66',NULL),('72e01e94-651d-4b03-b4d0-6b716c574ae3','1a2ee814-a842-4e83-a6c1-7fb032639d66',_binary '','${role_impersonation}','impersonation','a6362837-3fda-4079-bc1f-4fb892f0260e','1a2ee814-a842-4e83-a6c1-7fb032639d66',NULL),('76c90cee-f03a-4bfd-8817-1e734ef40de0','a6362837-3fda-4079-bc1f-4fb892f0260e',_binary '\0','${role_default-roles}','default-roles-buv','a6362837-3fda-4079-bc1f-4fb892f0260e',NULL,NULL),('76db992a-c87d-488a-8133-ef7957fb2340','21263250-78b6-4bda-a2f7-db61a43887ea',_binary '','${role_view-realm}','view-realm','20b6c21c-504d-4f91-96b2-fd3dfbff4203','21263250-78b6-4bda-a2f7-db61a43887ea',NULL),('7b22688b-d556-4787-aa46-7d81e3655092','41ed9506-24ac-42af-a8bb-8a88e090697b',_binary '','${role_impersonation}','impersonation','20b6c21c-504d-4f91-96b2-fd3dfbff4203','41ed9506-24ac-42af-a8bb-8a88e090697b',NULL),('7bf43570-7e75-4604-be60-6f89fc51a00a','1a2ee814-a842-4e83-a6c1-7fb032639d66',_binary '','${role_manage-identity-providers}','manage-identity-providers','a6362837-3fda-4079-bc1f-4fb892f0260e','1a2ee814-a842-4e83-a6c1-7fb032639d66',NULL),('7fc323e5-10e0-47ca-b6cf-c07207b5afd9','20b6c21c-504d-4f91-96b2-fd3dfbff4203',_binary '\0','${role_create-realm}','create-realm','20b6c21c-504d-4f91-96b2-fd3dfbff4203',NULL,NULL),('82d6364c-1261-4995-9b68-01248f329d15','a6362837-3fda-4079-bc1f-4fb892f0260e',_binary '\0','${role_offline-access}','offline_access','a6362837-3fda-4079-bc1f-4fb892f0260e',NULL,NULL),('83197cc5-1d32-4ed1-b36c-8d9252720ea6','20b6c21c-504d-4f91-96b2-fd3dfbff4203',_binary '\0','${role_default-roles}','default-roles-master','20b6c21c-504d-4f91-96b2-fd3dfbff4203',NULL,NULL),('836aaa33-27bb-46f2-a997-0b920c3d9b6e','21263250-78b6-4bda-a2f7-db61a43887ea',_binary '','${role_query-realms}','query-realms','20b6c21c-504d-4f91-96b2-fd3dfbff4203','21263250-78b6-4bda-a2f7-db61a43887ea',NULL),('83cc73d0-f212-4da3-a04c-785a1726997f','41ed9506-24ac-42af-a8bb-8a88e090697b',_binary '','${role_manage-identity-providers}','manage-identity-providers','20b6c21c-504d-4f91-96b2-fd3dfbff4203','41ed9506-24ac-42af-a8bb-8a88e090697b',NULL),('860926bd-2819-4bee-be10-4ede337fd782','20b6c21c-504d-4f91-96b2-fd3dfbff4203',_binary '\0','${role_uma_authorization}','uma_authorization','20b6c21c-504d-4f91-96b2-fd3dfbff4203',NULL,NULL),('86adcde2-fac1-4fb2-b7a3-49fdc5a995b9','209490ed-9eb5-49f1-8ad3-b634190f138d',_binary '','${role_delete-account}','delete-account','20b6c21c-504d-4f91-96b2-fd3dfbff4203','209490ed-9eb5-49f1-8ad3-b634190f138d',NULL),('8839d830-884b-4a95-bdff-933dfacda586','a6362837-3fda-4079-bc1f-4fb892f0260e',_binary '\0','Role para poder listar (get) la BUV','buv-get','a6362837-3fda-4079-bc1f-4fb892f0260e',NULL,NULL),('88ce5326-6826-4c48-b53e-781c5037b48b','1a2ee814-a842-4e83-a6c1-7fb032639d66',_binary '','${role_manage-clients}','manage-clients','a6362837-3fda-4079-bc1f-4fb892f0260e','1a2ee814-a842-4e83-a6c1-7fb032639d66',NULL),('8a08ac22-e3f4-4621-b708-1d7457b29fb7','1a2ee814-a842-4e83-a6c1-7fb032639d66',_binary '','${role_view-realm}','view-realm','a6362837-3fda-4079-bc1f-4fb892f0260e','1a2ee814-a842-4e83-a6c1-7fb032639d66',NULL),('8cde1e0f-2419-42d7-b1c8-d791f0f89131','c97499b9-2697-478e-91d3-6125ce5c7771',_binary '','${role_view-profile}','view-profile','a6362837-3fda-4079-bc1f-4fb892f0260e','c97499b9-2697-478e-91d3-6125ce5c7771',NULL),('8e0b900a-8eb0-457e-aad3-569d95a3bd94','21263250-78b6-4bda-a2f7-db61a43887ea',_binary '','${role_impersonation}','impersonation','20b6c21c-504d-4f91-96b2-fd3dfbff4203','21263250-78b6-4bda-a2f7-db61a43887ea',NULL),('9359c600-8be2-43ac-b6b9-5e051c122312','1a2ee814-a842-4e83-a6c1-7fb032639d66',_binary '','${role_view-events}','view-events','a6362837-3fda-4079-bc1f-4fb892f0260e','1a2ee814-a842-4e83-a6c1-7fb032639d66',NULL),('99c95647-a99a-4a13-a1b4-0a4f2952a927','c97499b9-2697-478e-91d3-6125ce5c7771',_binary '','${role_view-groups}','view-groups','a6362837-3fda-4079-bc1f-4fb892f0260e','c97499b9-2697-478e-91d3-6125ce5c7771',NULL),('99c9e6dd-482e-43d7-8140-d7a381affc29','41ed9506-24ac-42af-a8bb-8a88e090697b',_binary '','${role_manage-realm}','manage-realm','20b6c21c-504d-4f91-96b2-fd3dfbff4203','41ed9506-24ac-42af-a8bb-8a88e090697b',NULL),('a24dc662-1c12-486c-9187-dad992c7bd86','41ed9506-24ac-42af-a8bb-8a88e090697b',_binary '','${role_query-realms}','query-realms','20b6c21c-504d-4f91-96b2-fd3dfbff4203','41ed9506-24ac-42af-a8bb-8a88e090697b',NULL),('a69f7be8-41e8-463f-b7af-564b527b9663','209490ed-9eb5-49f1-8ad3-b634190f138d',_binary '','${role_manage-account-links}','manage-account-links','20b6c21c-504d-4f91-96b2-fd3dfbff4203','209490ed-9eb5-49f1-8ad3-b634190f138d',NULL),('ad3335cd-becc-4fea-9633-c20cdbcf4a70','a6362837-3fda-4079-bc1f-4fb892f0260e',_binary '\0','Role para poder hacer update (put) de la BUV','buv-put','a6362837-3fda-4079-bc1f-4fb892f0260e',NULL,NULL),('adcd8718-a69d-41ee-a698-955bc30e9cd2','1a2ee814-a842-4e83-a6c1-7fb032639d66',_binary '','${role_view-identity-providers}','view-identity-providers','a6362837-3fda-4079-bc1f-4fb892f0260e','1a2ee814-a842-4e83-a6c1-7fb032639d66',NULL),('af0cbf63-fbee-44ce-80a4-38e017f6c53d','21263250-78b6-4bda-a2f7-db61a43887ea',_binary '','${role_manage-authorization}','manage-authorization','20b6c21c-504d-4f91-96b2-fd3dfbff4203','21263250-78b6-4bda-a2f7-db61a43887ea',NULL),('b038d0cb-5c43-4e01-b6b6-7740bf01de0f','c97499b9-2697-478e-91d3-6125ce5c7771',_binary '','${role_manage-consent}','manage-consent','a6362837-3fda-4079-bc1f-4fb892f0260e','c97499b9-2697-478e-91d3-6125ce5c7771',NULL),('b2f594f3-ddb1-42f5-9c74-80077f2a2bc5','209490ed-9eb5-49f1-8ad3-b634190f138d',_binary '','${role_view-profile}','view-profile','20b6c21c-504d-4f91-96b2-fd3dfbff4203','209490ed-9eb5-49f1-8ad3-b634190f138d',NULL),('b3c12c7d-f0c1-4b3e-83b5-8371fd940548','21263250-78b6-4bda-a2f7-db61a43887ea',_binary '','${role_query-users}','query-users','20b6c21c-504d-4f91-96b2-fd3dfbff4203','21263250-78b6-4bda-a2f7-db61a43887ea',NULL),('b6df00dc-9405-4774-913f-4015807f054d','41ed9506-24ac-42af-a8bb-8a88e090697b',_binary '','${role_query-clients}','query-clients','20b6c21c-504d-4f91-96b2-fd3dfbff4203','41ed9506-24ac-42af-a8bb-8a88e090697b',NULL),('b9a675fb-4a84-4474-a13a-e3d3a945b246','1a2ee814-a842-4e83-a6c1-7fb032639d66',_binary '','${role_view-users}','view-users','a6362837-3fda-4079-bc1f-4fb892f0260e','1a2ee814-a842-4e83-a6c1-7fb032639d66',NULL),('bb9f3abd-7b2a-4e32-a9e5-39f5e3160020','20b6c21c-504d-4f91-96b2-fd3dfbff4203',_binary '\0','${role_offline-access}','offline_access','20b6c21c-504d-4f91-96b2-fd3dfbff4203',NULL,NULL),('bc3d5359-45a7-4dec-90d0-308c5554da13','21263250-78b6-4bda-a2f7-db61a43887ea',_binary '','${role_manage-users}','manage-users','20b6c21c-504d-4f91-96b2-fd3dfbff4203','21263250-78b6-4bda-a2f7-db61a43887ea',NULL),('bcd9f23b-8026-4c4b-8250-58e1df799f2f','1a2ee814-a842-4e83-a6c1-7fb032639d66',_binary '','${role_query-users}','query-users','a6362837-3fda-4079-bc1f-4fb892f0260e','1a2ee814-a842-4e83-a6c1-7fb032639d66',NULL),('c69bccbe-c38a-48da-af47-b4aded240782','75016c51-30b1-45b7-8454-b2fb2c353215',_binary '','${role_read-token}','read-token','20b6c21c-504d-4f91-96b2-fd3dfbff4203','75016c51-30b1-45b7-8454-b2fb2c353215',NULL),('cb1dc963-9b8b-4cc2-a8d6-f5f4b67f5f52','41ed9506-24ac-42af-a8bb-8a88e090697b',_binary '','${role_view-users}','view-users','20b6c21c-504d-4f91-96b2-fd3dfbff4203','41ed9506-24ac-42af-a8bb-8a88e090697b',NULL),('d0f00303-f083-43e4-851f-29081e2e4a7f','21263250-78b6-4bda-a2f7-db61a43887ea',_binary '','${role_query-clients}','query-clients','20b6c21c-504d-4f91-96b2-fd3dfbff4203','21263250-78b6-4bda-a2f7-db61a43887ea',NULL),('d3cf4a42-bbd2-49c9-984d-88dd07deb218','066f2a02-3f96-4cfa-9fd7-e295eddedc51',_binary '',NULL,'uma_protection','a6362837-3fda-4079-bc1f-4fb892f0260e','066f2a02-3f96-4cfa-9fd7-e295eddedc51',NULL),('d412e950-b10b-4a92-9428-5d7c67c33f31','21263250-78b6-4bda-a2f7-db61a43887ea',_binary '','${role_view-identity-providers}','view-identity-providers','20b6c21c-504d-4f91-96b2-fd3dfbff4203','21263250-78b6-4bda-a2f7-db61a43887ea',NULL),('d663bb49-4a64-44cd-ba95-c208e6f70b38','c97499b9-2697-478e-91d3-6125ce5c7771',_binary '','${role_view-consent}','view-consent','a6362837-3fda-4079-bc1f-4fb892f0260e','c97499b9-2697-478e-91d3-6125ce5c7771',NULL),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','1a2ee814-a842-4e83-a6c1-7fb032639d66',_binary '','${role_realm-admin}','realm-admin','a6362837-3fda-4079-bc1f-4fb892f0260e','1a2ee814-a842-4e83-a6c1-7fb032639d66',NULL),('d8eec3d0-eb58-47a4-883e-fed22a05b521','41ed9506-24ac-42af-a8bb-8a88e090697b',_binary '','${role_view-identity-providers}','view-identity-providers','20b6c21c-504d-4f91-96b2-fd3dfbff4203','41ed9506-24ac-42af-a8bb-8a88e090697b',NULL),('d91f2680-e786-490d-a3e1-fa80513c01d2','21263250-78b6-4bda-a2f7-db61a43887ea',_binary '','${role_view-events}','view-events','20b6c21c-504d-4f91-96b2-fd3dfbff4203','21263250-78b6-4bda-a2f7-db61a43887ea',NULL),('de793237-6ad7-433c-a6ff-b84d31aa032d','21263250-78b6-4bda-a2f7-db61a43887ea',_binary '','${role_manage-events}','manage-events','20b6c21c-504d-4f91-96b2-fd3dfbff4203','21263250-78b6-4bda-a2f7-db61a43887ea',NULL),('e28bcb99-0b30-4983-991b-7feef5f54651','c97499b9-2697-478e-91d3-6125ce5c7771',_binary '','${role_view-applications}','view-applications','a6362837-3fda-4079-bc1f-4fb892f0260e','c97499b9-2697-478e-91d3-6125ce5c7771',NULL),('ec5f4e10-cfa3-4d64-92f6-128ff2e45319','a6362837-3fda-4079-bc1f-4fb892f0260e',_binary '\0','Role para poder hacer insert(post) en la BUV','buv-post','a6362837-3fda-4079-bc1f-4fb892f0260e',NULL,NULL),('f1c836ef-37f7-4b4e-a3b7-ec13b9858ca6','41ed9506-24ac-42af-a8bb-8a88e090697b',_binary '','${role_manage-events}','manage-events','20b6c21c-504d-4f91-96b2-fd3dfbff4203','41ed9506-24ac-42af-a8bb-8a88e090697b',NULL),('f2dddf86-9d55-4597-9ade-b4af91ef3f09','c97499b9-2697-478e-91d3-6125ce5c7771',_binary '','${role_manage-account}','manage-account','a6362837-3fda-4079-bc1f-4fb892f0260e','c97499b9-2697-478e-91d3-6125ce5c7771',NULL),('f7cd8b2d-18ec-4a34-b332-10b8acdaa9f0','209490ed-9eb5-49f1-8ad3-b634190f138d',_binary '','${role_view-consent}','view-consent','20b6c21c-504d-4f91-96b2-fd3dfbff4203','209490ed-9eb5-49f1-8ad3-b634190f138d',NULL),('f8ec931c-cb98-48b6-a3fd-21e750ff4798','41ed9506-24ac-42af-a8bb-8a88e090697b',_binary '','${role_view-authorization}','view-authorization','20b6c21c-504d-4f91-96b2-fd3dfbff4203','41ed9506-24ac-42af-a8bb-8a88e090697b',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('ru3y6','20.0.1',1671216622);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL DEFAULT '',
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int(11) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('0137af46-03db-4c94-a03d-fff43c219787','username','openid-connect','oidc-usermodel-property-mapper',NULL,'de97970b-f8e9-4063-ab46-7d3adbf17b3e'),('03d2e736-918c-4b44-98e6-fc747b4ed877','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'de97970b-f8e9-4063-ab46-7d3adbf17b3e'),('0633f12a-2579-4419-a117-b18bfd891745','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','066f2a02-3f96-4cfa-9fd7-e295eddedc51',NULL),('069e6fa4-6513-4ed3-8ee5-3b6351cc66f1','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','d0cdeacb-905c-4879-bb48-4595fdd3969d',NULL),('07bdcf74-c9d0-43f1-abb5-971890a5230b','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'1f572c55-7b94-4667-8e3c-d63f93176d99'),('0888a5b9-b078-41c0-9a34-de98655a41f5','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'2b6ce36e-4e5e-40cb-b517-8584cd9b2351'),('0f6ed451-21ac-43e3-a2dd-822997b8f628','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a23821f5-cfa5-49ee-887b-d08f17f57a59'),('0f9bb949-138b-4634-9ad6-733d3184daa7','acr loa level','openid-connect','oidc-acr-mapper',NULL,'e5cab7b9-2c9a-4ca7-9f60-f448590afe5c'),('1335a2aa-cba1-4ee2-86b0-40db749fe5d2','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'de97970b-f8e9-4063-ab46-7d3adbf17b3e'),('15f6fdd8-9947-4422-8473-00beff28973f','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cdd4b208-4ea0-4af5-9a99-7238ee5a5de2'),('1749e7db-7aa1-44fc-8234-da025cb0a7a9','role list','saml','saml-role-list-mapper',NULL,'2ffa1fdd-22a2-4a41-8c84-52ecc66de28d'),('228a9c70-03ee-45f1-8848-c5ff55489a4c','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'2b6ce36e-4e5e-40cb-b517-8584cd9b2351'),('290152e2-aeb4-4f21-906d-c82715e7a6e1','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'de97970b-f8e9-4063-ab46-7d3adbf17b3e'),('29060323-d7f2-44ed-bb0f-3e0f6f1e4884','email','openid-connect','oidc-usermodel-property-mapper',NULL,'22fee9af-78b2-4560-b57d-7977d89e7b72'),('2af8f1a0-9021-447f-8948-ccd598f9cfe8','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'41bbc137-35c0-4c6f-92ad-ec287a24b678'),('2bbc81f8-7004-4f7e-8d40-200471256b69','client roles','openid-connect','oidc-usermodel-client-role-mapper','59d280aa-8b97-4e3d-bad9-5a86acd3d9c9',NULL),('2c00cb65-f623-4428-80e3-79868e24ec77','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'1f572c55-7b94-4667-8e3c-d63f93176d99'),('2c2e3df5-e056-4216-add2-1c6ede56254c','acr loa level','openid-connect','oidc-acr-mapper',NULL,'0a62bd0f-9076-4240-a3da-c06ec1e142ad'),('2faac80d-59fb-4f45-9f37-cf0fbce58254','username','openid-connect','oidc-usermodel-property-mapper',NULL,'cdd4b208-4ea0-4af5-9a99-7238ee5a5de2'),('3218e8d0-83db-40ba-958d-7a7c888a5890','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'de97970b-f8e9-4063-ab46-7d3adbf17b3e'),('3ec2803b-e56d-4873-8898-2fcf2d6b9ef3','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','066f2a02-3f96-4cfa-9fd7-e295eddedc51',NULL),('40b9c731-4c79-43a5-bb45-f90263a17956','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'de97970b-f8e9-4063-ab46-7d3adbf17b3e'),('41c33ea1-497d-49e9-ab2c-d7e6dd0de7d4','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'48141992-faeb-4c66-9be6-c76e8e37d53c'),('4a9b20dc-b498-414e-8dad-966340b5cdb4','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','d0cdeacb-905c-4879-bb48-4595fdd3969d',NULL),('4b412683-a096-4d84-905e-80a0a94b1630','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'65212589-6ee4-404b-b248-7a08f647cec9'),('4c13ffd5-607d-4851-94be-014b66245d99','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'cdd4b208-4ea0-4af5-9a99-7238ee5a5de2'),('655e5f65-3a61-4a8f-8bec-6df852edf296','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'22fee9af-78b2-4560-b57d-7977d89e7b72'),('672c780c-1404-4d1f-85c9-1c8968a721e5','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'a083faa5-c057-4a29-a988-376caf87f095'),('6980778d-d46f-4ec4-9bc1-fd454ebd5a44','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'65212589-6ee4-404b-b248-7a08f647cec9'),('6da229f7-a411-4422-a52f-93ee3c0fedfb','audience resolve','openid-connect','oidc-audience-resolve-mapper','ffdacefe-6633-4321-8817-f765be106869',NULL),('7162f006-d31f-47dd-a45b-7cdd3f3123ba','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'a23821f5-cfa5-49ee-887b-d08f17f57a59'),('72de45e8-3282-4674-b72f-fe1f629c0a6c','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'823e6346-4043-4eb2-a9a0-22fbb73ad7b5'),('772e39f6-85cc-4237-8bac-2f33351301ba','address','openid-connect','oidc-address-mapper',NULL,'07d9d5ce-4175-4b65-856d-87715e627e2c'),('7bb3614b-4c74-4527-86e3-83862a97f262','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cdd4b208-4ea0-4af5-9a99-7238ee5a5de2'),('7ffef0c7-1bf7-4450-9bdc-4a1dcea027c5','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'41bbc137-35c0-4c6f-92ad-ec287a24b678'),('801ffdce-c60e-4675-9fdc-678b07ada75d','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cdd4b208-4ea0-4af5-9a99-7238ee5a5de2'),('808835e6-a9b0-42f7-842f-792c5007b3ac','full name','openid-connect','oidc-full-name-mapper',NULL,'de97970b-f8e9-4063-ab46-7d3adbf17b3e'),('8301884a-8707-45e3-9b64-9c4a02818324','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cdd4b208-4ea0-4af5-9a99-7238ee5a5de2'),('85516c12-ff54-4437-a9da-ffa89ca2e134','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'de97970b-f8e9-4063-ab46-7d3adbf17b3e'),('895ffecf-b825-486e-8d7d-8329ba8871a4','full name','openid-connect','oidc-full-name-mapper',NULL,'cdd4b208-4ea0-4af5-9a99-7238ee5a5de2'),('8e9b91da-7bf4-443e-988d-2be6f307924e','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'016de98d-3748-4db6-b4b7-b0564d779c88'),('9137f403-d293-4aab-973c-8c926e81ae7f','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','066f2a02-3f96-4cfa-9fd7-e295eddedc51',NULL),('92c65c07-8472-4ba0-9a5f-d9de82e8ba1b','address','openid-connect','oidc-address-mapper',NULL,'98c08b2e-cd2a-4449-aac4-02eeb92c4068'),('971196d4-8de3-4a62-b9f0-d8e1a7a8f448','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'48141992-faeb-4c66-9be6-c76e8e37d53c'),('993ff0d5-46f4-47da-b105-4f2b3f486f73','locale','openid-connect','oidc-usermodel-attribute-mapper','d48e5aa3-9a0a-4e3b-b8b3-236114df7301',NULL),('9e7c378d-7853-4dfe-9645-0f7c93df6b8e','audience resolve','openid-connect','oidc-audience-resolve-mapper','f8e07e76-9ef9-446e-858c-da3d72b30d77',NULL),('a7fef13d-654e-4450-9140-a73602e580f3','email','openid-connect','oidc-usermodel-property-mapper',NULL,'016de98d-3748-4db6-b4b7-b0564d779c88'),('a85c2052-e0a2-457a-9072-716b910422c8','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'41bbc137-35c0-4c6f-92ad-ec287a24b678'),('b333f98e-8471-4455-920e-eb9537c01e1d','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'de97970b-f8e9-4063-ab46-7d3adbf17b3e'),('b79da2aa-c768-473b-b1a7-1191368233ae','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cdd4b208-4ea0-4af5-9a99-7238ee5a5de2'),('bbb2844c-f2eb-42bd-960a-bbce95af67d2','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'48141992-faeb-4c66-9be6-c76e8e37d53c'),('be54265c-e20a-4c0b-b657-46bceda9b906','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'cdd4b208-4ea0-4af5-9a99-7238ee5a5de2'),('c0944e84-893b-4baa-9b0b-07227a3c317e','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'de97970b-f8e9-4063-ab46-7d3adbf17b3e'),('cacdde6f-2e62-4e15-a9c7-93db351098b7','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cdd4b208-4ea0-4af5-9a99-7238ee5a5de2'),('d797ec9a-6adc-452b-9be8-32a961802114','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cdd4b208-4ea0-4af5-9a99-7238ee5a5de2'),('d95a610c-eaeb-4dd5-be4b-4d1d32323cd7','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'de97970b-f8e9-4063-ab46-7d3adbf17b3e'),('d968b216-2ce2-43bf-b9c3-520f540a53c1','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'de97970b-f8e9-4063-ab46-7d3adbf17b3e'),('d9f1887c-e49e-4669-9e3c-ce85bfe3f79a','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cdd4b208-4ea0-4af5-9a99-7238ee5a5de2'),('de5eda74-d878-4b40-8d9a-e604de2019b1','locale','openid-connect','oidc-usermodel-attribute-mapper','fda74549-8bda-4d87-8fe4-632f1c8f8a3c',NULL),('e2c98e22-ed6d-44a4-a22a-1706d93442e6','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'de97970b-f8e9-4063-ab46-7d3adbf17b3e'),('ead025e4-7d9d-44e6-b929-bc4af5caa38c','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cdd4b208-4ea0-4af5-9a99-7238ee5a5de2'),('ebad8f03-9f20-4c24-801f-9a57a119aa34','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','d0cdeacb-905c-4879-bb48-4595fdd3969d',NULL),('f0190660-284f-4b2d-8ee9-a15d4c258a27','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'de97970b-f8e9-4063-ab46-7d3adbf17b3e'),('f08e9882-b3b4-4ef9-b36b-455571aeefdb','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cdd4b208-4ea0-4af5-9a99-7238ee5a5de2'),('f2b38c1f-e2db-4d6f-b53f-6928e846c3b4','realm roles','openid-connect','oidc-usermodel-realm-role-mapper','59d280aa-8b97-4e3d-bad9-5a86acd3d9c9',NULL),('f6bce5d8-060c-40fb-9690-dd7a1b3ef6d0','role list','saml','saml-role-list-mapper',NULL,'3837e21d-2fdc-45d5-86cd-ebfceb73d7d6');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('0137af46-03db-4c94-a03d-fff43c219787','true','access.token.claim'),('0137af46-03db-4c94-a03d-fff43c219787','preferred_username','claim.name'),('0137af46-03db-4c94-a03d-fff43c219787','true','id.token.claim'),('0137af46-03db-4c94-a03d-fff43c219787','String','jsonType.label'),('0137af46-03db-4c94-a03d-fff43c219787','username','user.attribute'),('0137af46-03db-4c94-a03d-fff43c219787','true','userinfo.token.claim'),('03d2e736-918c-4b44-98e6-fc747b4ed877','true','access.token.claim'),('03d2e736-918c-4b44-98e6-fc747b4ed877','profile','claim.name'),('03d2e736-918c-4b44-98e6-fc747b4ed877','true','id.token.claim'),('03d2e736-918c-4b44-98e6-fc747b4ed877','String','jsonType.label'),('03d2e736-918c-4b44-98e6-fc747b4ed877','profile','user.attribute'),('03d2e736-918c-4b44-98e6-fc747b4ed877','true','userinfo.token.claim'),('0633f12a-2579-4419-a117-b18bfd891745','true','access.token.claim'),('0633f12a-2579-4419-a117-b18bfd891745','clientAddress','claim.name'),('0633f12a-2579-4419-a117-b18bfd891745','true','id.token.claim'),('0633f12a-2579-4419-a117-b18bfd891745','String','jsonType.label'),('0633f12a-2579-4419-a117-b18bfd891745','clientAddress','user.session.note'),('069e6fa4-6513-4ed3-8ee5-3b6351cc66f1','true','access.token.claim'),('069e6fa4-6513-4ed3-8ee5-3b6351cc66f1','clientId','claim.name'),('069e6fa4-6513-4ed3-8ee5-3b6351cc66f1','true','id.token.claim'),('069e6fa4-6513-4ed3-8ee5-3b6351cc66f1','String','jsonType.label'),('069e6fa4-6513-4ed3-8ee5-3b6351cc66f1','clientId','user.session.note'),('07bdcf74-c9d0-43f1-abb5-971890a5230b','true','access.token.claim'),('07bdcf74-c9d0-43f1-abb5-971890a5230b','upn','claim.name'),('07bdcf74-c9d0-43f1-abb5-971890a5230b','true','id.token.claim'),('07bdcf74-c9d0-43f1-abb5-971890a5230b','String','jsonType.label'),('07bdcf74-c9d0-43f1-abb5-971890a5230b','username','user.attribute'),('07bdcf74-c9d0-43f1-abb5-971890a5230b','true','userinfo.token.claim'),('0888a5b9-b078-41c0-9a34-de98655a41f5','true','access.token.claim'),('0888a5b9-b078-41c0-9a34-de98655a41f5','upn','claim.name'),('0888a5b9-b078-41c0-9a34-de98655a41f5','true','id.token.claim'),('0888a5b9-b078-41c0-9a34-de98655a41f5','String','jsonType.label'),('0888a5b9-b078-41c0-9a34-de98655a41f5','username','user.attribute'),('0888a5b9-b078-41c0-9a34-de98655a41f5','true','userinfo.token.claim'),('0f6ed451-21ac-43e3-a2dd-822997b8f628','true','access.token.claim'),('0f6ed451-21ac-43e3-a2dd-822997b8f628','phone_number','claim.name'),('0f6ed451-21ac-43e3-a2dd-822997b8f628','true','id.token.claim'),('0f6ed451-21ac-43e3-a2dd-822997b8f628','String','jsonType.label'),('0f6ed451-21ac-43e3-a2dd-822997b8f628','phoneNumber','user.attribute'),('0f6ed451-21ac-43e3-a2dd-822997b8f628','true','userinfo.token.claim'),('0f9bb949-138b-4634-9ad6-733d3184daa7','true','access.token.claim'),('0f9bb949-138b-4634-9ad6-733d3184daa7','true','id.token.claim'),('1335a2aa-cba1-4ee2-86b0-40db749fe5d2','true','access.token.claim'),('1335a2aa-cba1-4ee2-86b0-40db749fe5d2','locale','claim.name'),('1335a2aa-cba1-4ee2-86b0-40db749fe5d2','true','id.token.claim'),('1335a2aa-cba1-4ee2-86b0-40db749fe5d2','String','jsonType.label'),('1335a2aa-cba1-4ee2-86b0-40db749fe5d2','locale','user.attribute'),('1335a2aa-cba1-4ee2-86b0-40db749fe5d2','true','userinfo.token.claim'),('15f6fdd8-9947-4422-8473-00beff28973f','true','access.token.claim'),('15f6fdd8-9947-4422-8473-00beff28973f','zoneinfo','claim.name'),('15f6fdd8-9947-4422-8473-00beff28973f','true','id.token.claim'),('15f6fdd8-9947-4422-8473-00beff28973f','String','jsonType.label'),('15f6fdd8-9947-4422-8473-00beff28973f','zoneinfo','user.attribute'),('15f6fdd8-9947-4422-8473-00beff28973f','true','userinfo.token.claim'),('1749e7db-7aa1-44fc-8234-da025cb0a7a9','Role','attribute.name'),('1749e7db-7aa1-44fc-8234-da025cb0a7a9','Basic','attribute.nameformat'),('1749e7db-7aa1-44fc-8234-da025cb0a7a9','false','single'),('228a9c70-03ee-45f1-8848-c5ff55489a4c','true','access.token.claim'),('228a9c70-03ee-45f1-8848-c5ff55489a4c','groups','claim.name'),('228a9c70-03ee-45f1-8848-c5ff55489a4c','true','id.token.claim'),('228a9c70-03ee-45f1-8848-c5ff55489a4c','String','jsonType.label'),('228a9c70-03ee-45f1-8848-c5ff55489a4c','true','multivalued'),('228a9c70-03ee-45f1-8848-c5ff55489a4c','foo','user.attribute'),('290152e2-aeb4-4f21-906d-c82715e7a6e1','true','access.token.claim'),('290152e2-aeb4-4f21-906d-c82715e7a6e1','gender','claim.name'),('290152e2-aeb4-4f21-906d-c82715e7a6e1','true','id.token.claim'),('290152e2-aeb4-4f21-906d-c82715e7a6e1','String','jsonType.label'),('290152e2-aeb4-4f21-906d-c82715e7a6e1','gender','user.attribute'),('290152e2-aeb4-4f21-906d-c82715e7a6e1','true','userinfo.token.claim'),('29060323-d7f2-44ed-bb0f-3e0f6f1e4884','true','access.token.claim'),('29060323-d7f2-44ed-bb0f-3e0f6f1e4884','email','claim.name'),('29060323-d7f2-44ed-bb0f-3e0f6f1e4884','true','id.token.claim'),('29060323-d7f2-44ed-bb0f-3e0f6f1e4884','String','jsonType.label'),('29060323-d7f2-44ed-bb0f-3e0f6f1e4884','email','user.attribute'),('29060323-d7f2-44ed-bb0f-3e0f6f1e4884','true','userinfo.token.claim'),('2af8f1a0-9021-447f-8948-ccd598f9cfe8','true','access.token.claim'),('2af8f1a0-9021-447f-8948-ccd598f9cfe8','realm_access.roles','claim.name'),('2af8f1a0-9021-447f-8948-ccd598f9cfe8','String','jsonType.label'),('2af8f1a0-9021-447f-8948-ccd598f9cfe8','true','multivalued'),('2af8f1a0-9021-447f-8948-ccd598f9cfe8','foo','user.attribute'),('2bbc81f8-7004-4f7e-8d40-200471256b69','true','access.token.claim'),('2bbc81f8-7004-4f7e-8d40-200471256b69','resource_access.${client_id}.roles','claim.name'),('2bbc81f8-7004-4f7e-8d40-200471256b69','String','jsonType.label'),('2bbc81f8-7004-4f7e-8d40-200471256b69','true','multivalued'),('2bbc81f8-7004-4f7e-8d40-200471256b69','foo','user.attribute'),('2c00cb65-f623-4428-80e3-79868e24ec77','true','access.token.claim'),('2c00cb65-f623-4428-80e3-79868e24ec77','groups','claim.name'),('2c00cb65-f623-4428-80e3-79868e24ec77','true','id.token.claim'),('2c00cb65-f623-4428-80e3-79868e24ec77','String','jsonType.label'),('2c00cb65-f623-4428-80e3-79868e24ec77','true','multivalued'),('2c00cb65-f623-4428-80e3-79868e24ec77','foo','user.attribute'),('2c2e3df5-e056-4216-add2-1c6ede56254c','true','access.token.claim'),('2c2e3df5-e056-4216-add2-1c6ede56254c','true','id.token.claim'),('2faac80d-59fb-4f45-9f37-cf0fbce58254','true','access.token.claim'),('2faac80d-59fb-4f45-9f37-cf0fbce58254','preferred_username','claim.name'),('2faac80d-59fb-4f45-9f37-cf0fbce58254','true','id.token.claim'),('2faac80d-59fb-4f45-9f37-cf0fbce58254','String','jsonType.label'),('2faac80d-59fb-4f45-9f37-cf0fbce58254','username','user.attribute'),('2faac80d-59fb-4f45-9f37-cf0fbce58254','true','userinfo.token.claim'),('3218e8d0-83db-40ba-958d-7a7c888a5890','true','access.token.claim'),('3218e8d0-83db-40ba-958d-7a7c888a5890','given_name','claim.name'),('3218e8d0-83db-40ba-958d-7a7c888a5890','true','id.token.claim'),('3218e8d0-83db-40ba-958d-7a7c888a5890','String','jsonType.label'),('3218e8d0-83db-40ba-958d-7a7c888a5890','firstName','user.attribute'),('3218e8d0-83db-40ba-958d-7a7c888a5890','true','userinfo.token.claim'),('3ec2803b-e56d-4873-8898-2fcf2d6b9ef3','true','access.token.claim'),('3ec2803b-e56d-4873-8898-2fcf2d6b9ef3','clientHost','claim.name'),('3ec2803b-e56d-4873-8898-2fcf2d6b9ef3','true','id.token.claim'),('3ec2803b-e56d-4873-8898-2fcf2d6b9ef3','String','jsonType.label'),('3ec2803b-e56d-4873-8898-2fcf2d6b9ef3','clientHost','user.session.note'),('40b9c731-4c79-43a5-bb45-f90263a17956','true','access.token.claim'),('40b9c731-4c79-43a5-bb45-f90263a17956','updated_at','claim.name'),('40b9c731-4c79-43a5-bb45-f90263a17956','true','id.token.claim'),('40b9c731-4c79-43a5-bb45-f90263a17956','long','jsonType.label'),('40b9c731-4c79-43a5-bb45-f90263a17956','updatedAt','user.attribute'),('40b9c731-4c79-43a5-bb45-f90263a17956','true','userinfo.token.claim'),('4a9b20dc-b498-414e-8dad-966340b5cdb4','true','access.token.claim'),('4a9b20dc-b498-414e-8dad-966340b5cdb4','clientAddress','claim.name'),('4a9b20dc-b498-414e-8dad-966340b5cdb4','true','id.token.claim'),('4a9b20dc-b498-414e-8dad-966340b5cdb4','String','jsonType.label'),('4a9b20dc-b498-414e-8dad-966340b5cdb4','clientAddress','user.session.note'),('4b412683-a096-4d84-905e-80a0a94b1630','true','access.token.claim'),('4b412683-a096-4d84-905e-80a0a94b1630','phone_number','claim.name'),('4b412683-a096-4d84-905e-80a0a94b1630','true','id.token.claim'),('4b412683-a096-4d84-905e-80a0a94b1630','String','jsonType.label'),('4b412683-a096-4d84-905e-80a0a94b1630','phoneNumber','user.attribute'),('4b412683-a096-4d84-905e-80a0a94b1630','true','userinfo.token.claim'),('4c13ffd5-607d-4851-94be-014b66245d99','true','access.token.claim'),('4c13ffd5-607d-4851-94be-014b66245d99','family_name','claim.name'),('4c13ffd5-607d-4851-94be-014b66245d99','true','id.token.claim'),('4c13ffd5-607d-4851-94be-014b66245d99','String','jsonType.label'),('4c13ffd5-607d-4851-94be-014b66245d99','lastName','user.attribute'),('4c13ffd5-607d-4851-94be-014b66245d99','true','userinfo.token.claim'),('655e5f65-3a61-4a8f-8bec-6df852edf296','true','access.token.claim'),('655e5f65-3a61-4a8f-8bec-6df852edf296','email_verified','claim.name'),('655e5f65-3a61-4a8f-8bec-6df852edf296','true','id.token.claim'),('655e5f65-3a61-4a8f-8bec-6df852edf296','boolean','jsonType.label'),('655e5f65-3a61-4a8f-8bec-6df852edf296','emailVerified','user.attribute'),('655e5f65-3a61-4a8f-8bec-6df852edf296','true','userinfo.token.claim'),('6980778d-d46f-4ec4-9bc1-fd454ebd5a44','true','access.token.claim'),('6980778d-d46f-4ec4-9bc1-fd454ebd5a44','phone_number_verified','claim.name'),('6980778d-d46f-4ec4-9bc1-fd454ebd5a44','true','id.token.claim'),('6980778d-d46f-4ec4-9bc1-fd454ebd5a44','boolean','jsonType.label'),('6980778d-d46f-4ec4-9bc1-fd454ebd5a44','phoneNumberVerified','user.attribute'),('6980778d-d46f-4ec4-9bc1-fd454ebd5a44','true','userinfo.token.claim'),('7162f006-d31f-47dd-a45b-7cdd3f3123ba','true','access.token.claim'),('7162f006-d31f-47dd-a45b-7cdd3f3123ba','phone_number_verified','claim.name'),('7162f006-d31f-47dd-a45b-7cdd3f3123ba','true','id.token.claim'),('7162f006-d31f-47dd-a45b-7cdd3f3123ba','boolean','jsonType.label'),('7162f006-d31f-47dd-a45b-7cdd3f3123ba','phoneNumberVerified','user.attribute'),('7162f006-d31f-47dd-a45b-7cdd3f3123ba','true','userinfo.token.claim'),('772e39f6-85cc-4237-8bac-2f33351301ba','true','access.token.claim'),('772e39f6-85cc-4237-8bac-2f33351301ba','true','id.token.claim'),('772e39f6-85cc-4237-8bac-2f33351301ba','country','user.attribute.country'),('772e39f6-85cc-4237-8bac-2f33351301ba','formatted','user.attribute.formatted'),('772e39f6-85cc-4237-8bac-2f33351301ba','locality','user.attribute.locality'),('772e39f6-85cc-4237-8bac-2f33351301ba','postal_code','user.attribute.postal_code'),('772e39f6-85cc-4237-8bac-2f33351301ba','region','user.attribute.region'),('772e39f6-85cc-4237-8bac-2f33351301ba','street','user.attribute.street'),('772e39f6-85cc-4237-8bac-2f33351301ba','true','userinfo.token.claim'),('7bb3614b-4c74-4527-86e3-83862a97f262','true','access.token.claim'),('7bb3614b-4c74-4527-86e3-83862a97f262','gender','claim.name'),('7bb3614b-4c74-4527-86e3-83862a97f262','true','id.token.claim'),('7bb3614b-4c74-4527-86e3-83862a97f262','String','jsonType.label'),('7bb3614b-4c74-4527-86e3-83862a97f262','gender','user.attribute'),('7bb3614b-4c74-4527-86e3-83862a97f262','true','userinfo.token.claim'),('7ffef0c7-1bf7-4450-9bdc-4a1dcea027c5','true','access.token.claim'),('7ffef0c7-1bf7-4450-9bdc-4a1dcea027c5','resource_access.${client_id}.roles','claim.name'),('7ffef0c7-1bf7-4450-9bdc-4a1dcea027c5','String','jsonType.label'),('7ffef0c7-1bf7-4450-9bdc-4a1dcea027c5','true','multivalued'),('7ffef0c7-1bf7-4450-9bdc-4a1dcea027c5','foo','user.attribute'),('801ffdce-c60e-4675-9fdc-678b07ada75d','true','access.token.claim'),('801ffdce-c60e-4675-9fdc-678b07ada75d','website','claim.name'),('801ffdce-c60e-4675-9fdc-678b07ada75d','true','id.token.claim'),('801ffdce-c60e-4675-9fdc-678b07ada75d','String','jsonType.label'),('801ffdce-c60e-4675-9fdc-678b07ada75d','website','user.attribute'),('801ffdce-c60e-4675-9fdc-678b07ada75d','true','userinfo.token.claim'),('808835e6-a9b0-42f7-842f-792c5007b3ac','true','access.token.claim'),('808835e6-a9b0-42f7-842f-792c5007b3ac','true','id.token.claim'),('808835e6-a9b0-42f7-842f-792c5007b3ac','true','userinfo.token.claim'),('8301884a-8707-45e3-9b64-9c4a02818324','true','access.token.claim'),('8301884a-8707-45e3-9b64-9c4a02818324','locale','claim.name'),('8301884a-8707-45e3-9b64-9c4a02818324','true','id.token.claim'),('8301884a-8707-45e3-9b64-9c4a02818324','String','jsonType.label'),('8301884a-8707-45e3-9b64-9c4a02818324','locale','user.attribute'),('8301884a-8707-45e3-9b64-9c4a02818324','true','userinfo.token.claim'),('85516c12-ff54-4437-a9da-ffa89ca2e134','true','access.token.claim'),('85516c12-ff54-4437-a9da-ffa89ca2e134','website','claim.name'),('85516c12-ff54-4437-a9da-ffa89ca2e134','true','id.token.claim'),('85516c12-ff54-4437-a9da-ffa89ca2e134','String','jsonType.label'),('85516c12-ff54-4437-a9da-ffa89ca2e134','website','user.attribute'),('85516c12-ff54-4437-a9da-ffa89ca2e134','true','userinfo.token.claim'),('895ffecf-b825-486e-8d7d-8329ba8871a4','true','access.token.claim'),('895ffecf-b825-486e-8d7d-8329ba8871a4','true','id.token.claim'),('895ffecf-b825-486e-8d7d-8329ba8871a4','true','userinfo.token.claim'),('8e9b91da-7bf4-443e-988d-2be6f307924e','true','access.token.claim'),('8e9b91da-7bf4-443e-988d-2be6f307924e','email_verified','claim.name'),('8e9b91da-7bf4-443e-988d-2be6f307924e','true','id.token.claim'),('8e9b91da-7bf4-443e-988d-2be6f307924e','boolean','jsonType.label'),('8e9b91da-7bf4-443e-988d-2be6f307924e','emailVerified','user.attribute'),('8e9b91da-7bf4-443e-988d-2be6f307924e','true','userinfo.token.claim'),('9137f403-d293-4aab-973c-8c926e81ae7f','true','access.token.claim'),('9137f403-d293-4aab-973c-8c926e81ae7f','clientId','claim.name'),('9137f403-d293-4aab-973c-8c926e81ae7f','true','id.token.claim'),('9137f403-d293-4aab-973c-8c926e81ae7f','String','jsonType.label'),('9137f403-d293-4aab-973c-8c926e81ae7f','clientId','user.session.note'),('92c65c07-8472-4ba0-9a5f-d9de82e8ba1b','true','access.token.claim'),('92c65c07-8472-4ba0-9a5f-d9de82e8ba1b','true','id.token.claim'),('92c65c07-8472-4ba0-9a5f-d9de82e8ba1b','country','user.attribute.country'),('92c65c07-8472-4ba0-9a5f-d9de82e8ba1b','formatted','user.attribute.formatted'),('92c65c07-8472-4ba0-9a5f-d9de82e8ba1b','locality','user.attribute.locality'),('92c65c07-8472-4ba0-9a5f-d9de82e8ba1b','postal_code','user.attribute.postal_code'),('92c65c07-8472-4ba0-9a5f-d9de82e8ba1b','region','user.attribute.region'),('92c65c07-8472-4ba0-9a5f-d9de82e8ba1b','street','user.attribute.street'),('92c65c07-8472-4ba0-9a5f-d9de82e8ba1b','true','userinfo.token.claim'),('971196d4-8de3-4a62-b9f0-d8e1a7a8f448','true','access.token.claim'),('971196d4-8de3-4a62-b9f0-d8e1a7a8f448','realm_access.roles','claim.name'),('971196d4-8de3-4a62-b9f0-d8e1a7a8f448','String','jsonType.label'),('971196d4-8de3-4a62-b9f0-d8e1a7a8f448','true','multivalued'),('971196d4-8de3-4a62-b9f0-d8e1a7a8f448','foo','user.attribute'),('993ff0d5-46f4-47da-b105-4f2b3f486f73','true','access.token.claim'),('993ff0d5-46f4-47da-b105-4f2b3f486f73','locale','claim.name'),('993ff0d5-46f4-47da-b105-4f2b3f486f73','true','id.token.claim'),('993ff0d5-46f4-47da-b105-4f2b3f486f73','String','jsonType.label'),('993ff0d5-46f4-47da-b105-4f2b3f486f73','locale','user.attribute'),('993ff0d5-46f4-47da-b105-4f2b3f486f73','true','userinfo.token.claim'),('a7fef13d-654e-4450-9140-a73602e580f3','true','access.token.claim'),('a7fef13d-654e-4450-9140-a73602e580f3','email','claim.name'),('a7fef13d-654e-4450-9140-a73602e580f3','true','id.token.claim'),('a7fef13d-654e-4450-9140-a73602e580f3','String','jsonType.label'),('a7fef13d-654e-4450-9140-a73602e580f3','email','user.attribute'),('a7fef13d-654e-4450-9140-a73602e580f3','true','userinfo.token.claim'),('b333f98e-8471-4455-920e-eb9537c01e1d','true','access.token.claim'),('b333f98e-8471-4455-920e-eb9537c01e1d','birthdate','claim.name'),('b333f98e-8471-4455-920e-eb9537c01e1d','true','id.token.claim'),('b333f98e-8471-4455-920e-eb9537c01e1d','String','jsonType.label'),('b333f98e-8471-4455-920e-eb9537c01e1d','birthdate','user.attribute'),('b333f98e-8471-4455-920e-eb9537c01e1d','true','userinfo.token.claim'),('b79da2aa-c768-473b-b1a7-1191368233ae','true','access.token.claim'),('b79da2aa-c768-473b-b1a7-1191368233ae','birthdate','claim.name'),('b79da2aa-c768-473b-b1a7-1191368233ae','true','id.token.claim'),('b79da2aa-c768-473b-b1a7-1191368233ae','String','jsonType.label'),('b79da2aa-c768-473b-b1a7-1191368233ae','birthdate','user.attribute'),('b79da2aa-c768-473b-b1a7-1191368233ae','true','userinfo.token.claim'),('bbb2844c-f2eb-42bd-960a-bbce95af67d2','true','access.token.claim'),('bbb2844c-f2eb-42bd-960a-bbce95af67d2','resource_access.${client_id}.roles','claim.name'),('bbb2844c-f2eb-42bd-960a-bbce95af67d2','String','jsonType.label'),('bbb2844c-f2eb-42bd-960a-bbce95af67d2','true','multivalued'),('bbb2844c-f2eb-42bd-960a-bbce95af67d2','foo','user.attribute'),('be54265c-e20a-4c0b-b657-46bceda9b906','true','access.token.claim'),('be54265c-e20a-4c0b-b657-46bceda9b906','given_name','claim.name'),('be54265c-e20a-4c0b-b657-46bceda9b906','true','id.token.claim'),('be54265c-e20a-4c0b-b657-46bceda9b906','String','jsonType.label'),('be54265c-e20a-4c0b-b657-46bceda9b906','firstName','user.attribute'),('be54265c-e20a-4c0b-b657-46bceda9b906','true','userinfo.token.claim'),('c0944e84-893b-4baa-9b0b-07227a3c317e','true','access.token.claim'),('c0944e84-893b-4baa-9b0b-07227a3c317e','nickname','claim.name'),('c0944e84-893b-4baa-9b0b-07227a3c317e','true','id.token.claim'),('c0944e84-893b-4baa-9b0b-07227a3c317e','String','jsonType.label'),('c0944e84-893b-4baa-9b0b-07227a3c317e','nickname','user.attribute'),('c0944e84-893b-4baa-9b0b-07227a3c317e','true','userinfo.token.claim'),('cacdde6f-2e62-4e15-a9c7-93db351098b7','true','access.token.claim'),('cacdde6f-2e62-4e15-a9c7-93db351098b7','profile','claim.name'),('cacdde6f-2e62-4e15-a9c7-93db351098b7','true','id.token.claim'),('cacdde6f-2e62-4e15-a9c7-93db351098b7','String','jsonType.label'),('cacdde6f-2e62-4e15-a9c7-93db351098b7','profile','user.attribute'),('cacdde6f-2e62-4e15-a9c7-93db351098b7','true','userinfo.token.claim'),('d797ec9a-6adc-452b-9be8-32a961802114','true','access.token.claim'),('d797ec9a-6adc-452b-9be8-32a961802114','middle_name','claim.name'),('d797ec9a-6adc-452b-9be8-32a961802114','true','id.token.claim'),('d797ec9a-6adc-452b-9be8-32a961802114','String','jsonType.label'),('d797ec9a-6adc-452b-9be8-32a961802114','middleName','user.attribute'),('d797ec9a-6adc-452b-9be8-32a961802114','true','userinfo.token.claim'),('d95a610c-eaeb-4dd5-be4b-4d1d32323cd7','true','access.token.claim'),('d95a610c-eaeb-4dd5-be4b-4d1d32323cd7','zoneinfo','claim.name'),('d95a610c-eaeb-4dd5-be4b-4d1d32323cd7','true','id.token.claim'),('d95a610c-eaeb-4dd5-be4b-4d1d32323cd7','String','jsonType.label'),('d95a610c-eaeb-4dd5-be4b-4d1d32323cd7','zoneinfo','user.attribute'),('d95a610c-eaeb-4dd5-be4b-4d1d32323cd7','true','userinfo.token.claim'),('d968b216-2ce2-43bf-b9c3-520f540a53c1','true','access.token.claim'),('d968b216-2ce2-43bf-b9c3-520f540a53c1','middle_name','claim.name'),('d968b216-2ce2-43bf-b9c3-520f540a53c1','true','id.token.claim'),('d968b216-2ce2-43bf-b9c3-520f540a53c1','String','jsonType.label'),('d968b216-2ce2-43bf-b9c3-520f540a53c1','middleName','user.attribute'),('d968b216-2ce2-43bf-b9c3-520f540a53c1','true','userinfo.token.claim'),('d9f1887c-e49e-4669-9e3c-ce85bfe3f79a','true','access.token.claim'),('d9f1887c-e49e-4669-9e3c-ce85bfe3f79a','nickname','claim.name'),('d9f1887c-e49e-4669-9e3c-ce85bfe3f79a','true','id.token.claim'),('d9f1887c-e49e-4669-9e3c-ce85bfe3f79a','String','jsonType.label'),('d9f1887c-e49e-4669-9e3c-ce85bfe3f79a','nickname','user.attribute'),('d9f1887c-e49e-4669-9e3c-ce85bfe3f79a','true','userinfo.token.claim'),('de5eda74-d878-4b40-8d9a-e604de2019b1','true','access.token.claim'),('de5eda74-d878-4b40-8d9a-e604de2019b1','locale','claim.name'),('de5eda74-d878-4b40-8d9a-e604de2019b1','true','id.token.claim'),('de5eda74-d878-4b40-8d9a-e604de2019b1','String','jsonType.label'),('de5eda74-d878-4b40-8d9a-e604de2019b1','locale','user.attribute'),('de5eda74-d878-4b40-8d9a-e604de2019b1','true','userinfo.token.claim'),('e2c98e22-ed6d-44a4-a22a-1706d93442e6','true','access.token.claim'),('e2c98e22-ed6d-44a4-a22a-1706d93442e6','family_name','claim.name'),('e2c98e22-ed6d-44a4-a22a-1706d93442e6','true','id.token.claim'),('e2c98e22-ed6d-44a4-a22a-1706d93442e6','String','jsonType.label'),('e2c98e22-ed6d-44a4-a22a-1706d93442e6','lastName','user.attribute'),('e2c98e22-ed6d-44a4-a22a-1706d93442e6','true','userinfo.token.claim'),('ead025e4-7d9d-44e6-b929-bc4af5caa38c','true','access.token.claim'),('ead025e4-7d9d-44e6-b929-bc4af5caa38c','updated_at','claim.name'),('ead025e4-7d9d-44e6-b929-bc4af5caa38c','true','id.token.claim'),('ead025e4-7d9d-44e6-b929-bc4af5caa38c','long','jsonType.label'),('ead025e4-7d9d-44e6-b929-bc4af5caa38c','updatedAt','user.attribute'),('ead025e4-7d9d-44e6-b929-bc4af5caa38c','true','userinfo.token.claim'),('ebad8f03-9f20-4c24-801f-9a57a119aa34','true','access.token.claim'),('ebad8f03-9f20-4c24-801f-9a57a119aa34','clientHost','claim.name'),('ebad8f03-9f20-4c24-801f-9a57a119aa34','true','id.token.claim'),('ebad8f03-9f20-4c24-801f-9a57a119aa34','String','jsonType.label'),('ebad8f03-9f20-4c24-801f-9a57a119aa34','clientHost','user.session.note'),('f0190660-284f-4b2d-8ee9-a15d4c258a27','true','access.token.claim'),('f0190660-284f-4b2d-8ee9-a15d4c258a27','picture','claim.name'),('f0190660-284f-4b2d-8ee9-a15d4c258a27','true','id.token.claim'),('f0190660-284f-4b2d-8ee9-a15d4c258a27','String','jsonType.label'),('f0190660-284f-4b2d-8ee9-a15d4c258a27','picture','user.attribute'),('f0190660-284f-4b2d-8ee9-a15d4c258a27','true','userinfo.token.claim'),('f08e9882-b3b4-4ef9-b36b-455571aeefdb','true','access.token.claim'),('f08e9882-b3b4-4ef9-b36b-455571aeefdb','picture','claim.name'),('f08e9882-b3b4-4ef9-b36b-455571aeefdb','true','id.token.claim'),('f08e9882-b3b4-4ef9-b36b-455571aeefdb','String','jsonType.label'),('f08e9882-b3b4-4ef9-b36b-455571aeefdb','picture','user.attribute'),('f08e9882-b3b4-4ef9-b36b-455571aeefdb','true','userinfo.token.claim'),('f2b38c1f-e2db-4d6f-b53f-6928e846c3b4','true','access.token.claim'),('f2b38c1f-e2db-4d6f-b53f-6928e846c3b4','realm_access.roles','claim.name'),('f2b38c1f-e2db-4d6f-b53f-6928e846c3b4','String','jsonType.label'),('f2b38c1f-e2db-4d6f-b53f-6928e846c3b4','true','multivalued'),('f2b38c1f-e2db-4d6f-b53f-6928e846c3b4','foo','user.attribute'),('f6bce5d8-060c-40fb-9690-dd7a1b3ef6d0','Role','attribute.name'),('f6bce5d8-060c-40fb-9690-dd7a1b3ef6d0','Basic','attribute.nameformat'),('f6bce5d8-060c-40fb-9690-dd7a1b3ef6d0','false','single');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` tinyint(1) NOT NULL DEFAULT '0',
  `EVENTS_ENABLED` tinyint(1) NOT NULL DEFAULT '0',
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` varchar(2550) DEFAULT NULL,
  `REGISTRATION_ALLOWED` tinyint(1) NOT NULL DEFAULT '0',
  `REMEMBER_ME` tinyint(1) NOT NULL DEFAULT '0',
  `RESET_PASSWORD_ALLOWED` tinyint(1) NOT NULL DEFAULT '0',
  `SOCIAL` tinyint(1) NOT NULL DEFAULT '0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` tinyint(1) NOT NULL DEFAULT '0',
  `VERIFY_EMAIL` tinyint(1) NOT NULL DEFAULT '0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int(11) DEFAULT '0',
  `OTP_POLICY_WINDOW` int(11) DEFAULT '1',
  `OTP_POLICY_PERIOD` int(11) DEFAULT '30',
  `OTP_POLICY_DIGITS` int(11) DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int(11) DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int(11) NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int(11) NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('20b6c21c-504d-4f91-96b2-fd3dfbff4203',60,300,60,NULL,NULL,NULL,1,0,0,NULL,'master',0,NULL,0,0,0,0,'EXTERNAL',1800,36000,0,0,'41ed9506-24ac-42af-a8bb-8a88e090697b',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','39a5d7e9-a41e-4efd-b527-3cea72923e50','09f46c26-458c-4972-8e9e-1d101ab8aec1','e9e55b04-c1eb-49fe-8b9e-ffd0cd83e3b7','4b4389f4-c930-4dbb-8db5-4af556f795ef','31a551f1-f60f-47cd-a929-00d9ed476959',2592000,_binary '\0',900,_binary '',_binary '\0','552e90d8-8b05-49a0-a28a-0eb4847de256',0,_binary '\0',0,0,'83197cc5-1d32-4ed1-b36c-8d9252720ea6'),('a6362837-3fda-4079-bc1f-4fb892f0260e',60,300,10800,'','','BUV',1,0,0,'BUV','BUV',1713810997,NULL,1,0,1,0,'EXTERNAL',108000,36000,0,1,'21263250-78b6-4bda-a2f7-db61a43887ea',1800,_binary '','es',_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','84968d46-1978-4844-9d0c-8b13c4658589','bcf7f9d1-e46a-4ce7-8388-3e5f221fcb72','6f60d870-ff1b-4641-80d7-dd3d5f282f28','0362bca3-42f1-402b-be89-98a0ba2ae994','872a4ece-3235-4f2a-bec1-314b425e3eb6',2592000,_binary '\0',54000,_binary '',_binary '\0','6a673dd7-f954-4c1e-a456-404b11789712',0,_binary '\0',0,0,'76c90cee-f03a-4bfd-8817-1e734ef40de0');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('acr.loa.map','a6362837-3fda-4079-bc1f-4fb892f0260e','{}'),('actionTokenGeneratedByAdminLifespan','20b6c21c-504d-4f91-96b2-fd3dfbff4203','43200'),('actionTokenGeneratedByAdminLifespan','a6362837-3fda-4079-bc1f-4fb892f0260e','43200'),('actionTokenGeneratedByUserLifespan','20b6c21c-504d-4f91-96b2-fd3dfbff4203','300'),('actionTokenGeneratedByUserLifespan','a6362837-3fda-4079-bc1f-4fb892f0260e','18000'),('actionTokenGeneratedByUserLifespan-execute-actions','a6362837-3fda-4079-bc1f-4fb892f0260e',''),('actionTokenGeneratedByUserLifespan-idp-verify-account-via-email','a6362837-3fda-4079-bc1f-4fb892f0260e',''),('actionTokenGeneratedByUserLifespan-reset-credentials','a6362837-3fda-4079-bc1f-4fb892f0260e',''),('actionTokenGeneratedByUserLifespan-verify-email','a6362837-3fda-4079-bc1f-4fb892f0260e',''),('bruteForceProtected','20b6c21c-504d-4f91-96b2-fd3dfbff4203','false'),('bruteForceProtected','a6362837-3fda-4079-bc1f-4fb892f0260e','false'),('cibaAuthRequestedUserHint','20b6c21c-504d-4f91-96b2-fd3dfbff4203','login_hint'),('cibaAuthRequestedUserHint','a6362837-3fda-4079-bc1f-4fb892f0260e','login_hint'),('cibaBackchannelTokenDeliveryMode','20b6c21c-504d-4f91-96b2-fd3dfbff4203','poll'),('cibaBackchannelTokenDeliveryMode','a6362837-3fda-4079-bc1f-4fb892f0260e','poll'),('cibaExpiresIn','20b6c21c-504d-4f91-96b2-fd3dfbff4203','120'),('cibaExpiresIn','a6362837-3fda-4079-bc1f-4fb892f0260e','120'),('cibaInterval','20b6c21c-504d-4f91-96b2-fd3dfbff4203','5'),('cibaInterval','a6362837-3fda-4079-bc1f-4fb892f0260e','5'),('client-policies.policies','20b6c21c-504d-4f91-96b2-fd3dfbff4203','{\"policies\":[]}'),('client-policies.policies','a6362837-3fda-4079-bc1f-4fb892f0260e','{\"policies\":[]}'),('client-policies.profiles','20b6c21c-504d-4f91-96b2-fd3dfbff4203','{\"profiles\":[]}'),('client-policies.profiles','a6362837-3fda-4079-bc1f-4fb892f0260e','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','20b6c21c-504d-4f91-96b2-fd3dfbff4203','0'),('clientOfflineSessionIdleTimeout','a6362837-3fda-4079-bc1f-4fb892f0260e','0'),('clientOfflineSessionMaxLifespan','20b6c21c-504d-4f91-96b2-fd3dfbff4203','0'),('clientOfflineSessionMaxLifespan','a6362837-3fda-4079-bc1f-4fb892f0260e','0'),('clientSessionIdleTimeout','20b6c21c-504d-4f91-96b2-fd3dfbff4203','0'),('clientSessionIdleTimeout','a6362837-3fda-4079-bc1f-4fb892f0260e','0'),('clientSessionMaxLifespan','20b6c21c-504d-4f91-96b2-fd3dfbff4203','0'),('clientSessionMaxLifespan','a6362837-3fda-4079-bc1f-4fb892f0260e','0'),('defaultSignatureAlgorithm','20b6c21c-504d-4f91-96b2-fd3dfbff4203','RS256'),('defaultSignatureAlgorithm','a6362837-3fda-4079-bc1f-4fb892f0260e','RS256'),('displayName','20b6c21c-504d-4f91-96b2-fd3dfbff4203','Keycloak'),('displayName','a6362837-3fda-4079-bc1f-4fb892f0260e','Identidad Digital MVL'),('displayNameHtml','20b6c21c-504d-4f91-96b2-fd3dfbff4203','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('displayNameHtml','a6362837-3fda-4079-bc1f-4fb892f0260e',''),('failureFactor','20b6c21c-504d-4f91-96b2-fd3dfbff4203','30'),('failureFactor','a6362837-3fda-4079-bc1f-4fb892f0260e','30'),('frontendUrl','a6362837-3fda-4079-bc1f-4fb892f0260e',''),('maxDeltaTimeSeconds','20b6c21c-504d-4f91-96b2-fd3dfbff4203','43200'),('maxDeltaTimeSeconds','a6362837-3fda-4079-bc1f-4fb892f0260e','43200'),('maxFailureWaitSeconds','20b6c21c-504d-4f91-96b2-fd3dfbff4203','900'),('maxFailureWaitSeconds','a6362837-3fda-4079-bc1f-4fb892f0260e','900'),('minimumQuickLoginWaitSeconds','20b6c21c-504d-4f91-96b2-fd3dfbff4203','60'),('minimumQuickLoginWaitSeconds','a6362837-3fda-4079-bc1f-4fb892f0260e','60'),('oauth2DeviceCodeLifespan','20b6c21c-504d-4f91-96b2-fd3dfbff4203','600'),('oauth2DeviceCodeLifespan','a6362837-3fda-4079-bc1f-4fb892f0260e','600'),('oauth2DevicePollingInterval','20b6c21c-504d-4f91-96b2-fd3dfbff4203','5'),('oauth2DevicePollingInterval','a6362837-3fda-4079-bc1f-4fb892f0260e','5'),('offlineSessionMaxLifespan','20b6c21c-504d-4f91-96b2-fd3dfbff4203','5184000'),('offlineSessionMaxLifespan','a6362837-3fda-4079-bc1f-4fb892f0260e','5184000'),('offlineSessionMaxLifespanEnabled','20b6c21c-504d-4f91-96b2-fd3dfbff4203','false'),('offlineSessionMaxLifespanEnabled','a6362837-3fda-4079-bc1f-4fb892f0260e','false'),('parRequestUriLifespan','20b6c21c-504d-4f91-96b2-fd3dfbff4203','60'),('parRequestUriLifespan','a6362837-3fda-4079-bc1f-4fb892f0260e','60'),('permanentLockout','20b6c21c-504d-4f91-96b2-fd3dfbff4203','false'),('permanentLockout','a6362837-3fda-4079-bc1f-4fb892f0260e','false'),('quickLoginCheckMilliSeconds','20b6c21c-504d-4f91-96b2-fd3dfbff4203','1000'),('quickLoginCheckMilliSeconds','a6362837-3fda-4079-bc1f-4fb892f0260e','1000'),('realmReusableOtpCode','20b6c21c-504d-4f91-96b2-fd3dfbff4203','false'),('realmReusableOtpCode','a6362837-3fda-4079-bc1f-4fb892f0260e','false'),('waitIncrementSeconds','20b6c21c-504d-4f91-96b2-fd3dfbff4203','60'),('waitIncrementSeconds','a6362837-3fda-4079-bc1f-4fb892f0260e','60'),('webAuthnPolicyAttestationConveyancePreference','20b6c21c-504d-4f91-96b2-fd3dfbff4203','not specified'),('webAuthnPolicyAttestationConveyancePreference','a6362837-3fda-4079-bc1f-4fb892f0260e','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','20b6c21c-504d-4f91-96b2-fd3dfbff4203','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','a6362837-3fda-4079-bc1f-4fb892f0260e','not specified'),('webAuthnPolicyAuthenticatorAttachment','20b6c21c-504d-4f91-96b2-fd3dfbff4203','not specified'),('webAuthnPolicyAuthenticatorAttachment','a6362837-3fda-4079-bc1f-4fb892f0260e','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','20b6c21c-504d-4f91-96b2-fd3dfbff4203','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','a6362837-3fda-4079-bc1f-4fb892f0260e','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','20b6c21c-504d-4f91-96b2-fd3dfbff4203','false'),('webAuthnPolicyAvoidSameAuthenticatorRegister','a6362837-3fda-4079-bc1f-4fb892f0260e','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','20b6c21c-504d-4f91-96b2-fd3dfbff4203','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','a6362837-3fda-4079-bc1f-4fb892f0260e','false'),('webAuthnPolicyCreateTimeout','20b6c21c-504d-4f91-96b2-fd3dfbff4203','0'),('webAuthnPolicyCreateTimeout','a6362837-3fda-4079-bc1f-4fb892f0260e','0'),('webAuthnPolicyCreateTimeoutPasswordless','20b6c21c-504d-4f91-96b2-fd3dfbff4203','0'),('webAuthnPolicyCreateTimeoutPasswordless','a6362837-3fda-4079-bc1f-4fb892f0260e','0'),('webAuthnPolicyRequireResidentKey','20b6c21c-504d-4f91-96b2-fd3dfbff4203','not specified'),('webAuthnPolicyRequireResidentKey','a6362837-3fda-4079-bc1f-4fb892f0260e','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','20b6c21c-504d-4f91-96b2-fd3dfbff4203','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','a6362837-3fda-4079-bc1f-4fb892f0260e','not specified'),('webAuthnPolicyRpEntityName','20b6c21c-504d-4f91-96b2-fd3dfbff4203','keycloak'),('webAuthnPolicyRpEntityName','a6362837-3fda-4079-bc1f-4fb892f0260e','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','20b6c21c-504d-4f91-96b2-fd3dfbff4203','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','a6362837-3fda-4079-bc1f-4fb892f0260e','keycloak'),('webAuthnPolicyRpId','20b6c21c-504d-4f91-96b2-fd3dfbff4203',''),('webAuthnPolicyRpId','a6362837-3fda-4079-bc1f-4fb892f0260e',''),('webAuthnPolicyRpIdPasswordless','20b6c21c-504d-4f91-96b2-fd3dfbff4203',''),('webAuthnPolicyRpIdPasswordless','a6362837-3fda-4079-bc1f-4fb892f0260e',''),('webAuthnPolicySignatureAlgorithms','20b6c21c-504d-4f91-96b2-fd3dfbff4203','ES256'),('webAuthnPolicySignatureAlgorithms','a6362837-3fda-4079-bc1f-4fb892f0260e','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','20b6c21c-504d-4f91-96b2-fd3dfbff4203','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','a6362837-3fda-4079-bc1f-4fb892f0260e','ES256'),('webAuthnPolicyUserVerificationRequirement','20b6c21c-504d-4f91-96b2-fd3dfbff4203','not specified'),('webAuthnPolicyUserVerificationRequirement','a6362837-3fda-4079-bc1f-4fb892f0260e','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','20b6c21c-504d-4f91-96b2-fd3dfbff4203','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','a6362837-3fda-4079-bc1f-4fb892f0260e','not specified'),('_browser_header.contentSecurityPolicy','20b6c21c-504d-4f91-96b2-fd3dfbff4203','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','a6362837-3fda-4079-bc1f-4fb892f0260e','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','20b6c21c-504d-4f91-96b2-fd3dfbff4203',''),('_browser_header.contentSecurityPolicyReportOnly','a6362837-3fda-4079-bc1f-4fb892f0260e',''),('_browser_header.strictTransportSecurity','20b6c21c-504d-4f91-96b2-fd3dfbff4203','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','a6362837-3fda-4079-bc1f-4fb892f0260e','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','20b6c21c-504d-4f91-96b2-fd3dfbff4203','nosniff'),('_browser_header.xContentTypeOptions','a6362837-3fda-4079-bc1f-4fb892f0260e','nosniff'),('_browser_header.xFrameOptions','20b6c21c-504d-4f91-96b2-fd3dfbff4203','SAMEORIGIN'),('_browser_header.xFrameOptions','a6362837-3fda-4079-bc1f-4fb892f0260e','SAMEORIGIN'),('_browser_header.xRobotsTag','20b6c21c-504d-4f91-96b2-fd3dfbff4203','none'),('_browser_header.xRobotsTag','a6362837-3fda-4079-bc1f-4fb892f0260e','none'),('_browser_header.xXSSProtection','20b6c21c-504d-4f91-96b2-fd3dfbff4203','1; mode=block'),('_browser_header.xXSSProtection','a6362837-3fda-4079-bc1f-4fb892f0260e','1; mode=block');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('20b6c21c-504d-4f91-96b2-fd3dfbff4203','jboss-logging'),('a6362837-3fda-4079-bc1f-4fb892f0260e','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
INSERT INTO `REALM_LOCALIZATIONS` VALUES ('a6362837-3fda-4079-bc1f-4fb892f0260e','es','{}');
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` tinyint(1) NOT NULL DEFAULT '0',
  `SECRET` tinyint(1) NOT NULL DEFAULT '0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',1,1,'20b6c21c-504d-4f91-96b2-fd3dfbff4203'),('password','password',1,1,'a6362837-3fda-4079-bc1f-4fb892f0260e');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
INSERT INTO `REALM_SMTP_CONFIG` VALUES ('20b6c21c-504d-4f91-96b2-fd3dfbff4203','false','auth'),('20b6c21c-504d-4f91-96b2-fd3dfbff4203','smtp.keycloak@vicentelopez.gov.ar','envelopeFrom'),('20b6c21c-504d-4f91-96b2-fd3dfbff4203','smtp.keycloak@vicentelopez.gov.ar','from'),('20b6c21c-504d-4f91-96b2-fd3dfbff4203','Keycloak mail test','fromDisplayName'),('20b6c21c-504d-4f91-96b2-fd3dfbff4203','prd-mod-smtp02.vicentelopez.gov.ar','host'),('20b6c21c-504d-4f91-96b2-fd3dfbff4203','25','port'),('20b6c21c-504d-4f91-96b2-fd3dfbff4203','smtp.keycloak@vicentelopez.gov.ar','replyTo'),('20b6c21c-504d-4f91-96b2-fd3dfbff4203','','replyToDisplayName'),('20b6c21c-504d-4f91-96b2-fd3dfbff4203','false','ssl'),('20b6c21c-504d-4f91-96b2-fd3dfbff4203','false','starttls'),('a6362837-3fda-4079-bc1f-4fb892f0260e','false','auth'),('a6362837-3fda-4079-bc1f-4fb892f0260e','','envelopeFrom'),('a6362837-3fda-4079-bc1f-4fb892f0260e','IdentidadDigital@vicentelopez.gov.ar','from'),('a6362837-3fda-4079-bc1f-4fb892f0260e','IdentidadDigital@vicentelopez.gov.ar','fromDisplayName'),('a6362837-3fda-4079-bc1f-4fb892f0260e','prd-mod-smtp02.vicentelopez.gov.ar','host'),('a6362837-3fda-4079-bc1f-4fb892f0260e','25','port'),('a6362837-3fda-4079-bc1f-4fb892f0260e','IdentidadDigital@vicentelopez.gov.ar','replyTo'),('a6362837-3fda-4079-bc1f-4fb892f0260e','Identidad Digital MVL','replyToDisplayName'),('a6362837-3fda-4079-bc1f-4fb892f0260e','false','ssl'),('a6362837-3fda-4079-bc1f-4fb892f0260e','true','starttls');
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
INSERT INTO `REALM_SUPPORTED_LOCALES` VALUES ('a6362837-3fda-4079-bc1f-4fb892f0260e','es');
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://15.228.204.194'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://15.228.204.194/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://dev-mod-iis02.vicentelopez.gov.ar/DeportesPublic*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://dev-mod-web09.vicentelopez.gov.ar/sicuv/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://dev-sip-web02.vicentelopez.gov.ar:3001/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://dev-sip-web02.vicentelopez.gov.ar:8080/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://localhost:3000/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://localhost:7069/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://localhost:8000/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://localhost:8000/login/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://localhost:8005/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://tst-mod-web03.vicentelopez.gov.ar/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://15.228.204.194/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://auth-oscity.firebaseapp.com/__/auth/handler'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://demos.citymis.co/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://dev-deportes.vicentelopez.gov.ar/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://dev-deportes.vicentelopez.gov.ar/mibarriovecinos/Account/MvlId*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://dev-mod-iis02.vicentelopez.gov.ar/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://identidaddigital.vicentelopez.gov.ar'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://identidaddigital.vicentelopez.gov.ar/auth/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://identidaddigital.vicentelopez.gov.ar/__/auth/handler/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://identidadigital.vicentelopez.gov.ar/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://localhost:8001/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://localhost:8005/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://openid-gw-iipp.vicentelopez.gov.ar/login/callback'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://openidconnect.net/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://os-arg-vicente-lopez.firebaseapp.com/__/auth/handler'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://prd-sip-web06.vicentelopez.gov.ar:3000/login/callback/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://prepro-tad.vicentelopez.gov.ar/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','vlmibarrio://vicentelopez.gov.ar*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','vlmibarrio://vicentelopez.gov.ar/*'),('209490ed-9eb5-49f1-8ad3-b634190f138d','/realms/master/account/*'),('2d4dec4c-0c3e-4b94-a2a1-6e68ccf8eaf1','http://localhost:8000/*'),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','vlmibarrio://vicentelopez.gov.ar'),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','vlmibarrio://vicentelopez.gov.ar/*'),('50a61bff-3ecb-4b8a-8461-42f81212550d','https://dev-deportes.vicentelopez.gov.ar/*'),('50a61bff-3ecb-4b8a-8461-42f81212550d','https://dev-deportes.vicentelopez.gov.ar/mibarriovecinos/Account/MvlId*'),('605b2748-d68d-4296-bb07-5f1f693dc27a','http://localhost:8000/*'),('7d98848c-daa6-4508-a519-eb348ba3c055','https://testing2.diphot.com.ar/vl-presupuesto-participativo/auth/keycloak/callback'),('7e166491-3e57-4d03-ae88-b175cc6dc202','http://localhost:3000/*'),('7e166491-3e57-4d03-ae88-b175cc6dc202','http://localhost:5050/*'),('7e166491-3e57-4d03-ae88-b175cc6dc202','https://prepro-tad.vicentelopez.gov.ar/*'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','http://18.229.123.224/*'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','http://localhost:8005/'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','http://localhost:8005/*'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','https://18.229.123.224/*'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','https://empleo.vicentelopez.gov.ar/*'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','https://empleo.vicentelopez.gov.ar/login/sso/redirect*'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','https://localhost:8005/*'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','https://localhost:8005/login/sso'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','https://localhost:8005/login/sso/*'),('c97499b9-2697-478e-91d3-6125ce5c7771','/realms/BUV/account/*'),('d48e5aa3-9a0a-4e3b-b8b3-236114df7301','/admin/BUV/console/*'),('f8e07e76-9ef9-446e-858c-da3d72b30d77','/realms/master/account/*'),('fda74549-8bda-4d87-8fe4-632f1c8f8a3c','/admin/master/console/*'),('ffdacefe-6633-4321-8817-f765be106869','/realms/BUV/account/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('103353ad-b788-4c5c-82c6-e62c69ad7dd5','delete_account','Delete Account','a6362837-3fda-4079-bc1f-4fb892f0260e',_binary '\0',_binary '\0','delete_account',60),('15468894-878f-4261-8daf-97fe918e9bdb','delete_account','Delete Account','20b6c21c-504d-4f91-96b2-fd3dfbff4203',_binary '\0',_binary '\0','delete_account',60),('274352c1-9cae-48e4-95e1-2280ff41d5f1','UPDATE_PASSWORD','Update Password','20b6c21c-504d-4f91-96b2-fd3dfbff4203',_binary '',_binary '\0','UPDATE_PASSWORD',30),('2b04b56e-ac1d-4ca0-9da0-7fb25b16040e','webauthn-register','Webauthn Register','a6362837-3fda-4079-bc1f-4fb892f0260e',_binary '',_binary '\0','webauthn-register',70),('35ad17c4-dbe9-425e-98b7-00d9ed1a2e88','webauthn-register-passwordless','Webauthn Register Passwordless','a6362837-3fda-4079-bc1f-4fb892f0260e',_binary '',_binary '\0','webauthn-register-passwordless',80),('401ee8c3-a4d4-4e20-9b53-05536c794d6b','UPDATE_PROFILE','Update Profile','20b6c21c-504d-4f91-96b2-fd3dfbff4203',_binary '',_binary '\0','UPDATE_PROFILE',40),('40e2022a-3ce8-4eee-9e3e-01e4c1a53a8f','update_user_locale','Update User Locale','20b6c21c-504d-4f91-96b2-fd3dfbff4203',_binary '',_binary '\0','update_user_locale',1000),('457ecdb2-0575-4140-a254-18a17f0b2fda','update_user_locale','Update User Locale','a6362837-3fda-4079-bc1f-4fb892f0260e',_binary '',_binary '\0','update_user_locale',1000),('5c3c4178-e336-48e3-90cd-326cb0d845c4','webauthn-register','Webauthn Register','20b6c21c-504d-4f91-96b2-fd3dfbff4203',_binary '',_binary '\0','webauthn-register',70),('743b8237-5c20-4c91-b9c8-afd34cacb963','UPDATE_PASSWORD','Update Password','a6362837-3fda-4079-bc1f-4fb892f0260e',_binary '',_binary '\0','UPDATE_PASSWORD',30),('7c685ca1-5117-48de-a1a0-71aecd5d0608','webauthn-register-passwordless','Webauthn Register Passwordless','20b6c21c-504d-4f91-96b2-fd3dfbff4203',_binary '',_binary '\0','webauthn-register-passwordless',80),('ad354afa-e35a-4f70-81a6-182facf23f14','CONFIGURE_TOTP','Configure OTP','a6362837-3fda-4079-bc1f-4fb892f0260e',_binary '',_binary '\0','CONFIGURE_TOTP',10),('b197fb13-8ac3-476a-9157-a9644fde1e35','UPDATE_PROFILE','Update Profile','a6362837-3fda-4079-bc1f-4fb892f0260e',_binary '',_binary '\0','UPDATE_PROFILE',40),('b432e45d-8486-426a-a082-e9a2e3902738','VERIFY_EMAIL','Verify Email','a6362837-3fda-4079-bc1f-4fb892f0260e',_binary '',_binary '\0','VERIFY_EMAIL',50),('cb1d7adc-89dc-4797-80f8-85c02293e5b1','terms_and_conditions','Terms and Conditions','20b6c21c-504d-4f91-96b2-fd3dfbff4203',_binary '\0',_binary '\0','terms_and_conditions',20),('d1f2847a-5769-43ee-8a19-9d628baad7f1','terms_and_conditions','Terms and Conditions','a6362837-3fda-4079-bc1f-4fb892f0260e',_binary '\0',_binary '\0','terms_and_conditions',20),('f594b095-6ec5-4b22-b7fb-16c447339603','CONFIGURE_TOTP','Configure OTP','20b6c21c-504d-4f91-96b2-fd3dfbff4203',_binary '',_binary '\0','CONFIGURE_TOTP',10),('ffd2b290-a3d2-42d8-b89e-95f985de95fe','VERIFY_EMAIL','Verify Email','20b6c21c-504d-4f91-96b2-fd3dfbff4203',_binary '',_binary '\0','VERIFY_EMAIL',50);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL DEFAULT '',
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) NOT NULL,
  `GRANTED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('f8e07e76-9ef9-446e-858c-da3d72b30d77','0fa385fe-a377-4b82-adfa-11d4396c000b'),('f8e07e76-9ef9-446e-858c-da3d72b30d77','64ad5086-873b-431d-a12d-f9650a4c9205'),('ffdacefe-6633-4321-8817-f765be106869','99c95647-a99a-4a13-a1b4-0a4f2952a927'),('ffdacefe-6633-4321-8817-f765be106869','f2dddf86-9d55-4597-9ade-b4af91ef3f09');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
  `LAST_FAILURE` bigint(20) DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int(11) DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `USER_ATTRIBUTE` VALUES ('locale','en','794fba61-c2f8-429a-90e9-9b972399c7df','15f6d4ca-dc01-4957-9621-654ba61bd2ca');
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` tinyint(1) NOT NULL DEFAULT '0',
  `ENABLED` tinyint(1) NOT NULL DEFAULT '0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`),
  KEY `IDX_USER_SERVICE_ACCOUNT` (`REALM_ID`,`SERVICE_ACCOUNT_CLIENT_LINK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c','marcelo.dri@vicentelopez.gov.ar','marcelo.dri@vicentelopez.gov.ar',1,1,NULL,'Marcelo','Dri','20b6c21c-504d-4f91-96b2-fd3dfbff4203','marcelo.dri',1675772229898,NULL,0),('04193736-41b3-4b59-81e5-40cafb81ed09','ramiri77o@hotmail.com','ramiri77o@hotmail.com',1,1,NULL,'Ramiro','GODINO SOARES GACHE','a6362837-3fda-4079-bc1f-4fb892f0260e','20369506480',1686682652074,NULL,0),('11630e4d-0eac-40e9-96e1-fd489ecfa49c','marce@info.com','marce@info.com',1,1,NULL,'','Blum','a6362837-3fda-4079-bc1f-4fb892f0260e','20164974058',1678198525550,NULL,0),('1315ec80-bf51-4c47-8238-f3be4fee30e5',NULL,'0e255ac2-f998-4914-b7ea-e651621d044f',1,1,NULL,'','','a6362837-3fda-4079-bc1f-4fb892f0260e','buv_mi_barrio',1679435568992,NULL,0),('1527fb6c-da4f-47fd-80dc-e1c16c856c70','jorgecharrabe7@gmail.com','jorgecharrabe7@gmail.com',1,1,NULL,'JORGE ALBERT','CHARRABE ALVAREZ','a6362837-3fda-4079-bc1f-4fb892f0260e','20961076340',1685981584624,NULL,0),('1940f269-513a-49bb-a18a-028c6abdd350','jose@os.city','jose@os.city',1,1,NULL,'Os','City','a6362837-3fda-4079-bc1f-4fb892f0260e','oscity',1675961320444,NULL,1675962478),('19b3fd04-9916-4fea-80f1-5222ea73871f','natydifonzo@gmail.com','natydifonzo@gmail.com',1,1,NULL,'Natalia Irina','DI FONZO PORRI','a6362837-3fda-4079-bc1f-4fb892f0260e','27288031415',1686057151020,NULL,0),('1a899fbf-ea97-4810-b6c7-85f6320a48c2',NULL,'1aac0a9c-efb5-41b9-9e62-a97682e38ca6',1,1,NULL,'Rusoft','GET','a6362837-3fda-4079-bc1f-4fb892f0260e','rusoft-get',1704722804185,NULL,0),('1da8ef53-8add-4738-b446-9bfa9dde2a3e','chona.22.04.1993@gmail.com','chona.22.04.1993@gmail.com',1,1,NULL,'Juan Ignacio','ALBERDI','a6362837-3fda-4079-bc1f-4fb892f0260e','20375405688',1683209393299,NULL,0),('1f7d61c3-e1b1-414e-8323-241e8e016c96',NULL,'b0526e70-26d4-49c7-9eec-7cfc7f593a73',1,1,NULL,'','','a6362837-3fda-4079-bc1f-4fb892f0260e','sebastian.starck',1706698578911,NULL,0),('1fa20ccb-2466-4d41-9741-b1045f578d5c','mario.garcia@vicentelopez.gov.ar','mario.garcia@vicentelopez.gov.ar',1,1,NULL,'Test','User SICUV','a6362837-3fda-4079-bc1f-4fb892f0260e','20555555555',1696516769405,NULL,0),('2420560f-3397-4907-8a9d-fa0978c2e4bb','maximomagaldi@vicentelopez.gov.ar','maximomagaldi@vicentelopez.gov.ar',0,1,NULL,'TEST','MÁXIMO','a6362837-3fda-4079-bc1f-4fb892f0260e','99999999999',1716920827552,NULL,0),('2472413f-a1e5-413d-a8bd-a4a44f45957e','fernanda.rousseau@vicentelopez.gov.ar','fernanda.rousseau@vicentelopez.gov.ar',1,1,NULL,'Maria Fernanda','ROUSSEAU','a6362837-3fda-4079-bc1f-4fb892f0260e','27242931462',1683215928256,NULL,0),('29e7ed38-fbf2-4610-bea6-810be8433bbd','valeria.bellino@vicentelopez.gov.ar','valeria.bellino@vicentelopez.gov.ar',1,1,NULL,'Valeria','BELLINO','a6362837-3fda-4079-bc1f-4fb892f0260e','27324371007',1683209494931,NULL,0),('2f1b8435-7f26-4103-9000-49f0fafa7c4b','mirtha.montiel@vicentelopez.gov.ar','mirtha.montiel@vicentelopez.gov.ar',1,1,NULL,'Mirtha Zulema','MONTIEL','a6362837-3fda-4079-bc1f-4fb892f0260e','27169736834',1684261488438,NULL,0),('3243d9c5-5b55-4a49-838e-3472315ff83b','marisamazzonibon@gmail.com','marisamazzonibon@gmail.com',1,1,NULL,'Marisa Nilda','MAZZONI','a6362837-3fda-4079-bc1f-4fb892f0260e','27215380349',1683808019178,NULL,0),('342231af-f5f1-4a2a-80da-990e7a7fe77d','gdufourc@anbem.com','gdufourc@anbem.com',1,1,NULL,'nombre_test','apellido_test','a6362837-3fda-4079-bc1f-4fb892f0260e','20112223344',1692197736479,NULL,0),('36f2163a-5667-40a2-8213-31cf2a37ec6a','giuliana@os.city','giuliana@os.city',1,1,NULL,'Giuliana Antonella','ALGARAÑA','a6362837-3fda-4079-bc1f-4fb892f0260e','27372359647',1684254994811,NULL,0),('3900c4e2-8f89-4e7d-acca-bb37c46de779','rjimenez@diphot.com','rjimenez@diphot.com',1,1,NULL,'Test','Test','a6362837-3fda-4079-bc1f-4fb892f0260e','20112223335',1709224704741,NULL,0),('3912d048-5887-4f80-a675-6acaa235e0eb','valenqpr47@hotmail.com','valenqpr47@hotmail.com',1,1,NULL,'Valentin Ivan','IRIBARREN','a6362837-3fda-4079-bc1f-4fb892f0260e','20438738836',1683136708091,NULL,0),('39d1ff0e-7bba-4717-9f16-a18f4b49df92','gabriel.neumann@vicentelopez.gov.ar','gabriel.neumann@vicentelopez.gov.ar',1,1,NULL,'Gabriel','Neumann','20b6c21c-504d-4f91-96b2-fd3dfbff4203','gabriel.neumann',1676296102580,NULL,0),('4565e2ea-fd60-46f4-8b4f-7f27770266a7','francisco.minali@vicentelopez.gov.ar','francisco.minali@vicentelopez.gov.ar',1,1,NULL,'Francisco Luciano','MINALI','a6362837-3fda-4079-bc1f-4fb892f0260e','20385259299',1684761341934,NULL,0),('4eb1fd8b-315b-43e3-95b1-c64f7a4ffd3e','delfina.encalda@vicentelopez.gov.ar','delfina.encalda@vicentelopez.gov.ar',0,1,NULL,'Delfina Mariana','ENCALADA DEMITTI','a6362837-3fda-4079-bc1f-4fb892f0260e','27429519840',1684756094315,NULL,0),('4fb4b408-e2ac-43bd-8ccc-f8a613a8484a','gabriel.neumann@gmail.com','gabriel.neumann@gmail.com',1,1,NULL,'Gabriel','NEUMANN','a6362837-3fda-4079-bc1f-4fb892f0260e','20226547151',1684416441252,NULL,0),('5065a3a5-365a-4ff8-9bff-85e461298cef','pablo.cd37@gmail.com','pablo.cd37@gmail.com',1,1,NULL,'Pablo Daniel','COVI','a6362837-3fda-4079-bc1f-4fb892f0260e','20310608476',1685979907403,NULL,0),('50fabba9-3ea6-49f8-a1f5-d24ccd3aa5e1',NULL,'9e7ae4d5-6caf-4cfd-ad75-612d86b3b7bf',1,1,NULL,'','','a6362837-3fda-4079-bc1f-4fb892f0260e','buv_sat',1679435643582,NULL,0),('53decf0c-d8fd-4ff9-9f51-049737b756da',NULL,'79091d8b-9c68-4409-b8e1-7c59e184b0f7',1,1,NULL,'Starck','GET','a6362837-3fda-4079-bc1f-4fb892f0260e','starck-get',1706805469192,NULL,0),('557fc54a-86ad-4fc8-a92f-8de7f2f0cbb4',NULL,'ff90037d-f9c8-44ed-b22e-63919a6f0941',1,1,NULL,'','','a6362837-3fda-4079-bc1f-4fb892f0260e','buv_crm',1693320191630,NULL,0),('569a6e88-4036-4d8e-b0f0-d7e5d5f682aa','mariiotomas16@hotmail.com','mariiotomas16@hotmail.com',1,1,NULL,'Test','User no SICUV','a6362837-3fda-4079-bc1f-4fb892f0260e','20112223333',1696516677868,NULL,0),('57a28bc5-ea29-4ea8-b35e-c083089e8c82','ivan@os.city','ivan@os.city',0,1,NULL,'OS City','Prueba','a6362837-3fda-4079-bc1f-4fb892f0260e','00000000000',1674761277165,NULL,0),('61686a39-6b06-405e-9dfb-d8e26c69d8ab','miguel@diphot.com','miguel@diphot.com',1,1,NULL,'','','a6362837-3fda-4079-bc1f-4fb892f0260e','test-diphot',1704460132476,NULL,0),('63f19567-774c-4bf3-9e4c-0a6e7630e7ac','sebastian99@starck.im','sebastian99@starck.im',0,1,NULL,'Test','Test','a6362837-3fda-4079-bc1f-4fb892f0260e','20112223340',1708367114066,NULL,0),('654aba66-df2c-410b-8819-0d03d9aca461','matias.salimbene@gmail.com','matias.salimbene@gmail.com',0,1,NULL,'Test','User Stark','a6362837-3fda-4079-bc1f-4fb892f0260e','20223334440',1697630524887,NULL,0),('686fad5a-0d9a-4df9-8e44-e3249d7e36b8',NULL,'70a17733-015e-435a-be09-195bd9a90746',1,1,NULL,'','','a6362837-3fda-4079-bc1f-4fb892f0260e','buv_mesa_digital',1679435544566,NULL,0),('6e7da6a2-3626-46d5-9df8-ca9bb179a86e',NULL,'cc1a67ef-9436-490e-969e-282ebf2591d8',0,1,NULL,NULL,NULL,'a6362837-3fda-4079-bc1f-4fb892f0260e','service-account-vlo_rusoft_czxes8o98yo6tmfv',1675965685662,'d0cdeacb-905c-4879-bb48-4595fdd3969d',0),('78df3168-6fde-4783-af0b-0c9e67ed1924','aguspen1999@gmail.com','aguspen1999@gmail.com',1,1,NULL,'Agustín','PENZOTTI','a6362837-3fda-4079-bc1f-4fb892f0260e','20422800213',1683304359384,NULL,0),('794fba61-c2f8-429a-90e9-9b972399c7df','gabriel.neumann@gmail.com','gabriel.neumann@gmail.com',1,1,NULL,'Gabriel','Neumann','20b6c21c-504d-4f91-96b2-fd3dfbff4203','admin',1671216625045,NULL,0),('7a3c889d-f872-408a-aeec-f39abd7c6fe8','roberto.vaccaro@qkstudio.com','roberto.vaccaro@qkstudio.com',1,1,NULL,'Roberto','Vaccaro','a6362837-3fda-4079-bc1f-4fb892f0260e','20318201324',1672685054215,NULL,0),('7ff9a958-a172-41f4-9af1-12ffeb6b5730',NULL,'06ab23b8-bf9c-48de-a3b1-fb8dd010930e',1,1,NULL,'','','a6362837-3fda-4079-bc1f-4fb892f0260e','oscity-admin',1678987889602,NULL,0),('86fd24d8-e964-43bd-8607-5f24e95a0184','analia.politi@vicentelopez.gov.ar','analia.politi@vicentelopez.gov.ar',1,1,NULL,'Analía Verónica','POLITI','a6362837-3fda-4079-bc1f-4fb892f0260e','27233515480',1683216464538,NULL,0),('87595d73-a378-4a35-a98d-399af37570b4','ipastore@lumile.com.ar','ipastore@lumile.com.ar',1,1,NULL,'Ileana Gabriela','PASTORE','a6362837-3fda-4079-bc1f-4fb892f0260e','27226050502',1683215137139,NULL,0),('89ed8bb3-8688-4f8c-b53f-ad9b216e179b',NULL,'fa5eb23d-bed6-4f5e-8f68-8aec4a74c656',0,1,NULL,'Juan Prueba','Prueba Prueba','a6362837-3fda-4079-bc1f-4fb892f0260e','23112223339',1723229155122,NULL,0),('8e75a67e-1d4c-47e4-abad-c82fe429d0fb','vercecconi@yahoo.com.ar','vercecconi@yahoo.com.ar',1,1,NULL,'Veronica','CECCONI','a6362837-3fda-4079-bc1f-4fb892f0260e','27302921720',1683564899446,NULL,0),('92e0b432-4f59-4966-8ee0-d52cc5253378','maximo.magaldi@vicentelopez.gov.ar','maximo.magaldi@vicentelopez.gov.ar',1,1,NULL,'ma','ximo','a6362837-3fda-4079-bc1f-4fb892f0260e','20445545180',1696527914830,NULL,0),('a84b94ec-c7bb-4942-8ff4-f158b78c70f4','gisellepedreira@gmail.com','gisellepedreira@gmail.com',0,1,NULL,'JOSE BLAS','DI MARTINO','a6362837-3fda-4079-bc1f-4fb892f0260e','23055781079',1723227111994,NULL,0),('aa4c22da-bb49-44ea-9955-d5d20bab750b','lautaro_bocchio@rusoft.com.ar','lautaro_bocchio@rusoft.com.ar',1,1,NULL,'Lautaro Martin','BOCCHIO','a6362837-3fda-4079-bc1f-4fb892f0260e','20444868237',1683134464210,NULL,1688497266),('ad1940ca-3581-452d-87ad-fc70156b4848','marcelodri@hotmail.com','marcelodri@hotmail.com',1,1,NULL,'Marcelo Agustin','DRI','a6362837-3fda-4079-bc1f-4fb892f0260e','20282817447',1684416939370,NULL,0),('ad7c8534-46f4-4d6c-bdd0-d6714a329ef9','cristian.neugebauer@vicentelopez.gov.ar','cristian.neugebauer@vicentelopez.gov.ar',1,1,NULL,'Cristián Ronaldo','NEUGEBAUER','a6362837-3fda-4079-bc1f-4fb892f0260e','24286594405',1685457452634,NULL,0),('b1a29476-a370-4acb-9105-c2c990663334','nataliamartin1794@gmail.com','nataliamartin1794@gmail.com',1,1,NULL,'Natalia','MARTIN','a6362837-3fda-4079-bc1f-4fb892f0260e','27380132864',1685378555285,NULL,0),('bd3c3d69-f9a7-4fdb-bf00-954733e053be',NULL,'0c97848c-972b-43d0-9e27-30c591088b39',1,1,NULL,'','','a6362837-3fda-4079-bc1f-4fb892f0260e','buv-admin',1671693476391,NULL,0),('be92b554-1b38-495e-a4d9-0616e82b0adb','marcelodri80@gmailll.com','marcelodri80@gmailll.com',0,1,NULL,'Marcelo','Gonzalez','a6362837-3fda-4079-bc1f-4fb892f0260e','2028281745',1712863154379,NULL,0),('c3da0664-3dd3-4e1e-ac0d-d284bcad0fc7',NULL,'45d7bc6f-f01b-4524-94f2-28c81559a0dd',1,1,NULL,'Munidigital cliente get','','a6362837-3fda-4079-bc1f-4fb892f0260e','munidigital-get',1719258495382,NULL,0),('c980985a-1173-4edd-b3af-7ae97327a461','riat87@gmail.com','riat87@gmail.com',1,1,NULL,'Cesar Raul','RIAT','a6362837-3fda-4079-bc1f-4fb892f0260e','20331381013',1683209428123,NULL,0),('cb247a8b-9550-4f7d-963a-f49549c66538','ivan+afip@os.city','ivan+afip@os.city',1,1,NULL,'KSUPA','KO ATURRUAS KPSKS','a6362837-3fda-4079-bc1f-4fb892f0260e','24035245304',1686330766732,NULL,0),('cba8d48f-2895-4007-9293-3e1b0abeb732','sebastian@starck.im','sebastian@starck.im',1,1,NULL,'Test','Test','a6362837-3fda-4079-bc1f-4fb892f0260e','20112223341',1708367366443,NULL,0),('cce2cc8e-86d7-4604-b940-abb80111c5b5',NULL,'4f0364b2-c168-4465-b3b4-795ada38455f',0,1,NULL,'','','a6362837-3fda-4079-bc1f-4fb892f0260e','90',1675889965879,NULL,0),('cd7bf83b-0d14-420e-b285-e62969434153','markey-prueba@markey.com','markey-prueba@markey.com',1,1,NULL,'Markey','Prueba','a6362837-3fda-4079-bc1f-4fb892f0260e','markey-prueba',1674038563231,NULL,0),('cffee809-37fe-4979-9451-de65e72e6d92','fedegt+vl@gmail.com','fedegt+vl@gmail.com',1,1,NULL,'nombre_test','apellido_test','a6362837-3fda-4079-bc1f-4fb892f0260e','20112223334',1691765508759,NULL,0),('d348b562-d9cb-4d47-8926-61d1ed6b159d','denisandrea@hotmail.com','denisandrea@hotmail.com',1,1,NULL,'Andrea','Denis','a6362837-3fda-4079-bc1f-4fb892f0260e','denisandrea@hotmail.com',1678382324542,NULL,0),('df9b4090-877f-456b-bfce-967c0b4c42e5',NULL,'81e0995c-0a60-4eca-81ca-3a140483f3ee',0,1,NULL,'','','a6362837-3fda-4079-bc1f-4fb892f0260e','usuario-falso-get',1704724071521,NULL,0),('e0501332-adc7-4fc8-a89f-d1ed02128750','damian.tiscornia@vicentelopez.gov.ar','damian.tiscornia@vicentelopez.gov.ar',0,1,NULL,'Damian Gabriel','TISCORNIA','a6362837-3fda-4079-bc1f-4fb892f0260e','20222125317',1683557194722,NULL,0),('e0b463ea-71ed-44d3-b1a9-dd7713047c42','marcelo.dri@vicentelopez.gov.ar','marcelo.dri@vicentelopez.gov.ar',1,1,NULL,'Alessandro','SARTINI','a6362837-3fda-4079-bc1f-4fb892f0260e','20386054119',1684848504754,NULL,0),('eddf377e-b9b8-4101-b2dd-57d0dda9ed91','pablo@lumile.com.ar','pablo@lumile.com.ar',1,1,NULL,'Pablo','Castillo','20b6c21c-504d-4f91-96b2-fd3dfbff4203','lumile',1674831177351,NULL,0),('f42b03a3-677e-4032-a40e-e125e386dfe4','manuabrilchab@gmail.com','manuabrilchab@gmail.com',1,1,NULL,'Manuel','ABRIL','a6362837-3fda-4079-bc1f-4fb892f0260e','20432457118',1684348061715,NULL,0),('f7a4de10-984f-45bd-9438-1de26f714b7f','emiliano.rossi@vicentelopez.gov.ar','emiliano.rossi@vicentelopez.gov.ar',0,1,NULL,'Emiliano Hernán','ROSSI','a6362837-3fda-4079-bc1f-4fb892f0260e','20365950440',1683732137650,NULL,0),('f9976153-fdae-45a7-8286-f4ea351a3d73',NULL,'0ada20b8-97f5-49f1-9a06-a447cdb491ab',1,1,NULL,'Usuario ','De prueba','a6362837-3fda-4079-bc1f-4fb892f0260e','20123456789',1673524785585,NULL,0),('fb9773f3-3d20-4ded-b613-b71a8837ddfb','patricia_abalos@hotmail.com','patricia_abalos@hotmail.com',0,1,NULL,'Patricia Monica','ABALOS','a6362837-3fda-4079-bc1f-4fb892f0260e','27226538165',1684418535265,NULL,0),('fdb3f5f7-2d2f-44ec-846f-f60f3ddd2ca5','gadeap@hotmail.com','gadeap@hotmail.com',0,1,NULL,'Hilda Patricia','Gadea','a6362837-3fda-4079-bc1f-4fb892f0260e','27141890986',1704393197898,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
INSERT INTO `USER_REQUIRED_ACTION` VALUES ('0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c','UPDATE_PASSWORD'),('1315ec80-bf51-4c47-8238-f3be4fee30e5','UPDATE_PASSWORD'),('50fabba9-3ea6-49f8-a1f5-d24ccd3aa5e1','UPDATE_PASSWORD'),('686fad5a-0d9a-4df9-8e44-e3249d7e36b8','UPDATE_PASSWORD');
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('0ba80dc3-3952-4ab5-aeb1-d470383c89af','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('0c7c36b9-d7c6-4fa4-b3f1-f8ef924b7a36','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('0c7c36b9-d7c6-4fa4-b3f1-f8ef924b7a36','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('0c7c36b9-d7c6-4fa4-b3f1-f8ef924b7a36','794fba61-c2f8-429a-90e9-9b972399c7df'),('0eb808bc-63b1-4e91-b379-197391b5d693','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('0eb808bc-63b1-4e91-b379-197391b5d693','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('0fa385fe-a377-4b82-adfa-11d4396c000b','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('0fa385fe-a377-4b82-adfa-11d4396c000b','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('0fd65ced-0dd8-45d4-85b7-2070b141b76b','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('1041ca36-cad2-4ca0-a7a2-d1867b9dc89e','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('10bb56c1-81fc-4010-93d8-abf49b0a891f','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('1266d884-1b9f-4734-bfec-037dcb7f9f12','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('1266d884-1b9f-4734-bfec-037dcb7f9f12','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('127ba3a0-9793-4a8f-aa22-6901ef2a565c','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('13f3b614-3f73-4f12-9bc0-e3cea6001158','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('16e22ec5-1cef-48f2-b9af-c96fd21cfaf8','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('16e22ec5-1cef-48f2-b9af-c96fd21cfaf8','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('1c47767d-adf1-4f32-a8d2-4af563295583','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('1c47767d-adf1-4f32-a8d2-4af563295583','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('1c47767d-adf1-4f32-a8d2-4af563295583','794fba61-c2f8-429a-90e9-9b972399c7df'),('21d4eea0-497a-451b-979f-999ee108adad','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('21d4eea0-497a-451b-979f-999ee108adad','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('2405eeb1-a4f5-4321-93a6-8d2f8f7ecf5f','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('2405eeb1-a4f5-4321-93a6-8d2f8f7ecf5f','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('2405eeb1-a4f5-4321-93a6-8d2f8f7ecf5f','794fba61-c2f8-429a-90e9-9b972399c7df'),('30369298-ec2f-4c6b-846c-542bd5e451ed','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('30369298-ec2f-4c6b-846c-542bd5e451ed','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('30369298-ec2f-4c6b-846c-542bd5e451ed','794fba61-c2f8-429a-90e9-9b972399c7df'),('357cdc4c-d4da-431c-a10a-cc25ec39f1da','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('357cdc4c-d4da-431c-a10a-cc25ec39f1da','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('357cdc4c-d4da-431c-a10a-cc25ec39f1da','794fba61-c2f8-429a-90e9-9b972399c7df'),('366b1de5-a859-4aab-a341-af484d3b4c65','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('366b1de5-a859-4aab-a341-af484d3b4c65','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('366b1de5-a859-4aab-a341-af484d3b4c65','794fba61-c2f8-429a-90e9-9b972399c7df'),('36af5873-9d8c-471b-b809-cd425757762e','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('426cd661-6ffb-411f-a8ab-7510acdc8ae5','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('426cd661-6ffb-411f-a8ab-7510acdc8ae5','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('4566a386-eb3f-4f26-a89c-2d3a15760b39','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('47088402-9773-4ff4-b2cd-5879ae7dc3ef','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('47088402-9773-4ff4-b2cd-5879ae7dc3ef','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('47088402-9773-4ff4-b2cd-5879ae7dc3ef','794fba61-c2f8-429a-90e9-9b972399c7df'),('4b2b88a2-ae05-4e22-97e3-84af3e84d938','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','794fba61-c2f8-429a-90e9-9b972399c7df'),('4bfcd30d-ee14-4d0b-a812-08f5bb316477','eddf377e-b9b8-4101-b2dd-57d0dda9ed91'),('51af51c1-dd9c-4d2a-aea0-e34171c8a3c2','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('51af51c1-dd9c-4d2a-aea0-e34171c8a3c2','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('528f143b-c794-4a16-a433-5ced0c2d1c1b','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('528f143b-c794-4a16-a433-5ced0c2d1c1b','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('548713d4-8147-40f1-8877-fd84f3ac19b8','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('5b0600e7-4f81-403f-b420-8691b7d4729e','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('5b0600e7-4f81-403f-b420-8691b7d4729e','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('5b0600e7-4f81-403f-b420-8691b7d4729e','794fba61-c2f8-429a-90e9-9b972399c7df'),('5cee7b73-d477-4d48-98ae-0d2fa661cb8d','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('5cee7b73-d477-4d48-98ae-0d2fa661cb8d','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('5da35329-9120-493a-84f4-a40653d66b9b','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('64ad5086-873b-431d-a12d-f9650a4c9205','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('64ad5086-873b-431d-a12d-f9650a4c9205','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('650e04a3-e9ad-4580-b7f7-3aa5abf4fc48','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('650e04a3-e9ad-4580-b7f7-3aa5abf4fc48','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('681da8f4-89db-4dee-8453-c4d82a2046f6','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('681da8f4-89db-4dee-8453-c4d82a2046f6','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('6c8ce33a-6df2-4426-91fd-231804a8ae5b','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('6c8ce33a-6df2-4426-91fd-231804a8ae5b','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('6edee55e-2f26-4c2c-a089-a17946818170','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('70793dd1-b815-43a9-a9f4-fb05420bbad3','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('72e01e94-651d-4b03-b4d0-6b716c574ae3','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','04193736-41b3-4b59-81e5-40cafb81ed09'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','11630e4d-0eac-40e9-96e1-fd489ecfa49c'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','1315ec80-bf51-4c47-8238-f3be4fee30e5'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','1527fb6c-da4f-47fd-80dc-e1c16c856c70'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','1940f269-513a-49bb-a18a-028c6abdd350'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','19b3fd04-9916-4fea-80f1-5222ea73871f'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','1a899fbf-ea97-4810-b6c7-85f6320a48c2'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','1da8ef53-8add-4738-b446-9bfa9dde2a3e'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','1f7d61c3-e1b1-414e-8323-241e8e016c96'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','1fa20ccb-2466-4d41-9741-b1045f578d5c'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','2420560f-3397-4907-8a9d-fa0978c2e4bb'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','2472413f-a1e5-413d-a8bd-a4a44f45957e'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','29e7ed38-fbf2-4610-bea6-810be8433bbd'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','2f1b8435-7f26-4103-9000-49f0fafa7c4b'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','3243d9c5-5b55-4a49-838e-3472315ff83b'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','342231af-f5f1-4a2a-80da-990e7a7fe77d'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','36f2163a-5667-40a2-8213-31cf2a37ec6a'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','3900c4e2-8f89-4e7d-acca-bb37c46de779'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','3912d048-5887-4f80-a675-6acaa235e0eb'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','4565e2ea-fd60-46f4-8b4f-7f27770266a7'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','4eb1fd8b-315b-43e3-95b1-c64f7a4ffd3e'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','4fb4b408-e2ac-43bd-8ccc-f8a613a8484a'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','5065a3a5-365a-4ff8-9bff-85e461298cef'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','50fabba9-3ea6-49f8-a1f5-d24ccd3aa5e1'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','53decf0c-d8fd-4ff9-9f51-049737b756da'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','569a6e88-4036-4d8e-b0f0-d7e5d5f682aa'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','57a28bc5-ea29-4ea8-b35e-c083089e8c82'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','61686a39-6b06-405e-9dfb-d8e26c69d8ab'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','63f19567-774c-4bf3-9e4c-0a6e7630e7ac'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','654aba66-df2c-410b-8819-0d03d9aca461'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','686fad5a-0d9a-4df9-8e44-e3249d7e36b8'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','6e7da6a2-3626-46d5-9df8-ca9bb179a86e'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','78df3168-6fde-4783-af0b-0c9e67ed1924'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','7a3c889d-f872-408a-aeec-f39abd7c6fe8'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','7ff9a958-a172-41f4-9af1-12ffeb6b5730'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','86fd24d8-e964-43bd-8607-5f24e95a0184'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','87595d73-a378-4a35-a98d-399af37570b4'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','89ed8bb3-8688-4f8c-b53f-ad9b216e179b'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','8e75a67e-1d4c-47e4-abad-c82fe429d0fb'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','92e0b432-4f59-4966-8ee0-d52cc5253378'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','a84b94ec-c7bb-4942-8ff4-f158b78c70f4'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','aa4c22da-bb49-44ea-9955-d5d20bab750b'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','ad1940ca-3581-452d-87ad-fc70156b4848'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','ad7c8534-46f4-4d6c-bdd0-d6714a329ef9'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','b1a29476-a370-4acb-9105-c2c990663334'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','be92b554-1b38-495e-a4d9-0616e82b0adb'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','c3da0664-3dd3-4e1e-ac0d-d284bcad0fc7'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','c980985a-1173-4edd-b3af-7ae97327a461'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','cb247a8b-9550-4f7d-963a-f49549c66538'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','cba8d48f-2895-4007-9293-3e1b0abeb732'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','cce2cc8e-86d7-4604-b940-abb80111c5b5'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','cd7bf83b-0d14-420e-b285-e62969434153'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','cffee809-37fe-4979-9451-de65e72e6d92'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','d348b562-d9cb-4d47-8926-61d1ed6b159d'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','df9b4090-877f-456b-bfce-967c0b4c42e5'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','e0501332-adc7-4fc8-a89f-d1ed02128750'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','e0b463ea-71ed-44d3-b1a9-dd7713047c42'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','f42b03a3-677e-4032-a40e-e125e386dfe4'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','f7a4de10-984f-45bd-9438-1de26f714b7f'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','f9976153-fdae-45a7-8286-f4ea351a3d73'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','fb9773f3-3d20-4ded-b613-b71a8837ddfb'),('76c90cee-f03a-4bfd-8817-1e734ef40de0','fdb3f5f7-2d2f-44ec-846f-f60f3ddd2ca5'),('76db992a-c87d-488a-8133-ef7957fb2340','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('76db992a-c87d-488a-8133-ef7957fb2340','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('76db992a-c87d-488a-8133-ef7957fb2340','794fba61-c2f8-429a-90e9-9b972399c7df'),('7b22688b-d556-4787-aa46-7d81e3655092','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('7b22688b-d556-4787-aa46-7d81e3655092','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('7bf43570-7e75-4604-be60-6f89fc51a00a','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('7fc323e5-10e0-47ca-b6cf-c07207b5afd9','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('7fc323e5-10e0-47ca-b6cf-c07207b5afd9','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('7fc323e5-10e0-47ca-b6cf-c07207b5afd9','eddf377e-b9b8-4101-b2dd-57d0dda9ed91'),('83197cc5-1d32-4ed1-b36c-8d9252720ea6','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('83197cc5-1d32-4ed1-b36c-8d9252720ea6','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('83197cc5-1d32-4ed1-b36c-8d9252720ea6','794fba61-c2f8-429a-90e9-9b972399c7df'),('83197cc5-1d32-4ed1-b36c-8d9252720ea6','eddf377e-b9b8-4101-b2dd-57d0dda9ed91'),('836aaa33-27bb-46f2-a997-0b920c3d9b6e','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('836aaa33-27bb-46f2-a997-0b920c3d9b6e','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('836aaa33-27bb-46f2-a997-0b920c3d9b6e','794fba61-c2f8-429a-90e9-9b972399c7df'),('83cc73d0-f212-4da3-a04c-785a1726997f','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('83cc73d0-f212-4da3-a04c-785a1726997f','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('860926bd-2819-4bee-be10-4ede337fd782','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('860926bd-2819-4bee-be10-4ede337fd782','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('860926bd-2819-4bee-be10-4ede337fd782','eddf377e-b9b8-4101-b2dd-57d0dda9ed91'),('86adcde2-fac1-4fb2-b7a3-49fdc5a995b9','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('86adcde2-fac1-4fb2-b7a3-49fdc5a995b9','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('8839d830-884b-4a95-bdff-933dfacda586','1315ec80-bf51-4c47-8238-f3be4fee30e5'),('8839d830-884b-4a95-bdff-933dfacda586','1a899fbf-ea97-4810-b6c7-85f6320a48c2'),('8839d830-884b-4a95-bdff-933dfacda586','1f7d61c3-e1b1-414e-8323-241e8e016c96'),('8839d830-884b-4a95-bdff-933dfacda586','50fabba9-3ea6-49f8-a1f5-d24ccd3aa5e1'),('8839d830-884b-4a95-bdff-933dfacda586','53decf0c-d8fd-4ff9-9f51-049737b756da'),('8839d830-884b-4a95-bdff-933dfacda586','557fc54a-86ad-4fc8-a92f-8de7f2f0cbb4'),('8839d830-884b-4a95-bdff-933dfacda586','61686a39-6b06-405e-9dfb-d8e26c69d8ab'),('8839d830-884b-4a95-bdff-933dfacda586','63f19567-774c-4bf3-9e4c-0a6e7630e7ac'),('8839d830-884b-4a95-bdff-933dfacda586','686fad5a-0d9a-4df9-8e44-e3249d7e36b8'),('8839d830-884b-4a95-bdff-933dfacda586','7ff9a958-a172-41f4-9af1-12ffeb6b5730'),('8839d830-884b-4a95-bdff-933dfacda586','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('8839d830-884b-4a95-bdff-933dfacda586','c3da0664-3dd3-4e1e-ac0d-d284bcad0fc7'),('88ce5326-6826-4c48-b53e-781c5037b48b','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('8a08ac22-e3f4-4621-b708-1d7457b29fb7','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('8cde1e0f-2419-42d7-b1c8-d791f0f89131','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('8e0b900a-8eb0-457e-aad3-569d95a3bd94','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('8e0b900a-8eb0-457e-aad3-569d95a3bd94','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('9359c600-8be2-43ac-b6b9-5e051c122312','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('99c95647-a99a-4a13-a1b4-0a4f2952a927','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('99c9e6dd-482e-43d7-8140-d7a381affc29','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('99c9e6dd-482e-43d7-8140-d7a381affc29','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('a24dc662-1c12-486c-9187-dad992c7bd86','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('a24dc662-1c12-486c-9187-dad992c7bd86','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('a69f7be8-41e8-463f-b7af-564b527b9663','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('a69f7be8-41e8-463f-b7af-564b527b9663','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('ad3335cd-becc-4fea-9633-c20cdbcf4a70','557fc54a-86ad-4fc8-a92f-8de7f2f0cbb4'),('ad3335cd-becc-4fea-9633-c20cdbcf4a70','7ff9a958-a172-41f4-9af1-12ffeb6b5730'),('ad3335cd-becc-4fea-9633-c20cdbcf4a70','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('adcd8718-a69d-41ee-a698-955bc30e9cd2','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('af0cbf63-fbee-44ce-80a4-38e017f6c53d','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('af0cbf63-fbee-44ce-80a4-38e017f6c53d','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('af0cbf63-fbee-44ce-80a4-38e017f6c53d','794fba61-c2f8-429a-90e9-9b972399c7df'),('b038d0cb-5c43-4e01-b6b6-7740bf01de0f','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('b2f594f3-ddb1-42f5-9c74-80077f2a2bc5','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('b2f594f3-ddb1-42f5-9c74-80077f2a2bc5','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('b3c12c7d-f0c1-4b3e-83b5-8371fd940548','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('b3c12c7d-f0c1-4b3e-83b5-8371fd940548','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('b3c12c7d-f0c1-4b3e-83b5-8371fd940548','794fba61-c2f8-429a-90e9-9b972399c7df'),('b6df00dc-9405-4774-913f-4015807f054d','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('b6df00dc-9405-4774-913f-4015807f054d','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('b9a675fb-4a84-4474-a13a-e3d3a945b246','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('bb9f3abd-7b2a-4e32-a9e5-39f5e3160020','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('bb9f3abd-7b2a-4e32-a9e5-39f5e3160020','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('bb9f3abd-7b2a-4e32-a9e5-39f5e3160020','eddf377e-b9b8-4101-b2dd-57d0dda9ed91'),('bc3d5359-45a7-4dec-90d0-308c5554da13','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('bc3d5359-45a7-4dec-90d0-308c5554da13','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('bc3d5359-45a7-4dec-90d0-308c5554da13','794fba61-c2f8-429a-90e9-9b972399c7df'),('bcd9f23b-8026-4c4b-8250-58e1df799f2f','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('c69bccbe-c38a-48da-af47-b4aded240782','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('c69bccbe-c38a-48da-af47-b4aded240782','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('cb1dc963-9b8b-4cc2-a8d6-f5f4b67f5f52','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('cb1dc963-9b8b-4cc2-a8d6-f5f4b67f5f52','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('d0f00303-f083-43e4-851f-29081e2e4a7f','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('d0f00303-f083-43e4-851f-29081e2e4a7f','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('d0f00303-f083-43e4-851f-29081e2e4a7f','794fba61-c2f8-429a-90e9-9b972399c7df'),('d3cf4a42-bbd2-49c9-984d-88dd07deb218','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('d412e950-b10b-4a92-9428-5d7c67c33f31','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('d412e950-b10b-4a92-9428-5d7c67c33f31','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('d412e950-b10b-4a92-9428-5d7c67c33f31','794fba61-c2f8-429a-90e9-9b972399c7df'),('d663bb49-4a64-44cd-ba95-c208e6f70b38','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('d73e7b3c-8b29-4416-b029-8d7af9aca08d','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('d8eec3d0-eb58-47a4-883e-fed22a05b521','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('d8eec3d0-eb58-47a4-883e-fed22a05b521','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('d91f2680-e786-490d-a3e1-fa80513c01d2','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('d91f2680-e786-490d-a3e1-fa80513c01d2','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('d91f2680-e786-490d-a3e1-fa80513c01d2','794fba61-c2f8-429a-90e9-9b972399c7df'),('de793237-6ad7-433c-a6ff-b84d31aa032d','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('de793237-6ad7-433c-a6ff-b84d31aa032d','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('de793237-6ad7-433c-a6ff-b84d31aa032d','794fba61-c2f8-429a-90e9-9b972399c7df'),('e28bcb99-0b30-4983-991b-7feef5f54651','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('ec5f4e10-cfa3-4d64-92f6-128ff2e45319','557fc54a-86ad-4fc8-a92f-8de7f2f0cbb4'),('ec5f4e10-cfa3-4d64-92f6-128ff2e45319','7ff9a958-a172-41f4-9af1-12ffeb6b5730'),('ec5f4e10-cfa3-4d64-92f6-128ff2e45319','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('f1c836ef-37f7-4b4e-a3b7-ec13b9858ca6','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('f1c836ef-37f7-4b4e-a3b7-ec13b9858ca6','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('f2dddf86-9d55-4597-9ade-b4af91ef3f09','bd3c3d69-f9a7-4fdb-bf00-954733e053be'),('f7cd8b2d-18ec-4a34-b332-10b8acdaa9f0','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('f7cd8b2d-18ec-4a34-b332-10b8acdaa9f0','39d1ff0e-7bba-4717-9f16-a18f4b49df92'),('f8ec931c-cb98-48b6-a3fd-21e750ff4798','0053e3a5-8f26-41e2-bbcd-b6f798a0ce2c'),('f8ec931c-cb98-48b6-a3fd-21e750ff4798','39d1ff0e-7bba-4717-9f16-a18f4b49df92');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` tinyint(1) NOT NULL DEFAULT '0',
  `STARTED` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int(11) DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://15.228.204.194'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://15.228.204.194/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://dev-mod-iis02.vicentelopez.gov.ar/DeportesPublic*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://dev-mod-web09.vicentelopez.gov.ar/sicuv/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://dev-sip-web02.vicentelopez.gov.ar:3001'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://dev-sip-web02.vicentelopez.gov.ar:8080'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://localhost:3000/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://localhost:7069/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://localhost:8000/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://localhost:8000/login/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://localhost:8005/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','http://tst-mod-web03.vicentelopez.gov.ar/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://15.228.204.194/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://auth-oscity.firebaseapp.com/__/auth/handler'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://demos.citymis.co/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://dev-deportes.vicentelopez.gov.ar'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://dev-deportes.vicentelopez.gov.ar/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://dev-deportes.vicentelopez.gov.ar/mibarriovecinos/Account/Logoff'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://dev-deportes.vicentelopez.gov.ar/mibarriovecinos/Account/MvlId*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://dev-mod-iis02.vicentelopez.gov.ar/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://identidaddigital.vicentelopez.gov.ar'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://identidaddigital.vicentelopez.gov.ar/__/auth/handler'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://localhost:8001/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://localhost:8005/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://openid-gw-iipp.vicentelopez.gov.ar/login/callback'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://openidconnect.net/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://os-arg-vicente-lopez.firebaseapp.com/__/auth/handler'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://prd-sip-web06.vicentelopez.gov.ar:3000/login/callback/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','https://prepro-tad.vicentelopez.gov.ar/*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','vlmibarrio://vicentelopez.gov.ar*'),('066f2a02-3f96-4cfa-9fd7-e295eddedc51','vlmibarrio://vicentelopez.gov.ar/*'),('2d4dec4c-0c3e-4b94-a2a1-6e68ccf8eaf1','http://localhost:8000'),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','vlmibarrio://vicentelopez.gov.ar'),('47e776b8-8a0a-4ab2-8e1b-5155c4ff43c7','vlmibarrio://vicentelopez.gov.ar/*'),('50a61bff-3ecb-4b8a-8461-42f81212550d','https://dev-deportes.vicentelopez.gov.ar/*'),('50a61bff-3ecb-4b8a-8461-42f81212550d','https://dev-deportes.vicentelopez.gov.ar/mibarriovecinos/Account/MvlId*'),('605b2748-d68d-4296-bb07-5f1f693dc27a','http://localhost:8000'),('7d98848c-daa6-4508-a519-eb348ba3c055','https://testing2.diphot.com.ar/vl-presupuesto-participativo/auth/keycloak/callback'),('7e166491-3e57-4d03-ae88-b175cc6dc202','http://localhost:3000'),('7e166491-3e57-4d03-ae88-b175cc6dc202','http://localhost:5050'),('7e166491-3e57-4d03-ae88-b175cc6dc202','https://prepro-tad.vicentelopez.gov.ar'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','http://18.229.123.224/*'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','http://localhost:8005/'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','http://localhost:8005/*'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','https://18.229.123.224/*'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','https://empleo.vicentelopez.gov.ar/*'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','https://empleo.vicentelopez.gov.ar/login/sso/redirect*'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','https://localhost:8005/*'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','https://localhost:8005/login/sso'),('b4cd395b-6b9b-4930-b7bc-4ec1540a692f','https://localhost:8005/login/sso/*'),('d48e5aa3-9a0a-4e3b-b8b3-236114df7301','+'),('fda74549-8bda-4d87-8fe4-632f1c8f8a3c','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buv_data`
--

DROP TABLE IF EXISTS `buv_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buv_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` text NOT NULL,
  `id_oscity` text,
  `apellido` text,
  `celular` text,
  `coordenadas` text,
  `correoElectronico` text,
  `deptounidad` text,
  `direccion` text,
  `fechaDeCreacion` date DEFAULT NULL,
  `fechaDeNacimiento` date DEFAULT NULL,
  `fechaDefuncion` date DEFAULT NULL,
  `fechaModificacion` date DEFAULT NULL,
  `genero` text,
  `nacionalidad` text,
  `nombre` text,
  `numeroDocumento` text,
  `piso` text,
  `plataforma` text,
  `secretaria` text,
  `sexo` text,
  `telefono` text,
  `telefonoLaboral` text,
  `tipoDeDocumento` text,
  `torre` text,
  `username` text NOT NULL,
  `verificado` text,
  `cuil` text,
  `emailValidado` text,
  `nivelValidacion` text,
  `origenValidacion` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buv_data`
--

LOCK TABLES `buv_data` WRITE;
/*!40000 ALTER TABLE `buv_data` DISABLE KEYS */;
INSERT INTO `buv_data` VALUES (107,'11630e4d-0eac-40e9-96e1-fd489ecfa49c',NULL,'Blum','+54-9-11-6968-2324',NULL,'marce@info.com',NULL,NULL,NULL,NULL,NULL,NULL,'Masculino','Argentino','','16497405',NULL,NULL,NULL,'Masculino',NULL,NULL,'DNI',NULL,'20164974058',NULL,NULL,NULL,NULL,NULL,'2023-03-07 11:15:25','2023-04-28 21:40:04',NULL),(154,'aa4c22da-bb49-44ea-9955-d5d20bab750b','20444868237','BOCCHIO','011555550',NULL,'lautaro_bocchio@rusoft.com.ar','','Pozos70,3832,1653,ballester','2023-05-03','2002-10-04',NULL,'2023-05-23','M','Argentina','Lautaro Martin','44486823','',NULL,NULL,'M','2281581440',NULL,'DNI','','20444868237',NULL,NULL,NULL,'1',NULL,'2023-05-03 14:21:04','2023-05-23 11:04:27',NULL),(155,'3912d048-5887-4f80-a675-6acaa235e0eb','20438738836','IRIBARREN','',NULL,'Valenqpr47@hotmail.com','','Simon de Iriondo,1318,b1446,San Fernando ','2023-05-03','2001-12-27',NULL,NULL,'M','Argentina','Valentin Ivan','43873883','',NULL,NULL,'M','1157412498',NULL,'DNI','','20438738836',NULL,NULL,NULL,NULL,NULL,'2023-05-03 14:58:28','2023-05-03 14:58:28',NULL),(156,'1da8ef53-8add-4738-b446-9bfa9dde2a3e','20375405688','ALBERDI','',NULL,'chona.22.04.1993@gmail.com','','Av. Maipú ,2609,1416,vicentelopez','2023-05-04','1993-04-22',NULL,NULL,'M','Argentina','Juan Ignacio','37540568','',NULL,NULL,'M','1166632199',NULL,'DNI','','20375405688',NULL,NULL,NULL,NULL,NULL,'2023-05-04 11:09:53','2023-05-04 11:09:53',NULL),(157,'c980985a-1173-4edd-b3af-7ae97327a461','20331381013','RIAT','02932535435',NULL,'riat87@gmail.com','dpto 4','Azcuenaga,69,C1074AAX,Buenos aires','2023-05-04','0000-00-00',NULL,NULL,'M','Argentina','Cesar Raul','33138101','4',NULL,NULL,'M','02932535435',NULL,'DNI','','20331381013',NULL,NULL,NULL,NULL,NULL,'2023-05-04 11:10:28','2023-05-04 12:34:17',NULL),(158,'29e7ed38-fbf2-4610-bea6-810be8433bbd','27324371007','BELLINO','',NULL,'valeria.bellino@vicentelopez.gov.ar','',',,,','2023-05-04','1986-06-09',NULL,NULL,'F','Argentina','Valeria','32437100','',NULL,NULL,'F','1169828920',NULL,'DNI','','27324371007',NULL,NULL,NULL,NULL,NULL,'2023-05-04 11:11:35','2023-05-04 11:58:10',NULL),(159,'87595d73-a378-4a35-a98d-399af37570b4','27226050502','PASTORE','',NULL,'ipastore@lumile.com.ar','','Ameghino,661,1704,Ramos Mejía','2023-05-04','1972-02-18',NULL,NULL,'F','Argentina','Ileana Gabriela','22605050','',NULL,NULL,'F','541164584658',NULL,'DNI','','27226050502',NULL,NULL,NULL,NULL,NULL,'2023-05-04 12:45:37','2023-05-04 12:45:37',NULL),(160,'2472413f-a1e5-413d-a8bd-a4a44f45957e','27242931462','ROUSSEAU','',NULL,'fernanda.rousseau@vicentelopez.gov.ar','',',,,','2023-05-04','0000-00-00',NULL,'2023-05-22','F','Argentina','Maria Fernanda','24293146','',NULL,NULL,'F','1145771968',NULL,'DNI','','27242931462',NULL,NULL,NULL,'2',NULL,'2023-05-04 12:58:48','2023-05-22 15:07:16',NULL),(161,'86fd24d8-e964-43bd-8607-5f24e95a0184','27233515480','POLITI','',NULL,'analia.politi@vicentelopez.gov.ar','','OLAGUER FELIU,3696,1605,Munro','2023-05-04','1973-05-24',NULL,NULL,'F','Argentina','Analía Verónica','23351548','',NULL,NULL,'F','1158896280',NULL,'DNI','','27233515480',NULL,NULL,NULL,NULL,NULL,'2023-05-04 13:07:44','2023-05-04 13:07:44',NULL),(162,'78df3168-6fde-4783-af0b-0c9e67ed1924','20422800213','PENZOTTI','',NULL,'aguspen1999@gmail.com','','Constitución 2583,1122704706,1644,Victoria','2023-05-05','1999-11-20',NULL,NULL,'M','Argentina','Agustín','42280021','',NULL,NULL,'M','1122704706',NULL,'DNI','','20422800213',NULL,NULL,NULL,NULL,NULL,'2023-05-05 13:32:39','2023-05-05 13:32:39',NULL),(165,'e0501332-adc7-4fc8-a89f-d1ed02128750','20222125317','TISCORNIA','',NULL,'damian.tiscornia@vicentelopez.gov.ar','a','Melo ,3376,1603,Munro','2023-05-08','1971-05-07',NULL,NULL,'M','Argentina','Damian Gabriel','22212531','ph',NULL,NULL,'M','1124182217',NULL,'DNI','','20222125317',NULL,NULL,NULL,NULL,NULL,'2023-05-08 11:46:34','2023-05-08 11:46:34',NULL),(166,'8e75a67e-1d4c-47e4-abad-c82fe429d0fb','27302921720','CECCONI','',NULL,'veronica.cecconi@vicentelopez.gov.ar','Belgrano 937','Belgrano 937,,Belgrano 937,san miguel','2023-05-08','1983-06-26',NULL,NULL,'F','Argentina','Veronica','30292172','Belgrano 937',NULL,NULL,'F','01124693469',NULL,'DNI','','27302921720',NULL,NULL,NULL,NULL,NULL,'2023-05-08 13:54:59','2023-05-08 13:54:59',NULL),(170,'f7a4de10-984f-45bd-9438-1de26f714b7f','20365950440','ROSSI','',NULL,'emiliano.rossi@vicentelopez.gov.ar','','Estanislao San Zeballoa,4871,1419,Buenos Aires','2023-05-10','1991-12-13',NULL,NULL,'M','Argentina','Emiliano Hernán','36595044','',NULL,NULL,'M','1158473736',NULL,'DNI','','20365950440',NULL,NULL,NULL,NULL,NULL,'2023-05-10 12:22:17','2023-05-10 12:22:17',NULL),(172,'3243d9c5-5b55-4a49-838e-3472315ff83b','27215380349','MAZZONI','',NULL,'marisamazzonibon@gmail.com','A','Libertad,2356,1602,Florida M','2023-05-11','0000-00-00',NULL,'2023-05-23','F','Argentina','Marisa Nilda','21538034','1',NULL,NULL,'F','01169828920',NULL,'DNI','','27215380349',NULL,NULL,NULL,'1',NULL,'2023-05-11 09:26:59','2023-05-23 10:10:51',NULL),(174,'36f2163a-5667-40a2-8213-31cf2a37ec6a','27372359647','ALGARAÑA','',NULL,'giuliana@os.city','',',,,','2023-05-16','0000-00-00',NULL,'2023-05-16','F','Argentina','Giuliana Antonella','37235964','','OSCITY','OSCITY','F','2914277419',NULL,'DNI','','27372359647','true','27372359647','true','1','RENAPER','2023-05-16 13:36:34','2023-05-16 13:36:34',NULL),(175,'2f1b8435-7f26-4103-9000-49f0fafa7c4b','27169736834','MONTIEL','',NULL,'mirtha.montiel@vicentelopez.gov.ar','PA','Av maipu ,2510,1636,Olivos','2023-05-16','1964-07-09',NULL,'2023-05-16','F','Argentina','Mirtha Zulema','16973683','--------------------------------','OSCITY','OSCITY','F','4711-2800',NULL,'DNI','-----------------------------------','27169736834','true','27169736834','true','1','RENAPER','2023-05-16 15:24:48','2023-05-16 15:24:48',NULL),(176,'f42b03a3-677e-4032-a40e-e125e386dfe4','20432457118','ABRIL','',NULL,'manuabrilchab@gmail.com','','Dr eduardo madero,735,1638,Vicente Lopez','2023-05-17','2001-04-25',NULL,'2023-05-17','M','Argentina','Manuel','43245711','','OSCITY','OSCITY','M','1135601928',NULL,'DNI','','20432457118','true','20432457118','true','1','RENAPER','2023-05-17 15:27:41','2023-05-17 15:27:41',NULL),(177,'4fb4b408-e2ac-43bd-8ccc-f8a613a8484a','20226547151','NEUMANN','',NULL,'gabriel.neumann@gmail.com','','Obarrio,2039,1636,Olivos','2023-05-18','1972-03-30',NULL,'2023-05-18','M','Argentina','Gabriel','22654715','','OSCITY','OSCITY','M','1160218468',NULL,'DNI','','20226547151','true','20226547151','true','1','RENAPER','2023-05-18 10:27:21','2023-05-18 10:27:21',NULL),(178,'ad1940ca-3581-452d-87ad-fc70156b4848','20282817447','DRI','',NULL,'marcelodri@hotmail.com','','Alferez Hipólito Bouchard,2054,1636,Olivos','2023-05-18','1980-08-01',NULL,'2023-05-18','M','Argentina','Marcelo Agustin','28281744','','OSCITY','OSCITY','M','1122223333',NULL,'DNI','','20282817447','true','20282817447','true','1','RENAPER','2023-05-18 10:35:39','2023-08-15 15:18:13',NULL),(179,'fb9773f3-3d20-4ded-b613-b71a8837ddfb','27226538165','ABALOS','',NULL,'patricia_abalos@hotmail.com','B','maipu,1068,1636,olivos','2023-05-18','1972-03-13',NULL,'2023-05-18','F','Argentina','Patricia Monica','22653816','12','OSCITY','OSCITY','F','38892835',NULL,'DNI','0','27226538165','true','27226538165','true','1','RENAPER','2023-05-18 11:02:15','2023-05-18 11:02:15',NULL),(181,'4eb1fd8b-315b-43e3-95b1-c64f7a4ffd3e','27429519840','ENCALADA DEMITTI','',NULL,'delfina.encalda@vicentelopez.gov.ar','',',,,','2023-05-22','0000-00-00',NULL,'2023-05-22','F','Argentina','Delfina Mariana','42951984','','OSCITY','OSCITY','F','1121736808',NULL,'DNI','','27429519840','true','27429519840','true','1','RENAPER','2023-05-22 08:48:14','2023-05-22 08:48:14',NULL),(183,'4565e2ea-fd60-46f4-8b4f-7f27770266a7','20385259299','MINALI','',NULL,'francisco.minali@vicentelopez.gov.ar','','santa teresa,1456,1708,moron','2023-05-22','1994-10-11',NULL,'2023-05-22','M','Argentina','Francisco Luciano','38525929','','OSCITY','OSCITY','M','1123557197',NULL,'DNI','','20385259299','true','20385259299','true','1','RENAPER','2023-05-22 10:15:42','2023-05-22 10:15:42',NULL),(184,'e0b463ea-71ed-44d3-b1a9-dd7713047c42','20386054119','SARTINI','',NULL,'marcelo.dri@vicentelopez.gov.ar','','18,333,1900,La Plata','2023-05-23','1994-10-14',NULL,'2023-05-23','M','Argentina','Alessandro','38605411','','OSCITY','OSCITY','M','2216223339',NULL,'DNI','','20386054119','true','20386054119','true','1','RENAPER','2023-05-23 10:28:24','2023-10-04 11:57:29',NULL),(185,'b1a29476-a370-4acb-9105-c2c990663334','27380132864','MARTIN','',NULL,'nataliamartin1794@gmail.com','','Francisco Borges,3229,1636,Olivos','2023-05-29','1994-02-17',NULL,'2023-05-29','F','Argentina','Natalia','38013286','','OSCITY','OSCITY','F','1140725015',NULL,'DNI','','27380132864','true','27380132864','true','1','RENAPER','2023-05-29 13:42:35','2023-05-29 13:42:35',NULL),(186,'ad7c8534-46f4-4d6c-bdd0-d6714a329ef9','24286594405','NEUGEBAUER','',NULL,'cristian.neugebauer@vicentelopez.gov.ar','',',,,','2023-05-30','1981-04-22',NULL,'2023-05-30','M','Argentina','Cristián Ronaldo','28659440','','OSCITY','OSCITY','M','11-5114-6112',NULL,'DNI','','24286594405','true','24286594405','true','1','RENAPER','2023-05-30 11:37:32','2023-05-30 11:37:32',NULL),(187,'5065a3a5-365a-4ff8-9bff-85e461298cef','20310608476','COVI','',NULL,'pablo.cd37@gmail.com','','estanislao del campo ,2035,1605,munro','2023-06-05','1984-07-11',NULL,'2023-06-05','M','Argentina','Pablo Daniel','31060847','','OSCITY','OSCITY','M','1161608430',NULL,'DNI','','20310608476','true','20310608476','true','1','RENAPER','2023-06-05 12:45:07','2023-06-05 12:45:07',NULL),(188,'1527fb6c-da4f-47fd-80dc-e1c16c856c70','20961076340','CHARRABE ALVAREZ','',NULL,'jorgecharrabe7@gmail.com','',',,,','2023-06-05','2003-10-13',NULL,'2023-06-05','M','Argentina','JORGE ALBERT','96107634','','OSCITY','OSCITY','M','1155622699',NULL,'DNI','','20961076340','true','20961076340','true','1','RENAPER','2023-06-05 13:13:04','2023-06-05 13:13:04',NULL),(189,'19b3fd04-9916-4fea-80f1-5222ea73871f','27288031415','DI FONZO PORRI','',NULL,'natydifonzo@gmail.com','','Arribeños,3535,1429,ciudad autonoma de buenos aires','2023-06-06','1981-03-12',NULL,'2023-06-06','F','Argentina','Natalia Irina','28803141','1','OSCITY','OSCITY','F','1161779990',NULL,'DNI','','27288031415','true','27288031415','true','1','RENAPER','2023-06-06 10:12:31','2023-06-06 10:12:31',NULL),(190,'cb247a8b-9550-4f7d-963a-f49549c66538','24035245304','KO ATURRUAS KPSKS','',NULL,'ivan+afip@os.city','asd','Holi,010,sd,sd','2023-06-09','2007-06-08',NULL,'2023-06-09','M','Argentina','KSUPA','03524530','8','OSCITY','OSCITY','M','0000000000',NULL,'DNI','0','24035245304','true','24035245304','true','1','RENAPER','2023-06-09 14:12:46','2023-06-09 14:12:46',NULL),(191,'04193736-41b3-4b59-81e5-40cafb81ed09','20369506480','GODINO SOARES GACHE','',NULL,'ramiri77o@hotmail.com','thames 786','thames 786,786,thames 786,thames 786','2023-06-13','1993-01-02',NULL,'2023-06-13','M','Argentina','Ramiro','36950648','thames 786','OSCITY','OSCITY','M','1157399999',NULL,'DNI','','20369506480','true','20369506480','true','1','RENAPER','2023-06-13 15:57:32','2023-06-13 15:57:32',NULL),(192,'cffee809-37fe-4979-9451-de65e72e6d92','20112223334','apellido_test','1122223333',NULL,'fedegt+vl@gmail.com','','18,333,1900,La Plata',NULL,'1994-10-14',NULL,NULL,'M','Argentina','nombre_test','11222333','','OSCITY','OSCITY','M','2216223339',NULL,'DNI','','20112223334','true','20112223334','true','1','RENAPER','2023-05-23 10:28:24','2023-05-23 10:28:24',NULL),(193,'342231af-f5f1-4a2a-80da-990e7a7fe77d','20112223334','apellido_test','1122223333',NULL,'gdufourc@anbem.com','','18,333,1900,La Plata',NULL,'1994-10-14',NULL,NULL,'M','Argentina','nombre_test','11222334','','OSCITY','OSCITY','M','2216223339',NULL,'DNI','','20112223344','true','20112223344','true','1','RENAPER','2023-05-23 10:28:24','2023-05-23 10:28:24',NULL),(194,'569a6e88-4036-4d8e-b0f0-d7e5d5f682aa','20112223333','User no SICUV','',NULL,'mariiotomas16@hotmail.com',NULL,NULL,NULL,'1942-12-30',NULL,NULL,'M','Argentina','Test','11222333',NULL,'POSTMAN','MODERNIZACION','M','',NULL,'DNI',NULL,'20112223333','true','20112223333','false','1','RENAPER','2023-10-05 11:37:58','2023-10-05 11:37:58',NULL),(195,'1fa20ccb-2466-4d41-9741-b1045f578d5c','20555555555','User SICUV','',NULL,'mario.garcia@vicentelopez.gov.ar',NULL,NULL,NULL,'1942-12-30',NULL,NULL,'M','Argentina','Test','55555555',NULL,'POSTMAN','MODERNIZACION','M','',NULL,'DNI',NULL,'20555555555','true','20555555555','false','1','RENAPER','2023-10-05 11:39:29','2023-10-05 11:39:29',NULL),(196,'92e0b432-4f59-4966-8ee0-d52cc5253378',NULL,'ximo','+54-9-11-6968-2324',NULL,'maximo.magaldi@vicentelopez.gov.ar',NULL,NULL,NULL,NULL,NULL,NULL,'Masculino','Argentino','ma','28281744',NULL,NULL,NULL,'Masculino',NULL,NULL,'DNI',NULL,'20445545180',NULL,NULL,NULL,NULL,NULL,'2023-10-05 14:45:15','2023-10-05 14:45:15',NULL),(197,'654aba66-df2c-410b-8819-0d03d9aca461','20223334440','User Stark','',NULL,'matias.salimbene@gmail.com',NULL,NULL,NULL,'1942-12-30',NULL,NULL,'M','Argentina','Test','22333444',NULL,'POSTMAN','MODERNIZACION','M','',NULL,'DNI',NULL,'20223334440','true','20223334440','false','1','RENAPER','2023-10-18 09:02:05','2023-11-30 12:24:37',NULL),(198,'fdb3f5f7-2d2f-44ec-846f-f60f3ddd2ca5','27141890986','Gadea','',NULL,'gadeap@hotmail.com',NULL,NULL,NULL,'1961-04-22',NULL,NULL,'F','Argentina','Hilda Patricia','14189098',NULL,'POSTMAN','MODERNIZACION','M','',NULL,'DNI',NULL,'27141890986','false','27141890986','false','1','INSUFICIENTE','2024-01-04 15:33:18','2024-01-04 15:33:18',NULL),(199,'63f19567-774c-4bf3-9e4c-0a6e7630e7ac','20112223349','Test','',NULL,'sebastian99@starck.im',NULL,NULL,NULL,'1961-04-22',NULL,NULL,'F','Argentina','Test','11222334',NULL,'POSTMAN','MODERNIZACION','M','',NULL,'DNI',NULL,'20112223340','false','20112223340','false','1','INSUFICIENTE','2024-02-19 15:25:14','2024-02-19 15:25:14',NULL),(200,'cba8d48f-2895-4007-9293-3e1b0abeb732','20112223341','Test','',NULL,'sebastian@starck.im',NULL,NULL,NULL,'1961-04-22',NULL,NULL,'F','Argentina','Test','11222334',NULL,'POSTMAN','MODERNIZACION','M','',NULL,'DNI',NULL,'20112223341','false','20112223341','false','1','INSUFICIENTE','2024-02-19 15:29:26','2024-02-19 15:29:26',NULL),(201,'3900c4e2-8f89-4e7d-acca-bb37c46de779','20112223335','Test','1169838895',NULL,'rjimenez@diphot.com','','','2024-02-14','1955-09-30',NULL,'2024-02-16','M','Argentina','Test','11222333','','OSCITY','OSCITY','M','',NULL,'DNI','','20112223335','true','20112223335','true','1','RENAPER','2024-02-14 20:23:25','2024-02-20 11:32:50',NULL),(202,'be92b554-1b38-495e-a4d9-0616e82b0adb','1234','Gonzalez','1121826375','[0.111, 0.222]','marcelodri80@gmaillL.com',NULL,NULL,NULL,'1980-08-01',NULL,NULL,NULL,'Argentino','Marcelo','28281744',NULL,'OSCITY','OSCITY','M','112223333','112223333','DNI',NULL,'2028281745','true','2028281745',NULL,'1','RENAPER','2024-04-11 16:19:14','2024-04-11 16:19:14',NULL),(203,'2420560f-3397-4907-8a9d-fa0978c2e4bb','99999999999','MÁXIMO','1122223333',NULL,'maximomagaldi@vicentelopez.gov.ar','','','2024-02-14','1955-09-30',NULL,'2024-02-16','M','Argentina','TEST','99999999','','OSCITY','OSCITY','M','',NULL,'DNI','','99999999999','true','99999999999','true','1','0','2024-02-14 20:23:25','2024-02-20 11:32:50',NULL),(204,'a84b94ec-c7bb-4942-8ff4-f158b78c70f4','23055781079','DI MARTINO','1158913666',NULL,'gisellepedreira@gmail.com','','C. María Alvear, 1505, 1602, Florida','2024-08-09','1931-12-05',NULL,'2024-08-09','M','Argentina','JOSE BLAS','05578107','','POSTMAN','Ingresos Publicos','M','1158913666',NULL,'DNI','','23055781079','false','23055781079','false','0','','2024-08-09 15:00:00','2024-08-09 15:00:00',NULL);
/*!40000 ALTER TABLE `buv_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buv_domicilio`
--

DROP TABLE IF EXISTS `buv_domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buv_domicilio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idVecino` int(11) NOT NULL,
  `calle` text,
  `numero` text,
  `depto` text,
  `piso` text,
  `torre` text,
  `cp` text,
  `localidad` text,
  `partido` text,
  `tipoDomicilio` int(11) NOT NULL,
  `estadoDomicilio` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buv_domicilio_idVecino_foreign` (`idVecino`),
  KEY `buv_domicilio_tipoDomicilio_foreign` (`tipoDomicilio`),
  CONSTRAINT `buv_domicilio_idVecino_foreign` FOREIGN KEY (`idVecino`) REFERENCES `buv_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buv_domicilio_tipoDomicilio_foreign` FOREIGN KEY (`tipoDomicilio`) REFERENCES `buv_tipo_domicilio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buv_domicilio`
--

LOCK TABLES `buv_domicilio` WRITE;
/*!40000 ALTER TABLE `buv_domicilio` DISABLE KEYS */;
INSERT INTO `buv_domicilio` VALUES (3,107,'calle','1234','','','','1636','olivos','vicente lópez',1,0,'2023-04-28 21:40:04','2023-04-28 21:40:04',NULL),(10,174,'','','','','','','','vicente lópez',2,0,'2023-05-16 13:36:34','2023-05-16 13:36:34',NULL),(11,175,'Av maipu ','2510','PA','--------------------------------','-----------------------------------','1636','Olivos','vicente lópez',2,0,'2023-05-16 15:24:48','2023-05-16 15:24:48',NULL),(12,176,'Dr eduardo madero','735','','','','1638','Vicente Lopez','vicente lópez',2,0,'2023-05-17 15:27:41','2023-05-17 15:27:41',NULL),(13,177,'Obarrio','2039','','','','1636','Olivos','vicente lópez',2,0,'2023-05-18 10:27:21','2023-05-18 10:27:21',NULL),(16,178,'Alferez Hipólito Bouchard','2054','','','','1636','Olivos','vicente lópez',2,0,'2023-05-18 10:41:42','2023-05-18 10:41:42',NULL),(17,179,'maipu','1068','B','12','0','1636','olivos','vicente lópez',2,0,'2023-05-18 11:02:15','2023-05-18 11:02:15',NULL),(19,181,'','','','','','','','vicente lópez',2,0,'2023-05-22 08:48:14','2023-05-22 08:48:14',NULL),(21,183,'santa teresa','1456','','','','1708','moron','vicente lópez',2,0,'2023-05-22 10:15:42','2023-05-22 10:15:42',NULL),(22,160,'','','','','','','','vicente lópez',2,0,'2023-05-22 15:07:16','2023-05-22 15:07:16',NULL),(23,172,'Libertad','2356','A','1','','1602','Florida M','vicente lópez',2,0,'2023-05-23 10:10:51','2023-05-23 10:10:51',NULL),(24,184,'18','333','','','','1900','La Plata','vicente lópez',2,0,'2023-05-23 10:28:24','2023-05-23 10:28:24',NULL),(27,154,'Pozos70','3832','','','','1653','ballester','vicente lópez',2,0,'2023-05-23 11:04:27','2023-05-23 11:04:27',NULL),(28,185,'Francisco Borges','3229','','','','1636','Olivos','vicente lópez',2,0,'2023-05-29 13:42:35','2023-05-29 13:42:35',NULL),(29,186,'','','','','','','','vicente lópez',2,0,'2023-05-30 11:37:32','2023-05-30 11:37:32',NULL),(30,187,'estanislao del campo ','2035','','','','1605','munro','vicente lópez',2,0,'2023-06-05 12:45:07','2023-06-05 12:45:07',NULL),(31,188,'','','','','','','','vicente lópez',2,0,'2023-06-05 13:13:04','2023-06-05 13:13:04',NULL),(32,189,'Arribeños','3535','','1','','1429','ciudad autonoma de buenos aires','vicente lópez',2,0,'2023-06-06 10:12:31','2023-06-06 10:12:31',NULL),(33,190,'Holi','010','asd','8','0','sd','sd','vicente lópez',2,0,'2023-06-09 14:12:46','2023-06-09 14:12:46',NULL),(34,191,'thames 786','786','thames 786','thames 786','','thames 786','thames 786','vicente lópez',2,0,'2023-06-13 15:57:32','2023-06-13 15:57:32',NULL);
/*!40000 ALTER TABLE `buv_domicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buv_logs`
--

DROP TABLE IF EXISTS `buv_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buv_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `op` varchar(1) NOT NULL,
  `table_name` text,
  `id_rec` int(11) NOT NULL,
  `user` text,
  `prev` text,
  `post` text,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buv_logs`
--

LOCK TABLES `buv_logs` WRITE;
/*!40000 ALTER TABLE `buv_logs` DISABLE KEYS */;
INSERT INTO `buv_logs` VALUES (1,'U','buv_data',197,'buv-admin','{\"id\":\"197\",\"_id\":\"654aba66-df2c-410b-8819-0d03d9aca461\",\"id_oscity\":\"20223334440\",\"apellido\":\"User Stark\",\"celular\":\"\",\"coordenadas\":null,\"correoElectronico\":\"sebastian@starck.im\",\"deptounidad\":null,\"direccion\":null,\"fechaDeCreacion\":null,\"fechaDeNacimiento\":\"1942-12-30\",\"fechaDefuncion\":null,\"fechaModificacion\":null,\"genero\":\"M\",\"nacionalidad\":\"Argentina\",\"nombre\":\"Test\",\"numeroDocumento\":\"22333444\",\"piso\":null,\"plataforma\":\"POSTMAN\",\"secretaria\":\"MODERNIZACION\",\"sexo\":\"M\",\"telefono\":\"\",\"telefonoLaboral\":null,\"tipoDeDocumento\":\"DNI\",\"torre\":null,\"username\":\"20223334440\",\"verificado\":\"true\",\"cuil\":\"20223334440\",\"emailValidado\":\"false\",\"nivelValidacion\":\"1\",\"origenValidacion\":\"RENAPER\",\"created_at\":\"2023-10-18 09:02:05\",\"updated_at\":\"2023-10-18 09:02:05\",\"deleted_at\":null,\"domicilios\":[]}','{\"correoElectronico\":\"dietlindekreutle@gmail.com\",\"id\":\"197\",\"_id\":\"654aba66-df2c-410b-8819-0d03d9aca461\"}','2023-11-30 12:19:12'),(2,'U','buv_data',197,'buv-admin','{\"id\":\"197\",\"_id\":\"654aba66-df2c-410b-8819-0d03d9aca461\",\"id_oscity\":\"20223334440\",\"apellido\":\"User Stark\",\"celular\":\"\",\"coordenadas\":null,\"correoElectronico\":\"dietlindekreutle@gmail.com\",\"deptounidad\":null,\"direccion\":null,\"fechaDeCreacion\":null,\"fechaDeNacimiento\":\"1942-12-30\",\"fechaDefuncion\":null,\"fechaModificacion\":null,\"genero\":\"M\",\"nacionalidad\":\"Argentina\",\"nombre\":\"Test\",\"numeroDocumento\":\"22333444\",\"piso\":null,\"plataforma\":\"POSTMAN\",\"secretaria\":\"MODERNIZACION\",\"sexo\":\"M\",\"telefono\":\"\",\"telefonoLaboral\":null,\"tipoDeDocumento\":\"DNI\",\"torre\":null,\"username\":\"20223334440\",\"verificado\":\"true\",\"cuil\":\"20223334440\",\"emailValidado\":\"false\",\"nivelValidacion\":\"1\",\"origenValidacion\":\"RENAPER\",\"created_at\":\"2023-10-18 09:02:05\",\"updated_at\":\"2023-11-30 12:19:12\",\"deleted_at\":null,\"domicilios\":[]}','{\"correoElectronico\":\"matias.salimbene@gmail.com\",\"id\":\"197\",\"_id\":\"654aba66-df2c-410b-8819-0d03d9aca461\"}','2023-11-30 12:24:37'),(3,'I','buv_data',198,NULL,NULL,'{\"id_oscity\":\"27141890986\",\"apellido\":\"Gadea\",\"celular\":\"\",\"correoElectronico\":\"gadeap@hotmail.com\",\"fechaDeNacimiento\":\"1961-04-22\",\"genero\":\"F\",\"nacionalidad\":\"Argentina\",\"nombre\":\"Hilda Patricia\",\"numeroDocumento\":\"14189098\",\"plataforma\":\"POSTMAN\",\"secretaria\":\"MODERNIZACION\",\"sexo\":\"M\",\"telefono\":\"\",\"tipoDeDocumento\":\"DNI\",\"username\":\"27141890986\",\"verificado\":\"false\",\"cuil\":\"27141890986\",\"emailValidado\":\"false\",\"nivelValidacion\":\"1\",\"origenValidacion\":\"INSUFICIENTE\",\"_id\":\"fdb3f5f7-2d2f-44ec-846f-f60f3ddd2ca5\"}','2024-01-04 15:33:18'),(4,'I','buv_data',199,'buv-admin',NULL,'{\"id_oscity\":\"20112223349\",\"apellido\":\"Test\",\"celular\":\"\",\"correoElectronico\":\"sebastian99@starck.im\",\"fechaDeNacimiento\":\"1961-04-22\",\"genero\":\"F\",\"nacionalidad\":\"Argentina\",\"nombre\":\"Test\",\"numeroDocumento\":\"11222334\",\"plataforma\":\"POSTMAN\",\"secretaria\":\"MODERNIZACION\",\"sexo\":\"M\",\"telefono\":\"\",\"tipoDeDocumento\":\"DNI\",\"username\":\"20112223340\",\"verificado\":\"false\",\"cuil\":\"20112223340\",\"emailValidado\":\"false\",\"nivelValidacion\":\"1\",\"origenValidacion\":\"INSUFICIENTE\",\"_id\":\"63f19567-774c-4bf3-9e4c-0a6e7630e7ac\"}','2024-02-19 15:25:14'),(5,'I','buv_data',200,'buv-admin',NULL,'{\"id_oscity\":\"20112223341\",\"apellido\":\"Test\",\"celular\":\"\",\"correoElectronico\":\"sebastian@starck.im\",\"fechaDeNacimiento\":\"1961-04-22\",\"genero\":\"F\",\"nacionalidad\":\"Argentina\",\"nombre\":\"Test\",\"numeroDocumento\":\"11222334\",\"plataforma\":\"POSTMAN\",\"secretaria\":\"MODERNIZACION\",\"sexo\":\"M\",\"telefono\":\"\",\"tipoDeDocumento\":\"DNI\",\"username\":\"20112223341\",\"verificado\":\"false\",\"cuil\":\"20112223341\",\"emailValidado\":\"false\",\"nivelValidacion\":\"1\",\"origenValidacion\":\"INSUFICIENTE\",\"_id\":\"cba8d48f-2895-4007-9293-3e1b0abeb732\"}','2024-02-19 15:29:26'),(6,'I','buv_data',201,'buv-admin',NULL,'{\"id_oscity\":\"20112223335\",\"apellido\":\"Test\",\"celular\":\"1169838895\",\"coordenadas\":null,\"correoElectronico\":\"rjimenez@diphot.com\",\"deptounidad\":\"\",\"direccion\":\"\",\"fechaDeCreacion\":\"2024-02-14\",\"fechaDeNacimiento\":\"1955-09-30\",\"fechaDefuncion\":null,\"fechaModificacion\":\"2024-02-16\",\"genero\":\"M\",\"nacionalidad\":\"Argentina\",\"nombre\":\"Test\",\"numeroDocumento\":\"11222333\",\"piso\":\"\",\"plataforma\":\"OSCITY\",\"secretaria\":\"OSCITY\",\"sexo\":\"M\",\"telefono\":\"\",\"telefonoLaboral\":null,\"tipoDeDocumento\":\"DNI\",\"torre\":\"\",\"username\":\"20112223335\",\"verificado\":\"true\",\"cuil\":\"20112223335\",\"emailValidado\":\"true\",\"nivelValidacion\":\"1\",\"origenValidacion\":\"RENAPER\",\"created_at\":\"2024-02-14 20:23:25\",\"updated_at\":\"2024-02-20 11:32:50\",\"deleted_at\":null,\"_id\":\"3900c4e2-8f89-4e7d-acca-bb37c46de779\"}','2024-02-29 13:38:24'),(7,'I','buv_data',202,NULL,NULL,'{\"id_oscity\":\"1234\",\"username\":\"2028281745\",\"apellido\":\"Gonzalez\",\"celular\":\"1121826375\",\"coordenadas\":\"[0.111, 0.222]\",\"fechaDeNacimiento\":\"1980-08-01\",\"nacionalidad\":\"Argentino\",\"nombre\":\"Marcelo\",\"numeroDocumento\":\"28281744\",\"plataforma\":\"OSCITY\",\"secretaria\":\"OSCITY\",\"sexo\":\"M\",\"telefono\":\"112223333\",\"telefonoLaboral\":\"112223333\",\"tipoDeDocumento\":\"DNI\",\"verificado\":\"true\",\"cuil\":\"2028281745\",\"nivelValidacion\":\"1\",\"origenValidacion\":\"RENAPER\",\"correoElectronico\":\"marcelodri80@gmaillL.com\",\"_id\":\"be92b554-1b38-495e-a4d9-0616e82b0adb\"}','2024-04-11 16:19:14'),(8,'I','buv_data',203,'buv-root',NULL,'{\"id_oscity\":\"99999999999\",\"apellido\":\"M\\u00c1XIMO\",\"celular\":\"1122223333\",\"coordenadas\":null,\"correoElectronico\":\"maximomagaldi@vicentelopez.gov.ar\",\"deptounidad\":\"\",\"direccion\":\"\",\"fechaDeCreacion\":\"2024-02-14\",\"fechaDeNacimiento\":\"1955-09-30\",\"fechaDefuncion\":null,\"fechaModificacion\":\"2024-02-16\",\"genero\":\"M\",\"nacionalidad\":\"Argentina\",\"nombre\":\"TEST\",\"numeroDocumento\":\"99999999\",\"piso\":\"\",\"plataforma\":\"OSCITY\",\"secretaria\":\"OSCITY\",\"sexo\":\"M\",\"telefono\":\"\",\"telefonoLaboral\":null,\"tipoDeDocumento\":\"DNI\",\"torre\":\"\",\"username\":\"99999999999\",\"verificado\":\"true\",\"cuil\":\"99999999999\",\"emailValidado\":\"true\",\"nivelValidacion\":\"1\",\"origenValidacion\":false,\"created_at\":\"2024-02-14 20:23:25\",\"updated_at\":\"2024-02-20 11:32:50\",\"deleted_at\":null,\"_id\":\"2420560f-3397-4907-8a9d-fa0978c2e4bb\"}','2024-05-28 15:27:07'),(9,'I','buv_data',204,'buv-root',NULL,'{\"id_oscity\":\"23055781079\",\"apellido\":\"DI MARTINO\",\"celular\":\"1158913666\",\"coordenadas\":null,\"correoElectronico\":\"gisellepedreira@gmail.com\",\"deptounidad\":\"\",\"direccion\":\"C. Mar\\u00eda Alvear, 1505, 1602, Florida\",\"fechaDeCreacion\":\"2024-08-09\",\"fechaDeNacimiento\":\"1931-12-05\",\"fechaDefuncion\":null,\"fechaModificacion\":\"2024-08-09\",\"genero\":\"M\",\"nacionalidad\":\"Argentina\",\"nombre\":\"JOSE BLAS\",\"numeroDocumento\":\"05578107\",\"piso\":\"\",\"plataforma\":\"POSTMAN\",\"secretaria\":\"Ingresos Publicos\",\"sexo\":\"M\",\"telefono\":\"1158913666\",\"telefonoLaboral\":null,\"tipoDeDocumento\":\"DNI\",\"torre\":\"\",\"username\":\"23055781079\",\"verificado\":\"false\",\"cuil\":\"23055781079\",\"emailValidado\":\"false\",\"nivelValidacion\":\"0\",\"origenValidacion\":\"\",\"created_at\":\"2024-08-09 15:00:00\",\"updated_at\":\"2024-08-09 15:00:00\",\"deleted_at\":null,\"_id\":\"a84b94ec-c7bb-4942-8ff4-f158b78c70f4\"}','2024-08-09 15:11:52');
/*!40000 ALTER TABLE `buv_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buv_tipo_domicilio`
--

DROP TABLE IF EXISTS `buv_tipo_domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buv_tipo_domicilio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buv_tipo_domicilio`
--

LOCK TABLES `buv_tipo_domicilio` WRITE;
/*!40000 ALTER TABLE `buv_tipo_domicilio` DISABLE KEYS */;
INSERT INTO `buv_tipo_domicilio` VALUES (1,'REGISTRADO','2023-04-28 21:39:39'),(2,'REAL','2023-04-28 21:39:39'),(3,'LEGAL','2023-04-28 21:39:39'),(4,'LABORAL','2023-04-28 21:39:39');
/*!40000 ALTER TABLE `buv_tipo_domicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `load_data_errors`
--

DROP TABLE IF EXISTS `load_data_errors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `load_data_errors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `_id` text NOT NULL,
  `msg` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `load_data_errors`
--

LOCK TABLES `load_data_errors` WRITE;
/*!40000 ALTER TABLE `load_data_errors` DISABLE KEYS */;
/*!40000 ALTER TABLE `load_data_errors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2022-12-01-183642','App\\Database\\Migrations\\Initial','default','App',1671694440,1),(2,'2023-01-31-084308','App\\Database\\Migrations\\OSCity','default','App',1675159598,2),(3,'2023-02-07-122208','App\\Database\\Migrations\\NuevosCampos','default','App',1678195446,3),(4,'2023-02-07-123447','App\\Database\\Migrations\\Direcciones','default','App',1678195446,3),(5,'2023-02-20-204100','App\\Database\\Migrations\\Logs','default','App',1678195446,3),(6,'2023-03-07-174700','App\\Database\\Migrations\\OrigenValidacion','default','App',1678212885,4),(7,'2023-10-30-180622','App\\Database\\Migrations\\BorradoLogico','default','App',1699519835,5),(8,'2023-10-30-185512','App\\Database\\Migrations\\LogsTableName','default','App',1699519835,5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-27 11:36:04
