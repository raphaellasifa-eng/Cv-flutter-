# Application Mobile Flutter — CV & Gestion de la Famille (TP2)

Ce dépôt contient le code source de mon application mobile Flutter (**TP2**), faisant évoluer le projet du **TP1** (présentation du CV, des membres de la famille et des coordonnées) vers une application dynamique connectée à une **API REST** et à une **base de données**.

## Fonctionnalités principales

* **Authentification réelle** : connexion via `LoginPage` reliée à l'API (sans simulation de connexion).
* **Consultation (`GET`)** : récupération dynamique de la liste des membres de la famille depuis la base de données via `ApiService`.
* **Ajout (`POST`)** : ajout d'un nouveau membre de la famille enregistré en base de données.
* **Modification (`PUT` / `PATCH`)** : mise à jour des informations d'un membre existant.
* **Suppression (`DELETE`)** : suppression d'un membre de la famille côté serveur et base de données.
* **Présentation du CV et des coordonnées** : consultation des informations du profil et de la page de contact.

## Structure du projet

* `Flutter.dart` : interface de l'application Flutter (authentification, navigation, CV, gestion de la famille via `FamillePage`, coordonnées).
* `Api_service.dart` : service gérant les appels HTTP vers l'API REST pour l'authentification et les opérations sur les membres de la famille.

## Capture vidéo de démonstration

> **Démonstration complète (authentification + ajout, consultation, modification et suppression en base de données) :**  
> [Voir la vidéo de démonstration ici]([COLLE_ICI_LE_LIEN_DE_TA_VIDEO])

*(Si tu ajoutes un fichier vidéo directement dans le dépôt ou sur une plateforme comme YouTube / Google Drive, indique ici le lien ou le chemin correspondant.)*
