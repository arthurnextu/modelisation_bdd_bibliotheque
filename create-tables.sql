CREATE TABLE Livres (
    id_livre INT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    Auteur VARCHAR(255),
    date_parution DATE,
);

CREATE TABLE Membres (
    id_membre INT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    date_inscription DATE NOT NULL
);

CREATE TABLE Demandes (
    id_demande INT PRIMARY KEY,
    id_membre INT NOT NULL,
    id_livre INT NOT NULL,
    type_demande ENUM('emprunt', 'consultation', 'autre') NOT NULL,
    date_demande DATE NOT NULL,
    etat_demande ENUM('en attente', 'validée', 'refusée') DEFAULT 'en attente',
    FOREIGN KEY (id_membre) REFERENCES Membres(id_membre),
    FOREIGN KEY (id_livre) REFERENCES Livres(id_livre)
);

CREATE TABLE Emprunts (
    id_emprunt INT PRIMARY KEY,
    id_demande INT NOT NULL,
    id_membre INT NOT NULL,
    id_livre INT NOT NULL,
    date_emprunt DATE NOT NULL,
    date_retour DATE,
    FOREIGN KEY (id_demande) REFERENCES Demandes(id_demande)
);

