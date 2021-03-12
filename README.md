# Projet Fil rouge : travail à réaliser

Pour développer la vente aux particuliers, l'entreprise souhaiterait mettre en place un site web accessible aux particuliers et aux professionnels.

Les fonctionnalités attendues sont les suivantes :

 * Un module de gestion des commandes. Réservé au service commercial, ce module doit permettre de :

    * Créer une nouvelle commande
    * Ajouter des produits dans la commande
    * Connaître l'état de la commande (saisie, annulée, en préparation, expédiée, facturée, retard de paiement, soldée)
    * Consulter les clients en retard de paiement à une date donnée
    * Modifier ou annuler la commande avant qu’elle ne soit en préparation
    * Les commandes seront saisies par le biais d'une interface accessible par internet

 * Un module de gestion des produits :

    * ajouter des produits et leurs caractéristiques (libellé, caractéristiques, prix etc.)
    * modifier des produits
    * supprimer des produits

### 1 - Utiliser un outil de gestion de version

En utilisant l'outil de gestion de versions GIT :

    * 1.1 - Créez un dépôt pour suivre les modifications apportées à votre projet.
    * 1.2 - Synchronisez votre dépôt local avec un dépôt distant GitHub.
    * 1.3 - Votre dépôt doit être accessible publiquement et contenir un fichier README.md.

###2 - Mettre en place une base de données

####2.1 - Elaborer le dictionnaire de données

A partir du cahier des charges, élaborez le dictionnaire des données :

    * Les descriptions devront être claires et réalistes.
    * Les informations devront être typées.

####2.2 - Créer la base de données

Analysez ces documents annexes qui comportent des éléments à prendre en compte.

    * 2.2.1 - Réaliser le MCD du site e-commerce en tenant compte de toutes les contraintes fonctionnelles énoncées dans le cahier des charges (partie L'existant notamment).

    * 2.2.2 - Ecrivez le script de création de la base de données (vous pouvez utiliser le script de génération de la base précédemment obtenu).

    * 2.2.3 - Ce script doit prendre en compte l'ensemble des tables du schéma physique, les clés primaires et étrangères, les index et les droits d'accès.

    * 2.2.4 - Pour la sécurité, vous devez prévoir plusieurs profils de connexion et décliner les autorisations nécessaires.

        * Profil visiteur : lecture sur le catalogue
        * Profil client : lecture sur toute la base (insertion et mise à jour dans commande et client)
        * Profil gestion : lecture/écriture dans la base
        * Profil administrateur (ou développeur) : comme gestion + création et suppression d'objet

    * 2.2.5 - Alimenter la base de tests : créez un script d'insertion des données dans l'ensemble des tables de la base de données. Ces données seront compréhensibles par un utilisateur de base et devront donc avoir des valeurs en cohérence avec le domaine fonctionnel.

Vous pouvez vous aider de ce site bien pratique.

    * 2.2.6 - Décrivez les procédures que vous mettez en place pour assurer les sauvegardes de la base.
    * 2.2.7 - Testez une restauration.
###3 - Manipuler la base de données

####3.1 - Formaliser des requêtes à l'aide du langage SQL

    * 3.1.1 - Pour chacune des interrogations demandées (voir cahier des charges), créez un script contenant la ou les requêtes nécessaires.
    * 3.1.2 - Exportez les tables principales (entité) vers des tableaux d'un tableur de votre choix ainsi que le contenu du résultat de vos requêtes.

Certaines interrogations sont à prévoir :

    * 3.1.3 - chiffre d'affaires hors taxes généré pour l'ensemble et par fournisseur
    * 3.1.4 - liste des produits commandés pour une année sélectionnée (référence et nom du produit, quantité commandée, fournisseur)
    * 3.1.5 - liste des commandes pour un client (date de commande, référence client, montant, état de la commande)
    * 3.1.6 - répartition du chiffre d'affaires hors taxes par type de client
    * 3.1.7 - lister les commandes en cours de livraison.

Ces tableaux devront apparaître dans votre dossier final.

####3.2 - Programmer des procédures stockées sur le SGBD

Créez une procédure stockée :

    * 3.2.1 - qui renvoie le délai moyen entre la date de commande et la date de facturation

####3.3 - Gérer les vues

    * 3.3 - Créez une vue correspondant à la jointure Produits - Fournisseurs

###4 - Construire la maquette de l'application

    * 4.1 - Représentez le diagramme de cas d'utilisation d'une commande sur le site par un client particulier. La notion de panier doit y apparaître.
    * 4.2 - Avec un outil de maquettage (Draw.io, Balsamiq ou encore Pencil), réalisez la maquette de la page de connexion du site.

###5. Développer une application web

Réalisez un site e-commerce pour les clients particuliers qui permet de :

    * 5.0.1 - consulter le catalogue
    * 5.0.2 - saisir de nouvelles commandes
    * 5.0.3 - visualiser les anciennes commandes

####5.1 - Développer des pages web statiques (HTML/CSS)

    * 5.1.1 - Réaliser une page d'accueil pour votre projet. Vous devez réaliser l'intégration HTML/CSS de votre page d'accueil à partir des éléments qui vous sont fournis dans la charte graphique.
    Le site sera divisé en deux parties :

    * 5.1.2 - Front-office : contient la partie publique du site (dont la page d'accueil) et un accès à la liste de produits et accès au formulaire d'inscription. Vous devez intégrer au mieux les éléments de la charte graphique.
    * 5.1.3 - Back-office : c'est la partie privée du site, réservée à l'administrateur, elle permet de gérer les produits et les commandes (si vous avez le temps...).

####5.2 - Intégrer des scripts clients (Javascript)

    * 5.2.1 - Votre application web doit comporter un formulaire d'inscription pour le client.
    * 5.2.2 - Vous devez empêcher l'utilisateur d'envoyer des informations erronées et lui indiquer les erreurs.

####5.3 - Développer des composants web d'accès aux données

    * 5.3.1 - Vous devez mettre en œuvre la gestion CRUD sur une table de votre choix. Ces pages devront être accessibles à partir de votre menu d'accueil.

    * 5.3.2 - Votre interface doit permettre d'afficher la liste des éléments, l'ajout, la modification et la suppression.

    * 5.3.3 - Vous devez utiliser une architecture MVC pour réaliser ce travail.

###6 - Mettre en œuvre une solution de gestion de contenu ou d'ecommerce

Dans le cadre de sa stratégie S.E.O., la société Village Green veut développer du marketing de contenu autour des produits qu'elle commercialise via un blog en Wordpress (articles sur les nouveaux produits, tests, vulgarisation technique, vie de l'entreprise etc.).

Utilisez l'extension FakerPress pour créer de faux articles.

Le site doit s'inspirer de la page d'accueil de Village Green.

* 6.1 - Réalisez un thème responsive qui reprend les grandes lignes de la charte graphique du site e-commerce.
* 6.2 - Les employés pourront écrire des articles sans les publier. Il n'y aura qu'un seul administrateur, lequel se chargera, entre autres tâches, de valider les articles.
* 6.3 - Un plugin S.E.O. devra être configuré.
* 6.4 - La sécurité devra bien sûr être prise en compte.
* 6.5 - Publier le résultat de votre travail sur le serveur. Le site publié doit s'exécuter sans erreur.

###7 - Publier l'application
    * 7.1 - Le projet Fil rouge (e-commerce et Wordpress) doit être hébergé sur votre compte dev.amorce.org.
    * 7.2 - L'exécution doit se dérouler sans erreurs.
