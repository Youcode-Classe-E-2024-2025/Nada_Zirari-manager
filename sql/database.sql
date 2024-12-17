-- Création de la base de données
CREATE DATABASE IF NOT EXISTS bibliotheque;
USE bibliotheque;

-- Table Livres
CREATE TABLE Livres (
    id_livre INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    Auteur VARCHAR(255) NOT NULL,
    Genre VARCHAR(100),
    nbr_exemplaire INT DEFAULT 0,
    date_publication DATE,
    langue VARCHAR(50)
);

-- Table Exemplaire
CREATE TABLE Exemplaire (
    id_exemplaire INT AUTO_INCREMENT PRIMARY KEY,
    id_livre INT NOT NULL,
    statut VARCHAR(50) DEFAULT 'disponible',
    date_ajout DATE NOT NULL,
    FOREIGN KEY (id_livre) REFERENCES Livres(id_livre) ON DELETE CASCADE
);

-- Table Emprunteur
CREATE TABLE Emprunteur (
    id_emprunteur INT AUTO_INCREMENT PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL,
    Prenom VARCHAR(100) NOT NULL,
    adresse VARCHAR(255),
    email VARCHAR(100) UNIQUE,
    num_tel VARCHAR(15),
    date_inscription DATE
);

-- Table Emprunt
CREATE TABLE Emprunt (
    id_emprunt INT AUTO_INCREMENT PRIMARY KEY,
    id_emprunteur INT NOT NULL,
    id_exemplaire INT NOT NULL,
    date_emprunt DATE NOT NULL,
    date_retour DATE,
    FOREIGN KEY (id_emprunteur) REFERENCES Emprunteur(id_emprunteur) ON DELETE CASCADE,
    FOREIGN KEY (id_exemplaire) REFERENCES Exemplaire(id_exemplaire) ON DELETE CASCADE
);

-- Table Réservation
CREATE TABLE reservation (
    id_réservation INT AUTO_INCREMENT PRIMARY KEY,
    id_emprunteur INT NOT NULL,
    id_livre INT NOT NULL,
    date_réservation DATE NOT NULL,
    FOREIGN KEY (id_emprunteur) REFERENCES Emprunteur(id_emprunteur) ON DELETE CASCADE,
    FOREIGN KEY (id_livre) REFERENCES Livres(id_livre) ON DELETE CASCADE
);

-- Table Employé
CREATE TABLE Employé (
    id_employé INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prénom VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE
);


INSERT INTO Livres (titre, Auteur, Genre, nbr_exemplaire, date_publication, langue)
VALUES ('Les Misérables', 'Victor Hugo', 'Roman', 5, '1862-04-03', 'Français');


INSERT INTO Exemplaire (id_livre, statut, date_ajout)
VALUES (1, 'disponible', CURDATE());

INSERT INTO Emprunteur (Nom, Prenom, adresse, email, num_tel, date_inscription)
VALUES ('Dupont', 'Jean', '123 Rue A', 'jean.dupont@example.com', '0612345678', CURDATE());

INSERT INTO Emprunt (id_emprunteur, id_exemplaire, date_emprunt, date_retour)
VALUES (1, 1, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 14 DAY));

INSERT INTO reservation (id_emprunteur, id_livre, date_réservation)
VALUES (1, 1, CURDATE());


INSERT INTO Employé (nom, prénom, role, Email)
VALUES ('Martin', 'Sophie', 'Administrateur', 'sophie.martin@example.com');
