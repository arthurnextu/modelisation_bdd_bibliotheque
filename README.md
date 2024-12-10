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
             - date_emprunt : Date à laquelle le membre à emprunter
             - date_retour : Date à laquelle le membre doit rendre le livre

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
