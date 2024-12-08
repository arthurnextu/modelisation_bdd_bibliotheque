# modelisation_bdd_bibliotheque

## Exercice 1:

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

