INSERT INTO Livres (id_livre, nom, auteur, date_parution)
VALUES 
(1, '1984', 'George Orwell', 1949),
(2, 'Le Petit Prince', 'Antoine de Saint-Exupéry', 1943),
(3, "Harry Potter à l'école des sorciers", 'J.K. Rowling', 1997);

INSERT INTO Membres (id_membre, nom, prenom, email, date_inscription)
VALUES 
(1, 'Dupont', 'Jean', 'jean.dupont@example.com', '2023-01-10'),
(2, 'Durand', 'Marie', 'marie.durand@example.com', '2023-05-15'),
(3, 'Martin', 'Paul', 'paul.martin@example.com', '2023-09-20');

INSERT INTO Demandes (id_demande, id_membre, id_livre, type_demande, date_demande, etat_demande)
VALUES 
(1, 1, 1, 'emprunt', '2024-12-01', 'validée'),
(2, 2, 2, 'consultation', '2024-12-02', 'en attente'),
(3, 3, 3, 'emprunt', '2024-12-03', 'validée');

INSERT INTO Emprunts (id_emprunt, id_demande, id_membre, date_emprunt, date_retour)
VALUES 
(1, 1, 1, '2024-12-01', '2024-12-15'),
(2, 3, 2, '2024-12-03', NULL);
