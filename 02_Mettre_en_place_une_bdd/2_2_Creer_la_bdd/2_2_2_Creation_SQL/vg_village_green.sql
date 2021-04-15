--
-- Base de données :  `village_green`
--

DROP DATABASE IF EXISTS `vg_village_green`;
CREATE DATABASE `vg_village_green`;

USE `vg_village_green`;

CREATE TABLE `vg_categories`(
   `cat_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
   `cat_nom` VARCHAR(50) NOT NULL,
   `cat_sous_categories` INT UNSIGNED NOT NULL,

   PRIMARY KEY(`cat_id`),
   FOREIGN KEY (`cat_sous_categories`) REFERENCES `vg_categories`(`cat_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vg_services`(
   `ser_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
   `ser_nom` VARCHAR(50) NOT NULL,

   PRIMARY KEY(`ser_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vg_fonctions`(
   `fon_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
   `fon_nom` VARCHAR(50) NOT NULL,
   `fon_id_services` INT UNSIGNED NOT NULL,

   PRIMARY KEY(`fon_id`),
   FOREIGN KEY(`fon_id_services`) REFERENCES `vg_services`(`ser_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vg_categories_client`(
   `cat_cli_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
   `cat_cli_nom` VARCHAR(50) NOT NULL,
   `cat_cli_coeff` DECIMAL(3,2),

   PRIMARY KEY(`cat_cli_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vg_pays`(
   `pay_id` VARCHAR(2),
   `pay_nom` VARCHAR(60) NOT NULL,

   PRIMARY KEY(`pay_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vg_categories_fournisseur`(
   `cat_fou_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
   `cat_fou_nom` VARCHAR(50) NOT NULL,

   PRIMARY KEY(`cat_fou_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vg_fournisseurs`(
   `fou_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
   `fou_nom` VARCHAR(50) NOT NULL,
   `fou_adresse` VARCHAR(150) NOT NULL,
   `fou_cp` INT UNSIGNED,
   `fou_ville` VARCHAR(50),
   `fou_tel` INT UNSIGNED,
   `fou_mail` VARCHAR(255),
   `fou_cat_fou_id` INT UNSIGNED NOT NULL,
   `fou_pay_id` VARCHAR(2) NOT NULL,

   PRIMARY KEY(`fou_id`),
   FOREIGN KEY(`fou_cat_fou_id`) REFERENCES `vg_categories_fournisseur`(`cat_fou_id`),
   FOREIGN KEY(`fou_pay_id`) REFERENCES `vg_pays`(`pay_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vg_produits`(
   `pro_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
   `pro_ref` INT UNSIGNED NOT NULL,
   `pro_libelle` VARCHAR(45) NOT NULL,
   `pro_description` VARCHAR(500),
   `pro_prix_unit_HT` DECIMAL(6,2) NOT NULL,
   `pro_stock_physique` INT,
   `pro_stock_alert` INT UNSIGNED NOT NULL,
   `pro_photo` VARCHAR(4) NOT NULL,
   `pro_bloque` BOOLEAN,
   `pro_cat_id` INT UNSIGNED NOT NULL,
   `pro_fou_id` INT UNSIGNED NOT NULL,
   `pro_date_ajout` DATETIME,
   `pro_date_modifs` DATETIME,

   PRIMARY KEY(`pro_id`),
   FOREIGN KEY(`pro_cat_id`) REFERENCES `vg_categories`(`cat_id`),
   FOREIGN KEY(`pro_fou_id`) REFERENCES `vg_fournisseurs`(`fou_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vg_employes`(
   `emp_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
   `emp_fon_id` INT UNSIGNED NOT NULL,
   `emp_nom` VARCHAR(50) NOT NULL,
   `emp_prenom` VARCHAR(50) NOT NULL,
   `emp_adresse` VARCHAR(150) NOT NULL,
   `emp_cp` INT UNSIGNED NOT NULL,
   `emp_ville` VARCHAR(50) NOT NULL,
   `emp_pay_id` VARCHAR(2) NOT NULL,
   `emp_mail` VARCHAR(255) NOT NULL,
   `emp_telephone` INT UNSIGNED NOT NULL,

   PRIMARY KEY(`emp_id`),
   FOREIGN KEY(`emp_fon_id`) REFERENCES `vg_fonctions`(`fon_id`),
   FOREIGN KEY(`emp_pay_id`) REFERENCES `vg_pays`(`pay_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vg_clients`(
   `cli_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
   `cli_ref` VARCHAR(30) NOT NULL,
   `cli_nom` VARCHAR(50) NOT NULL,
   `cli_prenom` VARCHAR(50) NOT NULL,
   `cli_genre` VARCHAR(5) NOT NULL,
   `cli_mail` VARCHAR(255) NOT NULL,
   `cli_telephone` INT UNSIGNED NOT NULL,
   `cli_mdp` VARCHAR(64) NOT NULL,
   `cli_emp_id` INT UNSIGNED NOT NULL,
   `cli_cat_cli_id` INT UNSIGNED NOT NULL,

   PRIMARY KEY(`cli_id`),
   FOREIGN KEY(`cli_emp_id`) REFERENCES `vg_employes`(`emp_id`),
   FOREIGN KEY(`cli_cat_cli_id`) REFERENCES `vg_categories_client`(`cat_cli_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vg_adresse`(
   `adr_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
   `adr_numero` INT NOT NULL,
   `adr_num_appartement` INT UNSIGNED,
   `adr_rue` VARCHAR(50) NOT NULL,
   `adr_cp` INT UNSIGNED NOT NULL,
   `adr_ville` VARCHAR(50) NOT NULL,
   `adr_facturation_numero` INT UNSIGNED NOT NULL,
   `adr_facturation_rue` VARCHAR(50) NOT NULL,
   `adr_facturation_cp` INT UNSIGNED NOT NULL,
   `adr_facturation_ville` VARCHAR(50) NOT NULL,
   `adr_pay_id` VARCHAR(2) NOT NULL,
   `adr_cli_id` INT UNSIGNED NOT NULL,

   PRIMARY KEY(`adr_id`),
   FOREIGN KEY(`adr_pay_id`) REFERENCES `vg_pays`(`pay_id`),
   FOREIGN KEY(`adr_cli_id`) REFERENCES `vg_clients`(`cli_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vg_commandes`(
   `com_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
   `com_date_creation` DATETIME NOT NULL,
   `com_date_envoi` DATE,
   `com_date_paiement` DATE,
   `com_statut` VARCHAR(50),
   `com_date_livre` DATE,
   `com_cli_id` INT UNSIGNED NOT NULL,

   PRIMARY KEY(`com_id`),
   FOREIGN KEY(`com_cli_id`) REFERENCES `vg_clients`(`cli_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vg_details_commande`(
   `det_com_id` INT UNSIGNED AUTO_INCREMENT NOT NULL,
   `det_com_qte` INT UNSIGNED NOT NULL,
   `det_com_total_HT` DECIMAL(6,2) NOT NULL,
   `det_com_tva` DECIMAL(6,2) NOT NULL,
   `det_com_remise` INT UNSIGNED,
   `det_com_remise_commerciale` INT UNSIGNED,
   `det_com_total_TTC` DECIMAL(6,2) NOT NULL,
   `det_com_pro_id` INT UNSIGNED NOT NULL,
   `det_com_com_id` INT UNSIGNED NOT NULL,

   PRIMARY KEY(`det_com_id`),
   FOREIGN KEY(`det_com_pro_id`) REFERENCES `vg_produits`(`pro_id`),
   FOREIGN KEY(`det_com_com_id`) REFERENCES `vg_commandes`(`com_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP ROLE IF EXISTS 'r_visiteur'@'localhost', 'r_client'@'localhost', 'r_gestion'@'localhost', 'r_admin'@'localhost';
CREATE ROLE 'r_visiteur'@'localhost', 'r_client'@'localhost', 'r_gestion'@'localhost', 'r_admin'@'localhost';

GRANT SELECT ON vg_village_green.vg_produits
TO 'r_visiteur'@'localhost';

GRANT SELECT ON vg_village_green.*
TO 'r_client'@'localhost';
GRANT INSERT, UPDATE ON vg_village_green.vg_clients
TO 'r_client'@'localhost';
GRANT INSERT, UPDATE ON  vg_village_green.vg_commandes
TO 'r_client'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE ON vg_village_green.*
TO 'r_gestion'@'localhost';

GRANT ALL PRIVILEGES ON vg_village_green.*
TO 'r_admin'@'localhost';
