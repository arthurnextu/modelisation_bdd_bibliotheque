# modelisation_bdd_bibliotheque

## Etape 1:

--Entités-- --Attributs--
- Livres :   - id_livre (clé primaire) : Identifiant unique du livre
             - nom : Nom du livre
             - date_parution : Date de parution du livre
             - auteur : Auteur(e) du livre

- Membres :  - id_membre (clé primaire) : Identifiant unique du membre
             - nom : Nom du membre
             - prenom : Prénom du membre
             - email : Email du membre
             - date_inscription : Date à laquelle le membre s'est inscrit

- Demandes : - id_demande (clé primaire) : Identifiant unique de la demande.
             - id_livre (clé étrangère) : Référence au livre concerné.
             - id_membre (clé étrangère) : Référence au membre ayant fait la demande.
             - type_demande : Type d'action demandée (emprunt, consultation, autre).
             - date_demande : Date à laquelle la demande a été effectuée.
             - etat_demande : Statut de la demande (En attente, Approuvée, Refusée, etc.)

- Emprunts : - id_emprunt (clé primaire) : Identifiant unique de l'emprunt
             - id_livre (clé étrangère) : Référence au livre concerné
             - id_membre (clé étrangère) : Référence au membre ayant fait l'emprunt
             - id_demande (clé étrangère) : Référence au type de demande 
             - date_emprunt : Date à laquelle le membre à emprunter
             - date_retour : Date à laquelle le membre doit rendre le livre

## Etape 2

**capture d'écran du diagramme**

## Etape 3

1ère forme normale
Critère : Éliminer les groupes d'attributs répétitifs et s'assurer que chaque cellule contient une valeur atomique.
Actions sur le modèle :

Les colonnes répétitives ou listes doivent être transformées en nouvelles entités.
Exemple : Si une table "Livres" contient une colonne "Auteurs" avec plusieurs noms séparés par des virgules, elle sera transformée en une table "Auteurs".
Résultat :

Les tables du modèle (Livres, Membres, Demandes, Emprunts) sont déjà conformes à la 1NF, car chaque colonne contient des valeurs atomiques.
2ème forme normale (2NF)
Critère : S'assurer que toutes les colonnes non clés dépendent entièrement de la clé primaire (pas de dépendances partielles).
Actions sur le modèle :

Identifier les colonnes qui dépendent d'une partie seulement d'une clé primaire composite.
Les déplacer vers une nouvelle table si nécessaire.
Exemple d'ajustement :
Si "Demandes" avait des colonnes comme "Nom_Membre" (qui dépend de l'ID_Membre), on les déplacerait vers la table "Membres".
Résultat :

Les dépendances partielles sont déjà bien organisées dans le modèle proposé. Les tables sont conformes à la 2NF.
3ème forme normale (3NF)
Critère : Éliminer les dépendances transitives (les colonnes doivent dépendre uniquement de la clé primaire).
Actions sur le modèle :

Si une colonne "Catégorie_Livre" dépend de "ID_Catégorie", et que "ID_Catégorie" dépend de "ID_Livre", alors une table "Catégories" est créée.
Résultat :

Les tables proposées sont déjà conformes à la 3NF, car chaque attribut dépend uniquement de la clé primaire.

## Etape 4

create_tables.sql : Contient les requêtes pour créer les tables de la base de données.

## Etape 5

insert_data.sql : Contient des exemples d'insertion de données.

## Etape 6

request.sql : contient des requêtes SQL avancées avec des jointures et des agrégations.

## Etape 7

## Rapport Final : Gestion d'une Bibliothèque
## Introduction
Ce projet vise à modéliser et implémenter une base de données pour une bibliothèque, permettant de gérer les livres, les membres, les emprunts et les demandes. L'objectif principal était de concevoir une structure relationnelle respectant les normes de modélisation, d'insérer des données et de réaliser des requêtes complexes.

## Processus de création
### Étape 1 : Analyse des besoins
Une analyse des besoins a permis d'identifier les entités suivantes :

Livres : pour gérer les informations des ouvrages disponibles.
Membres : pour gérer les utilisateurs inscrits à la bibliothèque.
Emprunts : pour suivre les livres empruntés.
Demandes : pour gérer les requêtes de réservation ou de disponibilité des livres.

### Étape 2 : Modélisation relationnelle
Un diagramme ERD a été réalisé pour visualiser les entités et leurs relations. Voici les principaux éléments du modèle :

Relations :
Un membre peut emprunter plusieurs livres.
Un livre peut faire l'objet de plusieurs emprunts ou demandes.
Cardinalités :
Chaque emprunt est associé à un seul livre et un seul membre.
Chaque demande est associée à un seul livre et un seul membre.
Diagramme ERD :

### Étape 3 : Normalisation
Le modèle a été normalisé pour respecter les trois premières formes normales (1NF, 2NF, 3NF). Voici les ajustements effectués :

1NF : Élimination des attributs multi-valeurs ou non atomiques (par exemple, un membre avec plusieurs numéros de téléphone aurait été divisé en plusieurs enregistrements).
2NF : Suppression des dépendances partielles en s'assurant que chaque table dépend uniquement de la clé primaire.
3NF : Élimination des dépendances transitives, comme une table intermédiaire contenant des informations redondantes sur les livres et les emprunts.

### Étape 4 : Création des tables
Les tables ont été créées à l'aide du script create_tables.sql. Les contraintes suivantes ont été appliquées :

Clés primaires : livre_id, membre_id, emprunt_id, et demande_id.
Clés étrangères : Relations entre les tables pour assurer l'intégrité référentielle.
Types de données : Par exemple, VARCHAR pour les noms et DATE pour les dates.

### Étape 5 : Insertion des données
Le script insert_data.sql contient des données fictives pour illustrer le fonctionnement du modèle. Trois enregistrements par table ont été insérés :

Livres : Exemples d'œuvres littéraires variées.
Membres : Profils fictifs pour tester les relations.
Emprunts : Données d'exemple pour les livres actuellement empruntés.
Demandes : Requêtes fictives pour tester les réservations.

### Étape 6 : Requêtes avancées
Trois requêtes SQL avancées ont été rédigées pour démontrer les relations entre les tables :

Liste des livres empruntés avec les informations des membres :
Permet de visualiser quels membres ont emprunté quels livres.
Nombre total de livres empruntés par chaque membre :
Identifie les membres les plus actifs.
Liste des demandes en attente :
Affiche les livres réservés par les membres et leur statut.
Exemple de résultat pour la requête 1 :

emprunt_id	titre	nom	prenom	date_emprunt	date_retour
1	1984	Dupont	Jean	2024-12-01	NULL
2	Les Misérables	Martin	Marie	2024-12-05	2024-12-10
Défis rencontrés et solutions
Défis
Problème de connexion à MySQL via VS Code :
L'installation initiale n'a pas reconnu la commande mysql.
Solution : Installation correcte du serveur MySQL et configuration des variables d'environnement.

Conception des relations :
Une hésitation entre l'utilisation d'une table pour les transactions et la séparation entre les emprunts et les demandes.
Solution : Maintien de la clarté en séparant ces deux entités pour refléter des processus distincts.

Respect des cardinalités :
La définition des clés étrangères nécessitait une attention particulière.
Solution : Vérifications et ajustements fréquents dans le diagramme ERD.

## Conclusion
Ce projet a permis de concevoir et d'implémenter une base de données fonctionnelle pour une bibliothèque. Le modèle relationnel a été respecté, et les scripts SQL fournis permettent de tester facilement la structure et les relations.
