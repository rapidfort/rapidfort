-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: standalone
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Current Database: `standalone`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `standalone` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `standalone`;

--
-- Current Database: `keycloak`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `keycloak` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
CREATE USER IF NOT EXISTS 'keycloak'@'%' identified by 'RF-123579';
GRANT ALL PRIVILEGES ON keycloak.* TO 'keycloak'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

USE `keycloak`;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
INSERT INTO `ASSOCIATED_POLICY` VALUES ('491ea318-6f55-4255-b269-a021b6babc2f','66da9318-e914-4926-8666-2828bcd6569a');
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
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('02ade28a-3198-4a1d-97e7-4fdf0c182835',NULL,'http-basic-authenticator','master','6f369a96-88c3-4a67-93e5-8fdccd083f0e',0,10,_binary '\0',NULL,NULL),('0518d157-07e4-4aad-8b4a-6f325758145e',NULL,'auth-spnego','customers','468560cf-22d1-4ea7-bebc-5fded89b66c1',3,20,_binary '\0',NULL,NULL),('054c379b-9ea4-4f49-b007-9049b9e00f55',NULL,'conditional-user-configured','master','012bab29-d931-400c-a2cc-822baef5bd9a',0,10,_binary '\0',NULL,NULL),('08c92913-2ce5-42a4-8675-0ae51cd7835f',NULL,'auth-cookie','customers','468560cf-22d1-4ea7-bebc-5fded89b66c1',2,10,_binary '\0',NULL,NULL),('09bd2631-a886-4b52-8d59-79ee552f8160',NULL,'http-basic-authenticator','customers','903ee4be-1b15-4ac8-a97c-ae32fcb22f68',0,10,_binary '\0',NULL,NULL),('0c4b581c-3935-4677-997a-272016990a00',NULL,'registration-password-action','customers','b970b061-d4b1-4c22-9c23-f4d6feabc224',0,50,_binary '\0',NULL,NULL),('0ddad94b-465c-468d-8d8c-fa5215d05d0d',NULL,'conditional-user-configured','master','c0f3c293-1909-46e0-ba45-429c379c3e95',0,10,_binary '\0',NULL,NULL),('13c18b09-a006-496c-a25f-66dd9a6656b3',NULL,'conditional-user-configured','customers','a99360cd-cf7a-4860-8252-80b7f3f43c73',0,10,_binary '\0',NULL,NULL),('16ad7cdb-9347-4b45-8b8f-809f14576145',NULL,'conditional-user-configured','customers','6c9604bf-eed9-40cc-a5c3-2cfedc3cdc33',0,10,_binary '\0',NULL,NULL),('1753be05-e896-4c81-a1c5-33730cc741ac',NULL,'reset-otp','customers','0668dc43-a752-4223-aa9c-ba8b234eccca',0,20,_binary '\0',NULL,NULL),('1c33a598-4158-4df1-88ee-71e7778b544d',NULL,'docker-http-basic-authenticator','master','4dbf74f9-f641-4f75-947f-f7c0fb44f08d',0,10,_binary '\0',NULL,NULL),('1ec70570-f161-4a8b-88d8-c16b475837ce',NULL,'idp-email-verification','master','09863ac7-4a38-436f-a010-41074a7af210',2,10,_binary '\0',NULL,NULL),('2113d88e-8d60-4dd2-9de2-a1b21d6d8a04',NULL,'conditional-user-configured','customers','87bafa60-9d06-42f2-b017-efab9ddf281d',0,10,_binary '\0',NULL,NULL),('234848bc-38d5-4cac-a3b8-461e6efe38fe',NULL,NULL,'customers','1609f054-d828-43c5-94c6-ffdfbb4a6acf',1,20,_binary '','6c9604bf-eed9-40cc-a5c3-2cfedc3cdc33',NULL),('24d2e4c9-e317-4bd7-8619-ba40427796ec',NULL,NULL,'master','3045a23d-bdbb-4bea-a3a4-26bd2dd267f3',1,30,_binary '','012bab29-d931-400c-a2cc-822baef5bd9a',NULL),('28b061de-9a26-46f8-9e8e-277864898d32',NULL,'auth-otp-form','customers','6c9604bf-eed9-40cc-a5c3-2cfedc3cdc33',0,20,_binary '\0',NULL,NULL),('2a3e8138-49cf-4c3b-b499-fe7eee79b528',NULL,'registration-recaptcha-action','master','0f199650-7c15-47ae-820d-1ac3f4b1ac04',3,60,_binary '\0',NULL,NULL),('2b10895e-8270-4b68-8975-14e4b9ed0912',NULL,'conditional-user-configured','master','75e7a094-4235-48ce-958b-4ff7816aca0d',0,10,_binary '\0',NULL,NULL),('2b4f4fb0-6191-4ed6-97d5-617d4287a229',NULL,'auth-username-password-form','customers','1609f054-d828-43c5-94c6-ffdfbb4a6acf',0,10,_binary '\0',NULL,NULL),('2b572cea-5961-49e7-bb79-a4e70ad5e8d4',NULL,NULL,'customers','dbb49351-a97e-4231-a620-191700c9df6a',0,20,_binary '','c43a88b2-4fe1-4b80-b0d0-e2e451f120b2',NULL),('2ba2866f-096f-470c-a36e-be7cb0c8e7e5',NULL,'identity-provider-redirector','master','69c9cc25-0913-48b2-bf4e-4f2d73aa8d3c',2,25,_binary '\0',NULL,NULL),('31bcd39e-55f8-4e50-a16d-391aef9efedb',NULL,'registration-user-creation','customers','b970b061-d4b1-4c22-9c23-f4d6feabc224',0,20,_binary '\0',NULL,NULL),('353210af-474c-434e-8e06-820cbc38db8d',NULL,'auth-spnego','master','581a9bb3-f093-487c-946f-6a102a939621',3,30,_binary '\0',NULL,NULL),('367b5776-066e-45da-b47a-d53203b3ca7a',NULL,'idp-review-profile','master','e61f2d6e-486d-4f32-add5-826d5709abc0',0,10,_binary '\0',NULL,'a22e2f47-9bf9-489f-8889-23b8f75ebbe4'),('37afbefa-cbf3-4a47-a661-1f198ee5cb3c',NULL,'auth-otp-form','master','c0f3c293-1909-46e0-ba45-429c379c3e95',0,20,_binary '\0',NULL,NULL),('3e18eaf0-5ed4-45da-b2ef-af334d4f3d31',NULL,'registration-profile-action','customers','b970b061-d4b1-4c22-9c23-f4d6feabc224',0,40,_binary '\0',NULL,NULL),('3f352488-e852-40db-9ced-f1d581d3f66e',NULL,NULL,'master','aba76eb9-9f3b-41e7-8941-7417428ee08b',1,20,_binary '','6a075466-e665-473b-8327-fd7003aad281',NULL),('42eec64d-b221-47a2-a680-726a6057d5a9',NULL,'registration-user-creation','master','0f199650-7c15-47ae-820d-1ac3f4b1ac04',0,20,_binary '\0',NULL,NULL),('4303f40f-73f6-4d46-a15a-8cfc3edfd93d',NULL,'basic-auth-otp','master','581a9bb3-f093-487c-946f-6a102a939621',3,20,_binary '\0',NULL,NULL),('449390cc-efc1-416d-ad60-86b6a7dec4d0',NULL,'direct-grant-validate-otp','master','012bab29-d931-400c-a2cc-822baef5bd9a',0,20,_binary '\0',NULL,NULL),('4db02fb1-c4b8-48b5-a834-8a014ab6c425',NULL,'idp-create-user-if-unique','master','9c724e42-0b5e-4c64-ba8b-bbc60fef9077',2,10,_binary '\0',NULL,'14655bc7-7749-4a13-8d95-b531e7c91015'),('4dc00680-c571-479c-ab15-3bc0ff3db119',NULL,'auth-otp-form','customers','a99360cd-cf7a-4860-8252-80b7f3f43c73',0,20,_binary '\0',NULL,NULL),('52a55d7b-9fbc-46e4-bcd4-e3dec71b76e8',NULL,NULL,'customers','37c431b2-33b7-4c70-b934-056e85f352cb',1,20,_binary '','a99360cd-cf7a-4860-8252-80b7f3f43c73',NULL),('587a86ce-fc51-45ec-87b0-23ac7213e4fe',NULL,'reset-password','master','fbfdcd45-730f-4636-80c0-9707f0fe9f39',0,30,_binary '\0',NULL,NULL),('588a6d08-a1be-4f22-8498-4e94a447c73b',NULL,'registration-profile-action','master','0f199650-7c15-47ae-820d-1ac3f4b1ac04',0,40,_binary '\0',NULL,NULL),('5a14e08f-8c93-4aa5-b38b-cc0e60d0c48f',NULL,'direct-grant-validate-username','master','3045a23d-bdbb-4bea-a3a4-26bd2dd267f3',0,10,_binary '\0',NULL,NULL),('6041f5d1-6c6b-4da3-84ee-76760f8b6ecc',NULL,'client-secret','customers','2a0d4867-653f-46e3-a980-51dfc05c249a',2,10,_binary '\0',NULL,NULL),('61c95b20-f8d6-4140-bb2d-f20fd1c6f0fe',NULL,'registration-page-form','customers','680adcd7-9adc-4870-8ca3-a75d905d2147',0,10,_binary '','b970b061-d4b1-4c22-9c23-f4d6feabc224',NULL),('6474163b-395f-4cc0-a07d-0350d0b7f324',NULL,'idp-username-password-form','master','aba76eb9-9f3b-41e7-8941-7417428ee08b',0,10,_binary '\0',NULL,NULL),('69593fa6-4914-4d41-8ba7-7b083f3cb840',NULL,'reset-otp','master','75e7a094-4235-48ce-958b-4ff7816aca0d',0,20,_binary '\0',NULL,NULL),('6decabf1-4557-48f2-8d0d-fb96a3472526',NULL,'basic-auth','master','581a9bb3-f093-487c-946f-6a102a939621',0,10,_binary '\0',NULL,NULL),('6f4e6821-2083-4572-b8ef-3da4e89de14c',NULL,'no-cookie-redirect','master','b6c66bb7-7dd5-4f40-9741-9dc80099c72d',0,10,_binary '\0',NULL,NULL),('75f53dc7-4fcd-4c6d-810e-e238bfb3740e',NULL,'auth-otp-form','master','6a075466-e665-473b-8327-fd7003aad281',0,20,_binary '\0',NULL,NULL),('771d0e4b-61e8-423e-8f65-8335aa6d5782',NULL,'client-secret-jwt','master','f2f6522c-21c7-4d95-b1f0-0f6263c84c43',2,30,_binary '\0',NULL,NULL),('77d06a47-ce68-4dfc-9cb1-d7507759571b',NULL,NULL,'customers','84d42922-1a82-40e8-b765-bf354f595c90',2,20,_binary '','37c431b2-33b7-4c70-b934-056e85f352cb',NULL),('7dff9acd-9fa1-4021-977e-0707974115a3',NULL,'auth-spnego','customers','c43a88b2-4fe1-4b80-b0d0-e2e451f120b2',3,30,_binary '\0',NULL,NULL),('7ef7cd35-9f0f-4377-acf2-393ddea796a5',NULL,NULL,'master','f7cd2ad5-b5b4-47d9-a957-f207737f93d1',0,20,_binary '','09863ac7-4a38-436f-a010-41074a7af210',NULL),('833b0076-9482-4661-93a5-0f6b729cb292',NULL,'reset-credential-email','master','fbfdcd45-730f-4636-80c0-9707f0fe9f39',0,20,_binary '\0',NULL,NULL),('8a3b343a-9b77-4b39-bf27-8fbb5ad4b101',NULL,'reset-password','customers','53b49208-380e-4f20-bb91-b5da0fc4df28',0,30,_binary '\0',NULL,NULL),('8a584152-d1f2-440a-a3f5-00466444e6b9',NULL,'idp-review-profile','customers','74cdce6f-9ca4-4a00-9d90-a3ce5793aa55',0,10,_binary '\0',NULL,'15c17e2b-c904-4aa5-b6fb-8263a66d6666'),('8ae54762-7eed-4c22-b640-8ca41e2140f1',NULL,'idp-username-password-form','customers','37c431b2-33b7-4c70-b934-056e85f352cb',0,10,_binary '\0',NULL,NULL),('8b969113-7860-4cae-88cf-58d339bf9d73',NULL,NULL,'customers','fbdc2a4b-2bb7-4f6c-95de-5ba61f26b698',2,20,_binary '','8fa073cc-277f-4a3b-bc45-180347eba84e',NULL),('92be3102-9087-4a98-98c9-af10c644f4c8',NULL,'direct-grant-validate-password','customers','cd9a6c83-fef6-4d48-b555-d3b4fd4a5616',0,20,_binary '\0',NULL,NULL),('95870a7a-e511-4231-9bd6-5cfa2a4d8324',NULL,'registration-recaptcha-action','customers','b970b061-d4b1-4c22-9c23-f4d6feabc224',3,60,_binary '\0',NULL,NULL),('9b638ace-325e-442c-81db-4f6fa2d67aa5',NULL,NULL,'customers','74cdce6f-9ca4-4a00-9d90-a3ce5793aa55',0,20,_binary '','fbdc2a4b-2bb7-4f6c-95de-5ba61f26b698',NULL),('9c2fd759-cf9e-4a6f-8497-5b4274254585',NULL,'auth-cookie','master','69c9cc25-0913-48b2-bf4e-4f2d73aa8d3c',2,10,_binary '\0',NULL,NULL),('a6641e0d-c72f-4cb6-8c6d-9c4636966660',NULL,NULL,'master','09863ac7-4a38-436f-a010-41074a7af210',2,20,_binary '','aba76eb9-9f3b-41e7-8941-7417428ee08b',NULL),('a9d195e6-2a93-4209-a2f3-4b6696237c97',NULL,'reset-credentials-choose-user','customers','53b49208-380e-4f20-bb91-b5da0fc4df28',0,10,_binary '\0',NULL,NULL),('ac1c664a-c227-4cad-a7a5-c726471b698c',NULL,NULL,'master','e61f2d6e-486d-4f32-add5-826d5709abc0',0,20,_binary '','9c724e42-0b5e-4c64-ba8b-bbc60fef9077',NULL),('ac1fa025-5fd5-475b-b50d-7c866ca0216b',NULL,'client-jwt','customers','2a0d4867-653f-46e3-a980-51dfc05c249a',2,20,_binary '\0',NULL,NULL),('acea910c-1085-4c1d-be9a-0589f039a8ea',NULL,'direct-grant-validate-password','master','3045a23d-bdbb-4bea-a3a4-26bd2dd267f3',0,20,_binary '\0',NULL,NULL),('ae83fdce-08db-4c89-a950-c718a28e670f',NULL,'direct-grant-validate-otp','customers','87bafa60-9d06-42f2-b017-efab9ddf281d',0,20,_binary '\0',NULL,NULL),('b106f7b6-9ad0-4791-ab0a-da616a8d2479',NULL,NULL,'master','b6c66bb7-7dd5-4f40-9741-9dc80099c72d',0,20,_binary '','581a9bb3-f093-487c-946f-6a102a939621',NULL),('b631be73-6b3c-4f67-b7a8-47a22bb7f54e',NULL,'docker-http-basic-authenticator','customers','1070aef9-bcdc-4cf3-962a-9cdfb28a14d4',0,10,_binary '\0',NULL,NULL),('b668a346-cf49-4245-bfea-5fdb812e9e28',NULL,'client-secret','master','f2f6522c-21c7-4d95-b1f0-0f6263c84c43',2,10,_binary '\0',NULL,NULL),('b67ccc52-c9e1-416d-93be-d38dd45649cf',NULL,NULL,'customers','468560cf-22d1-4ea7-bebc-5fded89b66c1',2,30,_binary '','1609f054-d828-43c5-94c6-ffdfbb4a6acf',NULL),('b82ad0eb-518d-4fdc-9dc2-2f95eb4342bc',NULL,'direct-grant-validate-username','customers','cd9a6c83-fef6-4d48-b555-d3b4fd4a5616',0,10,_binary '\0',NULL,NULL),('bb1d8d96-2082-4627-8e9c-44407a1d0c46',NULL,'basic-auth','customers','c43a88b2-4fe1-4b80-b0d0-e2e451f120b2',0,10,_binary '\0',NULL,NULL),('bb80a907-8d29-431f-9d93-01bda774e2be',NULL,'auth-spnego','master','69c9cc25-0913-48b2-bf4e-4f2d73aa8d3c',3,20,_binary '\0',NULL,NULL),('bc2e65c8-d901-4b39-9b83-0f7da89bf5fd',NULL,NULL,'master','fbfdcd45-730f-4636-80c0-9707f0fe9f39',1,40,_binary '','75e7a094-4235-48ce-958b-4ff7816aca0d',NULL),('bd953c70-6fdb-4c07-88e2-2cb8b2ccf8a6',NULL,'identity-provider-redirector','customers','468560cf-22d1-4ea7-bebc-5fded89b66c1',2,25,_binary '\0',NULL,NULL),('be279232-bca9-4b34-a3fd-783a95bd55ea',NULL,'idp-confirm-link','master','f7cd2ad5-b5b4-47d9-a957-f207737f93d1',0,10,_binary '\0',NULL,NULL),('bf1c042d-4a4a-4a9f-8dba-0f984d950634',NULL,'no-cookie-redirect','customers','dbb49351-a97e-4231-a620-191700c9df6a',0,10,_binary '\0',NULL,NULL),('c1dd2ff6-3f36-4bd0-97ae-2192ef9d4543',NULL,'client-secret-jwt','customers','2a0d4867-653f-46e3-a980-51dfc05c249a',2,30,_binary '\0',NULL,NULL),('c5cffcc7-7201-46f1-9b6c-5de8b479ce42',NULL,'reset-credentials-choose-user','master','fbfdcd45-730f-4636-80c0-9707f0fe9f39',0,10,_binary '\0',NULL,NULL),('c81d5bc5-8372-4564-ba9d-d77b89addacc',NULL,'conditional-user-configured','customers','0668dc43-a752-4223-aa9c-ba8b234eccca',0,10,_binary '\0',NULL,NULL),('c9827fe9-65e9-405d-87f3-7931c2747c7c',NULL,'registration-password-action','master','0f199650-7c15-47ae-820d-1ac3f4b1ac04',0,50,_binary '\0',NULL,NULL),('ccd3e90c-e929-46a4-b75a-9f7fb6950019',NULL,'registration-page-form','master','f5e91f58-d13c-4fb6-a359-aa1b38d83e58',0,10,_binary '','0f199650-7c15-47ae-820d-1ac3f4b1ac04',NULL),('cffc2b82-c0a0-4e4a-959f-f25df26798b4',NULL,NULL,'master','9c724e42-0b5e-4c64-ba8b-bbc60fef9077',2,20,_binary '','f7cd2ad5-b5b4-47d9-a957-f207737f93d1',NULL),('d17ce6e0-987e-43b6-8e54-52a2a530d8c1',NULL,NULL,'master','ad3aaff5-d8fd-4b12-b945-78429a70d349',1,20,_binary '','c0f3c293-1909-46e0-ba45-429c379c3e95',NULL),('d1ab8c9f-f570-4c55-8074-c2fbfdd99248',NULL,'auth-username-password-form','master','ad3aaff5-d8fd-4b12-b945-78429a70d349',0,10,_binary '\0',NULL,NULL),('d2234eca-db5d-475b-a83b-0e5b4e873ec8',NULL,'reset-credential-email','customers','53b49208-380e-4f20-bb91-b5da0fc4df28',0,20,_binary '\0',NULL,NULL),('d24c11b9-f563-4eb4-96e1-5bc06d9baea4',NULL,'idp-email-verification','customers','84d42922-1a82-40e8-b765-bf354f595c90',2,10,_binary '\0',NULL,NULL),('d37e4fc7-a4c6-4091-a7b3-da18a8352ef9',NULL,'basic-auth-otp','customers','c43a88b2-4fe1-4b80-b0d0-e2e451f120b2',3,20,_binary '\0',NULL,NULL),('de66433e-3fbb-456d-8ee9-08c1400ea357',NULL,NULL,'customers','53b49208-380e-4f20-bb91-b5da0fc4df28',1,40,_binary '','0668dc43-a752-4223-aa9c-ba8b234eccca',NULL),('e1a647fd-c038-4c10-b5ea-f685495ca3a5',NULL,'conditional-user-configured','master','6a075466-e665-473b-8327-fd7003aad281',0,10,_binary '\0',NULL,NULL),('e22d6f15-13f0-46cd-b8c4-8772e52e1227',NULL,'idp-confirm-link','customers','8fa073cc-277f-4a3b-bc45-180347eba84e',0,10,_binary '\0',NULL,NULL),('e23436fb-b9e8-40c0-91c8-b5b21bfa49fa',NULL,NULL,'master','69c9cc25-0913-48b2-bf4e-4f2d73aa8d3c',2,30,_binary '','ad3aaff5-d8fd-4b12-b945-78429a70d349',NULL),('e27de369-ca71-4558-9ec8-cbe7f3d6b824',NULL,NULL,'customers','8fa073cc-277f-4a3b-bc45-180347eba84e',0,20,_binary '','84d42922-1a82-40e8-b765-bf354f595c90',NULL),('e4207005-d681-4640-bbfc-c26bbe63fce7',NULL,'client-jwt','master','f2f6522c-21c7-4d95-b1f0-0f6263c84c43',2,20,_binary '\0',NULL,NULL),('ecfb82c9-e62c-4b44-aff8-95ac22b4faa7',NULL,'client-x509','customers','2a0d4867-653f-46e3-a980-51dfc05c249a',2,40,_binary '\0',NULL,NULL),('ed17ea8e-27c8-440a-b1cf-d38eb856c0ec',NULL,'idp-create-user-if-unique','customers','fbdc2a4b-2bb7-4f6c-95de-5ba61f26b698',2,10,_binary '\0',NULL,'18728c11-de8d-45b1-882d-f7831d612a1c'),('ef8e247d-3ab2-4fcf-9852-ed913db39f4d',NULL,NULL,'customers','cd9a6c83-fef6-4d48-b555-d3b4fd4a5616',1,30,_binary '','87bafa60-9d06-42f2-b017-efab9ddf281d',NULL),('fb069f83-fc42-4e25-b218-148290ab2cec',NULL,'client-x509','master','f2f6522c-21c7-4d95-b1f0-0f6263c84c43',2,40,_binary '\0',NULL,NULL);
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
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('012bab29-d931-400c-a2cc-822baef5bd9a','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('0668dc43-a752-4223-aa9c-ba8b234eccca','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','customers','basic-flow',_binary '\0',_binary ''),('09863ac7-4a38-436f-a010-41074a7af210','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('0f199650-7c15-47ae-820d-1ac3f4b1ac04','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('1070aef9-bcdc-4cf3-962a-9cdfb28a14d4','docker auth','Used by Docker clients to authenticate against the IDP','customers','basic-flow',_binary '',_binary ''),('1609f054-d828-43c5-94c6-ffdfbb4a6acf','forms','Username, password, otp and other auth forms.','customers','basic-flow',_binary '\0',_binary ''),('2a0d4867-653f-46e3-a980-51dfc05c249a','clients','Base authentication for clients','customers','client-flow',_binary '',_binary ''),('3045a23d-bdbb-4bea-a3a4-26bd2dd267f3','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('37c431b2-33b7-4c70-b934-056e85f352cb','Verify Existing Account by Re-authentication','Reauthentication of existing account','customers','basic-flow',_binary '\0',_binary ''),('468560cf-22d1-4ea7-bebc-5fded89b66c1','browser','browser based authentication','customers','basic-flow',_binary '',_binary ''),('4dbf74f9-f641-4f75-947f-f7c0fb44f08d','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('53b49208-380e-4f20-bb91-b5da0fc4df28','reset credentials','Reset credentials for a user if they forgot their password or something','customers','basic-flow',_binary '',_binary ''),('581a9bb3-f093-487c-946f-6a102a939621','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('680adcd7-9adc-4870-8ca3-a75d905d2147','registration','registration flow','customers','basic-flow',_binary '',_binary ''),('69c9cc25-0913-48b2-bf4e-4f2d73aa8d3c','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('6a075466-e665-473b-8327-fd7003aad281','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('6c9604bf-eed9-40cc-a5c3-2cfedc3cdc33','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','customers','basic-flow',_binary '\0',_binary ''),('6f369a96-88c3-4a67-93e5-8fdccd083f0e','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('74cdce6f-9ca4-4a00-9d90-a3ce5793aa55','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','customers','basic-flow',_binary '',_binary ''),('75e7a094-4235-48ce-958b-4ff7816aca0d','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('84d42922-1a82-40e8-b765-bf354f595c90','Account verification options','Method with which to verity the existing account','customers','basic-flow',_binary '\0',_binary ''),('87bafa60-9d06-42f2-b017-efab9ddf281d','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','customers','basic-flow',_binary '\0',_binary ''),('8fa073cc-277f-4a3b-bc45-180347eba84e','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','customers','basic-flow',_binary '\0',_binary ''),('903ee4be-1b15-4ac8-a97c-ae32fcb22f68','saml ecp','SAML ECP Profile Authentication Flow','customers','basic-flow',_binary '',_binary ''),('9c724e42-0b5e-4c64-ba8b-bbc60fef9077','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('a99360cd-cf7a-4860-8252-80b7f3f43c73','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','customers','basic-flow',_binary '\0',_binary ''),('aba76eb9-9f3b-41e7-8941-7417428ee08b','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('ad3aaff5-d8fd-4b12-b945-78429a70d349','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('b6c66bb7-7dd5-4f40-9741-9dc80099c72d','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('b970b061-d4b1-4c22-9c23-f4d6feabc224','registration form','registration form','customers','form-flow',_binary '\0',_binary ''),('c0f3c293-1909-46e0-ba45-429c379c3e95','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('c43a88b2-4fe1-4b80-b0d0-e2e451f120b2','Authentication Options','Authentication options.','customers','basic-flow',_binary '\0',_binary ''),('cd9a6c83-fef6-4d48-b555-d3b4fd4a5616','direct grant','OpenID Connect Resource Owner Grant','customers','basic-flow',_binary '',_binary ''),('dbb49351-a97e-4231-a620-191700c9df6a','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','customers','basic-flow',_binary '',_binary ''),('e61f2d6e-486d-4f32-add5-826d5709abc0','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('f2f6522c-21c7-4d95-b1f0-0f6263c84c43','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('f5e91f58-d13c-4fb6-a359-aa1b38d83e58','registration','registration flow','master','basic-flow',_binary '',_binary ''),('f7cd2ad5-b5b4-47d9-a957-f207737f93d1','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('fbdc2a4b-2bb7-4f6c-95de-5ba61f26b698','User creation or linking','Flow for the existing/non-existing user alternatives','customers','basic-flow',_binary '\0',_binary ''),('fbfdcd45-730f-4636-80c0-9707f0fe9f39','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary '');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('14655bc7-7749-4a13-8d95-b531e7c91015','create unique user config','master'),('15c17e2b-c904-4aa5-b6fb-8263a66d6666','review profile config','customers'),('18728c11-de8d-45b1-882d-f7831d612a1c','create unique user config','customers'),('a22e2f47-9bf9-489f-8889-23b8f75ebbe4','review profile config','master');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('14655bc7-7749-4a13-8d95-b531e7c91015','false','require.password.update.after.registration'),('15c17e2b-c904-4aa5-b6fb-8263a66d6666','missing','update.profile.on.first.login'),('18728c11-de8d-45b1-882d-f7831d612a1c','false','require.password.update.after.registration'),('a22e2f47-9bf9-489f-8889-23b8f75ebbe4','missing','update.profile.on.first.login');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('0e340f5b-529b-4a51-9ec0-3aebfe99dcd5',_binary '',_binary '\0','security-admin-console',0,_binary '','01ccbca7-3c97-4a9d-8be9-8f2d65adcd0d','/admin/customers/console/',_binary '\0',NULL,_binary '\0','customers','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('10515457-1268-4829-87b2-136005abc130',_binary '',_binary '\0','broker',0,_binary '\0','683ae91b-66b2-4633-bf87-2dafe2902c32',NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('1ce7298d-fe2d-49d5-be66-bafa584bed70',_binary '',_binary '\0','admin-cli',0,_binary '','9d314ace-3976-441b-a676-28e0b41cda74',NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('35f9aa3f-0809-4b80-9d32-f128b9819e71',_binary '',_binary '\0','account-console',0,_binary '','7b5b0cf5-9314-4ba3-889c-0484137c7614','/realms/customers/account/',_binary '\0',NULL,_binary '\0','customers','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('3decebb2-f7ec-427e-ba4b-3e33d2c8c598',_binary '',_binary '\0','security-admin-console',0,_binary '','05f41cb3-9b28-4aee-86b3-05c603ef58cc','/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('5bba4a74-d89e-4280-97b8-018d7a03eb23',_binary '',_binary '\0','account',0,_binary '\0','9a56794a-e262-4f7f-904e-d9fc187f364b','/realms/customers/account/',_binary '\0',NULL,_binary '\0','customers','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('63cf9145-de0c-4f53-96b4-f881fd3d3a72',_binary '',_binary '\0','broker',0,_binary '\0','bf389c6d-f1dd-45e1-9bf0-2eb5b12c87c4',NULL,_binary '\0',NULL,_binary '\0','customers','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('6b6c72ba-6fd7-4b9e-91b6-4eff47af9068',_binary '',_binary '\0','account-console',0,_binary '','bcb34779-c61e-49f0-8551-7342a7fccf92','/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('7ef4796e-a932-41cb-9bbc-006bc16cfdf1',_binary '',_binary '','customers-realm',0,_binary '\0','7505deb0-9ce8-496f-a8ee-1eac7c8f5b20',NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','customers Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('8d4f97ec-581f-4c16-a87c-8690b4031c4e',_binary '',_binary '','master-realm',0,_binary '\0','264263e1-58df-47a8-bb70-da41235a583c',NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '',_binary '\0','realm-management',0,_binary '\0','f078fbde-1f39-42ba-8f6e-e6985b3c6ebb',NULL,_binary '',NULL,_binary '\0','customers','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('c9e6110f-f347-4d2c-8206-cf4504a99865',_binary '',_binary '\0','admin-cli',0,_binary '\0','5b97220c-838a-4186-bcdd-8cdb77d0e0f3',NULL,_binary '\0',NULL,_binary '\0','customers','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('d1b4ce96-42e8-4770-aed1-c6cad994fcbb',_binary '',_binary '\0','account',0,_binary '\0','013df798-0f44-4400-a694-1a68511d0076','/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('f6ebeaf9-bc3b-401d-9b39-e967191d4a1b',_binary '',_binary '','scanners',0,_binary '','a46a539e-c0fe-4c01-8c36-cb246ccaead3',NULL,_binary '\0','',_binary '\0','customers','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0');
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
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('0e340f5b-529b-4a51-9ec0-3aebfe99dcd5','S256','pkce.code.challenge.method'),('35f9aa3f-0809-4b80-9d32-f128b9819e71','S256','pkce.code.challenge.method'),('3decebb2-f7ec-427e-ba4b-3e33d2c8c598','S256','pkce.code.challenge.method'),('6b6c72ba-6fd7-4b9e-91b6-4eff47af9068','S256','pkce.code.challenge.method'),('c9e6110f-f347-4d2c-8206-cf4504a99865','false','backchannel.logout.revoke.offline.tokens'),('c9e6110f-f347-4d2c-8206-cf4504a99865','false','backchannel.logout.session.required'),('c9e6110f-f347-4d2c-8206-cf4504a99865','false','client_credentials.use_refresh_token'),('c9e6110f-f347-4d2c-8206-cf4504a99865','false','display.on.consent.screen'),('c9e6110f-f347-4d2c-8206-cf4504a99865','false','exclude.session.state.from.auth.response'),('c9e6110f-f347-4d2c-8206-cf4504a99865',NULL,'request.uris'),('c9e6110f-f347-4d2c-8206-cf4504a99865','false','saml_force_name_id_format'),('c9e6110f-f347-4d2c-8206-cf4504a99865','false','saml.assertion.signature'),('c9e6110f-f347-4d2c-8206-cf4504a99865','false','saml.authnstatement'),('c9e6110f-f347-4d2c-8206-cf4504a99865','false','saml.client.signature'),('c9e6110f-f347-4d2c-8206-cf4504a99865','false','saml.encrypt'),('c9e6110f-f347-4d2c-8206-cf4504a99865','false','saml.force.post.binding'),('c9e6110f-f347-4d2c-8206-cf4504a99865','false','saml.multivalued.roles'),('c9e6110f-f347-4d2c-8206-cf4504a99865','false','saml.onetimeuse.condition'),('c9e6110f-f347-4d2c-8206-cf4504a99865','false','saml.server.signature'),('c9e6110f-f347-4d2c-8206-cf4504a99865','false','saml.server.signature.keyinfo.ext'),('c9e6110f-f347-4d2c-8206-cf4504a99865','false','tls.client.certificate.bound.access.tokens'),('f6ebeaf9-bc3b-401d-9b39-e967191d4a1b','false','backchannel.logout.revoke.offline.tokens'),('f6ebeaf9-bc3b-401d-9b39-e967191d4a1b','true','backchannel.logout.session.required');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('0505fc1a-95c2-4210-b334-734ff5a5383e','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('1eb05fd2-0f45-40f6-abb0-98448c4e6548','profile','customers','OpenID Connect built-in scope: profile','openid-connect'),('26453049-5a31-4df7-ac66-ae1135258083','microprofile-jwt','customers','Microprofile - JWT built-in scope','openid-connect'),('39c35c9f-6d59-4d1b-ae7c-1b584208b678','role_list','customers','SAML role list','saml'),('44f23d2a-2d67-46fc-8986-824b15e5d57e','role_list','master','SAML role list','saml'),('4fc4e8e9-faee-4225-817e-33f63aad5865','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('5be0f2ad-d5be-432e-94c2-4cd7bd2d1728','address','master','OpenID Connect built-in scope: address','openid-connect'),('6271ec48-fb8d-4fd1-83a2-ea11ce19261d','email','customers','OpenID Connect built-in scope: email','openid-connect'),('6a304655-ce70-4bf9-89e0-a75967be895a','email','master','OpenID Connect built-in scope: email','openid-connect'),('7bdb6058-2c09-4539-a2bd-de292c6c166f','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('8372670b-61ea-479d-8e3a-7dfc4423e72e','web-origins','customers','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('8a6fae5d-00c9-42a2-bead-31a38239892a','offline_access','customers','OpenID Connect built-in scope: offline_access','openid-connect'),('955e2209-d0f7-4bcb-8579-a97f99b43ed6','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('c512f6e8-fbcd-4fc7-b865-87a41866999c','roles','customers','OpenID Connect scope for add user roles to the access token','openid-connect'),('ccaf2c6e-694f-43df-8568-17ceb03e1a33','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('cd177045-6898-40d7-b228-1330df000b1c','phone','customers','OpenID Connect built-in scope: phone','openid-connect'),('eeb2d339-8dd3-4808-8ef2-1c23944830ba','address','customers','OpenID Connect built-in scope: address','openid-connect'),('f4a13c0e-2530-49f3-8e6c-44102d9af005','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('0505fc1a-95c2-4210-b334-734ff5a5383e','${rolesScopeConsentText}','consent.screen.text'),('0505fc1a-95c2-4210-b334-734ff5a5383e','true','display.on.consent.screen'),('0505fc1a-95c2-4210-b334-734ff5a5383e','false','include.in.token.scope'),('1eb05fd2-0f45-40f6-abb0-98448c4e6548','${profileScopeConsentText}','consent.screen.text'),('1eb05fd2-0f45-40f6-abb0-98448c4e6548','true','display.on.consent.screen'),('1eb05fd2-0f45-40f6-abb0-98448c4e6548','true','include.in.token.scope'),('26453049-5a31-4df7-ac66-ae1135258083','false','display.on.consent.screen'),('26453049-5a31-4df7-ac66-ae1135258083','true','include.in.token.scope'),('39c35c9f-6d59-4d1b-ae7c-1b584208b678','${samlRoleListScopeConsentText}','consent.screen.text'),('39c35c9f-6d59-4d1b-ae7c-1b584208b678','true','display.on.consent.screen'),('44f23d2a-2d67-46fc-8986-824b15e5d57e','${samlRoleListScopeConsentText}','consent.screen.text'),('44f23d2a-2d67-46fc-8986-824b15e5d57e','true','display.on.consent.screen'),('4fc4e8e9-faee-4225-817e-33f63aad5865','','consent.screen.text'),('4fc4e8e9-faee-4225-817e-33f63aad5865','false','display.on.consent.screen'),('4fc4e8e9-faee-4225-817e-33f63aad5865','false','include.in.token.scope'),('5be0f2ad-d5be-432e-94c2-4cd7bd2d1728','${addressScopeConsentText}','consent.screen.text'),('5be0f2ad-d5be-432e-94c2-4cd7bd2d1728','true','display.on.consent.screen'),('5be0f2ad-d5be-432e-94c2-4cd7bd2d1728','true','include.in.token.scope'),('6271ec48-fb8d-4fd1-83a2-ea11ce19261d','${emailScopeConsentText}','consent.screen.text'),('6271ec48-fb8d-4fd1-83a2-ea11ce19261d','true','display.on.consent.screen'),('6271ec48-fb8d-4fd1-83a2-ea11ce19261d','true','include.in.token.scope'),('6a304655-ce70-4bf9-89e0-a75967be895a','${emailScopeConsentText}','consent.screen.text'),('6a304655-ce70-4bf9-89e0-a75967be895a','true','display.on.consent.screen'),('6a304655-ce70-4bf9-89e0-a75967be895a','true','include.in.token.scope'),('7bdb6058-2c09-4539-a2bd-de292c6c166f','false','display.on.consent.screen'),('7bdb6058-2c09-4539-a2bd-de292c6c166f','true','include.in.token.scope'),('8372670b-61ea-479d-8e3a-7dfc4423e72e','','consent.screen.text'),('8372670b-61ea-479d-8e3a-7dfc4423e72e','false','display.on.consent.screen'),('8372670b-61ea-479d-8e3a-7dfc4423e72e','false','include.in.token.scope'),('8a6fae5d-00c9-42a2-bead-31a38239892a','${offlineAccessScopeConsentText}','consent.screen.text'),('8a6fae5d-00c9-42a2-bead-31a38239892a','true','display.on.consent.screen'),('955e2209-d0f7-4bcb-8579-a97f99b43ed6','${phoneScopeConsentText}','consent.screen.text'),('955e2209-d0f7-4bcb-8579-a97f99b43ed6','true','display.on.consent.screen'),('955e2209-d0f7-4bcb-8579-a97f99b43ed6','true','include.in.token.scope'),('c512f6e8-fbcd-4fc7-b865-87a41866999c','${rolesScopeConsentText}','consent.screen.text'),('c512f6e8-fbcd-4fc7-b865-87a41866999c','true','display.on.consent.screen'),('c512f6e8-fbcd-4fc7-b865-87a41866999c','false','include.in.token.scope'),('ccaf2c6e-694f-43df-8568-17ceb03e1a33','${profileScopeConsentText}','consent.screen.text'),('ccaf2c6e-694f-43df-8568-17ceb03e1a33','true','display.on.consent.screen'),('ccaf2c6e-694f-43df-8568-17ceb03e1a33','true','include.in.token.scope'),('cd177045-6898-40d7-b228-1330df000b1c','${phoneScopeConsentText}','consent.screen.text'),('cd177045-6898-40d7-b228-1330df000b1c','true','display.on.consent.screen'),('cd177045-6898-40d7-b228-1330df000b1c','true','include.in.token.scope'),('eeb2d339-8dd3-4808-8ef2-1c23944830ba','${addressScopeConsentText}','consent.screen.text'),('eeb2d339-8dd3-4808-8ef2-1c23944830ba','true','display.on.consent.screen'),('eeb2d339-8dd3-4808-8ef2-1c23944830ba','true','include.in.token.scope'),('f4a13c0e-2530-49f3-8e6c-44102d9af005','${offlineAccessScopeConsentText}','consent.screen.text'),('f4a13c0e-2530-49f3-8e6c-44102d9af005','true','display.on.consent.screen');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('0e340f5b-529b-4a51-9ec0-3aebfe99dcd5','1eb05fd2-0f45-40f6-abb0-98448c4e6548',_binary ''),('0e340f5b-529b-4a51-9ec0-3aebfe99dcd5','26453049-5a31-4df7-ac66-ae1135258083',_binary '\0'),('0e340f5b-529b-4a51-9ec0-3aebfe99dcd5','39c35c9f-6d59-4d1b-ae7c-1b584208b678',_binary ''),('0e340f5b-529b-4a51-9ec0-3aebfe99dcd5','6271ec48-fb8d-4fd1-83a2-ea11ce19261d',_binary ''),('0e340f5b-529b-4a51-9ec0-3aebfe99dcd5','8372670b-61ea-479d-8e3a-7dfc4423e72e',_binary ''),('0e340f5b-529b-4a51-9ec0-3aebfe99dcd5','8a6fae5d-00c9-42a2-bead-31a38239892a',_binary '\0'),('0e340f5b-529b-4a51-9ec0-3aebfe99dcd5','c512f6e8-fbcd-4fc7-b865-87a41866999c',_binary ''),('0e340f5b-529b-4a51-9ec0-3aebfe99dcd5','cd177045-6898-40d7-b228-1330df000b1c',_binary '\0'),('0e340f5b-529b-4a51-9ec0-3aebfe99dcd5','eeb2d339-8dd3-4808-8ef2-1c23944830ba',_binary '\0'),('10515457-1268-4829-87b2-136005abc130','0505fc1a-95c2-4210-b334-734ff5a5383e',_binary ''),('10515457-1268-4829-87b2-136005abc130','44f23d2a-2d67-46fc-8986-824b15e5d57e',_binary ''),('10515457-1268-4829-87b2-136005abc130','4fc4e8e9-faee-4225-817e-33f63aad5865',_binary ''),('10515457-1268-4829-87b2-136005abc130','5be0f2ad-d5be-432e-94c2-4cd7bd2d1728',_binary '\0'),('10515457-1268-4829-87b2-136005abc130','6a304655-ce70-4bf9-89e0-a75967be895a',_binary ''),('10515457-1268-4829-87b2-136005abc130','7bdb6058-2c09-4539-a2bd-de292c6c166f',_binary '\0'),('10515457-1268-4829-87b2-136005abc130','955e2209-d0f7-4bcb-8579-a97f99b43ed6',_binary '\0'),('10515457-1268-4829-87b2-136005abc130','ccaf2c6e-694f-43df-8568-17ceb03e1a33',_binary ''),('10515457-1268-4829-87b2-136005abc130','f4a13c0e-2530-49f3-8e6c-44102d9af005',_binary '\0'),('1ce7298d-fe2d-49d5-be66-bafa584bed70','0505fc1a-95c2-4210-b334-734ff5a5383e',_binary ''),('1ce7298d-fe2d-49d5-be66-bafa584bed70','44f23d2a-2d67-46fc-8986-824b15e5d57e',_binary ''),('1ce7298d-fe2d-49d5-be66-bafa584bed70','4fc4e8e9-faee-4225-817e-33f63aad5865',_binary ''),('1ce7298d-fe2d-49d5-be66-bafa584bed70','5be0f2ad-d5be-432e-94c2-4cd7bd2d1728',_binary '\0'),('1ce7298d-fe2d-49d5-be66-bafa584bed70','6a304655-ce70-4bf9-89e0-a75967be895a',_binary ''),('1ce7298d-fe2d-49d5-be66-bafa584bed70','7bdb6058-2c09-4539-a2bd-de292c6c166f',_binary '\0'),('1ce7298d-fe2d-49d5-be66-bafa584bed70','955e2209-d0f7-4bcb-8579-a97f99b43ed6',_binary '\0'),('1ce7298d-fe2d-49d5-be66-bafa584bed70','ccaf2c6e-694f-43df-8568-17ceb03e1a33',_binary ''),('1ce7298d-fe2d-49d5-be66-bafa584bed70','f4a13c0e-2530-49f3-8e6c-44102d9af005',_binary '\0'),('35f9aa3f-0809-4b80-9d32-f128b9819e71','1eb05fd2-0f45-40f6-abb0-98448c4e6548',_binary ''),('35f9aa3f-0809-4b80-9d32-f128b9819e71','26453049-5a31-4df7-ac66-ae1135258083',_binary '\0'),('35f9aa3f-0809-4b80-9d32-f128b9819e71','39c35c9f-6d59-4d1b-ae7c-1b584208b678',_binary ''),('35f9aa3f-0809-4b80-9d32-f128b9819e71','6271ec48-fb8d-4fd1-83a2-ea11ce19261d',_binary ''),('35f9aa3f-0809-4b80-9d32-f128b9819e71','8372670b-61ea-479d-8e3a-7dfc4423e72e',_binary ''),('35f9aa3f-0809-4b80-9d32-f128b9819e71','8a6fae5d-00c9-42a2-bead-31a38239892a',_binary '\0'),('35f9aa3f-0809-4b80-9d32-f128b9819e71','c512f6e8-fbcd-4fc7-b865-87a41866999c',_binary ''),('35f9aa3f-0809-4b80-9d32-f128b9819e71','cd177045-6898-40d7-b228-1330df000b1c',_binary '\0'),('35f9aa3f-0809-4b80-9d32-f128b9819e71','eeb2d339-8dd3-4808-8ef2-1c23944830ba',_binary '\0'),('3decebb2-f7ec-427e-ba4b-3e33d2c8c598','0505fc1a-95c2-4210-b334-734ff5a5383e',_binary ''),('3decebb2-f7ec-427e-ba4b-3e33d2c8c598','44f23d2a-2d67-46fc-8986-824b15e5d57e',_binary ''),('3decebb2-f7ec-427e-ba4b-3e33d2c8c598','4fc4e8e9-faee-4225-817e-33f63aad5865',_binary ''),('3decebb2-f7ec-427e-ba4b-3e33d2c8c598','5be0f2ad-d5be-432e-94c2-4cd7bd2d1728',_binary '\0'),('3decebb2-f7ec-427e-ba4b-3e33d2c8c598','6a304655-ce70-4bf9-89e0-a75967be895a',_binary ''),('3decebb2-f7ec-427e-ba4b-3e33d2c8c598','7bdb6058-2c09-4539-a2bd-de292c6c166f',_binary '\0'),('3decebb2-f7ec-427e-ba4b-3e33d2c8c598','955e2209-d0f7-4bcb-8579-a97f99b43ed6',_binary '\0'),('3decebb2-f7ec-427e-ba4b-3e33d2c8c598','ccaf2c6e-694f-43df-8568-17ceb03e1a33',_binary ''),('3decebb2-f7ec-427e-ba4b-3e33d2c8c598','f4a13c0e-2530-49f3-8e6c-44102d9af005',_binary '\0'),('5bba4a74-d89e-4280-97b8-018d7a03eb23','1eb05fd2-0f45-40f6-abb0-98448c4e6548',_binary ''),('5bba4a74-d89e-4280-97b8-018d7a03eb23','26453049-5a31-4df7-ac66-ae1135258083',_binary '\0'),('5bba4a74-d89e-4280-97b8-018d7a03eb23','39c35c9f-6d59-4d1b-ae7c-1b584208b678',_binary ''),('5bba4a74-d89e-4280-97b8-018d7a03eb23','6271ec48-fb8d-4fd1-83a2-ea11ce19261d',_binary ''),('5bba4a74-d89e-4280-97b8-018d7a03eb23','8372670b-61ea-479d-8e3a-7dfc4423e72e',_binary ''),('5bba4a74-d89e-4280-97b8-018d7a03eb23','8a6fae5d-00c9-42a2-bead-31a38239892a',_binary '\0'),('5bba4a74-d89e-4280-97b8-018d7a03eb23','c512f6e8-fbcd-4fc7-b865-87a41866999c',_binary ''),('5bba4a74-d89e-4280-97b8-018d7a03eb23','cd177045-6898-40d7-b228-1330df000b1c',_binary '\0'),('5bba4a74-d89e-4280-97b8-018d7a03eb23','eeb2d339-8dd3-4808-8ef2-1c23944830ba',_binary '\0'),('63cf9145-de0c-4f53-96b4-f881fd3d3a72','1eb05fd2-0f45-40f6-abb0-98448c4e6548',_binary ''),('63cf9145-de0c-4f53-96b4-f881fd3d3a72','26453049-5a31-4df7-ac66-ae1135258083',_binary '\0'),('63cf9145-de0c-4f53-96b4-f881fd3d3a72','39c35c9f-6d59-4d1b-ae7c-1b584208b678',_binary ''),('63cf9145-de0c-4f53-96b4-f881fd3d3a72','6271ec48-fb8d-4fd1-83a2-ea11ce19261d',_binary ''),('63cf9145-de0c-4f53-96b4-f881fd3d3a72','8372670b-61ea-479d-8e3a-7dfc4423e72e',_binary ''),('63cf9145-de0c-4f53-96b4-f881fd3d3a72','8a6fae5d-00c9-42a2-bead-31a38239892a',_binary '\0'),('63cf9145-de0c-4f53-96b4-f881fd3d3a72','c512f6e8-fbcd-4fc7-b865-87a41866999c',_binary ''),('63cf9145-de0c-4f53-96b4-f881fd3d3a72','cd177045-6898-40d7-b228-1330df000b1c',_binary '\0'),('63cf9145-de0c-4f53-96b4-f881fd3d3a72','eeb2d339-8dd3-4808-8ef2-1c23944830ba',_binary '\0'),('6b6c72ba-6fd7-4b9e-91b6-4eff47af9068','0505fc1a-95c2-4210-b334-734ff5a5383e',_binary ''),('6b6c72ba-6fd7-4b9e-91b6-4eff47af9068','44f23d2a-2d67-46fc-8986-824b15e5d57e',_binary ''),('6b6c72ba-6fd7-4b9e-91b6-4eff47af9068','4fc4e8e9-faee-4225-817e-33f63aad5865',_binary ''),('6b6c72ba-6fd7-4b9e-91b6-4eff47af9068','5be0f2ad-d5be-432e-94c2-4cd7bd2d1728',_binary '\0'),('6b6c72ba-6fd7-4b9e-91b6-4eff47af9068','6a304655-ce70-4bf9-89e0-a75967be895a',_binary ''),('6b6c72ba-6fd7-4b9e-91b6-4eff47af9068','7bdb6058-2c09-4539-a2bd-de292c6c166f',_binary '\0'),('6b6c72ba-6fd7-4b9e-91b6-4eff47af9068','955e2209-d0f7-4bcb-8579-a97f99b43ed6',_binary '\0'),('6b6c72ba-6fd7-4b9e-91b6-4eff47af9068','ccaf2c6e-694f-43df-8568-17ceb03e1a33',_binary ''),('6b6c72ba-6fd7-4b9e-91b6-4eff47af9068','f4a13c0e-2530-49f3-8e6c-44102d9af005',_binary '\0'),('7ef4796e-a932-41cb-9bbc-006bc16cfdf1','0505fc1a-95c2-4210-b334-734ff5a5383e',_binary ''),('7ef4796e-a932-41cb-9bbc-006bc16cfdf1','44f23d2a-2d67-46fc-8986-824b15e5d57e',_binary ''),('7ef4796e-a932-41cb-9bbc-006bc16cfdf1','4fc4e8e9-faee-4225-817e-33f63aad5865',_binary ''),('7ef4796e-a932-41cb-9bbc-006bc16cfdf1','5be0f2ad-d5be-432e-94c2-4cd7bd2d1728',_binary '\0'),('7ef4796e-a932-41cb-9bbc-006bc16cfdf1','6a304655-ce70-4bf9-89e0-a75967be895a',_binary ''),('7ef4796e-a932-41cb-9bbc-006bc16cfdf1','7bdb6058-2c09-4539-a2bd-de292c6c166f',_binary '\0'),('7ef4796e-a932-41cb-9bbc-006bc16cfdf1','955e2209-d0f7-4bcb-8579-a97f99b43ed6',_binary '\0'),('7ef4796e-a932-41cb-9bbc-006bc16cfdf1','ccaf2c6e-694f-43df-8568-17ceb03e1a33',_binary ''),('7ef4796e-a932-41cb-9bbc-006bc16cfdf1','f4a13c0e-2530-49f3-8e6c-44102d9af005',_binary '\0'),('8d4f97ec-581f-4c16-a87c-8690b4031c4e','0505fc1a-95c2-4210-b334-734ff5a5383e',_binary ''),('8d4f97ec-581f-4c16-a87c-8690b4031c4e','44f23d2a-2d67-46fc-8986-824b15e5d57e',_binary ''),('8d4f97ec-581f-4c16-a87c-8690b4031c4e','4fc4e8e9-faee-4225-817e-33f63aad5865',_binary ''),('8d4f97ec-581f-4c16-a87c-8690b4031c4e','5be0f2ad-d5be-432e-94c2-4cd7bd2d1728',_binary '\0'),('8d4f97ec-581f-4c16-a87c-8690b4031c4e','6a304655-ce70-4bf9-89e0-a75967be895a',_binary ''),('8d4f97ec-581f-4c16-a87c-8690b4031c4e','7bdb6058-2c09-4539-a2bd-de292c6c166f',_binary '\0'),('8d4f97ec-581f-4c16-a87c-8690b4031c4e','955e2209-d0f7-4bcb-8579-a97f99b43ed6',_binary '\0'),('8d4f97ec-581f-4c16-a87c-8690b4031c4e','ccaf2c6e-694f-43df-8568-17ceb03e1a33',_binary ''),('8d4f97ec-581f-4c16-a87c-8690b4031c4e','f4a13c0e-2530-49f3-8e6c-44102d9af005',_binary '\0'),('97cf7bc9-27ef-43c2-8b87-235f57531fc8','1eb05fd2-0f45-40f6-abb0-98448c4e6548',_binary ''),('97cf7bc9-27ef-43c2-8b87-235f57531fc8','26453049-5a31-4df7-ac66-ae1135258083',_binary '\0'),('97cf7bc9-27ef-43c2-8b87-235f57531fc8','39c35c9f-6d59-4d1b-ae7c-1b584208b678',_binary ''),('97cf7bc9-27ef-43c2-8b87-235f57531fc8','6271ec48-fb8d-4fd1-83a2-ea11ce19261d',_binary ''),('97cf7bc9-27ef-43c2-8b87-235f57531fc8','8372670b-61ea-479d-8e3a-7dfc4423e72e',_binary ''),('97cf7bc9-27ef-43c2-8b87-235f57531fc8','8a6fae5d-00c9-42a2-bead-31a38239892a',_binary '\0'),('97cf7bc9-27ef-43c2-8b87-235f57531fc8','c512f6e8-fbcd-4fc7-b865-87a41866999c',_binary ''),('97cf7bc9-27ef-43c2-8b87-235f57531fc8','cd177045-6898-40d7-b228-1330df000b1c',_binary '\0'),('97cf7bc9-27ef-43c2-8b87-235f57531fc8','eeb2d339-8dd3-4808-8ef2-1c23944830ba',_binary '\0'),('c9e6110f-f347-4d2c-8206-cf4504a99865','1eb05fd2-0f45-40f6-abb0-98448c4e6548',_binary ''),('c9e6110f-f347-4d2c-8206-cf4504a99865','26453049-5a31-4df7-ac66-ae1135258083',_binary '\0'),('c9e6110f-f347-4d2c-8206-cf4504a99865','39c35c9f-6d59-4d1b-ae7c-1b584208b678',_binary ''),('c9e6110f-f347-4d2c-8206-cf4504a99865','6271ec48-fb8d-4fd1-83a2-ea11ce19261d',_binary ''),('c9e6110f-f347-4d2c-8206-cf4504a99865','8372670b-61ea-479d-8e3a-7dfc4423e72e',_binary ''),('c9e6110f-f347-4d2c-8206-cf4504a99865','8a6fae5d-00c9-42a2-bead-31a38239892a',_binary '\0'),('c9e6110f-f347-4d2c-8206-cf4504a99865','c512f6e8-fbcd-4fc7-b865-87a41866999c',_binary ''),('c9e6110f-f347-4d2c-8206-cf4504a99865','cd177045-6898-40d7-b228-1330df000b1c',_binary '\0'),('c9e6110f-f347-4d2c-8206-cf4504a99865','eeb2d339-8dd3-4808-8ef2-1c23944830ba',_binary '\0'),('d1b4ce96-42e8-4770-aed1-c6cad994fcbb','0505fc1a-95c2-4210-b334-734ff5a5383e',_binary ''),('d1b4ce96-42e8-4770-aed1-c6cad994fcbb','44f23d2a-2d67-46fc-8986-824b15e5d57e',_binary ''),('d1b4ce96-42e8-4770-aed1-c6cad994fcbb','4fc4e8e9-faee-4225-817e-33f63aad5865',_binary ''),('d1b4ce96-42e8-4770-aed1-c6cad994fcbb','5be0f2ad-d5be-432e-94c2-4cd7bd2d1728',_binary '\0'),('d1b4ce96-42e8-4770-aed1-c6cad994fcbb','6a304655-ce70-4bf9-89e0-a75967be895a',_binary ''),('d1b4ce96-42e8-4770-aed1-c6cad994fcbb','7bdb6058-2c09-4539-a2bd-de292c6c166f',_binary '\0'),('d1b4ce96-42e8-4770-aed1-c6cad994fcbb','955e2209-d0f7-4bcb-8579-a97f99b43ed6',_binary '\0'),('d1b4ce96-42e8-4770-aed1-c6cad994fcbb','ccaf2c6e-694f-43df-8568-17ceb03e1a33',_binary ''),('d1b4ce96-42e8-4770-aed1-c6cad994fcbb','f4a13c0e-2530-49f3-8e6c-44102d9af005',_binary '\0'),('f6ebeaf9-bc3b-401d-9b39-e967191d4a1b','1eb05fd2-0f45-40f6-abb0-98448c4e6548',_binary ''),('f6ebeaf9-bc3b-401d-9b39-e967191d4a1b','26453049-5a31-4df7-ac66-ae1135258083',_binary '\0'),('f6ebeaf9-bc3b-401d-9b39-e967191d4a1b','39c35c9f-6d59-4d1b-ae7c-1b584208b678',_binary ''),('f6ebeaf9-bc3b-401d-9b39-e967191d4a1b','6271ec48-fb8d-4fd1-83a2-ea11ce19261d',_binary ''),('f6ebeaf9-bc3b-401d-9b39-e967191d4a1b','8372670b-61ea-479d-8e3a-7dfc4423e72e',_binary ''),('f6ebeaf9-bc3b-401d-9b39-e967191d4a1b','8a6fae5d-00c9-42a2-bead-31a38239892a',_binary '\0'),('f6ebeaf9-bc3b-401d-9b39-e967191d4a1b','c512f6e8-fbcd-4fc7-b865-87a41866999c',_binary ''),('f6ebeaf9-bc3b-401d-9b39-e967191d4a1b','cd177045-6898-40d7-b228-1330df000b1c',_binary '\0'),('f6ebeaf9-bc3b-401d-9b39-e967191d4a1b','eeb2d339-8dd3-4808-8ef2-1c23944830ba',_binary '\0');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('8a6fae5d-00c9-42a2-bead-31a38239892a','97bdcce8-a816-4556-bc98-f0e265f344ec'),('f4a13c0e-2530-49f3-8e6c-44102d9af005','5b2b11c6-eb14-44ea-846c-a12e5a098497');
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
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `VALUE` text,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('00f526bc-a958-46f2-b653-7d279c5bb750','aes-generated','customers','aes-generated','org.keycloak.keys.KeyProvider','customers',NULL),('0e93a30b-fcc9-4ab7-9244-6ea9014ac679','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('1713c75c-5f40-4a9c-9f08-e06af05f91bc','Allowed Client Scopes','customers','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','customers','anonymous'),('1997db6b-8360-4d7a-9157-85cff94dd670','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('271c882d-f647-40d4-8d5c-54d6a21a46aa','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('31cf5591-e8b5-4b3b-8a7d-8d1e3271f58d','Allowed Client Scopes','customers','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','customers','authenticated'),('5a772a71-e970-4d5d-bf26-675695f06745','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('6ccd0dc7-ea47-40fc-96eb-4b5aa332da4c','Allowed Protocol Mapper Types','customers','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','customers','authenticated'),('6d8d3edb-52de-4266-bc86-3e919529e25c','fallback-HS256','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('76d43a72-19cc-4b46-bbb3-552ab71527d3','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('77a8e9e8-41f9-48c9-aca0-a61673c11b7a','Allowed Protocol Mapper Types','customers','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','customers','anonymous'),('7de828da-a482-4343-87e5-e5f9721abb37','rsa-generated','customers','rsa-generated','org.keycloak.keys.KeyProvider','customers',NULL),('a1572d42-ac1c-4fb1-8ae3-d3f6f0022ece','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('b6ab9341-191c-42c5-87f5-d10a553bc061','Full Scope Disabled','customers','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','customers','anonymous'),('bd82657b-2416-40af-945e-d867a45aa512','Consent Required','customers','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','customers','anonymous'),('c1c61618-436f-4c94-90bf-98af807880d5','fallback-RS256','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('dee20bad-b219-4d6d-9af5-9e10fc707296','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('e351d1ca-6457-49a6-bb8d-f783180f8b5f','Trusted Hosts','customers','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','customers','anonymous'),('f19c78f1-5cba-4715-904d-239788ba6b84','hmac-generated','customers','hmac-generated','org.keycloak.keys.KeyProvider','customers',NULL),('f72c9072-d355-4015-ba00-4c7aedb3966e','Max Clients Limit','customers','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','customers','anonymous'),('fd7caf8d-d216-40ce-8481-20e444b5b4a6','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous');
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
  `VALUE` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('02237bec-8705-43d2-b94a-08aa7cb96c8a','f19c78f1-5cba-4715-904d-239788ba6b84','algorithm','HS256'),('0d3125d0-79ea-4588-8e13-55cd5ce46ef2','5a772a71-e970-4d5d-bf26-675695f06745','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('12d84ffd-12a3-4742-91ac-ffaa161cba4e','fd7caf8d-d216-40ce-8481-20e444b5b4a6','client-uris-must-match','true'),('1dc5062e-8edb-4b90-b2fb-a397f264a2b1','271c882d-f647-40d4-8d5c-54d6a21a46aa','allowed-protocol-mapper-types','oidc-address-mapper'),('2c86298c-7799-444b-9f96-710ac755ec96','6ccd0dc7-ea47-40fc-96eb-4b5aa332da4c','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('33236ee0-c41e-4b79-99fa-5a66f85f6b10','271c882d-f647-40d4-8d5c-54d6a21a46aa','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('35771462-8f7f-4b8b-a8bc-2aef4ecd0211','6d8d3edb-52de-4266-bc86-3e919529e25c','secret','_p60e7qIAX2k03HlEVCC-AV3bY84o4Vg9yUEdtSlc6M8jUz8P37pSCYvggj6l19bm_qqF4prG_loBloMUsggyA'),('3a625bba-c344-41ab-b290-a9278dd042b2','f19c78f1-5cba-4715-904d-239788ba6b84','kid','23ce3b23-4e5b-4056-86b2-82fb6b30d02b'),('3ae59753-a543-4ac3-a115-baed6f003496','00f526bc-a958-46f2-b653-7d279c5bb750','kid','ae3887a4-6183-4a05-a488-b1c4aa40bc53'),('3b89c7af-bad5-4fb7-8b7a-b7771a21828c','5a772a71-e970-4d5d-bf26-675695f06745','allowed-protocol-mapper-types','saml-user-property-mapper'),('3de612a5-0571-4714-a897-e12386545893','1997db6b-8360-4d7a-9157-85cff94dd670','allow-default-scopes','true'),('3e67c5fc-d3a2-476f-a042-d396d5d2629a','271c882d-f647-40d4-8d5c-54d6a21a46aa','allowed-protocol-mapper-types','saml-role-list-mapper'),('42813c19-8d96-4306-8d37-75e5590a8574','c1c61618-436f-4c94-90bf-98af807880d5','algorithm','RS256'),('45eb1100-2ec6-4f7b-84fd-0a8ae4586258','31cf5591-e8b5-4b3b-8a7d-8d1e3271f58d','allow-default-scopes','true'),('4946a4b1-1e90-46e8-a3e6-7884a0c3bfc5','5a772a71-e970-4d5d-bf26-675695f06745','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('4d037d56-8bbc-4631-8265-82198c610da2','c1c61618-436f-4c94-90bf-98af807880d5','privateKey','MIIEpAIBAAKCAQEAm3m06b14iWMqG+Y/LAbCs1E6d/mrKxO4O6wKrHzj7g2iFBuWbZG+DeW2k7l+EyyndEDimJ5gvOHQEzqiX7QQeeBUkk57FjugjzXwXP1zC23NeZHtTEL3som/d1v5cne1Eo4BK/PCfci6Tm3W3kSzkCOV8zt/kUaGkqCjCh5RVNZYvwmGCO3Sqz9uhBplnY8KuEKq0Dq+CzREaVCR+UEiaW1Z3UJKNUY3JI+9/slbat2NyqhkPOuuFyPYKSwSz6xHsaEoyt2m9sneA+fPxtVGZcZcHg7ecesQJ6Kj5BQsHjIWgULsN7ZSxAmLcez+a828gDHvECrUZz6gCw1cEJh5LwIDAQABAoIBAQCSfcx+aC4IlUz52KoxG3Wca67BmJc1EXGHmAS+nTZN+L58X7oPJ0GB6q1q513pRyvIl9JppuDTV5ksZRTVQ946V6qX6CaFvkz8YwBFPfGGFUGDiIGkV3z31l53YkvZFP2hq/diqFzbE6SnfUr1RppB96Wz9p2uDluCEKVORV6wpYYHe28dLpm3jfKmJgRapfseGKHL5HChztx2IOW/dB480ej+Q4YNwgcO38VRlW9DNWYQhfoeACEeqFc715Gc8ie5v+VqKpGAKojYLgq9ohYV7TdN4nac6CcHSYDn/0Cp2aTV5ZmAVm6zRih7lOEoARS/LgmrWXjswKB4qKWyMtVhAoGBAMzEVbjHeB8cGxsZSRO6VT/wJHVCLtC9YEsB7vJ7+lbBF759NPiwoevpVu55klbPecmFuc9Tg9ZfZ8bkBnNknMG42zrVqcIaaDoprW43qJoBIZhQSgz4/n+sC7TaA6Lib/cpJ2VG7+ZfP4NFOHQxymlpq8+aB5EpiMqSNBpU2uDZAoGBAMJgKuo7X/+zB2VeMfrmE554vHpOSLOT3DCjP6UcCu6kz1XPDnP7BwaQ0eVQJ40EG8yrO3dRyUm4+OkyUEsEVHbfk62fs2sp22WBdsGGw3SZfxuqCq4rdjQZ6d1QbPNLL/+fb/6+oN3uLx1V6qfOmHxJkCkOqdUhCCezqfXpkuVHAoGAUYBP8kUKja9dJpMQ4BZJOjK2ACoAgjruKcyyM7ee84rVjY8+V0HOoRx16mNfGMhp3Akq5NeD4P6GSsaVvrYsInsWXzuN3uEt3QCbtAPZSrrqiTpjzvgIK/7phelEiz9/eyvZL1llwRbmK7SQfMcYno5dwTq4ilGyzZYVwOlHWTkCgYBeQYwN8aTntcUMXtUVuaQh4KJlHLkce8L2wvMF+cdDWiBAmBuGGmCZyng+HtRPCYMBiLdZcQuO+GebjY5qEjtzOY+/TgYPHUkKu/D+f38gd56vp5FuTB0Rvs8tRubOQ9OOvZ3thjsz42BtdVBI92HyQyno/vdUJqRxvCna2d0l2QKBgQCgD8D1nAH8TkidZb/Kom7GzR8gEswGy15sNFWeiTN/PMJhi1TubN9r0HPmKHCAnp/tGidwfqK+YTXZA5PwP16peikE2qS02And2KBse+EDbTfkucuFWTPgeCGVtBahAiu/qrZYFd9PumiQa9FS63FTKlgpEv6p66Y3AHoZqshfBw=='),('4f891ec2-c60e-42d6-9378-17fcb7fbf71a','6ccd0dc7-ea47-40fc-96eb-4b5aa332da4c','allowed-protocol-mapper-types','oidc-full-name-mapper'),('5772c8d7-06b2-46c9-844f-983e50b16210','76d43a72-19cc-4b46-bbb3-552ab71527d3','allow-default-scopes','true'),('58b9ad34-4fd4-48d6-9ae8-1cc968795d42','e351d1ca-6457-49a6-bb8d-f783180f8b5f','client-uris-must-match','true'),('5a479d14-675c-448e-b673-b8a2f5f253f7','00f526bc-a958-46f2-b653-7d279c5bb750','priority','100'),('5bc10e4e-7ad1-47bf-b046-5de4efa324cd','6d8d3edb-52de-4266-bc86-3e919529e25c','algorithm','HS256'),('5c148dec-bc29-45df-af9b-771d22ef0c07','fd7caf8d-d216-40ce-8481-20e444b5b4a6','host-sending-registration-request-must-match','true'),('5f63195d-d1ca-4223-8b3f-090d1cdf37e0','5a772a71-e970-4d5d-bf26-675695f06745','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('6484a2cf-bfca-4198-a205-b9992b192a16','7de828da-a482-4343-87e5-e5f9721abb37','privateKey','MIIEogIBAAKCAQEAt0EwFCzsmzWgn7A8A40hzX1kPHab0WZTmUF8OwHt7fyds6sBiSDPnLIh0BgmXIO2WIrGzARm9dVUeAWI/aUI7qucfgYgW7XSwwz7X/IrX6DExsNZzTLxgIfDJR/WP0fo1vO10BQDAtJxEkX5YvFitBFzg4FLKMZP5inAFM21+jfjD2ufi7NWTyFJR6YCLGFma29XHE75yE76+Xq8eH3DI/8xmrU5hw1Yk5GrABf4KYTijsp+QLQZkEycYvfJEPEMigwnARdp6C3VDp/T8OL1hb2YtrZ4vjZ80azEicQ3ea/R05JK6ikfik2SlC5Rm0Ore0Rh4jB1tI51biVa0smsiwIDAQABAoIBAHnx9CeI2Y5TOmbpZJZMZVET/w7JMtk+iaTzUdMGbqkusFauFiCFaAJy+1M5rtVjhIUZHD8JMuamJkaUEFwRZYdFRacLNp8wuGa5jdGEGl7RYgCOYITPQKvyK+bZb72+gXAAz1z+5B4NodayH8k6rh77ee3prPUeOm8EG2D8nvs48utcBM5nDIXZrluTmAx1+E1O2GTv6TGUAAOIEts5V3y0QvB/EpEtahuhW2On/XLDzd/Ufk8WsPkGMR+x/XSHuWMSgXvOwlVk9DuCaOoHpPMTvUffaISVGviXSfxdX4Fvsmv8mkZry43bULUBnKWarnL118FrvZUnWhgnTe+8SdkCgYEA4Z8CWHFGHsMEh/ERX1l7MWi+cM+xHShU9FEszsc1MOgJaO67pwpD300TnD1D38WoTUDYgOFY8vbH74RRDxP8nIPUpZDYC3lwcLcX2HFFXJ0iYoW9sPwnd7vSbHcowc6yneuiQ2vzwFmbeMKtlRVRQe7EIBAFg3NFVZM2uTLVBs0CgYEAz+3Wa00xIZyGHDScWfzRPxT5trw9gnOmi0zspDKHmxeGp1TGWXtNTuMje3OLhFqgZL/UGTX6VdB8FiN1rN2MgiJ525PaoDG0+Hh7Zn1mOZeH1Ru8VXS3e2SIrpaC/nEe4teSWl9cXe4hOVg8psL25xCg/weYJDjEvzCM/+ppELcCgYB1Zr5bsyWfoC7dZg16Jh+6iByAqzIoT/JU52B/gJ0nA7bRyVgQBYFn0r2fkSmeaUW4XUPLXHdihhNniNx9EhNihh7CwGoLHnfpzvwzfk1vcbyQs7MPQ0ZuQWevVRn6L0o2boSSvLurnXUPE44rg1ozCsE3Rd74laTAcMgK+m5rCQKBgCkPoL5D2iX3EQzU3uNuZ6v7amzJs6PlTshHgpvSVrEr7i1xMlJNZTDk7gbdBHo4o2AB+dKYtDzqFPcSPZTLk4nHYSUZh50G8+P1dvkAXoWVBP/yoDiH+gvmCI/hrTCuChll1ML//e+WrPz0DdYovjVXNVPnngXZKBFRdya6ldD1AoGAP/0DOpPdOYPrR64x6Hv7z1PkgQdGUxaQ+KSGasKBOcBAOzMK1cVlMK+Jx+z4pF59h+6GLI8apBS6GdKb+TfiUpzR0bgnktoYcIzm/Q9gEaT+kEmRyoDjzKvwSXCq1xCTFQwxSzzmlx1mY/vLiZmH8Uag0NeFr/RJv75kYw7vmwo='),('6b0a3a40-8465-4c6d-aebc-23a4262492df','00f526bc-a958-46f2-b653-7d279c5bb750','secret','BEgsB_Cvj36guaRgs7r2ug'),('6bec9322-dff8-4671-b609-d5cb11b4a13b','271c882d-f647-40d4-8d5c-54d6a21a46aa','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('6e9e0140-c753-4a57-934a-06142a770c7c','6ccd0dc7-ea47-40fc-96eb-4b5aa332da4c','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('73fe51fd-430a-41c6-8bd9-a853bdf2bb88','77a8e9e8-41f9-48c9-aca0-a61673c11b7a','allowed-protocol-mapper-types','saml-role-list-mapper'),('74b95ad8-9d6f-48d9-8ce6-f4a70a943667','6ccd0dc7-ea47-40fc-96eb-4b5aa332da4c','allowed-protocol-mapper-types','oidc-address-mapper'),('80b03c41-cf01-445a-8b9a-b9d969671d0c','271c882d-f647-40d4-8d5c-54d6a21a46aa','allowed-protocol-mapper-types','saml-user-property-mapper'),('81bff225-a959-4800-9f4a-413d5d08c3ca','77a8e9e8-41f9-48c9-aca0-a61673c11b7a','allowed-protocol-mapper-types','oidc-address-mapper'),('81f8b163-5dca-4b6e-b358-60108b966374','271c882d-f647-40d4-8d5c-54d6a21a46aa','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('86efac38-3a2d-4857-928b-e6e9cfd8014c','271c882d-f647-40d4-8d5c-54d6a21a46aa','allowed-protocol-mapper-types','oidc-full-name-mapper'),('9a330097-b2a8-4f1a-bf70-d39548ed4338','c1c61618-436f-4c94-90bf-98af807880d5','certificate','MIICmzCCAYMCBgF+TLaHpjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwMTEyMDUxMzU3WhcNMzIwMTEyMDUxNTM3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCbebTpvXiJYyob5j8sBsKzUTp3+asrE7g7rAqsfOPuDaIUG5Ztkb4N5baTuX4TLKd0QOKYnmC84dATOqJftBB54FSSTnsWO6CPNfBc/XMLbc15ke1MQveyib93W/lyd7USjgEr88J9yLpObdbeRLOQI5XzO3+RRoaSoKMKHlFU1li/CYYI7dKrP26EGmWdjwq4QqrQOr4LNERpUJH5QSJpbVndQko1Rjckj73+yVtq3Y3KqGQ8664XI9gpLBLPrEexoSjK3ab2yd4D58/G1UZlxlweDt5x6xAnoqPkFCweMhaBQuw3tlLECYtx7P5rzbyAMe8QKtRnPqALDVwQmHkvAgMBAAEwDQYJKoZIhvcNAQELBQADggEBADwBA7EcewDVk5WHhb+ugVdDYZLsUOFPlkCCqnq/BIfGLAclCW6bo2xTuW72Yryq+4Kp/FRE272340F/uc8ALWD0riBFdBcDJ6IuiyY5lBVJbl6Ibr/TmAkFeWM2Ail+1QVvV8++dyQ/2vLqrj1yAmVMUFlMUPph58JQ75BnnKJivaTjFPIuDA7ITSJRaKFVvXr34Om31vPj+Nh8LKxyPkoQC2a6zFIx5EeBy5mJ0HqwyyarDXShugMN85x02p1N1tvn2QZNFbN3RWk96KTNOhT9PpMgWgDHbBz9mLNVQeJ7stSJfQCpEVxhvZenQQ4h1g517E8O+ld2p7zPwRYs08E='),('9a44e404-0f05-408a-a824-576b96b8dffc','f19c78f1-5cba-4715-904d-239788ba6b84','secret','okGm3qnFUUhEyLjc7CVre9RICtLrPerW_OJTCPWeSHUuCUlflV1ZM4BpiMY5QtUhHMmdwOz9gOC4NwNpgRgNQw'),('a4c0af51-2f8a-470b-8e60-9721a5de1225','7de828da-a482-4343-87e5-e5f9721abb37','priority','100'),('a5f659b9-77d3-43ee-b8c4-d9c0a9166c9b','77a8e9e8-41f9-48c9-aca0-a61673c11b7a','allowed-protocol-mapper-types','saml-user-property-mapper'),('a8e11316-c9b5-4eab-9311-c173ab378a84','c1c61618-436f-4c94-90bf-98af807880d5','priority','-100'),('a9388e41-2cab-4b79-9b11-de2a99b62a7d','6ccd0dc7-ea47-40fc-96eb-4b5aa332da4c','allowed-protocol-mapper-types','saml-user-property-mapper'),('abb3ce06-7ef0-43bb-b12d-f2df4971e71a','77a8e9e8-41f9-48c9-aca0-a61673c11b7a','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('b3f99d87-c1c2-4b38-9e9a-5a3e73b730b3','7de828da-a482-4343-87e5-e5f9721abb37','certificate','MIICoTCCAYkCBgF+TLbImDANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAljdXN0b21lcnMwHhcNMjIwMTEyMDUxNDE0WhcNMzIwMTEyMDUxNTU0WjAUMRIwEAYDVQQDDAljdXN0b21lcnMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC3QTAULOybNaCfsDwDjSHNfWQ8dpvRZlOZQXw7Ae3t/J2zqwGJIM+csiHQGCZcg7ZYisbMBGb11VR4BYj9pQjuq5x+BiBbtdLDDPtf8itfoMTGw1nNMvGAh8MlH9Y/R+jW87XQFAMC0nESRfli8WK0EXODgUsoxk/mKcAUzbX6N+MPa5+Ls1ZPIUlHpgIsYWZrb1ccTvnITvr5erx4fcMj/zGatTmHDViTkasAF/gphOKOyn5AtBmQTJxi98kQ8QyKDCcBF2noLdUOn9Pw4vWFvZi2tni+NnzRrMSJxDd5r9HTkkrqKR+KTZKULlGbQ6t7RGHiMHW0jnVuJVrSyayLAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAH6IRayTj/12MKORMVL35gW7vkBSpboyQ9C26Ej6qChF0gXEiX+Jm4lEeqYEKhJW8+HuQZGpw3nAaRpf+cKM68xtgwdOfyTfOb/xVH4OopTfyGBIsd+BuxpHZfS4BDiIDhLXYd1DJrKmQH50WBFNPaXk1GhUX02iPPrEVNK7yVbijQKggmytc17oluq+JMczVqYp9HkG04MWmCsJ9dnvjYC/O1bjn9ASrLWYW92tvKJh3cO588OmU+bVZ/WI4rIglVNcXuKDEf51GcYnR9fbINPKn/PVOPJp3E/Oahi2/22yiljf1bSv+MRgrKhlsSVmZjXkmYxP8vObsjgMek7S86c='),('b5380d6e-6aa5-48ba-b445-93555ef1ea6f','f19c78f1-5cba-4715-904d-239788ba6b84','priority','100'),('c0efc46d-bd55-4dde-95c4-62922b5cf385','6ccd0dc7-ea47-40fc-96eb-4b5aa332da4c','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('c47a1f3c-36cf-4a68-8220-832608cd51ae','77a8e9e8-41f9-48c9-aca0-a61673c11b7a','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('c5efef6b-ba00-4def-b4e2-e9209c6c9717','271c882d-f647-40d4-8d5c-54d6a21a46aa','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('c61f95d6-4528-4a27-8bbe-2907f3af6cb5','5a772a71-e970-4d5d-bf26-675695f06745','allowed-protocol-mapper-types','oidc-full-name-mapper'),('ca94bfcd-4379-4760-a4ca-f52d983a4066','e351d1ca-6457-49a6-bb8d-f783180f8b5f','host-sending-registration-request-must-match','true'),('cb73d830-edb6-4cf7-ba5d-ee3aa83f3159','77a8e9e8-41f9-48c9-aca0-a61673c11b7a','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('d0320d14-b059-4ee3-9b94-84698abaf9e2','6d8d3edb-52de-4266-bc86-3e919529e25c','kid','b0be4127-06d3-4b7d-b09c-ccc8381776e0'),('d0fe4f5c-bd9e-43f6-bf24-bdee6a7c6356','5a772a71-e970-4d5d-bf26-675695f06745','allowed-protocol-mapper-types','oidc-address-mapper'),('d3d4cb54-8876-4a22-94b0-1977a25cf0cb','77a8e9e8-41f9-48c9-aca0-a61673c11b7a','allowed-protocol-mapper-types','oidc-full-name-mapper'),('da7a03da-fa7b-45b5-a7f4-99e758c4bec4','1713c75c-5f40-4a9c-9f08-e06af05f91bc','allow-default-scopes','true'),('de56a5e6-2d71-4fb1-aeee-3a842867bbce','5a772a71-e970-4d5d-bf26-675695f06745','allowed-protocol-mapper-types','saml-role-list-mapper'),('de659819-2730-4857-9f41-6654c7667ece','6d8d3edb-52de-4266-bc86-3e919529e25c','priority','-100'),('e0ecd42e-076e-4ef1-83f9-dfba4fd9edee','6ccd0dc7-ea47-40fc-96eb-4b5aa332da4c','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('e23b1f9d-73ff-4936-9c16-4a6521e68545','dee20bad-b219-4d6d-9af5-9e10fc707296','max-clients','200'),('f12d413c-c0a7-4fd5-b683-a4c733dd486b','6ccd0dc7-ea47-40fc-96eb-4b5aa332da4c','allowed-protocol-mapper-types','saml-role-list-mapper'),('f4ab3611-9e2d-4684-9ac1-e03927073d7e','5a772a71-e970-4d5d-bf26-675695f06745','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('f79ca50e-6dff-48a9-8879-4ff67a28dd71','f72c9072-d355-4015-ba00-4c7aedb3966e','max-clients','200'),('f9ea6d90-ef0b-49b2-a237-705d89253a6d','77a8e9e8-41f9-48c9-aca0-a61673c11b7a','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('00c7773e-5f76-44b3-b4b2-4478310bdc78','28ab1fe3-a22d-4268-96a6-5451625e09c3'),('10379b46-9bda-4f20-bdea-3ea31606892c','539dba17-962d-4480-a086-680452d5f443'),('10379b46-9bda-4f20-bdea-3ea31606892c','f2458d04-37eb-42ca-b16a-f81817a716b0'),('1b0e0e80-bf06-4116-93df-fbf67716b1ce','814a9c1c-67ee-4eb2-b66a-909df7aaf651'),('2e3a4a49-4f83-4911-9572-449027ff96c4','97bdcce8-a816-4556-bc98-f0e265f344ec'),('2e3a4a49-4f83-4911-9572-449027ff96c4','a1c93ea7-d731-42c8-92e6-2db34f434340'),('2e3a4a49-4f83-4911-9572-449027ff96c4','de9a048b-35ab-4f77-8336-d51d7b3dddba'),('2e3a4a49-4f83-4911-9572-449027ff96c4','f2fb7329-c81c-4752-bc02-12281d817530'),('32eb06e1-d028-4750-80b6-817560117bc1','d16e5f24-2b1b-44ab-8f66-a4062d29c5f7'),('42d8d926-9a21-4a86-8662-f2c63588037c','772c5293-1384-46b2-8117-57ef2d088232'),('42d8d926-9a21-4a86-8662-f2c63588037c','78bf86bf-b31e-439e-9352-e95ef3fb2526'),('73d81e5e-5d2f-41fc-b557-974c1433d5fd','31b796fb-d5b5-4ef7-87c3-b740ba0c87c2'),('73d81e5e-5d2f-41fc-b557-974c1433d5fd','b9a0703e-ddeb-4ffa-85c0-f6e309831160'),('8a8ff887-39a7-4312-a569-a1dc36723a47','07d4257c-ea82-4159-ac17-279dc15d4995'),('8a8ff887-39a7-4312-a569-a1dc36723a47','0c6ac5ef-271a-4fcb-8c06-6bd789c9e375'),('8a8ff887-39a7-4312-a569-a1dc36723a47','10379b46-9bda-4f20-bdea-3ea31606892c'),('8a8ff887-39a7-4312-a569-a1dc36723a47','106131a2-e24e-4646-af51-37376019bec2'),('8a8ff887-39a7-4312-a569-a1dc36723a47','17154f01-2752-4110-bfab-da972ed67251'),('8a8ff887-39a7-4312-a569-a1dc36723a47','260c98c4-a7bf-48c2-a334-698caafa62a7'),('8a8ff887-39a7-4312-a569-a1dc36723a47','2d8e15fd-2e52-40c7-9b0c-ed43712fe05b'),('8a8ff887-39a7-4312-a569-a1dc36723a47','316d0d1e-8d63-4242-95d2-d480afd9ee7f'),('8a8ff887-39a7-4312-a569-a1dc36723a47','36737cab-be50-4f32-bb45-03d2ee70e2ce'),('8a8ff887-39a7-4312-a569-a1dc36723a47','385a2ffa-fca4-49d3-9309-68458e030c3a'),('8a8ff887-39a7-4312-a569-a1dc36723a47','42d8d926-9a21-4a86-8662-f2c63588037c'),('8a8ff887-39a7-4312-a569-a1dc36723a47','463cbacd-2b3d-4d5f-ac43-1db9adf6e297'),('8a8ff887-39a7-4312-a569-a1dc36723a47','51a1e841-af4b-4330-bd0f-1ca2b301a521'),('8a8ff887-39a7-4312-a569-a1dc36723a47','5382eb7e-c041-4820-b748-e781bf1dc954'),('8a8ff887-39a7-4312-a569-a1dc36723a47','539dba17-962d-4480-a086-680452d5f443'),('8a8ff887-39a7-4312-a569-a1dc36723a47','565fbd5c-1e47-4313-a6e4-36b3fc2dbfcf'),('8a8ff887-39a7-4312-a569-a1dc36723a47','772c5293-1384-46b2-8117-57ef2d088232'),('8a8ff887-39a7-4312-a569-a1dc36723a47','78bf86bf-b31e-439e-9352-e95ef3fb2526'),('8a8ff887-39a7-4312-a569-a1dc36723a47','7ce13ef7-91fc-43b6-93f2-d1c5586071ba'),('8a8ff887-39a7-4312-a569-a1dc36723a47','80d6c04c-5b86-4445-a9a2-4097e9bcfede'),('8a8ff887-39a7-4312-a569-a1dc36723a47','8af87fd2-4f32-4cbf-838a-789d54da15e4'),('8a8ff887-39a7-4312-a569-a1dc36723a47','a17a9671-033c-43e8-af4b-311577faae5f'),('8a8ff887-39a7-4312-a569-a1dc36723a47','a2e56a83-e846-4084-b7a0-cb6ab0e40b0a'),('8a8ff887-39a7-4312-a569-a1dc36723a47','badc6e9d-be7d-418a-abfb-c5b1cef593f9'),('8a8ff887-39a7-4312-a569-a1dc36723a47','bdf03c9f-21e5-4b1e-9ff6-ad0a5dad17a8'),('8a8ff887-39a7-4312-a569-a1dc36723a47','c017d7a3-4cdc-402d-8aaf-62844d797af3'),('8a8ff887-39a7-4312-a569-a1dc36723a47','c2943e41-ade1-4d7e-8811-5abbd5e75eb0'),('8a8ff887-39a7-4312-a569-a1dc36723a47','c57224a0-30a1-48f7-8e13-fb7911c6ba49'),('8a8ff887-39a7-4312-a569-a1dc36723a47','d0693373-6cfc-4e2c-942f-5ac973b2f990'),('8a8ff887-39a7-4312-a569-a1dc36723a47','dc74b877-b58b-46de-9564-deac660a92ff'),('8a8ff887-39a7-4312-a569-a1dc36723a47','e682f5bb-0a82-4df9-855e-89f359afde2c'),('8a8ff887-39a7-4312-a569-a1dc36723a47','eae07930-3d77-49ea-9edf-e19fffb815b4'),('8a8ff887-39a7-4312-a569-a1dc36723a47','eb250d37-7244-4c22-b69f-b289da0aa6d8'),('8a8ff887-39a7-4312-a569-a1dc36723a47','eb66d916-ed63-4797-b13c-0977f4b413ed'),('8a8ff887-39a7-4312-a569-a1dc36723a47','f2458d04-37eb-42ca-b16a-f81817a716b0'),('8a8ff887-39a7-4312-a569-a1dc36723a47','f4b73992-4422-458d-878f-05bf58c4205d'),('8a8ff887-39a7-4312-a569-a1dc36723a47','fc0f7bfc-bee3-4b66-acdb-846a6b488c0e'),('a1c93ea7-d731-42c8-92e6-2db34f434340','dea254bc-2aeb-48ae-b6dd-5949d4a90e01'),('a4ca1c64-e3bd-4c0e-853e-8b332d44a334','099dc50e-3fc8-4b3e-8407-d3da808bbfd9'),('a6eb2bdb-b18f-4f08-a472-4e2d39f7b76a','00c7773e-5f76-44b3-b4b2-4478310bdc78'),('a6eb2bdb-b18f-4f08-a472-4e2d39f7b76a','1ba69df5-1cc9-40db-914b-6645db958059'),('a6eb2bdb-b18f-4f08-a472-4e2d39f7b76a','5b2b11c6-eb14-44ea-846c-a12e5a098497'),('a6eb2bdb-b18f-4f08-a472-4e2d39f7b76a','73f52f6b-c2c7-4f1b-97bb-ffc8e117f7da'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','099dc50e-3fc8-4b3e-8407-d3da808bbfd9'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','1c73da52-f1f9-4b85-85bb-c62a216d5325'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','27b97797-8307-44d3-b1b1-805c4c2cb3c4'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','28436126-907d-4637-b3c1-ebaa1d1f03e9'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','2e602bfd-2c3f-4c67-9d14-8cc7c396abd0'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','31b796fb-d5b5-4ef7-87c3-b740ba0c87c2'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','32eb06e1-d028-4750-80b6-817560117bc1'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','52b4afda-7fb4-4d78-902e-4eee80c1a00b'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','73d81e5e-5d2f-41fc-b557-974c1433d5fd'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','7a68dd55-eaa9-4ce1-aaa6-0426164d6a86'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','820c6c0c-d98d-4700-b615-6f2a11e83185'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','982ac6a2-2ec8-444d-bb35-77fcffaed1f4'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','9fd130f6-e7ad-47a0-a978-a2829ff2bf2d'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','b9a0703e-ddeb-4ffa-85c0-f6e309831160'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','d16e5f24-2b1b-44ab-8f66-a4062d29c5f7'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','d7a33f20-e611-446b-a148-0a39bc045309'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','e1a2f6de-8779-4d8f-bc74-230a9b1896e3'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','e42efeb8-0ae7-471e-a78f-a526c5ccc299'),('c2943e41-ade1-4d7e-8811-5abbd5e75eb0','5382eb7e-c041-4820-b748-e781bf1dc954'),('c57224a0-30a1-48f7-8e13-fb7911c6ba49','36737cab-be50-4f32-bb45-03d2ee70e2ce'),('d7a71291-037f-4f93-985a-4ae3db347bb3','8048258a-0948-4701-bcd4-fdd99e11ebc4');
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
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('37efe97c-c721-42b4-bb03-c39e04216cfe',NULL,'otp','0bc222bc-2673-4150-8751-4a2247e2983c',1641966467024,'','{\"value\":\"Quohp7t2mrLMUwft3g90\"}','{\"subType\":\"totp\",\"digits\":6,\"counter\":0,\"period\":30,\"algorithm\":\"HmacSHA1\"}',20),('4a853b21-f1a5-4233-9f61-62ebd2169048',NULL,'password','0bc222bc-2673-4150-8751-4a2247e2983c',1641966381039,NULL,'{\"value\":\"DaBTm8X93Dsbm7xWgRel27/ZFNOpE4nFWfq0O56KHFPO+uvZMFXV3ARsC+44wUG0afecg/XFi3MFp+0zNuMAkw==\",\"salt\":\"+Jpp1taNJt4ZgI0vK+sQ9g==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
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
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2022-01-12 05:14:42',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2022-01-12 05:14:42',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2022-01-12 05:14:42',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2022-01-12 05:14:42',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2022-01-12 05:14:44',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2022-01-12 05:14:44',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2022-01-12 05:14:45',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2022-01-12 05:14:45',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2022-01-12 05:14:45',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2022-01-12 05:14:47',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2022-01-12 05:14:47',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2022-01-12 05:14:47',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2022-01-12 05:14:48',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-01-12 05:14:48',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-01-12 05:14:48',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-01-12 05:14:48',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-01-12 05:14:48',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2022-01-12 05:14:49',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2022-01-12 05:14:50',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2022-01-12 05:14:50',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2022-01-12 05:14:50',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2022-01-12 05:14:50',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2022-01-12 05:14:50',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2022-01-12 05:14:50',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2022-01-12 05:14:50',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1964478913'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2022-01-12 05:14:50',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2022-01-12 05:14:51',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2022-01-12 05:14:51',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'1964478913'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2022-01-12 05:14:52',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2022-01-12 05:14:52',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2022-01-12 05:14:53',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2022-01-12 05:14:53',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'1964478913'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-01-12 05:14:53',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'1964478913'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-01-12 05:14:53',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-01-12 05:14:54',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2022-01-12 05:14:54',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1964478913'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-01-12 05:14:54',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1964478913'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2022-01-12 05:14:54',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'1964478913'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2022-01-12 05:14:54',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1964478913'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-01-12 05:14:54',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'1964478913'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-01-12 05:14:54',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'1964478913'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2022-01-12 05:14:54',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'1964478913'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-01-12 05:14:56',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2022-01-12 05:14:56',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'1964478913'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-01-12 05:14:56',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'1964478913'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-01-12 05:14:56',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'1964478913'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-01-12 05:14:56',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'1964478913'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-01-12 05:14:57',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-01-12 05:14:57',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1964478913'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2022-01-12 05:14:58',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2022-01-12 05:14:58',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2022-01-12 05:14:58',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'1964478913'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2022-01-12 05:14:58',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1964478913'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2022-01-12 05:14:58',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1964478913'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-01-12 05:14:58',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'1964478913'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-01-12 05:14:58',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'1964478913'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-01-12 05:14:58',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-01-12 05:15:00',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2022-01-12 05:15:01',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2022-01-12 05:15:01',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'1964478913'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2022-01-12 05:15:01',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2022-01-12 05:15:01',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'1964478913'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2022-01-12 05:15:01',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1964478913'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2022-01-12 05:15:01',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'1964478913'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2022-01-12 05:15:01',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'1964478913'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2022-01-12 05:15:01',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2022-01-12 05:15:01',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'1964478913'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2022-01-12 05:15:01',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1964478913'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2022-01-12 05:15:02',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2022-01-12 05:15:02',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'1964478913'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2022-01-12 05:15:02',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'1964478913'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-01-12 05:15:02',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1964478913'),('8.0.0-updating-credential-data-not-oracle','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-01-12 05:15:02',73,'EXECUTED','7:03b3f4b264c3c68ba082250a80b74216','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1964478913'),('8.0.0-updating-credential-data-oracle','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-01-12 05:15:02',74,'MARK_RAN','7:64c5728f5ca1f5aa4392217701c4fe23','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'1964478913'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-01-12 05:15:03',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-01-12 05:15:03',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'1964478913'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-01-12 05:15:03',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1964478913'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-01-12 05:15:03',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-01-12 05:15:04',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-01-12 05:15:04',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-01-12 05:15:04',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'1964478913'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-01-12 05:15:04',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1964478913'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-01-12 05:15:04',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1964478913'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-01-12 05:15:04',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'1964478913'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-01-12 05:15:04',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'1964478913'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2022-01-12 05:15:04',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'1964478913'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2022-01-12 05:15:04',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'1964478913'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2022-01-12 05:15:04',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'1964478913'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-01-17 07:56:27',89,'MARK_RAN','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'2406187603'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-01-17 07:56:27',90,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'2406187603'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-17 07:56:27',91,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'2406187603'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-17 07:56:27',92,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'2406187603'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-17 07:56:27',93,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'2406187603'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-17 07:56:28',94,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'2406187603'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-17 07:56:28',95,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'2406187603'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-17 07:56:28',96,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'2406187603'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-17 07:56:28',97,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'2406187603'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2022-01-17 07:56:28',98,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'2406187603'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-17 07:56:28',99,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'2406187603'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-17 07:56:28',100,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'2406187603'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-17 07:56:28',101,'MARK_RAN','7:06499836520f4f6b3d05e35a59324910','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'2406187603'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-17 07:56:28',102,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'2406187603'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-17 07:56:28',103,'MARK_RAN','7:3d2b23076e59c6f70bae703aa01be35b','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'2406187603'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-17 07:56:28',104,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'2406187603'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2022-01-17 07:56:28',105,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'2406187603'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2022-01-17 07:56:28',106,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'2406187603');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('customers','1eb05fd2-0f45-40f6-abb0-98448c4e6548',_binary ''),('customers','26453049-5a31-4df7-ac66-ae1135258083',_binary '\0'),('customers','39c35c9f-6d59-4d1b-ae7c-1b584208b678',_binary ''),('customers','6271ec48-fb8d-4fd1-83a2-ea11ce19261d',_binary ''),('customers','8372670b-61ea-479d-8e3a-7dfc4423e72e',_binary ''),('customers','8a6fae5d-00c9-42a2-bead-31a38239892a',_binary '\0'),('customers','c512f6e8-fbcd-4fc7-b865-87a41866999c',_binary ''),('customers','cd177045-6898-40d7-b228-1330df000b1c',_binary '\0'),('customers','eeb2d339-8dd3-4808-8ef2-1c23944830ba',_binary '\0'),('master','0505fc1a-95c2-4210-b334-734ff5a5383e',_binary ''),('master','44f23d2a-2d67-46fc-8986-824b15e5d57e',_binary ''),('master','4fc4e8e9-faee-4225-817e-33f63aad5865',_binary ''),('master','5be0f2ad-d5be-432e-94c2-4cd7bd2d1728',_binary '\0'),('master','6a304655-ce70-4bf9-89e0-a75967be895a',_binary ''),('master','7bdb6058-2c09-4539-a2bd-de292c6c166f',_binary '\0'),('master','955e2209-d0f7-4bcb-8579-a97f99b43ed6',_binary '\0'),('master','ccaf2c6e-694f-43df-8568-17ceb03e1a33',_binary ''),('master','f4a13c0e-2530-49f3-8e6c-44102d9af005',_binary '\0');
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
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `VALUE` text,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('00c7773e-5f76-44b3-b4b2-4478310bdc78','d1b4ce96-42e8-4770-aed1-c6cad994fcbb',_binary '','${role_manage-account}','manage-account','master','d1b4ce96-42e8-4770-aed1-c6cad994fcbb',NULL),('07d4257c-ea82-4159-ac17-279dc15d4995','8d4f97ec-581f-4c16-a87c-8690b4031c4e',_binary '','${role_view-realm}','view-realm','master','8d4f97ec-581f-4c16-a87c-8690b4031c4e',NULL),('099dc50e-3fc8-4b3e-8407-d3da808bbfd9','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '','${role_manage-users}','manage-users','customers','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('0c6ac5ef-271a-4fcb-8c06-6bd789c9e375','8d4f97ec-581f-4c16-a87c-8690b4031c4e',_binary '','${role_query-realms}','query-realms','master','8d4f97ec-581f-4c16-a87c-8690b4031c4e',NULL),('10379b46-9bda-4f20-bdea-3ea31606892c','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',_binary '','${role_view-users}','view-users','master','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',NULL),('104c4f16-5b61-4839-a5e4-cab53b271e81','d1b4ce96-42e8-4770-aed1-c6cad994fcbb',_binary '','${role_view-applications}','view-applications','master','d1b4ce96-42e8-4770-aed1-c6cad994fcbb',NULL),('106131a2-e24e-4646-af51-37376019bec2','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',_binary '','${role_manage-clients}','manage-clients','master','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',NULL),('17154f01-2752-4110-bfab-da972ed67251','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',_binary '','${role_create-client}','create-client','master','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',NULL),('1b0e0e80-bf06-4116-93df-fbf67716b1ce','d1b4ce96-42e8-4770-aed1-c6cad994fcbb',_binary '','${role_manage-consent}','manage-consent','master','d1b4ce96-42e8-4770-aed1-c6cad994fcbb',NULL),('1ba69df5-1cc9-40db-914b-6645db958059','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,'master'),('1c73da52-f1f9-4b85-85bb-c62a216d5325','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '','${role_manage-authorization}','manage-authorization','customers','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('260c98c4-a7bf-48c2-a334-698caafa62a7','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',_binary '','${role_manage-authorization}','manage-authorization','master','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',NULL),('27b97797-8307-44d3-b1b1-805c4c2cb3c4','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '','${role_manage-realm}','manage-realm','customers','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('27d3ab99-d8f0-4eb2-bdd5-3b5091eb97bd','customers',_binary '\0',NULL,'admin','customers',NULL,NULL),('28436126-907d-4637-b3c1-ebaa1d1f03e9','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '','${role_query-realms}','query-realms','customers','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('28ab1fe3-a22d-4268-96a6-5451625e09c3','d1b4ce96-42e8-4770-aed1-c6cad994fcbb',_binary '','${role_manage-account-links}','manage-account-links','master','d1b4ce96-42e8-4770-aed1-c6cad994fcbb',NULL),('2d8e15fd-2e52-40c7-9b0c-ed43712fe05b','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',_binary '','${role_view-realm}','view-realm','master','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',NULL),('2e3a4a49-4f83-4911-9572-449027ff96c4','customers',_binary '\0','${role_default-roles-customers}','default-roles-customers','customers',NULL,'customers'),('2e602bfd-2c3f-4c67-9d14-8cc7c396abd0','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '','${role_impersonation}','impersonation','customers','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('316d0d1e-8d63-4242-95d2-d480afd9ee7f','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',_binary '','${role_view-identity-providers}','view-identity-providers','master','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',NULL),('31b796fb-d5b5-4ef7-87c3-b740ba0c87c2','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '','${role_query-users}','query-users','customers','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('32eb06e1-d028-4750-80b6-817560117bc1','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '','${role_view-clients}','view-clients','customers','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('36737cab-be50-4f32-bb45-03d2ee70e2ce','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',_binary '','${role_query-clients}','query-clients','master','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',NULL),('385a2ffa-fca4-49d3-9309-68458e030c3a','8d4f97ec-581f-4c16-a87c-8690b4031c4e',_binary '','${role_manage-events}','manage-events','master','8d4f97ec-581f-4c16-a87c-8690b4031c4e',NULL),('42d8d926-9a21-4a86-8662-f2c63588037c','8d4f97ec-581f-4c16-a87c-8690b4031c4e',_binary '','${role_view-users}','view-users','master','8d4f97ec-581f-4c16-a87c-8690b4031c4e',NULL),('463cbacd-2b3d-4d5f-ac43-1db9adf6e297','8d4f97ec-581f-4c16-a87c-8690b4031c4e',_binary '','${role_manage-clients}','manage-clients','master','8d4f97ec-581f-4c16-a87c-8690b4031c4e',NULL),('511cbb43-1a52-4088-9c74-ef7e8ff6027a','customers',_binary '\0',NULL,'super-admin','customers',NULL,NULL),('51a1e841-af4b-4330-bd0f-1ca2b301a521','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',_binary '','${role_view-events}','view-events','master','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',NULL),('52b4afda-7fb4-4d78-902e-4eee80c1a00b','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '','${role_view-authorization}','view-authorization','customers','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('5382eb7e-c041-4820-b748-e781bf1dc954','8d4f97ec-581f-4c16-a87c-8690b4031c4e',_binary '','${role_query-clients}','query-clients','master','8d4f97ec-581f-4c16-a87c-8690b4031c4e',NULL),('539dba17-962d-4480-a086-680452d5f443','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',_binary '','${role_query-groups}','query-groups','master','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',NULL),('565fbd5c-1e47-4313-a6e4-36b3fc2dbfcf','8d4f97ec-581f-4c16-a87c-8690b4031c4e',_binary '','${role_manage-authorization}','manage-authorization','master','8d4f97ec-581f-4c16-a87c-8690b4031c4e',NULL),('5a329bbf-898d-44e5-b854-21aba3f3848a','d1b4ce96-42e8-4770-aed1-c6cad994fcbb',_binary '','${role_delete-account}','delete-account','master','d1b4ce96-42e8-4770-aed1-c6cad994fcbb',NULL),('5b11397f-db4d-4f98-b3c8-a810e165b55c','customers',_binary '\0',NULL,'guest','customers',NULL,NULL),('5b2b11c6-eb14-44ea-846c-a12e5a098497','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,'master'),('73d13ed4-f005-43ab-9758-7c5f10e2a7a8','5bba4a74-d89e-4280-97b8-018d7a03eb23',_binary '','${role_delete-account}','delete-account','customers','5bba4a74-d89e-4280-97b8-018d7a03eb23',NULL),('73d81e5e-5d2f-41fc-b557-974c1433d5fd','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '','${role_view-users}','view-users','customers','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('73f52f6b-c2c7-4f1b-97bb-ffc8e117f7da','d1b4ce96-42e8-4770-aed1-c6cad994fcbb',_binary '','${role_view-profile}','view-profile','master','d1b4ce96-42e8-4770-aed1-c6cad994fcbb',NULL),('772c5293-1384-46b2-8117-57ef2d088232','8d4f97ec-581f-4c16-a87c-8690b4031c4e',_binary '','${role_query-users}','query-users','master','8d4f97ec-581f-4c16-a87c-8690b4031c4e',NULL),('78bf86bf-b31e-439e-9352-e95ef3fb2526','8d4f97ec-581f-4c16-a87c-8690b4031c4e',_binary '','${role_query-groups}','query-groups','master','8d4f97ec-581f-4c16-a87c-8690b4031c4e',NULL),('7a68dd55-eaa9-4ce1-aaa6-0426164d6a86','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '','${role_manage-identity-providers}','manage-identity-providers','customers','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('7ce13ef7-91fc-43b6-93f2-d1c5586071ba','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',_binary '','${role_manage-events}','manage-events','master','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',NULL),('8048258a-0948-4701-bcd4-fdd99e11ebc4','5bba4a74-d89e-4280-97b8-018d7a03eb23',_binary '','${role_view-consent}','view-consent','customers','5bba4a74-d89e-4280-97b8-018d7a03eb23',NULL),('80567403-2dbb-4b63-b38a-64f64b7b41dc','63cf9145-de0c-4f53-96b4-f881fd3d3a72',_binary '','${role_read-token}','read-token','customers','63cf9145-de0c-4f53-96b4-f881fd3d3a72',NULL),('80d6c04c-5b86-4445-a9a2-4097e9bcfede','8d4f97ec-581f-4c16-a87c-8690b4031c4e',_binary '','${role_view-authorization}','view-authorization','master','8d4f97ec-581f-4c16-a87c-8690b4031c4e',NULL),('814a9c1c-67ee-4eb2-b66a-909df7aaf651','d1b4ce96-42e8-4770-aed1-c6cad994fcbb',_binary '','${role_view-consent}','view-consent','master','d1b4ce96-42e8-4770-aed1-c6cad994fcbb',NULL),('820c6c0c-d98d-4700-b615-6f2a11e83185','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '','${role_create-client}','create-client','customers','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('8a8ff887-39a7-4312-a569-a1dc36723a47','master',_binary '\0','${role_admin}','admin','master',NULL,'master'),('8af87fd2-4f32-4cbf-838a-789d54da15e4','8d4f97ec-581f-4c16-a87c-8690b4031c4e',_binary '','${role_view-events}','view-events','master','8d4f97ec-581f-4c16-a87c-8690b4031c4e',NULL),('97bdcce8-a816-4556-bc98-f0e265f344ec','customers',_binary '\0','${role_offline-access}','offline_access','customers',NULL,'customers'),('982ac6a2-2ec8-444d-bb35-77fcffaed1f4','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '','${role_manage-clients}','manage-clients','customers','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('9fd130f6-e7ad-47a0-a978-a2829ff2bf2d','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '','${role_view-identity-providers}','view-identity-providers','customers','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('a17a9671-033c-43e8-af4b-311577faae5f','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,'master'),('a1c93ea7-d731-42c8-92e6-2db34f434340','5bba4a74-d89e-4280-97b8-018d7a03eb23',_binary '','${role_manage-account}','manage-account','customers','5bba4a74-d89e-4280-97b8-018d7a03eb23',NULL),('a2e56a83-e846-4084-b7a0-cb6ab0e40b0a','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',_binary '','${role_query-realms}','query-realms','master','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',NULL),('a360474c-6c9f-42c7-b792-22287c6f7a8e','5bba4a74-d89e-4280-97b8-018d7a03eb23',_binary '','${role_view-applications}','view-applications','customers','5bba4a74-d89e-4280-97b8-018d7a03eb23',NULL),('a4ca1c64-e3bd-4c0e-853e-8b332d44a334','customers',_binary '\0',NULL,'admin-role','customers',NULL,'customers'),('a6eb2bdb-b18f-4f08-a472-4e2d39f7b76a','master',_binary '\0','${role_default-roles-master}','default-roles-master','master',NULL,'master'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '','${role_realm-admin}','realm-admin','customers','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('b653c6eb-2e67-4322-a58e-14e110199215','customers',_binary '\0',NULL,'member','customers',NULL,NULL),('b9a0703e-ddeb-4ffa-85c0-f6e309831160','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '','${role_query-groups}','query-groups','customers','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('badc6e9d-be7d-418a-abfb-c5b1cef593f9','8d4f97ec-581f-4c16-a87c-8690b4031c4e',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','8d4f97ec-581f-4c16-a87c-8690b4031c4e',NULL),('bdf03c9f-21e5-4b1e-9ff6-ad0a5dad17a8','8d4f97ec-581f-4c16-a87c-8690b4031c4e',_binary '','${role_impersonation}','impersonation','master','8d4f97ec-581f-4c16-a87c-8690b4031c4e',NULL),('c017d7a3-4cdc-402d-8aaf-62844d797af3','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',NULL),('c2943e41-ade1-4d7e-8811-5abbd5e75eb0','8d4f97ec-581f-4c16-a87c-8690b4031c4e',_binary '','${role_view-clients}','view-clients','master','8d4f97ec-581f-4c16-a87c-8690b4031c4e',NULL),('c57224a0-30a1-48f7-8e13-fb7911c6ba49','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',_binary '','${role_view-clients}','view-clients','master','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',NULL),('d0693373-6cfc-4e2c-942f-5ac973b2f990','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',_binary '','${role_view-authorization}','view-authorization','master','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',NULL),('d16e5f24-2b1b-44ab-8f66-a4062d29c5f7','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '','${role_query-clients}','query-clients','customers','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('d21f3c04-72c4-4126-be45-b964d9618050','10515457-1268-4829-87b2-136005abc130',_binary '','${role_read-token}','read-token','master','10515457-1268-4829-87b2-136005abc130',NULL),('d7a33f20-e611-446b-a148-0a39bc045309','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '','${role_view-realm}','view-realm','customers','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('d7a71291-037f-4f93-985a-4ae3db347bb3','5bba4a74-d89e-4280-97b8-018d7a03eb23',_binary '','${role_manage-consent}','manage-consent','customers','5bba4a74-d89e-4280-97b8-018d7a03eb23',NULL),('dc74b877-b58b-46de-9564-deac660a92ff','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',_binary '','${role_manage-users}','manage-users','master','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',NULL),('de9a048b-35ab-4f77-8336-d51d7b3dddba','customers',_binary '\0','${role_uma_authorization}','uma_authorization','customers',NULL,'customers'),('dea254bc-2aeb-48ae-b6dd-5949d4a90e01','5bba4a74-d89e-4280-97b8-018d7a03eb23',_binary '','${role_manage-account-links}','manage-account-links','customers','5bba4a74-d89e-4280-97b8-018d7a03eb23',NULL),('e1a2f6de-8779-4d8f-bc74-230a9b1896e3','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '','${role_view-events}','view-events','customers','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('e42efeb8-0ae7-471e-a78f-a526c5ccc299','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '','${role_manage-events}','manage-events','customers','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('e682f5bb-0a82-4df9-855e-89f359afde2c','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',_binary '','${role_impersonation}','impersonation','master','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',NULL),('eae07930-3d77-49ea-9edf-e19fffb815b4','8d4f97ec-581f-4c16-a87c-8690b4031c4e',_binary '','${role_manage-users}','manage-users','master','8d4f97ec-581f-4c16-a87c-8690b4031c4e',NULL),('eb250d37-7244-4c22-b69f-b289da0aa6d8','8d4f97ec-581f-4c16-a87c-8690b4031c4e',_binary '','${role_view-identity-providers}','view-identity-providers','master','8d4f97ec-581f-4c16-a87c-8690b4031c4e',NULL),('eb66d916-ed63-4797-b13c-0977f4b413ed','8d4f97ec-581f-4c16-a87c-8690b4031c4e',_binary '','${role_create-client}','create-client','master','8d4f97ec-581f-4c16-a87c-8690b4031c4e',NULL),('f2458d04-37eb-42ca-b16a-f81817a716b0','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',_binary '','${role_query-users}','query-users','master','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',NULL),('f2fb7329-c81c-4752-bc02-12281d817530','5bba4a74-d89e-4280-97b8-018d7a03eb23',_binary '','${role_view-profile}','view-profile','customers','5bba4a74-d89e-4280-97b8-018d7a03eb23',NULL),('f4b73992-4422-458d-878f-05bf58c4205d','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',_binary '','${role_manage-realm}','manage-realm','master','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',NULL),('fc0f7bfc-bee3-4b66-acdb-846a6b488c0e','8d4f97ec-581f-4c16-a87c-8690b4031c4e',_binary '','${role_manage-realm}','manage-realm','master','8d4f97ec-581f-4c16-a87c-8690b4031c4e',NULL);
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
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('oavia','16.1.0',1642575541),('qbl93','12.0.4',1641964507),('yedsj','16.1.1',1651186619),('ysxv2','15.1.1',1642406192);
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
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
INSERT INTO `POLICY_CONFIG` VALUES ('1129aaa7-56a1-4d5b-90e1-1cdeaa173b51','clients','[\"c9e6110f-f347-4d2c-8206-cf4504a99865\"]'),('66da9318-e914-4926-8666-2828bcd6569a','clients','[\"c9e6110f-f347-4d2c-8206-cf4504a99865\"]');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('0459fd77-1611-4d82-907a-2cea404466f6','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1eb05fd2-0f45-40f6-abb0-98448c4e6548'),('07eff19d-154e-41c3-962d-28b871f456b0','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1eb05fd2-0f45-40f6-abb0-98448c4e6548'),('08e25343-53cf-4017-a30f-544ad9bae3e2','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1eb05fd2-0f45-40f6-abb0-98448c4e6548'),('0a65a4f4-5737-4175-9229-b0786b7039a8','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'26453049-5a31-4df7-ac66-ae1135258083'),('0f150c1d-eaa3-48a4-b91d-6faad5807368','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'c512f6e8-fbcd-4fc7-b865-87a41866999c'),('1578d8f4-a566-4b59-aa1e-215442478de6','organization','openid-connect','oidc-usermodel-attribute-mapper','f6ebeaf9-bc3b-401d-9b39-e967191d4a1b',NULL),('17f0acc5-364d-4c97-90be-25235b4ee514','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'955e2209-d0f7-4bcb-8579-a97f99b43ed6'),('19405358-5530-44c6-b862-c8ad548623a1','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1eb05fd2-0f45-40f6-abb0-98448c4e6548'),('1a795dc6-bb3a-4985-99ca-8b0c5d0ab48b','org_id_license','openid-connect','oidc-usermodel-attribute-mapper','f6ebeaf9-bc3b-401d-9b39-e967191d4a1b',NULL),('21caacbd-fa9f-4402-bf86-2183a3e0cb62','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccaf2c6e-694f-43df-8568-17ceb03e1a33'),('2b9af2b2-18b9-46c8-bc1a-882adbdb785f','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1eb05fd2-0f45-40f6-abb0-98448c4e6548'),('32293868-aae8-480c-bf32-289c8a50c9f6','full name','openid-connect','oidc-full-name-mapper',NULL,'ccaf2c6e-694f-43df-8568-17ceb03e1a33'),('35f5cfab-5917-406b-957f-5ddc5ba0873f','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'8372670b-61ea-479d-8e3a-7dfc4423e72e'),('38021541-8c50-4621-906d-a92fbec2dbf5','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'c512f6e8-fbcd-4fc7-b865-87a41866999c'),('3ae37fdf-fa58-46cc-b8a6-9fea07d578f1','full name','openid-connect','oidc-full-name-mapper',NULL,'1eb05fd2-0f45-40f6-abb0-98448c4e6548'),('3e94ffe0-03fd-4265-8bd1-9a61960b5698','role list','saml','saml-role-list-mapper',NULL,'39c35c9f-6d59-4d1b-ae7c-1b584208b678'),('3ff96149-f357-4437-a4a3-5301756ec142','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'26453049-5a31-4df7-ac66-ae1135258083'),('45103ff6-ee26-49d3-8e57-28c687a1878a','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','c9e6110f-f347-4d2c-8206-cf4504a99865',NULL),('45e9b8c3-4f16-4563-b634-ab00fb3e5c92','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccaf2c6e-694f-43df-8568-17ceb03e1a33'),('49ff8033-c195-4296-8c6b-dab359640e12','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'ccaf2c6e-694f-43df-8568-17ceb03e1a33'),('4c1f8702-02cf-4961-a45e-38a9815c608b','audience resolve','openid-connect','oidc-audience-resolve-mapper','35f9aa3f-0809-4b80-9d32-f128b9819e71',NULL),('56f5964c-d899-41e5-8a21-7806ab1b35d0','username','openid-connect','oidc-usermodel-property-mapper',NULL,'1eb05fd2-0f45-40f6-abb0-98448c4e6548'),('5f52151a-6f17-4c05-b3af-920f7be5b070','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccaf2c6e-694f-43df-8568-17ceb03e1a33'),('6a0ca6aa-ab16-483f-a5f8-fa08294119b6','address','openid-connect','oidc-address-mapper',NULL,'eeb2d339-8dd3-4808-8ef2-1c23944830ba'),('6a2a0780-20bf-443c-973e-b752c9b3844b','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccaf2c6e-694f-43df-8568-17ceb03e1a33'),('6b0d5438-0219-4447-9f9b-a448b98b0d9b','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'6271ec48-fb8d-4fd1-83a2-ea11ce19261d'),('6c62a292-b832-4546-8ac0-225d3ef5ad2a','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1eb05fd2-0f45-40f6-abb0-98448c4e6548'),('6e1c4626-3bac-4281-97f4-d49200e3b936','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'1eb05fd2-0f45-40f6-abb0-98448c4e6548'),('6f9afd08-4b2b-4c33-b9f2-724cd1e284a6','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1eb05fd2-0f45-40f6-abb0-98448c4e6548'),('72164829-dbf7-42e3-bfe3-c890117ef2b7','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'0505fc1a-95c2-4210-b334-734ff5a5383e'),('740fd1b3-8af3-47df-b32d-08cf6cff54a6','username','openid-connect','oidc-usermodel-property-mapper',NULL,'ccaf2c6e-694f-43df-8568-17ceb03e1a33'),('751a73e8-8ef2-412f-8ac6-7aad0799cd25','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'7bdb6058-2c09-4539-a2bd-de292c6c166f'),('7ce51749-aff8-4371-bde4-02d6b60c7dc8','organization','openid-connect','oidc-usermodel-attribute-mapper','c9e6110f-f347-4d2c-8206-cf4504a99865',NULL),('7f628a03-7f13-4e48-8925-2a90f13ffcd5','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','c9e6110f-f347-4d2c-8206-cf4504a99865',NULL),('83ce17bd-d787-49e0-b08e-9dbcfbe6d953','role list','saml','saml-role-list-mapper',NULL,'44f23d2a-2d67-46fc-8986-824b15e5d57e'),('855f5e54-176c-449c-9e0b-a6232d8d3264','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'7bdb6058-2c09-4539-a2bd-de292c6c166f'),('85e24210-43ca-4bd8-b60d-a6f064efae1f','email','openid-connect','oidc-usermodel-property-mapper',NULL,'6271ec48-fb8d-4fd1-83a2-ea11ce19261d'),('8a68d775-f41d-422d-a903-136a4d09e543','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccaf2c6e-694f-43df-8568-17ceb03e1a33'),('8aa7c57e-7f6e-4162-b3f1-80fd931884a7','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccaf2c6e-694f-43df-8568-17ceb03e1a33'),('90d23204-dc40-41b3-9e07-811f526a1d3e','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'1eb05fd2-0f45-40f6-abb0-98448c4e6548'),('98ce004c-d0c0-4fe7-8e58-af24a2141b7a','org_id','openid-connect','oidc-usermodel-attribute-mapper','f6ebeaf9-bc3b-401d-9b39-e967191d4a1b',NULL),('9b29d378-f506-41c2-a324-6d44d7423a28','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccaf2c6e-694f-43df-8568-17ceb03e1a33'),('a426d588-ea60-45c7-bd0a-8232e48d8911','address','openid-connect','oidc-address-mapper',NULL,'5be0f2ad-d5be-432e-94c2-4cd7bd2d1728'),('a6724efe-0b5d-41d9-9af0-829216c38519','audience resolve','openid-connect','oidc-audience-resolve-mapper','6b6c72ba-6fd7-4b9e-91b6-4eff47af9068',NULL),('a893e7f8-588d-4fbf-9ec7-245968f45f74','locale','openid-connect','oidc-usermodel-attribute-mapper','3decebb2-f7ec-427e-ba4b-3e33d2c8c598',NULL),('abe6cb9e-3590-4e8f-849d-a3ee6415d7a4','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1eb05fd2-0f45-40f6-abb0-98448c4e6548'),('b0ef158a-5642-4be1-9086-19876d744b0c','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'0505fc1a-95c2-4210-b334-734ff5a5383e'),('b1691ba9-bd2f-4203-bb53-eb8e445a236e','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cd177045-6898-40d7-b228-1330df000b1c'),('c0b119df-559b-4ca5-bebb-0bccbf58bad6','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccaf2c6e-694f-43df-8568-17ceb03e1a33'),('c0d27316-e8b3-41d9-b639-9ceaa0211309','locale','openid-connect','oidc-usermodel-attribute-mapper','0e340f5b-529b-4a51-9ec0-3aebfe99dcd5',NULL),('c2fa3606-2009-401e-b124-152d63e10404','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccaf2c6e-694f-43df-8568-17ceb03e1a33'),('c5bd63a9-1583-4640-970b-4ff818ad57d0','org_id','openid-connect','oidc-usermodel-attribute-mapper','c9e6110f-f347-4d2c-8206-cf4504a99865',NULL),('c71ca3b6-5f7e-4d5e-8205-daa6dda163e6','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'955e2209-d0f7-4bcb-8579-a97f99b43ed6'),('c8275ea7-f8a5-44dc-a42c-f876d8a4256b','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'cd177045-6898-40d7-b228-1330df000b1c'),('d090007f-00e9-4a30-bfc0-a6f32a894511','email','openid-connect','oidc-usermodel-property-mapper',NULL,'6a304655-ce70-4bf9-89e0-a75967be895a'),('dfe51f96-3826-400c-b321-aa2fe38860c2','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1eb05fd2-0f45-40f6-abb0-98448c4e6548'),('e15f3faa-21f1-408c-904b-900872266bde','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'ccaf2c6e-694f-43df-8568-17ceb03e1a33'),('e2fe4287-b23a-4b6a-9930-93de8141b2d0','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'0505fc1a-95c2-4210-b334-734ff5a5383e'),('ef2ccf32-2159-49e4-874c-96599ce4a156','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'6a304655-ce70-4bf9-89e0-a75967be895a'),('f097454f-1f87-4ce7-9a10-5e3e3a7ed527','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'ccaf2c6e-694f-43df-8568-17ceb03e1a33'),('f2e81649-fc4f-432f-9e7a-fd7007701b54','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'1eb05fd2-0f45-40f6-abb0-98448c4e6548'),('f368a493-294b-4755-a418-cb8c8f1c63bd','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','c9e6110f-f347-4d2c-8206-cf4504a99865',NULL),('f652bf04-9e93-495e-ac38-28f05a8137a3','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'4fc4e8e9-faee-4225-817e-33f63aad5865'),('fc6caa13-3678-4db1-aa72-2d5e7f79ad18','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'c512f6e8-fbcd-4fc7-b865-87a41866999c');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('0459fd77-1611-4d82-907a-2cea404466f6','true','access.token.claim'),('0459fd77-1611-4d82-907a-2cea404466f6','zoneinfo','claim.name'),('0459fd77-1611-4d82-907a-2cea404466f6','true','id.token.claim'),('0459fd77-1611-4d82-907a-2cea404466f6','String','jsonType.label'),('0459fd77-1611-4d82-907a-2cea404466f6','zoneinfo','user.attribute'),('0459fd77-1611-4d82-907a-2cea404466f6','true','userinfo.token.claim'),('07eff19d-154e-41c3-962d-28b871f456b0','true','access.token.claim'),('07eff19d-154e-41c3-962d-28b871f456b0','profile','claim.name'),('07eff19d-154e-41c3-962d-28b871f456b0','true','id.token.claim'),('07eff19d-154e-41c3-962d-28b871f456b0','String','jsonType.label'),('07eff19d-154e-41c3-962d-28b871f456b0','profile','user.attribute'),('07eff19d-154e-41c3-962d-28b871f456b0','true','userinfo.token.claim'),('08e25343-53cf-4017-a30f-544ad9bae3e2','true','access.token.claim'),('08e25343-53cf-4017-a30f-544ad9bae3e2','picture','claim.name'),('08e25343-53cf-4017-a30f-544ad9bae3e2','true','id.token.claim'),('08e25343-53cf-4017-a30f-544ad9bae3e2','String','jsonType.label'),('08e25343-53cf-4017-a30f-544ad9bae3e2','picture','user.attribute'),('08e25343-53cf-4017-a30f-544ad9bae3e2','true','userinfo.token.claim'),('0a65a4f4-5737-4175-9229-b0786b7039a8','true','access.token.claim'),('0a65a4f4-5737-4175-9229-b0786b7039a8','upn','claim.name'),('0a65a4f4-5737-4175-9229-b0786b7039a8','true','id.token.claim'),('0a65a4f4-5737-4175-9229-b0786b7039a8','String','jsonType.label'),('0a65a4f4-5737-4175-9229-b0786b7039a8','username','user.attribute'),('0a65a4f4-5737-4175-9229-b0786b7039a8','true','userinfo.token.claim'),('0f150c1d-eaa3-48a4-b91d-6faad5807368','true','access.token.claim'),('0f150c1d-eaa3-48a4-b91d-6faad5807368','realm_access.roles','claim.name'),('0f150c1d-eaa3-48a4-b91d-6faad5807368','String','jsonType.label'),('0f150c1d-eaa3-48a4-b91d-6faad5807368','true','multivalued'),('0f150c1d-eaa3-48a4-b91d-6faad5807368','foo','user.attribute'),('1578d8f4-a566-4b59-aa1e-215442478de6','true','access.token.claim'),('1578d8f4-a566-4b59-aa1e-215442478de6','organization','claim.name'),('1578d8f4-a566-4b59-aa1e-215442478de6','true','id.token.claim'),('1578d8f4-a566-4b59-aa1e-215442478de6','String','jsonType.label'),('1578d8f4-a566-4b59-aa1e-215442478de6','organization','user.attribute'),('1578d8f4-a566-4b59-aa1e-215442478de6','true','userinfo.token.claim'),('17f0acc5-364d-4c97-90be-25235b4ee514','true','access.token.claim'),('17f0acc5-364d-4c97-90be-25235b4ee514','phone_number','claim.name'),('17f0acc5-364d-4c97-90be-25235b4ee514','true','id.token.claim'),('17f0acc5-364d-4c97-90be-25235b4ee514','String','jsonType.label'),('17f0acc5-364d-4c97-90be-25235b4ee514','phoneNumber','user.attribute'),('17f0acc5-364d-4c97-90be-25235b4ee514','true','userinfo.token.claim'),('19405358-5530-44c6-b862-c8ad548623a1','true','access.token.claim'),('19405358-5530-44c6-b862-c8ad548623a1','middle_name','claim.name'),('19405358-5530-44c6-b862-c8ad548623a1','true','id.token.claim'),('19405358-5530-44c6-b862-c8ad548623a1','String','jsonType.label'),('19405358-5530-44c6-b862-c8ad548623a1','middleName','user.attribute'),('19405358-5530-44c6-b862-c8ad548623a1','true','userinfo.token.claim'),('1a795dc6-bb3a-4985-99ca-8b0c5d0ab48b','true','access.token.claim'),('1a795dc6-bb3a-4985-99ca-8b0c5d0ab48b','org_id_license','claim.name'),('1a795dc6-bb3a-4985-99ca-8b0c5d0ab48b','true','id.token.claim'),('1a795dc6-bb3a-4985-99ca-8b0c5d0ab48b','String','jsonType.label'),('1a795dc6-bb3a-4985-99ca-8b0c5d0ab48b','org_id_license','user.attribute'),('1a795dc6-bb3a-4985-99ca-8b0c5d0ab48b','true','userinfo.token.claim'),('21caacbd-fa9f-4402-bf86-2183a3e0cb62','true','access.token.claim'),('21caacbd-fa9f-4402-bf86-2183a3e0cb62','zoneinfo','claim.name'),('21caacbd-fa9f-4402-bf86-2183a3e0cb62','true','id.token.claim'),('21caacbd-fa9f-4402-bf86-2183a3e0cb62','String','jsonType.label'),('21caacbd-fa9f-4402-bf86-2183a3e0cb62','zoneinfo','user.attribute'),('21caacbd-fa9f-4402-bf86-2183a3e0cb62','true','userinfo.token.claim'),('2b9af2b2-18b9-46c8-bc1a-882adbdb785f','true','access.token.claim'),('2b9af2b2-18b9-46c8-bc1a-882adbdb785f','updated_at','claim.name'),('2b9af2b2-18b9-46c8-bc1a-882adbdb785f','true','id.token.claim'),('2b9af2b2-18b9-46c8-bc1a-882adbdb785f','String','jsonType.label'),('2b9af2b2-18b9-46c8-bc1a-882adbdb785f','updatedAt','user.attribute'),('2b9af2b2-18b9-46c8-bc1a-882adbdb785f','true','userinfo.token.claim'),('32293868-aae8-480c-bf32-289c8a50c9f6','true','access.token.claim'),('32293868-aae8-480c-bf32-289c8a50c9f6','true','id.token.claim'),('32293868-aae8-480c-bf32-289c8a50c9f6','true','userinfo.token.claim'),('38021541-8c50-4621-906d-a92fbec2dbf5','true','access.token.claim'),('38021541-8c50-4621-906d-a92fbec2dbf5','resource_access.${client_id}.roles','claim.name'),('38021541-8c50-4621-906d-a92fbec2dbf5','String','jsonType.label'),('38021541-8c50-4621-906d-a92fbec2dbf5','true','multivalued'),('38021541-8c50-4621-906d-a92fbec2dbf5','foo','user.attribute'),('3ae37fdf-fa58-46cc-b8a6-9fea07d578f1','true','access.token.claim'),('3ae37fdf-fa58-46cc-b8a6-9fea07d578f1','true','id.token.claim'),('3ae37fdf-fa58-46cc-b8a6-9fea07d578f1','true','userinfo.token.claim'),('3e94ffe0-03fd-4265-8bd1-9a61960b5698','Role','attribute.name'),('3e94ffe0-03fd-4265-8bd1-9a61960b5698','Basic','attribute.nameformat'),('3e94ffe0-03fd-4265-8bd1-9a61960b5698','false','single'),('3ff96149-f357-4437-a4a3-5301756ec142','true','access.token.claim'),('3ff96149-f357-4437-a4a3-5301756ec142','groups','claim.name'),('3ff96149-f357-4437-a4a3-5301756ec142','true','id.token.claim'),('3ff96149-f357-4437-a4a3-5301756ec142','String','jsonType.label'),('3ff96149-f357-4437-a4a3-5301756ec142','true','multivalued'),('3ff96149-f357-4437-a4a3-5301756ec142','foo','user.attribute'),('45103ff6-ee26-49d3-8e57-28c687a1878a','true','access.token.claim'),('45103ff6-ee26-49d3-8e57-28c687a1878a','clientId','claim.name'),('45103ff6-ee26-49d3-8e57-28c687a1878a','true','id.token.claim'),('45103ff6-ee26-49d3-8e57-28c687a1878a','String','jsonType.label'),('45103ff6-ee26-49d3-8e57-28c687a1878a','clientId','user.session.note'),('45e9b8c3-4f16-4563-b634-ab00fb3e5c92','true','access.token.claim'),('45e9b8c3-4f16-4563-b634-ab00fb3e5c92','nickname','claim.name'),('45e9b8c3-4f16-4563-b634-ab00fb3e5c92','true','id.token.claim'),('45e9b8c3-4f16-4563-b634-ab00fb3e5c92','String','jsonType.label'),('45e9b8c3-4f16-4563-b634-ab00fb3e5c92','nickname','user.attribute'),('45e9b8c3-4f16-4563-b634-ab00fb3e5c92','true','userinfo.token.claim'),('49ff8033-c195-4296-8c6b-dab359640e12','true','access.token.claim'),('49ff8033-c195-4296-8c6b-dab359640e12','given_name','claim.name'),('49ff8033-c195-4296-8c6b-dab359640e12','true','id.token.claim'),('49ff8033-c195-4296-8c6b-dab359640e12','String','jsonType.label'),('49ff8033-c195-4296-8c6b-dab359640e12','firstName','user.attribute'),('49ff8033-c195-4296-8c6b-dab359640e12','true','userinfo.token.claim'),('56f5964c-d899-41e5-8a21-7806ab1b35d0','true','access.token.claim'),('56f5964c-d899-41e5-8a21-7806ab1b35d0','preferred_username','claim.name'),('56f5964c-d899-41e5-8a21-7806ab1b35d0','true','id.token.claim'),('56f5964c-d899-41e5-8a21-7806ab1b35d0','String','jsonType.label'),('56f5964c-d899-41e5-8a21-7806ab1b35d0','username','user.attribute'),('56f5964c-d899-41e5-8a21-7806ab1b35d0','true','userinfo.token.claim'),('5f52151a-6f17-4c05-b3af-920f7be5b070','true','access.token.claim'),('5f52151a-6f17-4c05-b3af-920f7be5b070','picture','claim.name'),('5f52151a-6f17-4c05-b3af-920f7be5b070','true','id.token.claim'),('5f52151a-6f17-4c05-b3af-920f7be5b070','String','jsonType.label'),('5f52151a-6f17-4c05-b3af-920f7be5b070','picture','user.attribute'),('5f52151a-6f17-4c05-b3af-920f7be5b070','true','userinfo.token.claim'),('6a0ca6aa-ab16-483f-a5f8-fa08294119b6','true','access.token.claim'),('6a0ca6aa-ab16-483f-a5f8-fa08294119b6','true','id.token.claim'),('6a0ca6aa-ab16-483f-a5f8-fa08294119b6','country','user.attribute.country'),('6a0ca6aa-ab16-483f-a5f8-fa08294119b6','formatted','user.attribute.formatted'),('6a0ca6aa-ab16-483f-a5f8-fa08294119b6','locality','user.attribute.locality'),('6a0ca6aa-ab16-483f-a5f8-fa08294119b6','postal_code','user.attribute.postal_code'),('6a0ca6aa-ab16-483f-a5f8-fa08294119b6','region','user.attribute.region'),('6a0ca6aa-ab16-483f-a5f8-fa08294119b6','street','user.attribute.street'),('6a0ca6aa-ab16-483f-a5f8-fa08294119b6','true','userinfo.token.claim'),('6a2a0780-20bf-443c-973e-b752c9b3844b','true','access.token.claim'),('6a2a0780-20bf-443c-973e-b752c9b3844b','updated_at','claim.name'),('6a2a0780-20bf-443c-973e-b752c9b3844b','true','id.token.claim'),('6a2a0780-20bf-443c-973e-b752c9b3844b','String','jsonType.label'),('6a2a0780-20bf-443c-973e-b752c9b3844b','updatedAt','user.attribute'),('6a2a0780-20bf-443c-973e-b752c9b3844b','true','userinfo.token.claim'),('6b0d5438-0219-4447-9f9b-a448b98b0d9b','true','access.token.claim'),('6b0d5438-0219-4447-9f9b-a448b98b0d9b','email_verified','claim.name'),('6b0d5438-0219-4447-9f9b-a448b98b0d9b','true','id.token.claim'),('6b0d5438-0219-4447-9f9b-a448b98b0d9b','boolean','jsonType.label'),('6b0d5438-0219-4447-9f9b-a448b98b0d9b','emailVerified','user.attribute'),('6b0d5438-0219-4447-9f9b-a448b98b0d9b','true','userinfo.token.claim'),('6c62a292-b832-4546-8ac0-225d3ef5ad2a','true','access.token.claim'),('6c62a292-b832-4546-8ac0-225d3ef5ad2a','nickname','claim.name'),('6c62a292-b832-4546-8ac0-225d3ef5ad2a','true','id.token.claim'),('6c62a292-b832-4546-8ac0-225d3ef5ad2a','String','jsonType.label'),('6c62a292-b832-4546-8ac0-225d3ef5ad2a','nickname','user.attribute'),('6c62a292-b832-4546-8ac0-225d3ef5ad2a','true','userinfo.token.claim'),('6e1c4626-3bac-4281-97f4-d49200e3b936','true','access.token.claim'),('6e1c4626-3bac-4281-97f4-d49200e3b936','given_name','claim.name'),('6e1c4626-3bac-4281-97f4-d49200e3b936','true','id.token.claim'),('6e1c4626-3bac-4281-97f4-d49200e3b936','String','jsonType.label'),('6e1c4626-3bac-4281-97f4-d49200e3b936','firstName','user.attribute'),('6e1c4626-3bac-4281-97f4-d49200e3b936','true','userinfo.token.claim'),('6f9afd08-4b2b-4c33-b9f2-724cd1e284a6','true','access.token.claim'),('6f9afd08-4b2b-4c33-b9f2-724cd1e284a6','birthdate','claim.name'),('6f9afd08-4b2b-4c33-b9f2-724cd1e284a6','true','id.token.claim'),('6f9afd08-4b2b-4c33-b9f2-724cd1e284a6','String','jsonType.label'),('6f9afd08-4b2b-4c33-b9f2-724cd1e284a6','birthdate','user.attribute'),('6f9afd08-4b2b-4c33-b9f2-724cd1e284a6','true','userinfo.token.claim'),('740fd1b3-8af3-47df-b32d-08cf6cff54a6','true','access.token.claim'),('740fd1b3-8af3-47df-b32d-08cf6cff54a6','preferred_username','claim.name'),('740fd1b3-8af3-47df-b32d-08cf6cff54a6','true','id.token.claim'),('740fd1b3-8af3-47df-b32d-08cf6cff54a6','String','jsonType.label'),('740fd1b3-8af3-47df-b32d-08cf6cff54a6','username','user.attribute'),('740fd1b3-8af3-47df-b32d-08cf6cff54a6','true','userinfo.token.claim'),('751a73e8-8ef2-412f-8ac6-7aad0799cd25','true','access.token.claim'),('751a73e8-8ef2-412f-8ac6-7aad0799cd25','upn','claim.name'),('751a73e8-8ef2-412f-8ac6-7aad0799cd25','true','id.token.claim'),('751a73e8-8ef2-412f-8ac6-7aad0799cd25','String','jsonType.label'),('751a73e8-8ef2-412f-8ac6-7aad0799cd25','username','user.attribute'),('751a73e8-8ef2-412f-8ac6-7aad0799cd25','true','userinfo.token.claim'),('7ce51749-aff8-4371-bde4-02d6b60c7dc8','true','access.token.claim'),('7ce51749-aff8-4371-bde4-02d6b60c7dc8','organization','claim.name'),('7ce51749-aff8-4371-bde4-02d6b60c7dc8','true','id.token.claim'),('7ce51749-aff8-4371-bde4-02d6b60c7dc8','String','jsonType.label'),('7ce51749-aff8-4371-bde4-02d6b60c7dc8','organization','user.attribute'),('7ce51749-aff8-4371-bde4-02d6b60c7dc8','true','userinfo.token.claim'),('7f628a03-7f13-4e48-8925-2a90f13ffcd5','true','access.token.claim'),('7f628a03-7f13-4e48-8925-2a90f13ffcd5','clientAddress','claim.name'),('7f628a03-7f13-4e48-8925-2a90f13ffcd5','true','id.token.claim'),('7f628a03-7f13-4e48-8925-2a90f13ffcd5','String','jsonType.label'),('7f628a03-7f13-4e48-8925-2a90f13ffcd5','clientAddress','user.session.note'),('83ce17bd-d787-49e0-b08e-9dbcfbe6d953','Role','attribute.name'),('83ce17bd-d787-49e0-b08e-9dbcfbe6d953','Basic','attribute.nameformat'),('83ce17bd-d787-49e0-b08e-9dbcfbe6d953','false','single'),('855f5e54-176c-449c-9e0b-a6232d8d3264','true','access.token.claim'),('855f5e54-176c-449c-9e0b-a6232d8d3264','groups','claim.name'),('855f5e54-176c-449c-9e0b-a6232d8d3264','true','id.token.claim'),('855f5e54-176c-449c-9e0b-a6232d8d3264','String','jsonType.label'),('855f5e54-176c-449c-9e0b-a6232d8d3264','true','multivalued'),('855f5e54-176c-449c-9e0b-a6232d8d3264','foo','user.attribute'),('85e24210-43ca-4bd8-b60d-a6f064efae1f','true','access.token.claim'),('85e24210-43ca-4bd8-b60d-a6f064efae1f','email','claim.name'),('85e24210-43ca-4bd8-b60d-a6f064efae1f','true','id.token.claim'),('85e24210-43ca-4bd8-b60d-a6f064efae1f','String','jsonType.label'),('85e24210-43ca-4bd8-b60d-a6f064efae1f','email','user.attribute'),('85e24210-43ca-4bd8-b60d-a6f064efae1f','true','userinfo.token.claim'),('8a68d775-f41d-422d-a903-136a4d09e543','true','access.token.claim'),('8a68d775-f41d-422d-a903-136a4d09e543','profile','claim.name'),('8a68d775-f41d-422d-a903-136a4d09e543','true','id.token.claim'),('8a68d775-f41d-422d-a903-136a4d09e543','String','jsonType.label'),('8a68d775-f41d-422d-a903-136a4d09e543','profile','user.attribute'),('8a68d775-f41d-422d-a903-136a4d09e543','true','userinfo.token.claim'),('8aa7c57e-7f6e-4162-b3f1-80fd931884a7','true','access.token.claim'),('8aa7c57e-7f6e-4162-b3f1-80fd931884a7','locale','claim.name'),('8aa7c57e-7f6e-4162-b3f1-80fd931884a7','true','id.token.claim'),('8aa7c57e-7f6e-4162-b3f1-80fd931884a7','String','jsonType.label'),('8aa7c57e-7f6e-4162-b3f1-80fd931884a7','locale','user.attribute'),('8aa7c57e-7f6e-4162-b3f1-80fd931884a7','true','userinfo.token.claim'),('90d23204-dc40-41b3-9e07-811f526a1d3e','true','access.token.claim'),('90d23204-dc40-41b3-9e07-811f526a1d3e','family_name','claim.name'),('90d23204-dc40-41b3-9e07-811f526a1d3e','true','id.token.claim'),('90d23204-dc40-41b3-9e07-811f526a1d3e','String','jsonType.label'),('90d23204-dc40-41b3-9e07-811f526a1d3e','lastName','user.attribute'),('90d23204-dc40-41b3-9e07-811f526a1d3e','true','userinfo.token.claim'),('98ce004c-d0c0-4fe7-8e58-af24a2141b7a','true','access.token.claim'),('98ce004c-d0c0-4fe7-8e58-af24a2141b7a','org_id','claim.name'),('98ce004c-d0c0-4fe7-8e58-af24a2141b7a','true','id.token.claim'),('98ce004c-d0c0-4fe7-8e58-af24a2141b7a','String','jsonType.label'),('98ce004c-d0c0-4fe7-8e58-af24a2141b7a','org_id','user.attribute'),('98ce004c-d0c0-4fe7-8e58-af24a2141b7a','true','userinfo.token.claim'),('9b29d378-f506-41c2-a324-6d44d7423a28','true','access.token.claim'),('9b29d378-f506-41c2-a324-6d44d7423a28','birthdate','claim.name'),('9b29d378-f506-41c2-a324-6d44d7423a28','true','id.token.claim'),('9b29d378-f506-41c2-a324-6d44d7423a28','String','jsonType.label'),('9b29d378-f506-41c2-a324-6d44d7423a28','birthdate','user.attribute'),('9b29d378-f506-41c2-a324-6d44d7423a28','true','userinfo.token.claim'),('a426d588-ea60-45c7-bd0a-8232e48d8911','true','access.token.claim'),('a426d588-ea60-45c7-bd0a-8232e48d8911','true','id.token.claim'),('a426d588-ea60-45c7-bd0a-8232e48d8911','country','user.attribute.country'),('a426d588-ea60-45c7-bd0a-8232e48d8911','formatted','user.attribute.formatted'),('a426d588-ea60-45c7-bd0a-8232e48d8911','locality','user.attribute.locality'),('a426d588-ea60-45c7-bd0a-8232e48d8911','postal_code','user.attribute.postal_code'),('a426d588-ea60-45c7-bd0a-8232e48d8911','region','user.attribute.region'),('a426d588-ea60-45c7-bd0a-8232e48d8911','street','user.attribute.street'),('a426d588-ea60-45c7-bd0a-8232e48d8911','true','userinfo.token.claim'),('a893e7f8-588d-4fbf-9ec7-245968f45f74','true','access.token.claim'),('a893e7f8-588d-4fbf-9ec7-245968f45f74','locale','claim.name'),('a893e7f8-588d-4fbf-9ec7-245968f45f74','true','id.token.claim'),('a893e7f8-588d-4fbf-9ec7-245968f45f74','String','jsonType.label'),('a893e7f8-588d-4fbf-9ec7-245968f45f74','locale','user.attribute'),('a893e7f8-588d-4fbf-9ec7-245968f45f74','true','userinfo.token.claim'),('abe6cb9e-3590-4e8f-849d-a3ee6415d7a4','true','access.token.claim'),('abe6cb9e-3590-4e8f-849d-a3ee6415d7a4','website','claim.name'),('abe6cb9e-3590-4e8f-849d-a3ee6415d7a4','true','id.token.claim'),('abe6cb9e-3590-4e8f-849d-a3ee6415d7a4','String','jsonType.label'),('abe6cb9e-3590-4e8f-849d-a3ee6415d7a4','website','user.attribute'),('abe6cb9e-3590-4e8f-849d-a3ee6415d7a4','true','userinfo.token.claim'),('b0ef158a-5642-4be1-9086-19876d744b0c','true','access.token.claim'),('b0ef158a-5642-4be1-9086-19876d744b0c','realm_access.roles','claim.name'),('b0ef158a-5642-4be1-9086-19876d744b0c','String','jsonType.label'),('b0ef158a-5642-4be1-9086-19876d744b0c','true','multivalued'),('b0ef158a-5642-4be1-9086-19876d744b0c','foo','user.attribute'),('b1691ba9-bd2f-4203-bb53-eb8e445a236e','true','access.token.claim'),('b1691ba9-bd2f-4203-bb53-eb8e445a236e','phone_number_verified','claim.name'),('b1691ba9-bd2f-4203-bb53-eb8e445a236e','true','id.token.claim'),('b1691ba9-bd2f-4203-bb53-eb8e445a236e','boolean','jsonType.label'),('b1691ba9-bd2f-4203-bb53-eb8e445a236e','phoneNumberVerified','user.attribute'),('b1691ba9-bd2f-4203-bb53-eb8e445a236e','true','userinfo.token.claim'),('c0b119df-559b-4ca5-bebb-0bccbf58bad6','true','access.token.claim'),('c0b119df-559b-4ca5-bebb-0bccbf58bad6','gender','claim.name'),('c0b119df-559b-4ca5-bebb-0bccbf58bad6','true','id.token.claim'),('c0b119df-559b-4ca5-bebb-0bccbf58bad6','String','jsonType.label'),('c0b119df-559b-4ca5-bebb-0bccbf58bad6','gender','user.attribute'),('c0b119df-559b-4ca5-bebb-0bccbf58bad6','true','userinfo.token.claim'),('c0d27316-e8b3-41d9-b639-9ceaa0211309','true','access.token.claim'),('c0d27316-e8b3-41d9-b639-9ceaa0211309','locale','claim.name'),('c0d27316-e8b3-41d9-b639-9ceaa0211309','true','id.token.claim'),('c0d27316-e8b3-41d9-b639-9ceaa0211309','String','jsonType.label'),('c0d27316-e8b3-41d9-b639-9ceaa0211309','locale','user.attribute'),('c0d27316-e8b3-41d9-b639-9ceaa0211309','true','userinfo.token.claim'),('c2fa3606-2009-401e-b124-152d63e10404','true','access.token.claim'),('c2fa3606-2009-401e-b124-152d63e10404','website','claim.name'),('c2fa3606-2009-401e-b124-152d63e10404','true','id.token.claim'),('c2fa3606-2009-401e-b124-152d63e10404','String','jsonType.label'),('c2fa3606-2009-401e-b124-152d63e10404','website','user.attribute'),('c2fa3606-2009-401e-b124-152d63e10404','true','userinfo.token.claim'),('c5bd63a9-1583-4640-970b-4ff818ad57d0','true','access.token.claim'),('c5bd63a9-1583-4640-970b-4ff818ad57d0','org_id','claim.name'),('c5bd63a9-1583-4640-970b-4ff818ad57d0','true','id.token.claim'),('c5bd63a9-1583-4640-970b-4ff818ad57d0','String','jsonType.label'),('c5bd63a9-1583-4640-970b-4ff818ad57d0','org_id','user.attribute'),('c5bd63a9-1583-4640-970b-4ff818ad57d0','true','userinfo.token.claim'),('c71ca3b6-5f7e-4d5e-8205-daa6dda163e6','true','access.token.claim'),('c71ca3b6-5f7e-4d5e-8205-daa6dda163e6','phone_number_verified','claim.name'),('c71ca3b6-5f7e-4d5e-8205-daa6dda163e6','true','id.token.claim'),('c71ca3b6-5f7e-4d5e-8205-daa6dda163e6','boolean','jsonType.label'),('c71ca3b6-5f7e-4d5e-8205-daa6dda163e6','phoneNumberVerified','user.attribute'),('c71ca3b6-5f7e-4d5e-8205-daa6dda163e6','true','userinfo.token.claim'),('c8275ea7-f8a5-44dc-a42c-f876d8a4256b','true','access.token.claim'),('c8275ea7-f8a5-44dc-a42c-f876d8a4256b','phone_number','claim.name'),('c8275ea7-f8a5-44dc-a42c-f876d8a4256b','true','id.token.claim'),('c8275ea7-f8a5-44dc-a42c-f876d8a4256b','String','jsonType.label'),('c8275ea7-f8a5-44dc-a42c-f876d8a4256b','phoneNumber','user.attribute'),('c8275ea7-f8a5-44dc-a42c-f876d8a4256b','true','userinfo.token.claim'),('d090007f-00e9-4a30-bfc0-a6f32a894511','true','access.token.claim'),('d090007f-00e9-4a30-bfc0-a6f32a894511','email','claim.name'),('d090007f-00e9-4a30-bfc0-a6f32a894511','true','id.token.claim'),('d090007f-00e9-4a30-bfc0-a6f32a894511','String','jsonType.label'),('d090007f-00e9-4a30-bfc0-a6f32a894511','email','user.attribute'),('d090007f-00e9-4a30-bfc0-a6f32a894511','true','userinfo.token.claim'),('dfe51f96-3826-400c-b321-aa2fe38860c2','true','access.token.claim'),('dfe51f96-3826-400c-b321-aa2fe38860c2','locale','claim.name'),('dfe51f96-3826-400c-b321-aa2fe38860c2','true','id.token.claim'),('dfe51f96-3826-400c-b321-aa2fe38860c2','String','jsonType.label'),('dfe51f96-3826-400c-b321-aa2fe38860c2','locale','user.attribute'),('dfe51f96-3826-400c-b321-aa2fe38860c2','true','userinfo.token.claim'),('e15f3faa-21f1-408c-904b-900872266bde','true','access.token.claim'),('e15f3faa-21f1-408c-904b-900872266bde','middle_name','claim.name'),('e15f3faa-21f1-408c-904b-900872266bde','true','id.token.claim'),('e15f3faa-21f1-408c-904b-900872266bde','String','jsonType.label'),('e15f3faa-21f1-408c-904b-900872266bde','middleName','user.attribute'),('e15f3faa-21f1-408c-904b-900872266bde','true','userinfo.token.claim'),('e2fe4287-b23a-4b6a-9930-93de8141b2d0','true','access.token.claim'),('e2fe4287-b23a-4b6a-9930-93de8141b2d0','resource_access.${client_id}.roles','claim.name'),('e2fe4287-b23a-4b6a-9930-93de8141b2d0','String','jsonType.label'),('e2fe4287-b23a-4b6a-9930-93de8141b2d0','true','multivalued'),('e2fe4287-b23a-4b6a-9930-93de8141b2d0','foo','user.attribute'),('ef2ccf32-2159-49e4-874c-96599ce4a156','true','access.token.claim'),('ef2ccf32-2159-49e4-874c-96599ce4a156','email_verified','claim.name'),('ef2ccf32-2159-49e4-874c-96599ce4a156','true','id.token.claim'),('ef2ccf32-2159-49e4-874c-96599ce4a156','boolean','jsonType.label'),('ef2ccf32-2159-49e4-874c-96599ce4a156','emailVerified','user.attribute'),('ef2ccf32-2159-49e4-874c-96599ce4a156','true','userinfo.token.claim'),('f097454f-1f87-4ce7-9a10-5e3e3a7ed527','true','access.token.claim'),('f097454f-1f87-4ce7-9a10-5e3e3a7ed527','family_name','claim.name'),('f097454f-1f87-4ce7-9a10-5e3e3a7ed527','true','id.token.claim'),('f097454f-1f87-4ce7-9a10-5e3e3a7ed527','String','jsonType.label'),('f097454f-1f87-4ce7-9a10-5e3e3a7ed527','lastName','user.attribute'),('f097454f-1f87-4ce7-9a10-5e3e3a7ed527','true','userinfo.token.claim'),('f2e81649-fc4f-432f-9e7a-fd7007701b54','true','access.token.claim'),('f2e81649-fc4f-432f-9e7a-fd7007701b54','gender','claim.name'),('f2e81649-fc4f-432f-9e7a-fd7007701b54','true','id.token.claim'),('f2e81649-fc4f-432f-9e7a-fd7007701b54','String','jsonType.label'),('f2e81649-fc4f-432f-9e7a-fd7007701b54','gender','user.attribute'),('f2e81649-fc4f-432f-9e7a-fd7007701b54','true','userinfo.token.claim'),('f368a493-294b-4755-a418-cb8c8f1c63bd','true','access.token.claim'),('f368a493-294b-4755-a418-cb8c8f1c63bd','clientHost','claim.name'),('f368a493-294b-4755-a418-cb8c8f1c63bd','true','id.token.claim'),('f368a493-294b-4755-a418-cb8c8f1c63bd','String','jsonType.label'),('f368a493-294b-4755-a418-cb8c8f1c63bd','clientHost','user.session.note');
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
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('customers',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,'keycloak-rapidfort','customers',0,NULL,_binary '\0',_binary '',_binary '',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '','7ef4796e-a932-41cb-9bbc-006bc16cfdf1',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','468560cf-22d1-4ea7-bebc-5fded89b66c1','680adcd7-9adc-4870-8ca3-a75d905d2147','cd9a6c83-fef6-4d48-b555-d3b4fd4a5616','53b49208-380e-4f20-bb91-b5da0fc4df28','2a0d4867-653f-46e3-a980-51dfc05c249a',2592000,_binary '\0',900,_binary '',_binary '\0','1070aef9-bcdc-4cf3-962a-9cdfb28a14d4',0,_binary '\0',0,0,'2e3a4a49-4f83-4911-9572-449027ff96c4'),('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','8d4f97ec-581f-4c16-a87c-8690b4031c4e',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','69c9cc25-0913-48b2-bf4e-4f2d73aa8d3c','f5e91f58-d13c-4fb6-a359-aa1b38d83e58','3045a23d-bdbb-4bea-a3a4-26bd2dd267f3','fbfdcd45-730f-4636-80c0-9707f0fe9f39','f2f6522c-21c7-4d95-b1f0-0f6263c84c43',2592000,_binary '\0',900,_binary '',_binary '\0','4dbf74f9-f641-4f75-947f-f7c0fb44f08d',0,_binary '\0',0,0,'a6eb2bdb-b18f-4f08-a472-4e2d39f7b76a');
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
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','customers','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','master','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','customers',''),('_browser_header.contentSecurityPolicyReportOnly','master',''),('_browser_header.strictTransportSecurity','customers','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','master','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','customers','nosniff'),('_browser_header.xContentTypeOptions','master','nosniff'),('_browser_header.xFrameOptions','customers','SAMEORIGIN'),('_browser_header.xFrameOptions','master','SAMEORIGIN'),('_browser_header.xRobotsTag','customers','none'),('_browser_header.xRobotsTag','master','none'),('_browser_header.xXSSProtection','customers','1; mode=block'),('_browser_header.xXSSProtection','master','1; mode=block'),('actionTokenGeneratedByAdminLifespan','customers','43200'),('actionTokenGeneratedByUserLifespan','customers','300'),('bruteForceProtected','customers','false'),('bruteForceProtected','master','false'),('cibaAuthRequestedUserHint','customers','login_hint'),('cibaBackchannelTokenDeliveryMode','customers','poll'),('cibaExpiresIn','customers','120'),('cibaInterval','customers','5'),('client-policies.policies','customers','{\"policies\":[]}'),('client-policies.policies','master','{\"policies\":[]}'),('client-policies.profiles','customers','{\"profiles\":[]}'),('client-policies.profiles','master','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','customers','0'),('clientOfflineSessionMaxLifespan','customers','0'),('clientSessionIdleTimeout','customers','0'),('clientSessionMaxLifespan','customers','0'),('displayName','master','Keycloak'),('displayNameHtml','master','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','customers','30'),('failureFactor','master','30'),('maxDeltaTimeSeconds','customers','43200'),('maxDeltaTimeSeconds','master','43200'),('maxFailureWaitSeconds','customers','900'),('maxFailureWaitSeconds','master','900'),('minimumQuickLoginWaitSeconds','customers','60'),('minimumQuickLoginWaitSeconds','master','60'),('oauth2DeviceCodeLifespan','customers','600'),('oauth2DevicePollingInterval','customers','600'),('offlineSessionMaxLifespan','customers','5184000'),('offlineSessionMaxLifespan','master','5184000'),('offlineSessionMaxLifespanEnabled','customers','false'),('offlineSessionMaxLifespanEnabled','master','false'),('parRequestUriLifespan','customers','60'),('permanentLockout','customers','false'),('permanentLockout','master','false'),('quickLoginCheckMilliSeconds','customers','1000'),('quickLoginCheckMilliSeconds','master','1000'),('waitIncrementSeconds','customers','60'),('waitIncrementSeconds','master','60'),('webAuthnPolicyAttestationConveyancePreference','customers','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','customers','not specified'),('webAuthnPolicyAuthenticatorAttachment','customers','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','customers','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','customers','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','customers','false'),('webAuthnPolicyCreateTimeout','customers','0'),('webAuthnPolicyCreateTimeoutPasswordless','customers','0'),('webAuthnPolicyRequireResidentKey','customers','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','customers','not specified'),('webAuthnPolicyRpEntityName','customers','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','customers','keycloak'),('webAuthnPolicyRpId','customers',''),('webAuthnPolicyRpIdPasswordless','customers',''),('webAuthnPolicySignatureAlgorithms','customers','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','customers','ES256'),('webAuthnPolicyUserVerificationRequirement','customers','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','customers','not specified');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('customers','jboss-logging'),('master','jboss-logging');
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
  `TEXTS` longtext CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
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
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','customers'),('password','password',_binary '',_binary '','master');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
INSERT INTO `REALM_SMTP_CONFIG` VALUES ('customers','true','auth'),('customers','noreply@rapidfort.com','from'),('customers','email-smtp.us-east-1.amazonaws.com','host'),('customers','BMQJ9FV51jI4fZK5KSrDBf4K3MQzuW9CDShOYNxqt4Yp','password'),('customers','587','port'),('customers','RapidFort','replyToDisplayName'),('customers','false','ssl'),('customers','true','starttls'),('customers','AKIAT7TY45BMHPQDS36H','user');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
INSERT INTO `REALM_SUPPORTED_LOCALES` VALUES ('customers','');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('0e340f5b-529b-4a51-9ec0-3aebfe99dcd5','/admin/customers/console/*'),('35f9aa3f-0809-4b80-9d32-f128b9819e71','/realms/customers/account/*'),('3decebb2-f7ec-427e-ba4b-3e33d2c8c598','/admin/master/console/*'),('5bba4a74-d89e-4280-97b8-018d7a03eb23','/realms/customers/account/*'),('6b6c72ba-6fd7-4b9e-91b6-4eff47af9068','/realms/master/account/*'),('d1b4ce96-42e8-4770-aed1-c6cad994fcbb','/realms/master/account/*'),('f6ebeaf9-bc3b-401d-9b39-e967191d4a1b','/*');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('01099d50-03ae-4b45-8435-fdba9fe03123','update_user_locale','Update User Locale','customers',_binary '',_binary '\0','update_user_locale',1000),('09a9673c-84b7-4613-b341-40c93cec13c4','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('1d16c2d2-b32a-4edd-9800-a9fa5beec200','VERIFY_EMAIL','Verify Email','customers',_binary '',_binary '\0','VERIFY_EMAIL',50),('1e627047-aa9d-43a4-ac11-7f6605a6a8e3','CONFIGURE_TOTP','Configure OTP','customers',_binary '',_binary '\0','CONFIGURE_TOTP',10),('1f4b43c4-040b-4223-989f-53ac5910c676','UPDATE_PROFILE','Update Profile','customers',_binary '',_binary '\0','UPDATE_PROFILE',40),('1fa92cf4-fe36-48f4-b5f3-7a6a34555ffe','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('4b6ba1c2-89bf-4426-b2e2-2c1122f47f5a','delete_account','Delete Account','master',_binary '\0',_binary '\0','delete_account',60),('646746cd-0ea6-447d-9de5-c8cce70e6d76','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('7d902ecb-b26d-4fde-a7eb-eb7f53c285e1','UPDATE_PASSWORD','Update Password','customers',_binary '',_binary '\0','UPDATE_PASSWORD',30),('805d4421-06fe-43f1-add6-4245b2e0e749','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('8aa9cf85-aff3-4708-b4cb-14a59204f187','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('cefd332e-8fa9-4be6-a022-e721a5c7b202','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('f4608c40-884e-4fca-a672-a389d0a45a1e','terms_and_conditions','Terms and Conditions','customers',_binary '\0',_binary '\0','terms_and_conditions',20),('f8f50a4e-80c8-4f82-b9a6-70ee23595e8b','delete_account','Delete Account','customers',_binary '\0',_binary '\0','delete_account',60);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
INSERT INTO `RESOURCE_POLICY` VALUES ('24957bbd-22c8-4636-9636-7777a292a1f7','408dc9c7-80b9-4dc7-b5c2-da2bc1f11a9f'),('24957bbd-22c8-4636-9636-7777a292a1f7','41cde83b-087b-4bee-93e8-c339832af7ac'),('24957bbd-22c8-4636-9636-7777a292a1f7','491ea318-6f55-4255-b269-a021b6babc2f'),('24957bbd-22c8-4636-9636-7777a292a1f7','841855e7-9c09-4d53-812a-47fc7bef4fa8'),('24957bbd-22c8-4636-9636-7777a292a1f7','9d246421-0525-4d7f-9d3a-19126a027d3b'),('24957bbd-22c8-4636-9636-7777a292a1f7','bee02c94-8734-4805-8147-4db7347c7b7b');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
INSERT INTO `RESOURCE_SCOPE` VALUES ('24957bbd-22c8-4636-9636-7777a292a1f7','1eda8021-dfd1-4b32-b073-e60e22dea143'),('24957bbd-22c8-4636-9636-7777a292a1f7','3835dd74-92fd-46d5-b136-a50e9c7651ce'),('24957bbd-22c8-4636-9636-7777a292a1f7','62100599-db9e-41fd-9520-96f994e40957'),('24957bbd-22c8-4636-9636-7777a292a1f7','71c2f607-265b-4bfa-a803-32a871b26b96'),('24957bbd-22c8-4636-9636-7777a292a1f7','73a355f8-46d2-403a-9b5a-beaf980577b3'),('24957bbd-22c8-4636-9636-7777a292a1f7','cd775fef-37e9-42b8-bf90-b0fa42dd7e2c');
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER` VALUES ('97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '\0','0',1);
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
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_POLICY` VALUES ('1129aaa7-56a1-4d5b-90e1-1cdeaa173b51','admin-token-exchange',NULL,'client','1','0','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('408dc9c7-80b9-4dc7-b5c2-da2bc1f11a9f','view.permission.users',NULL,'scope','1','0','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('41cde83b-087b-4bee-93e8-c339832af7ac','manage.permission.users',NULL,'scope','1','0','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('491ea318-6f55-4255-b269-a021b6babc2f','admin-impersonating.permission.users',NULL,'scope','1','0','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('66da9318-e914-4926-8666-2828bcd6569a','user-impersonate','user-impersonate','client','1','0','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('841855e7-9c09-4d53-812a-47fc7bef4fa8','manage-group-membership.permission.users',NULL,'scope','1','0','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('9d246421-0525-4d7f-9d3a-19126a027d3b','user-impersonated.permission.users',NULL,'scope','1','0','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('bee02c94-8734-4805-8147-4db7347c7b7b','map-roles.permission.users',NULL,'scope','1','0','97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_RESOURCE` VALUES ('24957bbd-22c8-4636-9636-7777a292a1f7','Users',NULL,NULL,'97cf7bc9-27ef-43c2-8b87-235f57531fc8','97cf7bc9-27ef-43c2-8b87-235f57531fc8',_binary '\0',NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_SCOPE` VALUES ('165b9947-79de-4983-960b-3665796b0504','map-roles-client-scope',NULL,'97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('1cb02879-b83a-45ad-9147-f0b3537b48ff','map-role-client-scope',NULL,'97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('1eda8021-dfd1-4b32-b073-e60e22dea143','view',NULL,'97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('3835dd74-92fd-46d5-b136-a50e9c7651ce','user-impersonated',NULL,'97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('62100599-db9e-41fd-9520-96f994e40957','manage-group-membership',NULL,'97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('68a04516-3757-492d-afcc-94df5d4a7b5b','token-exchange',NULL,'97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('712a9456-a149-45af-afc8-31464182c68a','map-roles-composite',NULL,'97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('71c2f607-265b-4bfa-a803-32a871b26b96','impersonate',NULL,'97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('73a355f8-46d2-403a-9b5a-beaf980577b3','map-roles',NULL,'97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('a38b8dfb-c212-4467-8372-6a627315e003','configure',NULL,'97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('a5c9b164-0f3a-4ebf-81c9-cd36e608bd71','map-role',NULL,'97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('b6acee0b-2dbe-4a0f-9070-b76db791463d','map-role-composite',NULL,'97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL),('cd775fef-37e9-42b8-bf90-b0fa42dd7e2c','manage',NULL,'97cf7bc9-27ef-43c2-8b87-235f57531fc8',NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('6b6c72ba-6fd7-4b9e-91b6-4eff47af9068','00c7773e-5f76-44b3-b4b2-4478310bdc78'),('35f9aa3f-0809-4b80-9d32-f128b9819e71','a1c93ea7-d731-42c8-92e6-2db34f434340');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
INSERT INTO `SCOPE_POLICY` VALUES ('1eda8021-dfd1-4b32-b073-e60e22dea143','408dc9c7-80b9-4dc7-b5c2-da2bc1f11a9f'),('cd775fef-37e9-42b8-bf90-b0fa42dd7e2c','41cde83b-087b-4bee-93e8-c339832af7ac'),('71c2f607-265b-4bfa-a803-32a871b26b96','491ea318-6f55-4255-b269-a021b6babc2f'),('62100599-db9e-41fd-9520-96f994e40957','841855e7-9c09-4d53-812a-47fc7bef4fa8'),('3835dd74-92fd-46d5-b136-a50e9c7651ce','9d246421-0525-4d7f-9d3a-19126a027d3b'),('73a355f8-46d2-403a-9b5a-beaf980577b3','bee02c94-8734-4805-8147-4db7347c7b7b');
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
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `USER_ATTRIBUTE` VALUES ('locale','en','0bc222bc-2673-4150-8751-4a2247e2983c','27008a29-784b-4c2c-a8f0-466726f0dc4e');
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
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('0bc222bc-2673-4150-8751-4a2247e2983c','rf@rapidfort.com','rf@rapidfort.com',_binary '\0',_binary '',NULL,'RapidFort','Inc','master','admin',1641964508697,NULL,0),('3837b25b-385f-4149-a3cc-f57966c51c9d',NULL,'39db0c1f-87a6-4b7f-a7ea-d865b6be9092',_binary '\0',_binary '',NULL,NULL,NULL,'customers','service-account-admin-cli',1641965178824,'c9e6110f-f347-4d2c-8206-cf4504a99865',0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('00c7773e-5f76-44b3-b4b2-4478310bdc78','0bc222bc-2673-4150-8751-4a2247e2983c'),('1ba69df5-1cc9-40db-914b-6645db958059','0bc222bc-2673-4150-8751-4a2247e2983c'),('5b2b11c6-eb14-44ea-846c-a12e5a098497','0bc222bc-2673-4150-8751-4a2247e2983c'),('73f52f6b-c2c7-4f1b-97bb-ffc8e117f7da','0bc222bc-2673-4150-8751-4a2247e2983c'),('8a8ff887-39a7-4312-a569-a1dc36723a47','0bc222bc-2673-4150-8751-4a2247e2983c'),('2e3a4a49-4f83-4911-9572-449027ff96c4','3837b25b-385f-4149-a3cc-f57966c51c9d'),('97bdcce8-a816-4556-bc98-f0e265f344ec','3837b25b-385f-4149-a3cc-f57966c51c9d'),('a1c93ea7-d731-42c8-92e6-2db34f434340','3837b25b-385f-4149-a3cc-f57966c51c9d'),('a4ca1c64-e3bd-4c0e-853e-8b332d44a334','3837b25b-385f-4149-a3cc-f57966c51c9d'),('b189d6af-3b88-4228-ad0f-da8ba08d763b','3837b25b-385f-4149-a3cc-f57966c51c9d'),('de9a048b-35ab-4f77-8336-d51d7b3dddba','3837b25b-385f-4149-a3cc-f57966c51c9d'),('f2fb7329-c81c-4752-bc02-12281d817530','3837b25b-385f-4149-a3cc-f57966c51c9d');
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
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `VALUE` text,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('0e340f5b-529b-4a51-9ec0-3aebfe99dcd5','+'),('3decebb2-f7ec-427e-ba4b-3e33d2c8c598','+'),('f6ebeaf9-bc3b-401d-9b39-e967191d4a1b','/*');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-03  2:17:37
